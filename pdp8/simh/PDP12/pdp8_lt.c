/* pdp8_lt.c: PDP-8 LINCtape simulator

   Copyright (c) 1993-2020, Robert M Supnik

   Permission is hereby granted, free of charge, to any person obtaining a
   copy of this software and associated documentation files (the "Software"),
   to deal in the Software without restriction, including without limitation
   the rights to use, copy, modify, merge, publish, distribute, sublicense,
   and/or sell copies of the Software, and to permit persons to whom the
   Software is furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
   ROBERT M SUPNIK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

   Except as contained in this notice, the name of Robert M Supnik shall not be
   used in advertising or otherwise to promote the sale, use or other dealings
   in this Software without prior written authorization from Robert M Supnik.

   lt           TC12/TU56 LINCtape

   20-May-22    VRS     Adapted from pdp8_dt.c
   03-May-21    RMS     Fixed bug if read overwrites WC memory location
   01-Jul-20    RMS     Fixed comments in bootstrap (Bernhard Baehr)
   15-Mar-17    RMS     Fixed lt_seterr to clear successor states
   17-Sep-13    RMS     Changed to use central set_bootpc routine
   23-Jun-06    RMS     Fixed switch conflict in ATTACH
   07-Jan-06    RMS     Fixed unaligned register access bug (Doug Carman)
   16-Aug-05    RMS     Fixed C++ declaration and cast problems
   25-Jan-04    RMS     Revised for device debug support
   09-Jan-04    RMS     Changed sim_fsize calling sequence, added STOP_OFFR
   18-Oct-03    RMS     Fixed bugs in read all, tightened timing
   25-Apr-03    RMS     Revised for extended file support
   14-Mar-03    RMS     Fixed sizing interaction with save/restore
   17-Oct-02    RMS     Fixed bug in end of reel logic
   04-Oct-02    RMS     Added DIB, device number support
   12-Sep-02    RMS     Added support for 16b format
   30-May-02    RMS     Widened POS to 32b
   06-Jan-02    RMS     Changed enable/disable support
   30-Nov-01    RMS     Added read only unit, extended SET/SHOW support
   24-Nov-01    RMS     Changed POS, STATT, LASTT, FLG to arrays
   29-Aug-01    RMS     Added casts to PDP-18b packup routine
   17-Jul-01    RMS     Moved function prototype
   11-May-01    RMS     Fixed bug in reset
   25-Apr-01    RMS     Added device enable/disable support
   18-Apr-01    RMS     Changed to rewind tape before boot
   19-Mar-01    RMS     Changed bootstrap to support 4k disk monitor
   15-Mar-01    RMS     Added 129th word to PDP-8 format

   PDP-8 LINCtapes are represented in memory by fixed length buffer of 16b words.
   Three file formats are supported:

        18b/36b                 256 words per block [256 x 18b]
        16b                     256 words per block [256 x 16b]
        12b                     129 words per block [129 x 12b]

   When a 16b or 18/36bb LINCtape file is read in, it is converted to 12b format.

   LINCtape motion is measured in 3b lines.  Time between lines is 33.33us.
   Tape density is nominally 300 lines per inch.  The format of a LINCtape (as
   taken from the TD8E formatter) is:

        reverse end zone        8192 reverse end zone codes ~ 10 feet
        reverse buffer          200 interblock codes
        block 0
         :
        block n
        forward buffer          200 interblock codes
        forward end zone        8192 forward end zone codes ~ 10 feet

   A block consists of five 18b header words, a tape-specific number of data
   words, and five 18b trailer words.  All systems except the PDP-8 use a
   standard block length of 256 words; the PDP-8 uses a standard block length
   of 86 words (x 18b = 129 words x 12b).

   Because a LINCtape file only contains data, the simulator cannot support
   write timing and mark track and can only do a limited implementation
   of read all and write all.  Read all assumes that the tape has been
   conventionally written forward:

        header word 0           0
        header word 1           block number (for forward reads)
        header words 2,3        0
        header word 4           checksum (for reverse reads)
        :
        trailer word 4          checksum (for forward reads)
        trailer words 3,2       0
        trailer word 1          block number (for reverse reads)
        trailer word 0          0

   Write all writes only the data words and dumps the non-data words in the
   bit bucket.
*/

#include "pdp8_defs.h"

// BUGBUG: This DECtape code is probably a poor fit for the mostly
// synchronous LINCtape instructions.

#define LT_NUMDR        8                               /* #drives */
#define UNIT_V_8FMT     (UNIT_V_UF + 0)                 /* 12b format */
#define UNIT_V_11FMT    (UNIT_V_UF + 1)                 /* 16b format */
#define UNIT_8FMT       (1 << UNIT_V_8FMT)
#define UNIT_11FMT      (1 << UNIT_V_11FMT)
#define STATE           u3                              /* unit state */
#define LASTT           u4                              /* last time update */
#define WRITTEN         u5                              /* device buffer is dirty and needs flushing */
#define LT_WC           07754                           /* word count */
#define LT_CA           07755                           /* current addr */

/* System independent LINCtape constants */

#define LT_LPERMC       6                               /* lines per mark track */
#define LT_BLKWD        1                               /* blk no word in h/t */
#define LT_CSMWD        4                               /* checksum word in h/t */
#define LT_HTWRD        5                               /* header/trailer words */
#define LT_EZLIN        (8192 * LT_LPERMC)              /* end zone length */
#define LT_BFLIN        (200 * LT_LPERMC)               /* buffer length */
#define LT_BLKLN        (LT_BLKWD * LT_LPERMC)          /* blk no line in h/t */
#define LT_CSMLN        (LT_CSMWD * LT_LPERMC)          /* csum line in h/t */
#define LT_HTLIN        (LT_HTWRD * LT_LPERMC)          /* header/trailer lines */

/* 16b, 18b, 36b LINCtape constants */

#define D18_WSIZE       6                               /* word size in lines */
#define D18_BSIZE       384                             /* block size in 12b */
#define D18_TSIZE       578                             /* tape size */
#define D18_LPERB       (LT_HTLIN + (D18_BSIZE * LT_WSIZE) + LT_HTLIN)
#define D18_FWDEZ       (LT_EZLIN + (D18_LPERB * D18_TSIZE))
#define D18_CAPAC       (D18_TSIZE * D18_BSIZE)         /* tape capacity */

#define D18_NBSIZE      ((D18_BSIZE * D8_WSIZE) / D18_WSIZE)
#define D18_FILSIZ      (D18_NBSIZE * D18_TSIZE * sizeof (int32))
#define D11_FILSIZ      (D18_NBSIZE * D18_TSIZE * sizeof (int16))

/* 12b LINCtape constants */

#define D8_WSIZE        4                               /* word size in lines */
#define D8_BSIZE        129                             /* block size in 12b */
#define D8_TSIZE        1474                            /* tape size */
#define D8_LPERB        (LT_HTLIN + (D8_BSIZE * LT_WSIZE) + LT_HTLIN)
#define D8_FWDEZ        (LT_EZLIN + (D8_LPERB * D8_TSIZE))
#define D8_CAPAC        (D8_TSIZE * D8_BSIZE)           /* tape capacity */
#define D8_FILSIZ       (D8_CAPAC * sizeof (int16))

/* This controller */

#define LT_CAPAC        D8_CAPAC                        /* default */
#define LT_WSIZE        D8_WSIZE

/* Calculated constants, per unit */

#define LTU_BSIZE(u)    (((u)->flags & UNIT_8FMT)? D8_BSIZE: D18_BSIZE)
#define LTU_TSIZE(u)    (((u)->flags & UNIT_8FMT)? D8_TSIZE: D18_TSIZE)
#define LTU_LPERB(u)    (((u)->flags & UNIT_8FMT)? D8_LPERB: D18_LPERB)
#define LTU_FWDEZ(u)    (((u)->flags & UNIT_8FMT)? D8_FWDEZ: D18_FWDEZ)
#define LTU_CAPAC(u)    (((u)->flags & UNIT_8FMT)? D8_CAPAC: D18_CAPAC)

#define LT_LIN2BL(p,u)  (((p) - LT_EZLIN) / LTU_LPERB (u))
#define LT_LIN2OF(p,u)  (((p) - LT_EZLIN) % LTU_LPERB (u))
#define LT_LIN2WD(p,u)  ((LT_LIN2OF (p,u) - LT_HTLIN) / LT_WSIZE)
#define LT_BLK2LN(p,u)  (((p) * LTU_LPERB (u)) + LT_EZLIN)
#define LT_QREZ(u)      (((u)->pos) < LT_EZLIN)
#define LT_QFEZ(u)      (((u)->pos) >= ((uint32) LTU_FWDEZ (u)))
#define LT_QEZ(u)       (LT_QREZ (u) || LT_QFEZ (u))

/* Status register A */

#define LTA_V_UNIT      9                               /* unit select */
#define LTA_M_UNIT      07
#define LTA_UNIT        (LTA_M_UNIT << LTA_V_UNIT)
#define LTA_V_MOT       7                               /* motion */
#define LTA_M_MOT       03
#define LTA_V_MODE      6                               /* mode */
#define LTA_V_FNC       3                               /* function */
#define LTA_M_FNC       07
#define  FNC_MOVE        00                             /* move */
#define  FNC_SRCH        01                             /* search */
#define  FNC_READ        02                             /* read */
#define  FNC_RALL        03                             /* read all */
#define  FNC_WRIT        04                             /* write */
#define  FNC_WALL        05                             /* write all */
#define  FNC_WMRK        06                             /* write timing */
#define LTA_V_ENB       2                               /* int enable */
#define LTA_V_CERF      1                               /* clr error flag */
#define LTA_V_CLTF      0                               /* clr LINCtape flag */
#define LTA_FWDRV       (1u << (LTA_V_MOT + 1))
#define LTA_STSTP       (1u << LTA_V_MOT)
#define LTA_MODE        (1u << LTA_V_MODE)
#define LTA_ENB         (1u << LTA_V_ENB)
#define LTA_CERF        (1u << LTA_V_CERF)
#define LTA_CLTF        (1u << LTA_V_CLTF)
#define LTA_RW          (07777 & ~(LTA_CERF | LTA_CLTF))

#define LTA_GETUNIT(x)  (((x) >> LTA_V_UNIT) & LTA_M_UNIT)
#define LTA_GETMOT(x)   (((x) >> LTA_V_MOT) & LTA_M_MOT)
#define LTA_GETFNC(x)   (((x) >> LTA_V_FNC) & LTA_M_FNC)

/* Status register B */

#define LTB_V_ERF       11                              /* error flag */
#define LTB_V_MRK       10                              /* mark trk err */
#define LTB_V_END       9                               /* end zone err */
#define LTB_V_SEL       8                               /* select err */
#define LTB_V_PAR       7                               /* parity err */
#define LTB_V_TIM       6                               /* timing err */
#define LTB_V_MEX       3                               /* memory extension */
#define LTB_M_MEX       07
#define LTB_MEX         (LTB_M_MEX << LTB_V_MEX)
#define LTB_V_LTF       0                               /* LINCtape flag */
#define LTB_ERF         (1u << LTB_V_ERF)
#define LTB_MRK         (1u << LTB_V_MRK)
#define LTB_END         (1u << LTB_V_END)
#define LTB_SEL         (1u << LTB_V_SEL)
#define LTB_PAR         (1u << LTB_V_PAR)
#define LTB_TIM         (1u << LTB_V_TIM)
#define LTB_LTF         (1u << LTB_V_LTF)
#define LTB_ALLERR      (LTB_ERF | LTB_MRK | LTB_END | LTB_SEL | \
                        LTB_PAR | LTB_TIM)
#define LTB_GETMEX(x)   (((x) & LTB_MEX) << (12 - LTB_V_MEX))

/* LINCtape state */

#define LTS_V_MOT       3                               /* motion */
#define LTS_M_MOT       07
#define  LTS_STOP        0                              /* stopped */
#define  LTS_DECF        2                              /* decel, fwd */
#define  LTS_DECR        3                              /* decel, rev */
#define  LTS_ACCF        4                              /* accel, fwd */
#define  LTS_ACCR        5                              /* accel, rev */
#define  LTS_ATSF        6                              /* @speed, fwd */
#define  LTS_ATSR        7                              /* @speed, rev */
#define LTS_DIR         01                              /* dir mask */
#define LTS_V_FNC       0                               /* function */
#define LTS_M_FNC       07
#define  LTS_OFR        7                               /* "off reel" */
#define LTS_GETMOT(x)   (((x) >> LTS_V_MOT) & LTS_M_MOT)
#define LTS_GETFNC(x)   (((x) >> LTS_V_FNC) & LTS_M_FNC)
#define LTS_V_2ND       6                               /* next state */
#define LTS_V_3RD       (LTS_V_2ND + LTS_V_2ND)         /* next next */
#define LTS_STA(y,z)    (((y) << LTS_V_MOT) | ((z) << LTS_V_FNC))
#define LTS_SETSTA(y,z) uptr->STATE = LTS_STA (y, z)
#define LTS_SET2ND(y,z) uptr->STATE = (uptr->STATE & 077) | \
                        ((LTS_STA (y, z)) << LTS_V_2ND)
#define LTS_SET3RD(y,z) uptr->STATE = (uptr->STATE & 07777) | \
                        ((LTS_STA (y, z)) << LTS_V_3RD)
#define LTS_NXTSTA(x)   (x >> LTS_V_2ND)

/* Operation substates */

#define LTO_WCO         1                               /* wc overflow */
#define LTO_SOB         2                               /* start of block */

/* Logging */

#define LOG_MS          001                             /* move, search */
#define LOG_RW          002                             /* read, write */
#define LOG_BL          004                             /* block # lblk */

#define LT_UPDINT       if ((ltsa & LTA_ENB) && (ltsb & (LTB_ERF | LTB_LTF))) \
                        int_req = int_req | INT_DTA; \
                        else int_req = int_req & ~INT_DTA;
#define ABS(x)          (((x) < 0)? (-(x)): (x))

extern uint16 M[];
extern int32 int_req;
extern UNIT cpu_unit;

int32 ltsa = 0;                                         /* status A */
int32 ltsb = 0;                                         /* status B */
int32 lt_ltime = 12;                                    /* interline time */
int32 lt_dctime = 40000;                                /* decel time */
int32 lt_substate = 0;
int32 lt_logblk = 0;
int32 lt_stopoffr = 0;

int32 tc12_inst (int32 IR1, int32 IR2, int32 AC);
int32 lt77 (int32 IR, int32 AC);
t_stat lt_svc (UNIT *uptr);
t_stat lt_reset (DEVICE *dptr);
t_stat lt_attach (UNIT *uptr, CONST char *cptr);
const char *lt_description (DEVICE *dptr);
void lt_flush (UNIT *uptr);
t_stat lt_detach (UNIT *uptr);
t_stat lt_boot (int32 unitno, DEVICE *dptr);
void lt_deselect (int32 oldf);
void lt_newsa (int32 newf);
void lt_newfnc (UNIT *uptr, int32 newsta);
t_bool lt_setpos (UNIT *uptr);
void lt_schedez (UNIT *uptr, int32 dir);
void lt_seterr (UNIT *uptr, int32 e);
int32 lt_comobv (int32 val);
int32 lt_csum (UNIT *uptr, int32 blk);
int32 lt_gethdr (UNIT *uptr, int32 blk, int32 relpos, int32 dir);

/* LT data structures

   lt_dev       LT device descriptor
   lt_unit      LT unit list
   lt_reg       LT register list
   lt_mod       LT modifier list
*/

// BUGBUG: DIB lt_dib = { DEV_DTA, 2, { &tc12_inst, &lt77 } };
DIB lt_dib = { DEV_DTA, 2, { &lt77 } };

UNIT lt_unit[] = {
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) },
    { UDATA (&lt_svc, UNIT_8FMT+UNIT_FIX+UNIT_ATTABLE+
             UNIT_DISABLE+UNIT_ROABLE, LT_CAPAC) }
    };

REG lt_reg[] = {
    { ORDATAD (LTSA, ltsa, 12, "status register A") },
    { ORDATAD (LTSB, ltsb, 12, "status register B") },
    { FLDATAD (INT, int_req, INT_V_DTA, "interrupt pending flag") },
    { FLDATAD (ENB, ltsa, LTA_V_ENB, "interrupt enable flag") },
    { FLDATAD (LTF, ltsb, LTB_V_LTF, "LINCtape flag") },
    { FLDATAD (ERF, ltsb, LTB_V_ERF, "error flag") },
    { ORDATAD (WC, M[LT_WC], 12, "word count (memory location 7755)"), REG_FIT },
    { ORDATAD (CA, M[LT_CA], 12, "current address (memory location 7754)"), REG_FIT },
    { DRDATAD (LTIME, lt_ltime, 24, "time between lines"), REG_NZ | PV_LEFT },
    { DRDATAD (DCTIME, lt_dctime, 24, "time to decelerate to a full stop"), REG_NZ | PV_LEFT },
    { ORDATAD (SUBSTATE, lt_substate, 2, "read/write command substate") },
    { DRDATA (LBLK, lt_logblk, 12), REG_HIDDEN },
    { URDATAD (POS, lt_unit[0].pos, 10, T_ADDR_W, 0,
              LT_NUMDR, PV_LEFT | REG_RO, "position, in lines, units 0 to 7") },
    { URDATAD (STATT, lt_unit[0].STATE, 8, 18, 0,
              LT_NUMDR, REG_RO, "unit state, units 0 to 7") },
    { URDATA (LASTT, lt_unit[0].LASTT, 10, 32, 0,
              LT_NUMDR, REG_HRO) },
    { FLDATAD (STOP_OFFR, lt_stopoffr, 0, "stop on off-reel error") },
    { ORDATA (DEVNUM, lt_dib.dev, 6), REG_HRO },
    { NULL }
    };

MTAB lt_mod[] = {
    { MTAB_XTD|MTAB_VUN, 0, "write enabled", "WRITEENABLED", 
        &set_writelock, &show_writelock,   NULL, "Write enable drive" },
    { MTAB_XTD|MTAB_VUN, 1, NULL, "LOCKED", 
        &set_writelock, NULL,   NULL, "Write lock drive" },
    { UNIT_8FMT + UNIT_11FMT, 0, "18b", NULL, NULL },
    { UNIT_8FMT + UNIT_11FMT, UNIT_8FMT, "12b", NULL, NULL },
    { UNIT_8FMT + UNIT_11FMT, UNIT_11FMT, "16b", NULL, NULL },
    { MTAB_XTD|MTAB_VDV, 0, "DEVNO", "DEVNO",
      &set_dev, &show_dev, NULL },
    { 0 }
    };

DEBTAB lt_deb[] = {
    { "MOTION", LOG_MS },
    { "DATA", LOG_RW },
    { "BLOCK", LOG_BL },
    { NULL, 0 }
    };

DEVICE lt_dev = {
    "LT", lt_unit, lt_reg, lt_mod,
    LT_NUMDR, 8, 24, 1, 8, 12,
    NULL, NULL, &lt_reset,
    &lt_boot, &lt_attach, &lt_detach,
    &lt_dib, DEV_DISABLE | DEV_DEBUG, 0,
    lt_deb, NULL, NULL, NULL, NULL, NULL,
    &lt_description
    };

/* I/O Instructions: RDC, RCG, RDE, MTB, WRC, WCG, WRI, CHK
 * Unit is in IR & 010
 * Motion is IR & 020, set to continue, clear to stop
 * Second word has memory and tape block numbers
 *
 * Interaction with LINCtape Extended Operations word:
 *   Bits 0-2 can specify a field if bit 7 is set.
 *   Bit 4 can attempt to write marks.
 *   Bit 5 can control interrupt enable.
 *   Bit 6 can request maintenance mode.
 *   Bit 7 can enable bits 0-2.
 *   Bit 8 can inhibit waiting.
 *   Bit 9 can leave the tape moving while unselected.
 *   Bit 10-11 can set "unit" MSBs.
*/
int32 tc12_inst (int32 IR, int32 blks, int32 AC)
{
extern int32 IF, DF; // BUGBUG
    int32 motion = IR & 020;
    int32 unit = !!(IR & 010);
    int32 mbase = blks & 07000;
    int32 tblk = blks & 00777;
    int32 field = mbase & 04000? DF: IF;
    int32 bcnt = mbase >> 9;
    int32 old_ltsa = ltsa, fnc;
    UNIT *uptr;
    int32 tac = 0; // BUGBUG: Implement

    mbase = (field<<12) | ((mbase&03000) << 1);
    /* Which operation? */
    switch (IR & 07) {
    case 00: /* RDC */
    case 02: /* RDE */
        do {
            /* Read a Block */
        } while ((IR & 02) || tac == 0);
        break;
    case 01: /* RCG */
        /* Group transfer -- reinterpret blks */
        field = blks & 04? DF: IF;
        mbase = (field << 12) | (tblk & 07);
        break;
    case 04: /* WRC */
    case 06: /* WRI */
        do {
            /* Write a Block */
        } while ((IR & 02) || tac == 0);
        break;
    case 05: /* WCG */
        /* Group transfer -- reinterpret blks */
        field = blks & 04? DF: IF;
        mbase = (field << 12) | (tblk & 07);
        break;
    case 03: /* MTB */
        /* Move toward block */
        break;
    case 07: /* CHK */
        /* Check a block -- like read, but w/o buffer change */
        break;
    }
    /* Stop tape unless motion or NO PAUSE is set. */

#ifdef OLDWAY
if (pulse & 01)                                         /* LTRA */
    AC = AC | ltsa;
if (pulse & 06) {                                       /* select */
    if (pulse & 02)                                     /* LTCA */
        ltsa = 0;
    if (pulse & 04) {                                   /* LTXA */
        if ((AC & LTA_CERF) == 0) ltsb = ltsb & ~LTB_ALLERR;
        if ((AC & LTA_CLTF) == 0) ltsb = ltsb & ~LTB_LTF;
        ltsa = ltsa ^ (AC & LTA_RW);
        AC = 0;                                         /* clr AC */
        }
    if ((old_ltsa ^ ltsa) & LTA_UNIT)
        lt_deselect (old_ltsa);
    uptr = lt_dev.units + LTA_GETUNIT (ltsa);           /* get unit */
    fnc = LTA_GETFNC (ltsa);                            /* get fnc */
    if (((uptr->flags) & UNIT_DIS) ||                   /* disabled? */
         (fnc >= FNC_WMRK) ||                           /* write mark? */
        ((fnc == FNC_WALL) && (uptr->flags & UNIT_WPRT)) ||
        ((fnc == FNC_WRIT) && (uptr->flags & UNIT_WPRT)))
        lt_seterr (uptr, LTB_SEL);                      /* select err */
    else lt_newsa (ltsa);
    LT_UPDINT;
    }
#endif
return AC;
}

int32 lt77 (int32 IR, int32 AC)
{
int32 pulse = IR & 07;

if ((pulse & 01) && (ltsb & (LTB_ERF |LTB_LTF)))        /* LTSF */
    AC = IOT_SKP | AC;
if (pulse & 02)                                         /* LTRB */
    AC = AC | ltsb;
if (pulse & 04) {                                       /* LTLB */
    ltsb = (ltsb & ~LTB_MEX) | (AC & LTB_MEX);
    AC = AC & ~07777;                                   /* clear AC */
    }
return AC;
}

/* Unit deselect */

void lt_deselect (int32 oldf)
{
int32 old_unit = LTA_GETUNIT (oldf);
UNIT *uptr = lt_dev.units + old_unit;
int32 old_mot = LTS_GETMOT (uptr->STATE);

if (old_mot >= LTS_ATSF)                                /* at speed? */
    lt_newfnc (uptr, LTS_STA (old_mot, LTS_OFR));
else if (old_mot >= LTS_ACCF)                           /* accelerating? */
    LTS_SET2ND (LTS_ATSF | (old_mot & LTS_DIR), LTS_OFR);
return;
}

/* Command register change

   1. If change in motion, stop to start
        - schedule acceleration
        - set function as next state
   2. If change in motion, start to stop
        - if not already decelerating (could be reversing),
          schedule deceleration
   3. If change in direction,
        - if not decelerating, schedule deceleration
        - set accelerating (other dir) as next state
        - set function as next next state
   4. If not accelerating or at speed,
        - schedule acceleration
        - set function as next state
   5. If not yet at speed,
        - set function as next state
   6. If at speed,
        - set function as current state, schedule function
*/

void lt_newsa (int32 newf)
{
int32 new_unit, prev_mot, new_fnc;
int32 prev_mving, new_mving, prev_dir, new_dir;
UNIT *uptr;

new_unit = LTA_GETUNIT (newf);                          /* new, old units */
uptr = lt_dev.units + new_unit;
if ((uptr->flags & UNIT_ATT) == 0) {                    /* new unit attached? */
    lt_seterr (uptr, LTB_SEL);                          /* no, error */
    return;
    }
prev_mot = LTS_GETMOT (uptr->STATE);                    /* previous motion */
prev_mving = prev_mot != LTS_STOP;                      /* previous moving? */
prev_dir = prev_mot & LTS_DIR;                          /* previous dir? */
new_mving = (newf & LTA_STSTP) != 0;                    /* new moving? */
new_dir = (newf & LTA_FWDRV) != 0;                      /* new dir? */
new_fnc = LTA_GETFNC (newf);                            /* new function? */

if ((prev_mving | new_mving) == 0)                      /* stop to stop */
    return;

if (new_mving & ~prev_mving) {                          /* start? */
    if (lt_setpos (uptr))                               /* update pos */
        return;
    sim_cancel (uptr);                                  /* stop current */
    sim_activate (uptr, lt_dctime - (lt_dctime >> 2));  /* schedule acc */
    LTS_SETSTA (LTS_ACCF | new_dir, 0);                 /* state = accel */
    LTS_SET2ND (LTS_ATSF | new_dir, new_fnc);           /* next = fnc */
    return;
    }

if (prev_mving & ~new_mving) {                          /* stop? */
    if ((prev_mot & ~LTS_DIR) != LTS_DECF) {            /* !already stopping? */
        if (lt_setpos (uptr))                           /* update pos */
            return;
        sim_cancel (uptr);                              /* stop current */
        sim_activate (uptr, lt_dctime);                 /* schedule decel */
        }
    LTS_SETSTA (LTS_DECF | prev_dir, 0);                /* state = decel */
    return;
    }

if (prev_dir ^ new_dir) {                               /* dir chg? */
    if ((prev_mot & ~LTS_DIR) != LTS_DECF) {            /* !already stopping? */
        if (lt_setpos (uptr))                           /* update pos */
            return;
        sim_cancel (uptr);                              /* stop current */
        sim_activate (uptr, lt_dctime);                 /* schedule decel */
        }
    LTS_SETSTA (LTS_DECF | prev_dir, 0);                /* state = decel */
    LTS_SET2ND (LTS_ACCF | new_dir, 0);                 /* next = accel */
    LTS_SET3RD (LTS_ATSF | new_dir, new_fnc);           /* next next = fnc */
    return;
    }

if (prev_mot < LTS_ACCF) {                              /* not accel/at speed? */
    if (lt_setpos (uptr))                               /* update pos */
        return;
    sim_cancel (uptr);                                  /* cancel cur */
    sim_activate (uptr, lt_dctime - (lt_dctime >> 2));  /* sched accel */
    LTS_SETSTA (LTS_ACCF | new_dir, 0);                 /* state = accel */
    LTS_SET2ND (LTS_ATSF | new_dir, new_fnc);           /* next = fnc */
    return;
    }

if (prev_mot < LTS_ATSF) {                              /* not at speed? */
    LTS_SET2ND (LTS_ATSF | new_dir, new_fnc);           /* next = fnc */
    return;
    }

lt_newfnc (uptr, LTS_STA (LTS_ATSF | new_dir, new_fnc));/* state = fnc */
return; 
}

/* Schedule new LINCtape function

   This routine is only called if
   - the selected unit is attached
   - the selected unit is at speed (forward or backward)

   This routine
   - updates the selected unit's position
   - updates the selected unit's state
   - schedules the new operation
*/

void lt_newfnc (UNIT *uptr, int32 newsta)
{
int32 fnc, dir, blk, unum, relpos, newpos;
uint32 oldpos;

oldpos = uptr->pos;                                     /* save old pos */
if (lt_setpos (uptr))                                   /* update pos */
    return;
uptr->STATE = newsta;                                   /* update state */
fnc = LTS_GETFNC (uptr->STATE);                         /* set variables */
dir = LTS_GETMOT (uptr->STATE) & LTS_DIR;
unum = (int32) (uptr - lt_dev.units);
if (oldpos == uptr->pos)                                /* bump pos */
    uptr->pos = uptr->pos + (dir? -1: 1);
blk = LT_LIN2BL (uptr->pos, uptr);

if (dir? LT_QREZ (uptr): LT_QFEZ (uptr)) {              /* wrong ez? */
    lt_seterr (uptr, LTB_END);                          /* set ez flag, stop */
    return;
    }
sim_cancel (uptr);                                      /* cancel cur op */
lt_substate = LTO_SOB;                                  /* substate = block start */
switch (fnc) {                                          /* case function */

    case LTS_OFR:                                       /* off reel */
        if (dir)                                        /* rev? < start */
            newpos = -1000;
        else newpos = LTU_FWDEZ (uptr) + LT_EZLIN + 1000; /* fwd? > end */
        break;

    case FNC_MOVE:                                      /* move */
        lt_schedez (uptr, dir);                         /* sched end zone */
        if (DEBUG_PRI (lt_dev, LOG_MS)) fprintf (sim_deb, ">>LT%d: moving %s\n",
            unum, (dir? "backward": "forward"));
        return;                                         /* done */

    case FNC_SRCH:                                      /* search */
        if (dir) newpos = LT_BLK2LN ((LT_QFEZ (uptr)?
            LTU_TSIZE (uptr): blk), uptr) - LT_BLKLN - LT_WSIZE;
        else newpos = LT_BLK2LN ((LT_QREZ (uptr)?
            0: blk + 1), uptr) + LT_BLKLN + (LT_WSIZE - 1);
        if (DEBUG_PRI (lt_dev, LOG_MS))
            fprintf (sim_deb, ">>LT%d: searching %s]\n",
                     unum, (dir? "backward": "forward"));
        break;

    case FNC_WRIT:                                      /* write */
    case FNC_READ:                                      /* read */
    case FNC_RALL:                                      /* read all */
    case FNC_WALL:                                      /* write all */
        if (LT_QEZ (uptr)) {                            /* in "ok" end zone? */
            if (dir)
                newpos = LTU_FWDEZ (uptr) - LT_HTLIN - LT_WSIZE;
            else newpos = LT_EZLIN + LT_HTLIN + (LT_WSIZE - 1);
            break;
            }
        relpos = LT_LIN2OF (uptr->pos, uptr);           /* cur pos in blk */
        if ((relpos >= LT_HTLIN) &&                     /* in data zone? */
            (relpos < (LTU_LPERB (uptr) - LT_HTLIN))) {
            lt_seterr (uptr, LTB_SEL);
            return;
            }
        if (dir)
            newpos = LT_BLK2LN (((relpos >= (LTU_LPERB (uptr) - LT_HTLIN))?
                blk + 1: blk), uptr) - LT_HTLIN - LT_WSIZE;
        else newpos = LT_BLK2LN (((relpos < LT_HTLIN)?
                blk: blk + 1), uptr) + LT_HTLIN + (LT_WSIZE - 1);
        break;

    default:
        lt_seterr (uptr, LTB_SEL);                      /* bad state */
        return;
        }

sim_activate (uptr, ABS (newpos - ((int32) uptr->pos)) * lt_ltime);
return;
}

/* Update LINCtape position

   LINCtape motion is modeled as a constant velocity, with linear
   acceleration and deceleration.  The motion equations are as follows:

        t       =       time since operation started
        tmax    =       time for operation (accel, decel only)
        v       =       at speed velocity in lines (= 1/lt_ltime)

   Then:
        at speed dist = t * v
        accel dist = (t^2 * v) / (2 * tmax)
        decel dist = (((2 * t * tmax) - t^2) * v) / (2 * tmax)

   This routine uses the relative (integer) time, rather than the absolute
   (floating point) time, to allow save and restore of the start times.
*/

t_bool lt_setpos (UNIT *uptr)
{
uint32 new_time, ut, ulin, udelt;
int32 mot = LTS_GETMOT (uptr->STATE);
int32 unum, delta = 0;

new_time = sim_grtime ();                               /* current time */
ut = new_time - uptr->LASTT;                            /* elapsed time */
if (ut == 0)                                            /* no time gone? exit */
    return FALSE;
uptr->LASTT = new_time;                                 /* update last time */
switch (mot & ~LTS_DIR) {                               /* case on motion */

    case LTS_STOP:                                      /* stop */
        delta = 0;
        break;

    case LTS_DECF:                                      /* slowing */
        ulin = ut / (uint32) lt_ltime;
        udelt = lt_dctime / lt_ltime;
        delta = ((ulin * udelt * 2) - (ulin * ulin)) / (2 * udelt);
        break;

    case LTS_ACCF:                                      /* accelerating */
        ulin = ut / (uint32) lt_ltime;
        udelt = (lt_dctime - (lt_dctime >> 2)) / lt_ltime;
        delta = (ulin * ulin) / (2 * udelt);
        break;

    case LTS_ATSF:                                      /* at speed */
        delta = ut / (uint32) lt_ltime;
        break;
        }

if (mot & LTS_DIR)                                      /* update pos */
    uptr->pos = uptr->pos - delta;
else uptr->pos = uptr->pos + delta;
if (((int32) uptr->pos < 0) ||
    ((int32) uptr->pos > (LTU_FWDEZ (uptr) + LT_EZLIN))) {
    detach_unit (uptr);                                 /* off reel? */
    uptr->STATE = uptr->pos = 0;
    unum = (int32) (uptr - lt_dev.units);
    if (unum == LTA_GETUNIT (ltsa))                     /* if selected, */
        lt_seterr (uptr, LTB_SEL);                      /* error */
    return TRUE;
    }
return FALSE;
}

/* Unit service

   Unit must be attached, detach cancels operation
*/

t_stat lt_svc (UNIT *uptr)
{
int32 mot = LTS_GETMOT (uptr->STATE);
int32 dir = mot & LTS_DIR;
int32 fnc = LTS_GETFNC (uptr->STATE);
int16 *fbuf = (int16 *) uptr->filebuf;
int32 unum = uptr - lt_dev.units;
int32 blk, wrd, ma, relpos, dat;
uint32 ba;

/* Motion cases

   Decelerating - if next state != stopped, must be accel reverse
   Accelerating - next state must be @speed, schedule function
   At speed - do functional processing
*/

switch (mot) {

    case LTS_DECF: case LTS_DECR:                       /* decelerating */
        if (lt_setpos (uptr))                           /* upd pos; off reel? */
            return IORETURN (lt_stopoffr, STOP_DTOFF);
        uptr->STATE = LTS_NXTSTA (uptr->STATE);         /* advance state */
        if (uptr->STATE)                                /* not stopped? */
            sim_activate (uptr, lt_dctime - (lt_dctime >> 2));  /* must be reversing */
        return SCPE_OK;

    case LTS_ACCF: case LTS_ACCR:                       /* accelerating */
        lt_newfnc (uptr, LTS_NXTSTA (uptr->STATE));     /* adv state, sched */
        return SCPE_OK;

    case LTS_ATSF: case LTS_ATSR:                       /* at speed */
        break;                                          /* check function */

    default:                                            /* other */
        lt_seterr (uptr, LTB_SEL);                      /* state error */
        return SCPE_OK;
        }

/* Functional cases

   Move - must be at end zone
   Search - transfer block number, schedule next block
   Off reel - detach unit (it must be deselected)
*/

if (lt_setpos (uptr))                                   /* upd pos; off reel? */
    return IORETURN (lt_stopoffr, STOP_DTOFF);
if (LT_QEZ (uptr)) {                                    /* in end zone? */
    lt_seterr (uptr, LTB_END);                          /* end zone error */
    return SCPE_OK;
    }
blk = LT_LIN2BL (uptr->pos, uptr);                      /* get block # */
switch (fnc) {                                          /* at speed, check fnc */

    case FNC_MOVE:                                      /* move */
        lt_seterr (uptr, LTB_END);                      /* end zone error */
        return SCPE_OK;

    case FNC_SRCH:                                      /* search */
        if (ltsb & LTB_LTF) {                           /* LTF set? */
            lt_seterr (uptr, LTB_TIM);                  /* timing error */
            return SCPE_OK;
            }
        sim_activate (uptr, LTU_LPERB (uptr) * lt_ltime);/* sched next block */
        M[LT_WC] = (M[LT_WC] + 1) & 07777;              /* incr word cnt */
        ma = LTB_GETMEX (ltsb) | M[LT_CA];              /* get mem addr */
        if (((ltsa & LTA_MODE) == 0) || (M[LT_WC] == 0))
            ltsb = ltsb | LTB_LTF;                      /* set LTF */
        if (MEM_ADDR_OK (ma))                           /* store block # */
            M[ma] = blk & 07777;
        break;

    case LTS_OFR:                                       /* off reel */
        detach_unit (uptr);                             /* must be deselected */
        uptr->STATE = uptr->pos = 0;                    /* no visible action */
        break;

/* Read has four subcases

   Start of block, not wc ovf - check that LTF is clear, otherwise normal
   Normal - increment MA, WC, copy word from tape to memory
        if read dir != write dir, bits must be scrambled
        if wc overflow, next state is wc overflow
        if end of block, possibly set LTF, next state is start of block
   Wc ovf, not start of block - 
        if end of block, possibly set LTF, next state is start of block
   Wc ovf, start of block - if end of block reached, timing error,
        otherwise, continue to next word
*/

    case FNC_READ:                                      /* read */
        wrd = LT_LIN2WD (uptr->pos, uptr);              /* get word # */
        switch (lt_substate) {                          /* case on substate */

        case LTO_SOB:                                   /* start of block */
            if (ltsb & LTB_LTF) {                       /* LTF set? */
                lt_seterr (uptr, LTB_TIM);              /* timing error */
                return SCPE_OK;
                }
            if (DEBUG_PRI (lt_dev, LOG_RW) ||
           (DEBUG_PRI (lt_dev, LOG_BL) && (blk == lt_logblk)))
                fprintf (sim_deb, ">>LT%d: reading block %d %s%s\n",
                    unum, blk, (dir? "backward": "forward"),
                    ((ltsa & LTA_MODE)? " continuous": " "));
            lt_substate = 0;
            /* fall through */
        case 0:                                         /* normal read */
            M[LT_WC] = (M[LT_WC] + 1) & 07777;          /* incr WC, CA */
            M[LT_CA] = (M[LT_CA] + 1) & 07777;
            if (M[LT_WC] == 0)                          /* wc ovf? */
                lt_substate = LTO_WCO;
            ma = LTB_GETMEX (ltsb) | M[LT_CA];          /* get mem addr */
            ba = (blk * LTU_BSIZE (uptr)) + wrd;        /* buffer ptr */
            dat = fbuf[ba];                             /* get tape word */
            if (dir)                                    /* rev? comp obv */
                dat = lt_comobv (dat);
            if (MEM_ADDR_OK (ma))                       /* mem addr legal? */
                M[ma] = dat;
            /* fall through */
        case LTO_WCO:                                   /* wc ovf, not sob */
            if (wrd != (dir? 0: LTU_BSIZE (uptr) - 1))  /* not last? */
                sim_activate (uptr, LT_WSIZE * lt_ltime);
            else {
                lt_substate = lt_substate | LTO_SOB;
                sim_activate (uptr, ((2 * LT_HTLIN) + LT_WSIZE) * lt_ltime);
                if (((ltsa & LTA_MODE) == 0) || (lt_substate == LTO_WCO))
                    ltsb = ltsb | LTB_LTF;              /* set LTF */
                }
            break;                      

        case LTO_WCO | LTO_SOB:                         /* next block */        
            if (wrd == (dir? 0: LTU_BSIZE (uptr)))      /* end of block? */
                lt_seterr (uptr, LTB_TIM);              /* timing error */
            else sim_activate (uptr, LT_WSIZE * lt_ltime);
            break;
            }

        break;

/* Write has four subcases

   Start of block, not wc ovf - check that LTF is clear, set block direction
   Normal - increment MA, WC, copy word from memory to tape
        if wc overflow, next state is wc overflow
        if end of block, possibly set LTF, next state is start of block
   Wc ovf, not start of block -
        copy 0 to tape
        if end of block, possibly set LTF, next state is start of block
   Wc ovf, start of block - schedule end zone
*/

    case FNC_WRIT:                                      /* write */
        wrd = LT_LIN2WD (uptr->pos, uptr);              /* get word # */
        switch (lt_substate) {                          /* case on substate */

        case LTO_SOB:                                   /* start block */
            if (ltsb & LTB_LTF) {                       /* LTF set? */
                lt_seterr (uptr, LTB_TIM);              /* timing error */
                return SCPE_OK;
                }
            if (DEBUG_PRI (lt_dev, LOG_RW) ||
               (DEBUG_PRI (lt_dev, LOG_BL) && (blk == lt_logblk)))
                fprintf (sim_deb, ">>LT%d: writing block %d %s%s\n", unum, blk,
                    (dir? "backward": "forward"),
                    ((ltsa & LTA_MODE)? " continuous": " "));
            lt_substate = 0;
            /* fall through */
        case 0:                                         /* normal write */
            M[LT_WC] = (M[LT_WC] + 1) & 07777;          /* incr WC, CA */
            M[LT_CA] = (M[LT_CA] + 1) & 07777;
            /* fall through */
        case LTO_WCO:                                   /* wc ovflo */
            ma = LTB_GETMEX (ltsb) | M[LT_CA];          /* get mem addr */
            ba = (blk * LTU_BSIZE (uptr)) + wrd;        /* buffer ptr */
            dat = lt_substate? 0: M[ma];                /* get word */
            if (dir)                                    /* rev? comp obv */
                dat = lt_comobv (dat);
            fbuf[ba] = dat;                             /* write word */
            uptr->WRITTEN = TRUE;
            if (ba >= uptr->hwmark)
                uptr->hwmark = ba + 1;
            if (M[LT_WC] == 0)
                lt_substate = LTO_WCO;
            if (wrd != (dir? 0: LTU_BSIZE (uptr) - 1))  /* not last? */
                sim_activate (uptr, LT_WSIZE * lt_ltime);
            else {
                lt_substate = lt_substate | LTO_SOB;
                sim_activate (uptr, ((2 * LT_HTLIN) + LT_WSIZE) * lt_ltime);
                if (((ltsa & LTA_MODE) == 0) || (M[LT_WC] == 0))
                    ltsb = ltsb | LTB_LTF;              /* set LTF */
                }
            break;                      

        case LTO_WCO | LTO_SOB:                         /* all done */
            lt_schedez (uptr, dir);                     /* sched end zone */
            break;
            }

        break;

/* Read all has two subcases

        Not word count overflow - increment MA, WC, copy word from tape to memory
        Word count overflow - schedule end zone
*/

    case FNC_RALL:
        switch (lt_substate) {                          /* case on substate */

        case 0: case LTO_SOB:                           /* read in progress */
            if (ltsb & LTB_LTF) {                       /* LTF set? */
                lt_seterr (uptr, LTB_TIM);              /* timing error */
                return SCPE_OK;
                }
            relpos = LT_LIN2OF (uptr->pos, uptr);       /* cur pos in blk */
            M[LT_WC] = (M[LT_WC] + 1) & 07777;          /* incr WC, CA */
            M[LT_CA] = (M[LT_CA] + 1) & 07777;
            if (M[LT_WC] == 0)
                lt_substate = LTO_WCO;
            ma = LTB_GETMEX (ltsb) | M[LT_CA];          /* get mem addr */
            if ((relpos >= LT_HTLIN) &&                 /* in data zone? */
                (relpos < (LTU_LPERB (uptr) - LT_HTLIN))) {
                wrd = LT_LIN2WD (uptr->pos, uptr);
                ba = (blk * LTU_BSIZE (uptr)) + wrd;
                dat = fbuf[ba];                         /* get tape word */
                if (dir)                                /* rev? comp obv */
                    dat = lt_comobv (dat);
                }
            else dat = lt_gethdr (uptr, blk, relpos, dir);      /* get hdr */
            sim_activate (uptr, LT_WSIZE * lt_ltime);
            if (MEM_ADDR_OK (ma))                       /* mem addr legal? */
                M[ma] = dat;
            if (((ltsa & LTA_MODE) == 0) || (lt_substate == LTO_WCO))
                ltsb = ltsb | LTB_LTF;                  /* set LTF */
            break;

        case LTO_WCO: case LTO_WCO | LTO_SOB:           /* all done */
            lt_schedez (uptr, dir);                     /* sched end zone */
            break;
            }                                           /* end case substate */

        break;

/* Write all has two subcases

        Not word count overflow - increment MA, WC, copy word from memory to tape
        Word count overflow - schedule end zone
*/

    case FNC_WALL:
        switch (lt_substate) {                          /* case on substate */

        case 0: case LTO_SOB:                           /* read in progress */
            if (ltsb & LTB_LTF) {                       /* LTF set? */
                lt_seterr (uptr, LTB_TIM);              /* timing error */
                return SCPE_OK;
                }
            relpos = LT_LIN2OF (uptr->pos, uptr);       /* cur pos in blk */
            M[LT_WC] = (M[LT_WC] + 1) & 07777;          /* incr WC, CA */
            M[LT_CA] = (M[LT_CA] + 1) & 07777;
            ma = LTB_GETMEX (ltsb) | M[LT_CA];          /* get mem addr */
            if ((relpos >= LT_HTLIN) &&                 /* in data zone? */
                (relpos < (LTU_LPERB (uptr) - LT_HTLIN))) {
                dat = M[ma];                            /* get mem word */
                if (dir)
                    dat = lt_comobv (dat);
                wrd = LT_LIN2WD (uptr->pos, uptr);
                ba = (blk * LTU_BSIZE (uptr)) + wrd;
                fbuf[ba] = dat;                         /* write word */
                if (ba >= uptr->hwmark)
                    uptr->hwmark = ba + 1;
                }
                                                        /* ignore hdr */
            sim_activate (uptr, LT_WSIZE * lt_ltime);
            if (M[LT_WC] == 0)
                lt_substate = LTO_WCO;
            if (((ltsa & LTA_MODE) == 0) || (M[LT_WC] == 0))
                ltsb = ltsb | LTB_LTF;                  /* set LTF */
            break;

        case LTO_WCO: case LTO_WCO | LTO_SOB:           /* all done */
            lt_schedez (uptr, dir);                     /* sched end zone */
            break;
            }                                           /* end case substate */
        break;

    default:
        lt_seterr (uptr, LTB_SEL);                      /* impossible state */
        break;
        }

LT_UPDINT;                                              /* update interrupts */
return SCPE_OK;
}

/* Reading the header is complicated, because 18b words are being parsed
   out 12b at a time.  The sequence of word numbers is directionally
   sensitive

                Forward                         Reverse
        Word    Word    Content         Word    Word    Content
        (abs)   (rel)                   (abs)   (rel)

        137     8       fwd csm'00      6       6       rev csm'00
        138     9       0000            5       5       0000
        139     10      0000            4       4       0000
        140     11      0000            3       3       0000
        141     12      00'lo rev blk   2       2       00'lo fwd blk
        142     13      hi rev blk      1       1       hi fwd blk
        143     14      0000            0       0       0000
        0       0       0000            143     14      0000
        1       1       0000            142     13      0000
        2       2       hi fwd blk      141     12      hi rev blk
        3       3       lo fwd blk'00   140     11      lo rev blk'00
        4       4       0000            139     10      0000
        5       5       0000            138     9       0000
        6       6       0000            137     8       0000
        7       7       rev csm         136     7       00'fwd csm
*/

int32 lt_gethdr (UNIT *uptr, int32 blk, int32 relpos, int32 dir)
{
if (relpos >= LT_HTLIN)
    relpos = relpos - (LT_WSIZE * LTU_BSIZE (uptr));
if (dir) {                                              /* reverse */
    switch (relpos / LT_WSIZE) {
    case 6:                                             /* rev csm */
        return 077;
    case 2:                                             /* lo fwd blk */
        return lt_comobv ((blk & 077) << 6);
    case 1:                                             /* hi fwd blk */
        return lt_comobv (blk >> 6);
    case 12:                                            /* hi rev blk */
        return (blk >> 6) & 07777;
    case 11:                                            /* lo rev blk */
        return ((blk & 077) << 6);
    case 7:                                             /* fwd csum */
        return (lt_comobv (lt_csum (uptr, blk)) << 6);
    default:                                            /* others */
        return 07777;
        }
    }
else {                                                  /* forward */
    switch (relpos / LT_WSIZE) {
    case 8:                                             /* fwd csum */
        return (lt_csum (uptr, blk) << 6);
    case 12:                                            /* lo rev blk */
        return lt_comobv ((blk & 077) << 6);
    case 13:                                            /* hi rev blk */
        return lt_comobv (blk >> 6);
    case 2:                                             /* hi fwd blk */
        return ((blk >> 6) & 07777);
    case 3:                                             /* lo fwd blk */
        return ((blk & 077) << 6);
    case 7:                                             /* rev csum */
        return 077;
    default:                                            /* others */
        break;
        }
    }
return 0;
}

/* Utility routines */

/* Set error flag */

void lt_seterr (UNIT *uptr, int32 e)
{
int32 mot = LTS_GETMOT (uptr->STATE);

ltsa = ltsa & ~LTA_STSTP;                               /* clear go */
ltsb = ltsb | LTB_ERF | e;                              /* set error flag */
if (mot >= LTS_ACCF) {                                  /* ~stopped or stopping? */
    sim_cancel (uptr);                                  /* cancel activity */
    if (lt_setpos (uptr))                               /* update position */
        return;
    sim_activate (uptr, lt_dctime);                     /* sched decel */
    LTS_SETSTA (LTS_DECF | (mot & LTS_DIR), 0);         /* state = decel */
    }
else LTS_SETSTA (mot, 0);                               /* clear 2nd, 3rd */
LT_UPDINT;
return;
}

/* Schedule end zone */

void lt_schedez (UNIT *uptr, int32 dir)
{
int32 newpos;

if (dir)                                                /* rev? rev ez */
    newpos = LT_EZLIN - LT_WSIZE;
else newpos = LTU_FWDEZ (uptr) + LT_WSIZE;              /* fwd? fwd ez */
sim_activate (uptr, ABS (newpos - ((int32) uptr->pos)) * lt_ltime);
return;
}

/* Complement obverse routine */

int32 lt_comobv (int32 dat)
{
dat = dat ^ 07777;                                      /* compl obverse */
dat = ((dat >> 9) & 07) | ((dat >> 3) & 070) |
    ((dat & 070) << 3) | ((dat & 07) << 9);
return dat;
}

/* Checksum routine */

int32 lt_csum (UNIT *uptr, int32 blk)
{
int16 *fbuf = (int16 *) uptr->filebuf;
int32 ba = blk * LTU_BSIZE (uptr);
int32 i, csum, wrd;

csum = 077;                                             /* init csum */
for (i = 0; i < LTU_BSIZE (uptr); i++) {                /* loop thru buf */
    wrd = fbuf[ba + i] ^ 07777;                         /* get ~word */
    csum = csum ^ (wrd >> 6) ^ wrd;
    }
return (csum & 077);
}

/* Reset routine */

t_stat lt_reset (DEVICE *dptr)
{
int32 i, prev_mot;
UNIT *uptr;

for (i = 0; i < LT_NUMDR; i++) {                        /* stop all activity */
    uptr = lt_dev.units + i;
    if (sim_is_running) {                               /* CAF? */
        prev_mot = LTS_GETMOT (uptr->STATE);            /* get motion */
        if ((prev_mot & ~LTS_DIR) > LTS_DECF) {         /* accel or spd? */
            if (lt_setpos (uptr))                       /* update pos */
                continue;
            sim_cancel (uptr);
            sim_activate (uptr, lt_dctime);             /* sched decel */
            LTS_SETSTA (LTS_DECF | (prev_mot & LTS_DIR), 0);
            }
        }
    else {
        sim_cancel (uptr);                              /* sim reset */
        uptr->STATE = 0;  
        uptr->LASTT = sim_grtime ();
        }
    }
ltsa = ltsb = 0;                                        /* clear status */
LT_UPDINT;                                              /* reset interrupt */
return SCPE_OK;
}

/* Bootstrap routine 

   This is actually the 4K disk monitor bootstrap, which also
   works with OS/8.  The reverse is not true - the OS/8 bootstrap
   doesn't work with the disk monitor.
*/

#define BOOT_START      0200
#define BOOT_LEN        (sizeof (boot_rom) / sizeof (int16))

static const uint16 boot_rom[] = {
    07600,                      /* 200, CLA             ; group 2 */
    01216,                      /*      TAD MVB         ; move back */
    04210,                      /*      JMS DO          ; action */
    01217,                      /*      TAD K7577       ; addr */
    03620,                      /*      DCA I CA */
    01222,                      /*      TAD RDF         ; read fwd */
    04210,                      /*      JMS DO          ; action */
    05600,                      /*      JMP I 200       ; enter boot */
    00000,                      /* DO,  0 */
    06766,                      /*      LTCA!LTXA       ; start tape */
    03621,                      /*      DCA I WC        ; clear wc */
    06771,                      /*      LTSF            ; wait */
    05213,                      /*      JMP .-1 */
    05610,                      /*      JMP I DO */
    00600,                      /* MVB, 0600 */
    07577,                      /* K7577, 7577 */
    07755,                      /* CA,  7755 */
    07754,                      /* WC,  7754 */
    00220                       /* RF,  0220 */
    };

t_stat lt_boot (int32 unitno, DEVICE *dptr)
{
size_t i;

if (unitno)                                             /* only unit 0 */
    return SCPE_ARG;
if (lt_dib.dev != DEV_DTA)                              /* only std devno */
    return STOP_NOTSTD;
lt_unit[unitno].pos = LT_EZLIN;
for (i = 0; i < BOOT_LEN; i++)
    M[BOOT_START + i] = boot_rom[i];
cpu_set_bootpc (BOOT_START);
return SCPE_OK;
}

/* Attach routine

   Determine 12b, 16b, or 18b/36b format
   Allocate buffer
   If 16b or 18b, read 16b or 18b format and convert to 12b in buffer
   If 12b, read data into buffer
*/

t_stat lt_attach (UNIT *uptr, CONST char *cptr)
{
uint32 pdp18b[D18_NBSIZE];
uint16 pdp11b[D18_NBSIZE], *fbuf;
int32 i, k;
int32 u = uptr - lt_dev.units;
t_stat r;
uint32 ba, sz;

r = attach_unit (uptr, cptr);                           /* attach */
if (r != SCPE_OK) return r;                             /* fail? */
if ((sim_switches & SIM_SW_REST) == 0) {                /* not from rest? */
    uptr->flags = (uptr->flags | UNIT_8FMT) & ~UNIT_11FMT;
    if (sim_switches & SWMASK ('F'))                    /* att 18b? */
        uptr->flags = uptr->flags & ~UNIT_8FMT;
    else if (sim_switches & SWMASK ('S'))               /* att 16b? */
        uptr->flags = (uptr->flags | UNIT_11FMT) & ~UNIT_8FMT;
    else if (!(sim_switches & SWMASK ('A')) &&          /* autosize? */
        (sz = sim_fsize (uptr->fileref))) {
        if (sz == D11_FILSIZ)
            uptr->flags = (uptr->flags | UNIT_11FMT) & ~UNIT_8FMT;
        else if (sz > D8_FILSIZ)
            uptr->flags = uptr->flags & ~UNIT_8FMT;
        }
    }
uptr->capac = LTU_CAPAC (uptr);                         /* set capacity */
uptr->filebuf = calloc (uptr->capac, sizeof (uint16));
if (uptr->filebuf == NULL) {                            /* can't alloc? */
    detach_unit (uptr);
    return SCPE_MEM;
    }
fbuf = (uint16 *) uptr->filebuf;                        /* file buffer */
sim_printf ("%s%d: ", sim_dname (&lt_dev), u);
if (uptr->flags & UNIT_8FMT)
    sim_printf ("12b format");
else if (uptr->flags & UNIT_11FMT)
    sim_printf ("16b format");
else sim_printf ("18b/36b format");
sim_printf (", buffering file in memory\n");
uptr->io_flush = lt_flush;
if (uptr->flags & UNIT_8FMT)                            /* 12b? */
    uptr->hwmark = fxread (uptr->filebuf, sizeof (uint16),
            uptr->capac, uptr->fileref);
else {                                                  /* 16b/18b */
    for (ba = 0; ba < uptr->capac; ) {                  /* loop thru file */
        if (uptr->flags & UNIT_11FMT) {
            k = fxread (pdp11b, sizeof (uint16), D18_NBSIZE, uptr->fileref);
            for (i = 0; i < k; i++)
                pdp18b[i] = pdp11b[i];
            }
        else k = fxread (pdp18b, sizeof (uint32), D18_NBSIZE, uptr->fileref);
        if (k == 0)
            break;
        for ( ; k < D18_NBSIZE; k++) pdp18b[k] = 0;
        for (k = 0; k < D18_NBSIZE; k = k + 2) {        /* loop thru blk */
            fbuf[ba] = (pdp18b[k] >> 6) & 07777;
            fbuf[ba + 1] = ((pdp18b[k] & 077) << 6) |
                ((pdp18b[k + 1] >> 12) & 077);
            fbuf[ba + 2] = pdp18b[k + 1] & 07777;
            ba = ba + 3;
            }                                           /* end blk loop */
        }                                               /* end file loop */
    uptr->hwmark = ba;
    }                                                   /* end else */
uptr->flags = uptr->flags | UNIT_BUF;                   /* set buf flag */
uptr->pos = LT_EZLIN;                                   /* beyond leader */
uptr->LASTT = sim_grtime ();                            /* last pos update */
return SCPE_OK;
}

/* Detach routine

   Cancel in progress operation
   If 12b, write buffer to file
   If 16b or 18b, convert 12b buffer to 16b or 18b and write to file
   Deallocate buffer
*/
void lt_flush (UNIT* uptr)
{
uint32 pdp18b[D18_NBSIZE];
uint16 pdp11b[D18_NBSIZE], *fbuf;
int32 i, k;
uint32 ba;

if (uptr->WRITTEN && uptr->hwmark && ((uptr->flags & UNIT_RO)== 0)) {    /* any data? */
    sim_printf ("%s: writing buffer to file: %s\n", sim_uname (uptr), uptr->filename);
    rewind (uptr->fileref);                             /* start of file */
    fbuf = (uint16 *) uptr->filebuf;                    /* file buffer */
    if (uptr->flags & UNIT_8FMT)                        /* PDP8? */
        fxwrite (uptr->filebuf, sizeof (uint16),        /* write file */
            uptr->hwmark, uptr->fileref);
    else {                                              /* 16b/18b */
        for (ba = 0; ba < uptr->hwmark; ) {             /* loop thru buf */
            for (k = 0; k < D18_NBSIZE; k = k + 2) {
                pdp18b[k] = ((uint32) (fbuf[ba] & 07777) << 6) |
                    ((uint32) (fbuf[ba + 1] >> 6) & 077);
                pdp18b[k + 1] = ((uint32) (fbuf[ba + 1] & 077) << 12) |
                    ((uint32) (fbuf[ba + 2] & 07777));
                ba = ba + 3;
                }                                       /* end loop blk */
            if (uptr->flags & UNIT_11FMT) {             /* 16b? */
                for (i = 0; i < D18_NBSIZE; i++)
                    pdp11b[i] = pdp18b[i];
                fxwrite (pdp11b, sizeof (uint16),
                    D18_NBSIZE, uptr->fileref);
                }
            else fxwrite (pdp18b, sizeof (uint32),
                D18_NBSIZE, uptr->fileref);
            }                                           /* end loop buf */
        }                                               /* end else */
    if (ferror (uptr->fileref))
        sim_perror ("I/O error");
    }
uptr->WRITTEN = FALSE;                                  /* no longer dirty */
}

t_stat lt_detach (UNIT* uptr)
{
int u = (int)(uptr - lt_dev.units);

if (!(uptr->flags & UNIT_ATT))                          /* attached? */
    return SCPE_OK;
if (sim_is_active (uptr)) {
    sim_cancel (uptr);
    if ((u == LTA_GETUNIT (ltsa)) && (ltsa & LTA_STSTP)) {
        ltsb = ltsb | LTB_ERF | LTB_SEL | LTB_LTF;
        LT_UPDINT;
        }
    uptr->STATE = uptr->pos = 0;
    }
if (uptr->hwmark && ((uptr->flags & UNIT_RO)== 0))      /* any data? */
    lt_flush (uptr);                                    /* end if hwmark */
free (uptr->filebuf);                                   /* release buf */
uptr->flags = uptr->flags & ~UNIT_BUF;                  /* clear buf flag */
uptr->filebuf = NULL;                                   /* clear buf ptr */
uptr->flags = (uptr->flags | UNIT_8FMT) & ~UNIT_11FMT;  /* default fmt */
uptr->capac = LT_CAPAC;                                 /* default size */
return detach_unit (uptr);
}

const char *lt_description (DEVICE *dptr)
{
return "TC12/TU56 LINCtape";
}
