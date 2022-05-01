/* pdp8_cpu.c: PDP-8 CPU simulator

   Copyright (c) 1993-2021, Robert M Supnik

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

   cpu          central processor

   07-Sep-17    RMS     Fixed sim_eval declaration in history routine (COVERITY)
   09-Mar-17    RMS     Fixed PCQ_ENTRY for interrupts (COVERITY)
   13-Feb-17    RMS     RESET clear L'AC, per schematics
   28-Jan-17    RMS     Renamed switch register variable to SR, per request
   18-Sep-16    RMS     Added alternate dispatch table for non-contiguous devices
   17-Sep-13    RMS     Fixed boot in wrong field problem (Dave Gesswein)
   28-Apr-07    RMS     Removed clock initialization
   30-Oct-06    RMS     Added idle and infinite loop detection
   30-Sep-06    RMS     Fixed SC value after DVI overflow (Don North)
   22-Sep-05    RMS     Fixed declarations (Sterling Garwood)
   16-Aug-05    RMS     Fixed C++ declaration and cast problems
   06-Nov-04    RMS     Added =n to SHOW HISTORY
   31-Dec-03    RMS     Fixed bug in set_cpu_hist
   13-Oct-03    RMS     Added instruction history
                        Added TSC8-75 support (Bernhard Baehr)
   12-Mar-03    RMS     Added logical name support
   04-Oct-02    RMS     Revamped device dispatching, added device number support
   06-Jan-02    RMS     Added device enable/disable routines
   30-Dec-01    RMS     Added old PC queue
   16-Dec-01    RMS     Fixed bugs in EAE
   07-Dec-01    RMS     Revised to use new breakpoint package
   30-Nov-01    RMS     Added RL8A, extended SET/SHOW support
   16-Sep-01    RMS     Fixed bug in reset routine, added KL8A support
   10-Aug-01    RMS     Removed register from declarations
   17-Jul-01    RMS     Moved function prototype
   07-Jun-01    RMS     Fixed bug in JMS to non-existent memory
   25-Apr-01    RMS     Added device enable/disable support
   18-Mar-01    RMS     Added DF32 support
   05-Mar-01    RMS     Added clock calibration support
   15-Feb-01    RMS     Added DECtape support
   14-Apr-99    RMS     Changed t_addr to unsigned

   The register state for the PDP-8 is:

   AC<0:11>             accumulator
   MQ<0:11>             multiplier-quotient
   L                    link flag
   PC<0:11>             program counter
   IF<0:2>              instruction field
   IB<0:2>              instruction buffer
   DF<0:2>              data field
   UF                   user flag
   UB                   user buffer
   SF<0:6>              interrupt save field
   LINC                 Operating in LINC mode

   The PDP-8 has three instruction formats: memory reference, I/O transfer,
   and operate.  The memory reference format is:

     0  1  2  3  4  5  6  7  8  9 10 11
   +--+--+--+--+--+--+--+--+--+--+--+--+
   |   op   |in|zr|    page offset     |        memory reference
   +--+--+--+--+--+--+--+--+--+--+--+--+

   <0:2>        mnemonic        action

    000         AND             AC = AC & M[MA]
    001         TAD             L'AC = AC + M[MA]
    010         DCA             M[MA] = AC, AC = 0
    011         ISZ             M[MA] = M[MA] + 1, skip if M[MA] == 0
    100         JMS             M[MA] = PC, PC = MA + 1
    101         JMP             PC = MA

   <3:4>        mode            action
    00  page zero               MA = IF'0'IR<5:11>
    01  current page            MA = IF'PC<0:4>'IR<5:11>
    10  indirect page zero      MA = xF'M[IF'0'IR<5:11>]
    11  indirect current page   MA = xF'M[IF'PC<0:4>'IR<5:11>]

   where x is D for AND, TAD, ISZ, DCA, and I for JMS, JMP.

   Memory reference instructions can access an address space of 32K words.
   The address space is divided into eight 4K word fields; each field is
   divided into thirty-two 128 word pages.  An instruction can directly
   address, via its 7b offset, locations 0-127 on page zero or on the current
   page.  All 32k words can be accessed via indirect addressing and the
   instruction and data field registers.  If an indirect address is in
   locations 0010-0017 of any field, the indirect address is incremented
   and rewritten to memory before use.

   The I/O transfer format is as follows:

     0  1  2  3  4  5  6  7  8  9 10 11
   +--+--+--+--+--+--+--+--+--+--+--+--+
   |   op   |      device     | pulse  |        I/O transfer
   +--+--+--+--+--+--+--+--+--+--+--+--+

   The IO transfer instruction sends the the specified pulse to the
   specified I/O device.  The I/O device may take data from the AC,
   return data to the AC, initiate or cancel operations, or skip on
   status.

   The operate format is as follows:

   +--+--+--+--+--+--+--+--+--+--+--+--+
   | 1| 1| 1| 0|  |  |  |  |  |  |  |  |        operate group 1
   +--+--+--+--+--+--+--+--+--+--+--+--+
                |  |  |  |  |  |  |  |
                |  |  |  |  |  |  |  +--- increment AC  3
                |  |  |  |  |  |  +--- rotate 1 or 2    4
                |  |  |  |  |  +--- rotate left         4
                |  |  |  |  +--- rotate right           4
                |  |  |  +--- complement L              2
                |  |  +--- complement AC                2
                |  +--- clear L                         1
                +-- clear AC                            1

   +--+--+--+--+--+--+--+--+--+--+--+--+
   | 1| 1| 1| 1|  |  |  |  |  |  |  | 0|        operate group 2
   +--+--+--+--+--+--+--+--+--+--+--+--+
                |  |  |  |  |  |  |
                |  |  |  |  |  |  +--- halt             3
                |  |  |  |  |  +--- or switch register  3
                |  |  |  |  +--- reverse skip sense     1
                |  |  |  +--- skip on L != 0            1
                |  |  +--- skip on AC == 0              1
                |  +--- skip on AC < 0                  1
                +-- clear AC                            2

   +--+--+--+--+--+--+--+--+--+--+--+--+
   | 1| 1| 1| 1|  |  |  |  |  |  |  | 1|        operate group 3
   +--+--+--+--+--+--+--+--+--+--+--+--+
                |  |  |  | \______/
                |  |  |  |     |
                |  |  +--|-----+--- EAE command         3
                |  |     +--- AC -> MQ, 0 -> AC         2
                |  +--- MQ v AC --> AC                  2
                +-- clear AC                            1

  The operate instruction can be microprogrammed to perform operations
  on the AC, MQ, and link.

  This routine is the instruction decode routine for the PDP-8.
   It is called from the simulator control program to execute
   instructions in simulated memory, starting at the simulated PC.
   It runs until 'reason' is set non-zero.

   General notes:

   1. Reasons to stop.  The simulator can be stopped by:

        HALT instruction
        breakpoint encountered
        unimplemented instruction and stop_inst flag set
        I/O error in I/O simulator

   2. Interrupts.  Interrupts are maintained by three parallel variables:

        dev_done        device done flags
        int_enable      interrupt enable flags
        int_req         interrupt requests

      In addition, int_req contains the interrupt enable flag, the
      CIF not pending flag, and the ION not pending flag.  If all
      three of these flags are set, and at least one interrupt request
      is set, then an interrupt occurs.

   3. Non-existent memory.  On the PDP-8, reads to non-existent memory
      return zero, and writes are ignored.  In the simulator, the
      largest possible memory is instantiated and initialized to zero.
      Thus, only writes outside the current field (indirect writes) need
      be checked against actual memory size.

   3. Adding I/O devices.  These modules must be modified:

        pdp8_defs.h     add device number and interrupt definitions
        pdp8_sys.c      add sim_devices table entry
*/

#include "pdp8_defs.h"

#define PCQ_SIZE        64                              /* must be 2**n */
#define PCQ_MASK        (PCQ_SIZE - 1)
#define PCQ_ENTRY(x)    pcq[pcq_p = (pcq_p - 1) & PCQ_MASK] = x
#define UNIT_V_NOEAE    (UNIT_V_UF)                     /* EAE absent */
#define UNIT_NOEAE      (1 << UNIT_V_NOEAE)
#define UNIT_V_MSIZE    (UNIT_V_UF + 1)                 /* dummy mask */
#define UNIT_MSIZE      (1 << UNIT_V_MSIZE)
#define UNIT_V_MODEL    (UNIT_V_UF + 2)                 /* dummy mask */
#define UNIT_MODEL      (1 << UNIT_V_MODEL)
#define OP_KSF          06031                           /* for idle */

#define HIST_PC         0x40000000
#define HIST_MIN        64
#define HIST_MAX        65536

typedef struct {
    int32               pc;
    int32               ea;
    int16               ir;
    int16               opnd;
    int16               lac;
    int16               mq;
    } InstHistory;

uint16 M[MAXMEMSIZE] = { 0 };                           /* main memory */
int32 saved_LAC = 0;                                    /* saved L'AC */
int32 saved_MQ = 0;                                     /* saved MQ */
int32 saved_PC = 0;                                     /* saved IF'PC */
int32 saved_DF = 0;                                     /* saved Data Field */
int32 IB = 0;                                           /* Instruction Buffer */
int32 SF = 0;                                           /* Save Field */
int32 emode = 0;                                        /* EAE mode */
int32 gtf = 0;                                          /* EAE gtf flag */
int32 SC = 0;                                           /* EAE shift count */
int32 UB = 0;                                           /* User mode Buffer */
int32 UF = 0;                                           /* User mode Flag */
int32 SR = 0;                                           /* Switch Register */
t_bool LINC = FALSE;                                    /* In LINC mode */
int32 tsc_ir = 0;                                       /* TSC8-75 IR */
int32 tsc_pc = 0;                                       /* TSC8-75 PC */
int32 tsc_cdf = 0;                                      /* TSC8-75 CDF flag */
int32 tsc_enb = 0;                                      /* TSC8-75 enabled */
int32 cpu_astop = 0;                                    /* address stop */
int16 pcq[PCQ_SIZE] = { 0 };                            /* PC queue */
int32 pcq_p = 0;                                        /* PC queue ptr */
REG *pcq_r = NULL;                                      /* PC queue reg ptr */
int32 dev_done = 0;                                     /* dev done flags */
int32 int_enable = INT_INIT_ENABLE;                     /* intr enables */
int32 int_req = 0;                                      /* intr requests */
int32 stop_inst = 0;                                    /* trap on ill inst */
int32 (*dev_tab[DEV_MAX])(int32 IR, int32 dat);         /* device dispatch */
int32 hst_p = 0;                                        /* history pointer */
int32 hst_lnt = 0;                                      /* history length */
InstHistory *hst = NULL;                                /* instruction history */

t_stat cpu_ex (t_value *vptr, t_addr addr, UNIT *uptr, int32 sw);
t_stat cpu_dep (t_value val, t_addr addr, UNIT *uptr, int32 sw);
t_stat cpu_reset (DEVICE *dptr);
t_stat cpu_set_model (UNIT *uptr, int32 val, CONST char *cptr, void *desc);
t_stat cpu_set_size (UNIT *uptr, int32 val, CONST char *cptr, void *desc);
t_stat cpu_set_hist (UNIT *uptr, int32 val, CONST char *cptr, void *desc);
t_stat cpu_show_model (FILE *st, UNIT *uptr, int32 val, CONST void *desc);
t_stat cpu_show_hist (FILE *st, UNIT *uptr, int32 val, CONST void *desc);
t_bool build_dev_tab (void);

/* CPU data structures

   cpu_dev      CPU device descriptor
   cpu_unit     CPU unit descriptor
   cpu_reg      CPU register list
   cpu_mod      CPU modifier list
*/

UNIT cpu_unit = { UDATA (NULL, UNIT_FIX + UNIT_BINK, MAXMEMSIZE) };

REG cpu_reg[] = {
    { ORDATAD (PC, saved_PC, 15, "program counter") },
    { ORDATAD (AC, saved_LAC, 12, "accumulator") },
    { FLDATAD (L, saved_LAC, 12, "link") },
    { ORDATAD (MQ, saved_MQ, 12, "multiplier-quotient") },
    { ORDATAD (SR, SR, 12, "front panel switches") },
    { GRDATAD (IF, saved_PC, 8, 3, 12, "instruction field") },
    { GRDATAD (DF, saved_DF, 8, 3, 12, "data field") },
    { GRDATAD (IB, IB, 8, 3, 12, "instruction field buffter") },
    { ORDATAD (SF, SF, 7, "save field") },
    { FLDATAD (UB, UB, 0, "user mode buffer") },
    { FLDATAD (UF, UF, 0, "user mode flag") },
    { ORDATAD (SC, SC, 5, "EAE shift counter") },
    { FLDATAD (GTF, gtf, 0, "EAE greater than flag") },
    { FLDATAD (EMODE, emode, 0, "EAE mode (0 = A, 1 = B)") },
    { FLDATAD (ION, int_req, INT_V_ION, "interrupt enable") },
    { FLDATAD (ION_DELAY, int_req, INT_V_NO_ION_PENDING, "interrupt enable delay for ION") },
    { FLDATAD (CIF_DELAY, int_req, INT_V_NO_CIF_PENDING, "interrupt enable delay for CIF") },
    { FLDATAD (PWR_INT, int_req, INT_V_PWR, "power fail interrupt") },
    { FLDATAD (UF_INT, int_req, INT_V_UF, "user mode violation interrupt") },
    { ORDATAD (INT, int_req, INT_V_ION+1, "interrupt pending flags"), REG_RO },
    { ORDATAD (DONE, dev_done, INT_V_DIRECT, "device done flags"), REG_RO },
    { ORDATAD (ENABLE, int_enable, INT_V_DIRECT, "device interrupt enable flags"), REG_RO },
    { BRDATAD (PCQ, pcq, 8, 15, PCQ_SIZE, "PC prior to last JMP, JMS, or interrupt;                                        most recent PC change first"), REG_RO+REG_CIRC },
    { ORDATA (PCQP, pcq_p, 6), REG_HRO },
    { FLDATAD (STOP_INST, stop_inst, 0, "stop on undefined instruction") },
    { ORDATAD (WRU, sim_int_char, 8, "interrupt character") },
    { NULL }
    };

MTAB cpu_mod[] = {
    { UNIT_NOEAE, UNIT_NOEAE, "no EAE", "NOEAE", NULL },
    { UNIT_NOEAE, 0, "EAE", "EAE", NULL },
    { UNIT_MODEL, 0, "MODEL", "MODEL", 0, &cpu_show_model },
    { UNIT_MODEL, PDP5,  "pdp5",     "PDP5",     &cpu_set_model },
    { UNIT_MODEL, PDP8_, "pdp8",     "PDP8",     &cpu_set_model },
    { UNIT_MODEL, PDP8S, "pdp8s",    "PDP8S",    &cpu_set_model },
    { UNIT_MODEL, LINC8, "linc8",    "LINC8",    &cpu_set_model },
    { UNIT_MODEL, PDP8L, "pdp8l",    "PDP8L",    &cpu_set_model },
    { UNIT_MODEL, PDP8I, "pdp8i",    "PDP8I",    &cpu_set_model },
    { UNIT_MODEL, PDP12, "pdp12",    "PDP12",    &cpu_set_model },
    { UNIT_MODEL, PDP8E, "pdp8e",    "PDP8E",    &cpu_set_model },
    { UNIT_MODEL, PDP8A, "pdp8a",    "PDP8A",    &cpu_set_model },
    { UNIT_MODEL, VT78,  "vt78",     "VT78",     &cpu_set_model },
    { UNIT_MODEL, DMI,   "DECmate3", "DECMATE1", &cpu_set_model },
    { UNIT_MODEL, DMII,  "DECmate3", "DECMATE2", &cpu_set_model },
    { UNIT_MODEL, DMIII, "DECmate3", "DECMATE3", &cpu_set_model },
    { MTAB_XTD|MTAB_VDV, 0, "IDLE", "IDLE", &sim_set_idle, &sim_show_idle },
    { MTAB_XTD|MTAB_VDV, 0, NULL, "NOIDLE", &sim_clr_idle, NULL },
    { UNIT_MSIZE, 4096, NULL, "4K", &cpu_set_size },
    { UNIT_MSIZE, 8192, NULL, "8K", &cpu_set_size },
    { UNIT_MSIZE, 12288, NULL, "12K", &cpu_set_size },
    { UNIT_MSIZE, 16384, NULL, "16K", &cpu_set_size },
    { UNIT_MSIZE, 20480, NULL, "20K", &cpu_set_size },
    { UNIT_MSIZE, 24576, NULL, "24K", &cpu_set_size },
    { UNIT_MSIZE, 28672, NULL, "28K", &cpu_set_size },
    { UNIT_MSIZE, 32768, NULL, "32K", &cpu_set_size },
    { MTAB_XTD|MTAB_VDV|MTAB_NMO|MTAB_SHP, 0, "HISTORY", "HISTORY",
      &cpu_set_hist, &cpu_show_hist },
    { 0 }
    };

DEVICE cpu_dev = {
    "CPU", &cpu_unit, cpu_reg, cpu_mod,
    1, 8, 15, 1, 8, 12,
    &cpu_ex, &cpu_dep, &cpu_reset,
    NULL, NULL, NULL,
    NULL, 0
    };

int32 IR, MB, IF, DF, LAC, MQ;
uint32 PC, MA;
int32 MODEL = PDP12;
uint32 LIF, LDF, P, A, B, S, Z; /* LINC-8 saved state for mode switch */
int32 device, pulse, temp, iot_data;
t_stat reason;
void do_linc();
void do_pdp8();
t_bool linciot(int, int);

t_stat sim_instr (void)
{

/* Restore register state */

if (build_dev_tab ())                                   /* build dev_tab */
    return SCPE_STOP;
PC = saved_PC & 007777;                                 /* load local copies */
IF = saved_PC & 070000;
DF = saved_DF & 070000;
LAC = saved_LAC & 017777;
MQ = saved_MQ & 07777;
int_req = INT_UPDATE;
reason = 0;

/* Main instruction fetch/decode loop */

while (reason == 0) {                                   /* loop until halted */

    if (cpu_astop != 0) {
        cpu_astop = 0;
        reason = SCPE_STOP;
        break;
        }

    if (sim_interval <= 0) {                            /* check clock queue */
        if ((reason = sim_process_event ()))
            break;
        }

    if (int_req > INT_PENDING) {                        /* interrupt? */
        int_req = int_req & ~INT_ION;                   /* interrupts off */
        SF = (UF << 6) | (IF >> 9) | (DF >> 12);        /* form save field */
        PCQ_ENTRY (IF | PC);                            /* save old PC with IF */
        IF = IB = DF = UF = UB = 0;                     /* clear mem ext */
        if (MODEL == PDP5) {
            M[1] = PC;                                  /* save PC in 1 */
            PC = 2;                                     /* fetch next from 2 */
        } else {
            M[0] = PC;                                  /* save PC in 0 */
            PC = 1;                                     /* fetch next from 1 */
        }
    }
// BUGBUG: Need to take interrupts correctly in LINC mode.

    MA = IF | PC;                                       /* form PC */
    if (sim_brk_summ && 
        sim_brk_test (MA, (1u << SIM_BKPT_V_SPC) | SWMASK ('E'))) { /* breakpoint? */
        reason = STOP_IBKPT;                            /* stop simulation */
        break;
        }

    IR = M[MA];                                         /* fetch instruction */
    if (sim_brk_summ && 
        sim_brk_test (IR, (2u << SIM_BKPT_V_SPC) | SWMASK ('I'))) { /* breakpoint? */
        reason = STOP_OPBKPT;                            /* stop simulation */
        break;
        }
    PC = (PC + 1) & 07777;                              /* increment PC */
    int_req = int_req | INT_NO_ION_PENDING;             /* clear ION delay */
    sim_interval = sim_interval - 1;

/* Instruction decoding.
   We execute a LINC or a PDP8 instruction, depending.
   Note that MA contains IF'PC.
*/
    if (LINC) {
        do_linc();
    } else {
        do_pdp8();
    }

    }                                                   /* end while */

/* Simulation halted */

saved_PC = IF | (PC & 07777);                           /* save copies */
saved_DF = DF & 070000;
saved_LAC = LAC & 017777;
saved_MQ = MQ & 07777;
pcq_r->qptr = pcq_p;                                    /* update pc q ptr */
return reason;
}                                                       /* end sim_instr */

/*
 * This sequence of instructions is a mix that hopefully
 * represents a resonable instruction set that is a close 
 * estimate to the normal calibrated result.
 */

static const char *pdp8_clock_precalibrate_commands[] = {
    "106 100"
    "-m 100 MQL MQA"
    "-m 101 ISZ 112",
    "-m 102 JMP I 106",
    "-m 103 JMP I 106",
    "PC 100",
    NULL};

/* Reset routine */

t_stat cpu_reset (DEVICE *dptr)
{
saved_LAC = 0;
int_req = (int_req & ~INT_ION) | INT_NO_CIF_PENDING;
saved_DF = IB = saved_PC & 070000;
UF = UB = gtf = emode = 0;
pcq_r = find_reg ("PCQ", NULL, dptr);
if (pcq_r)
    pcq_r->qptr = 0;
else 
    return SCPE_IERR;
sim_clock_precalibrate_commands = pdp8_clock_precalibrate_commands;
sim_vm_initial_ips = 10 * SIM_INITIAL_IPS;
sim_brk_types = SWMASK ('E') | SWMASK('I');
sim_brk_dflt = SWMASK ('E');
return SCPE_OK;
}

/* Set PC for boot (PC<14:12> will typically be 0) */

void cpu_set_bootpc (int32 pc)
{
saved_PC = pc;                                          /* set PC, IF */
saved_DF = IB = pc & 070000;                            /* set IB, DF */
return;
}

/* Memory examine */

t_stat cpu_ex (t_value *vptr, t_addr addr, UNIT *uptr, int32 sw)
{
if (addr >= MEMSIZE)
    return SCPE_NXM;
if (vptr != NULL)
    *vptr = M[addr] & 07777;
return SCPE_OK;
}

/* Memory deposit */

t_stat cpu_dep (t_value val, t_addr addr, UNIT *uptr, int32 sw)
{
if (addr >= MEMSIZE)
    return SCPE_NXM;
M[addr] = val & 07777;
return SCPE_OK;
}

/* CPU model change */

t_stat cpu_set_model (UNIT *uptr, int32 val, CONST char *cptr, void *desc)
{
   MODEL = val;
   return SCPE_OK;
}
/* CPU model display */
t_stat cpu_show_model (FILE *st, UNIT *uptr, int32 val, CONST void *desc)
{
   char *model[] = {
       0,
       "pdp5",
       "pdp8s",
       "pdp8",
       "linc8",
       "pdp8l",
       "pdp8i",
       "pdp12",
       "pdp8e",
       "pdp8a",
       "vt78",
       "decmate1",
       "decmate2",
       "decmate3",
   };
   fprintf (st, "%s", model[MODEL]);
}

/* Memory size change */

t_stat cpu_set_size (UNIT *uptr, int32 val, CONST char *cptr, void *desc)
{
int32 mc = 0;
uint32 i;

if ((val <= 0) || (val > MAXMEMSIZE) || ((val & 07777) != 0))
    return SCPE_ARG;
for (i = val; i < MEMSIZE; i++)
    mc = mc | M[i];
if ((mc != 0) && (!get_yn ("Really truncate memory [N]?", FALSE)))
    return SCPE_OK;
MEMSIZE = val;
for (i = MEMSIZE; i < MAXMEMSIZE; i++)
    M[i] = 0;
return SCPE_OK;
}

/* Change device number for a device */

t_stat set_dev (UNIT *uptr, int32 val, CONST char *cptr, void *desc)
{
DEVICE *dptr;
DIB *dibp;
uint32 newdev;
t_stat r;

if (cptr == NULL)
    return SCPE_ARG;
if (uptr == NULL)
    return SCPE_IERR;
dptr = find_dev_from_unit (uptr);
if (dptr == NULL)
    return SCPE_IERR;
dibp = (DIB *) dptr->ctxt;
if (dibp == NULL)
    return SCPE_IERR;
newdev = get_uint (cptr, 8, DEV_MAX - 1, &r);           /* get new */
if ((r != SCPE_OK) || (newdev == dibp->dev))
    return r;
dibp->dev = newdev;                                     /* store */
return SCPE_OK;
}

/* Show device number for a device */

t_stat show_dev (FILE *st, UNIT *uptr, int32 val, CONST void *desc)
{
DEVICE *dptr;
DIB *dibp;

if (uptr == NULL)
    return SCPE_IERR;
dptr = find_dev_from_unit (uptr);
if (dptr == NULL)
    return SCPE_IERR;
dibp = (DIB *) dptr->ctxt;
if (dibp == NULL)
    return SCPE_IERR;
fprintf (st, "devno=%02o", dibp->dev);
if (dibp->num > 1)
    fprintf (st, "-%2o", dibp->dev + dibp->num - 1);
return SCPE_OK;
}

/* CPU device handler - should never get here! */

int32 bad_dev (int32 IR, int32 AC)
{
return (SCPE_IERR << IOT_V_REASON) | AC;                /* broken! */
}

/* Build device dispatch table */

t_bool build_dev_tab (void)
{
DEVICE *dptr;
DIB *dibp;
uint32 i, j;
static const uint8 std_dev[] = {
    000, 010, 020, 021, 022, 023, 024, 025, 026, 027
    };

for (i = 0; i < DEV_MAX; i++)                           /* clr table */
    dev_tab[i] = NULL;
for (i = 0; i < ((uint32) sizeof (std_dev)); i++)       /* std entries */
    dev_tab[std_dev[i]] = &bad_dev;
for (i = 0; (dptr = sim_devices[i]) != NULL; i++) {     /* add devices */
    dibp = (DIB *) dptr->ctxt;                          /* get DIB */
    if (dibp && !(dptr->flags & DEV_DIS)) {             /* enabled? */
        if (dibp->dsp_tbl) {                            /* dispatch table? */
            DIB_DSP *dspp = dibp->dsp_tbl;              /* set ptr */
            for (j = 0; j < dibp->num; j++, dspp++) {   /* loop thru tbl */
                if (dspp->dsp) {                        /* any dispatch? */
                    if (dev_tab[dspp->dev]) {           /* already filled? */
                        sim_printf ("%s device number conflict at %02o\n",
                            sim_dname (dptr), dspp->dev);
                        return TRUE;
                        }
                    dev_tab[dspp->dev] = dspp->dsp;     /* fill */
                    }                                   /* end if dsp */
                }                                       /* end for j */
            }                                           /* end if dsp_tbl */
        else {                                          /* inline dispatches */
            for (j = 0; j < dibp->num; j++) {           /* loop thru disp */
                if (dibp->dsp[j]) {                     /* any dispatch? */
                    if (dev_tab[dibp->dev + j]) {       /* already filled? */
                        sim_printf ("%s device number conflict at %02o\n",
                            sim_dname (dptr), dibp->dev + j);
                        return TRUE;
                        }
                    dev_tab[dibp->dev + j] = dibp->dsp[j]; /* fill */
                    }                                   /* end if dsp */
                }                                       /* end for j */
            }                                           /* end else */
        }                                               /* end if enb */
    }                                                   /* end for i */
return FALSE;
}

/* Set history */

t_stat cpu_set_hist (UNIT *uptr, int32 val, CONST char *cptr, void *desc)
{
int32 i, lnt;
t_stat r;

if (cptr == NULL) {
    for (i = 0; i < hst_lnt; i++)
        hst[i].pc = 0;
    hst_p = 0;
    return SCPE_OK;
    }
lnt = (int32) get_uint (cptr, 10, HIST_MAX, &r);
if ((r != SCPE_OK) || (lnt && (lnt < HIST_MIN)))
    return SCPE_ARG;
hst_p = 0;
if (hst_lnt) {
    free (hst);
    hst_lnt = 0;
    hst = NULL;
    }
if (lnt) {
    hst = (InstHistory *) calloc (lnt, sizeof (InstHistory));
    if (hst == NULL)
        return SCPE_MEM;
    hst_lnt = lnt;
    }
return SCPE_OK;
}

/* Show history */

t_stat cpu_show_hist (FILE *st, UNIT *uptr, int32 val, CONST void *desc)
{
int32 l, k, di, lnt;
const char *cptr = (const char *) desc;
t_stat r;
InstHistory *h;

if (hst_lnt == 0)                                       /* enabled? */
    return SCPE_NOFNC;
if (cptr) {
    lnt = (int32) get_uint (cptr, 10, hst_lnt, &r);
    if ((r != SCPE_OK) || (lnt == 0))
        return SCPE_ARG;
    }
else lnt = hst_lnt;
di = hst_p - lnt;                                       /* work forward */
if (di < 0)
    di = di + hst_lnt;
fprintf (st, "PC     L AC    MQ    ea     IR\n\n");
for (k = 0; k < lnt; k++) {                             /* print specified */
    h = &hst[(++di) % hst_lnt];                         /* entry pointer */
    if (h->pc & HIST_PC) {                              /* instruction? */
        l = (h->lac >> 12) & 1;                         /* link */
        fprintf (st, "%05o  %o %04o  %04o  ", h->pc & ADDRMASK, l, h->lac & 07777, h->mq);
        if (h->ir < 06000)
            fprintf (st, "%05o  ", h->ea);
        else fprintf (st, "       ");
        sim_eval[0] = h->ir;
        if ((fprint_sym (st, h->pc & ADDRMASK, sim_eval, &cpu_unit, SWMASK ('M'))) > 0)
            fprintf (st, "(undefined) %04o", h->ir);
        if (h->ir < 04000)
            fprintf (st, "  [%04o]", h->opnd);
        fputc ('\n', st);                               /* end line */
        }                                               /* end else instruction */
    }                                                   /* end for */
return SCPE_OK;
}

/* Instruction decoding.

   The opcode (IR<0:2>), indirect flag (IR<3>), and page flag (IR<4>)
   are decoded together.  This produces 32 decode points, four per
   major opcode.  For IOT, the extra decode points are not useful;
   for OPR, only the group flag (IR<3>) is used.

   AND, TAD, ISZ, DCA calculate a full 15b effective address.
   JMS, JMP calculate a 12b field-relative effective address.

   Autoindex calculations always occur within the same field as the
   instruction fetch.  The field must exist; otherwise, the instruction
   fetched would be 0000, and indirect addressing could not occur.

   Note that MA contains IF'PC.

   CPU Models and Limitations:

   Various improvements were made to the PDP-8 instruction set over time.
   These interact with design compromises, so that the PDP-8/S, while newer
   than the straight-8, is the least capable model after the PDP-5.

   Model        Limitations
   5            No IAC rotate, no CMA rotate, no EAE, 4K maximum, slower
                PC at 0000, Interrupts at 0001, no DMA (data break)
   8/S          No IAC rotate, no CMA rotate, no EAE, 8K maximum, 15x slower
   (straight) 8 No IAC rotate, IOT 6004 is special, no SWP, no SCL
                Nonexistent memory reference is special
   LINC-8       Like straight-8, but with LINC & LINC peripherals, 4K
   8/L          group 3 CLA is NOP, no EAE, 8K maximum, protect switch
                CDF/CIF to non-existant field is a NOP
                RAL RAR and RTL RTR, perform both AND results
   8/I          RAL RAR and RTL RTR, perform both AND results
   PDP-12       Same as 8/I, but with LINC & LINC peripherals
                IOT 6006 is special, DTLA conflicts with PUSHJ
   8/E/F/M      CAF, BSW, Omnibus I/O, MQL, MQA, SWP
                Odd semantics for RAL RAR, RTL RTR
                EAE option has mode B
   8/A          CAF, BSW, Omnibus I/O, PUSH/POP, 128K support
                Yet different semantics for RAL RAR, no EAE
                non-standard LPT
   VT78         CAF, BSW, Omnibus I/O, PUSH/POP
                RAL RAR and RTL RTR are NOPs
                Autoindex suppressed for current page accesses
                No restart from HLT, No DMA (data break)
   DECmates     CAF, BSW, R3L, Omnibus I/O, PUSH/POP
                RAL RAR is R3L, RTL RTR is NOP
                No EAE, EAE operations hang
                Incompatible second serial port (also model dependent)
                KSF, TSF, PSF implementation botched
                No restart from HLT in DECmate I
                Color graphics options
                Optional Z80 and 8086 coprocessor

   Most of these differences have to do with the treatment of IOT and OPR
   instructions.  There is a difference in the treatment of non-existant
   memory, and of current page indirection where the current page is page
   zero.  Quirks that are not fully implemented will be marked in the code
   with BUGBUG: or TODO: comments, based on the percieved serverity of the
   limitation imposed by their absence.
*/
//BUGBUG: Data break is not excluded on any model.
//BUGBUG: Implement PDP-5 slowdown.
//BUGBUG: Implement PDP-8/S slowdown.
//BUGBUG: Memory maximums for 8/L, etc. are not implemented.
//BUGBUG: Special non-existant memory behaviors for straight-8, LINC-8.
//BUGBUG: Implement memory protect feature for the 8/L.
//BUGBUG: Implement special nop CIF/CDF for the 8/L.
//BUGBUG: Debug LINC instruction emulations.
//BUGBUG: Distinguish LINC-8 and PDP-12 LINC instruction emulations.
//BUGBUG: Implement LINC peripherals.
//BUGBUG: Implement PDP-12 API/stack stuff.
//BUGBUG: Restrict pre-Omnibus IOT handling.
//BUGBUG: Implement special 8/A handling for line printer port.
//BUGBUG: Implement special 8/A handling for memory over 32K.
//BUGBUG: Implement special 8/A handling for PUSH/POP.
//BUGBUG: Implement special VT78 handling for panel memory.
//BUGBUG: Implement special DECmate handling for panel memory.
//BUGBUG: Suppress EAE on PDP-5?, 8/S, 8/L.
//BUGBUG: Suppress EAE on 8/A (except CLA, MQA, MQL, SWP).
//BUGBUG: Suppress EAE on DECmates (illegal instructions).
//BUGBUG: Implement special VT78, DECmate handling for PUSH/POP.
//BUGBUG: Implement VT78, DECmate peripherals.
//BUGBUG: Implement DECmate color graphics option.
//BUGBUG: Implement DECmate Z80 option.
//BUGBUG: Implement DECmate 8086 option.
void
do_pdp8()
{

    if (hst_lnt) {                                      /* history enabled? */
        int32 ea;

        hst_p = (hst_p + 1);                            /* next entry */
        if (hst_p >= hst_lnt)
            hst_p = 0;
        hst[hst_p].pc = MA | HIST_PC;                   /* save PC, IR, LAC, MQ */
        hst[hst_p].ir = IR;
        hst[hst_p].lac = LAC;
        hst[hst_p].mq = MQ;
        if (IR < 06000) {                               /* mem ref? */
            if (IR & 0200)
                ea = (MA & 077600) | (IR & 0177);
            else ea = IF | (IR & 0177);                 /* direct addr */
            if (IR & 0400) {                            /* indirect? */
                if (IR < 04000) {                       /* mem operand? */
                    if ((ea & 07770) != 00010)
                        ea = DF | M[ea];
                    else ea = DF | ((M[ea] + 1) & 07777);
                    }
                else {                                  /* no, jms/jmp */
                    if ((ea & 07770) != 00010)
                        ea = IB | M[ea];
                    else ea = IB | ((M[ea] + 1) & 07777);
                    }
                }
            hst[hst_p].ea = ea;                         /* save eff addr */
            hst[hst_p].opnd = M[ea];                    /* save operand */
            }
    }

    // Implement PDP5 PC in location 0.
    if (MODEL == PDP5)                                  /* Update PDP-5 PC */
        M[0] = PC;
    switch ((IR >> 7) & 037) {                          /* decode IR<0:4> */

/* Opcode 0, AND */

    case 000:                                           /* AND, dir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        LAC = LAC & (M[MA] | 010000);
        break;

    case 001:                                           /* AND, dir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        LAC = LAC & (M[MA] | 010000);
        break;

    case 002:                                           /* AND, indir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        if ((MA & 07770) != 00010)                      /* indirect; autoinc? */
            MA = DF | M[MA];
        else MA = DF | (M[MA] = (M[MA] + 1) & 07777);   /* incr before use */
        LAC = LAC & (M[MA] | 010000);
        break;

    case 003:                                           /* AND, indir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        if ((MA & 07770) == 00010)                      /* indirect; autoinc? */
            if (MODEL != VT78)                          /* on a 6100? */
                M[MA] = (M[MA] + 1) & 07777;            /* incr before use */
        MA = DF | M[MA];
        LAC = LAC & (M[MA] | 010000);
        break;

/* Opcode 1, TAD */

    case 004:                                           /* TAD, dir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        LAC = (LAC + M[MA]) & 017777;
        break;

    case 005:                                           /* TAD, dir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        LAC = (LAC + M[MA]) & 017777;
        break;

    case 006:                                           /* TAD, indir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        if ((MA & 07770) != 00010)                      /* indirect; autoinc? */
            MA = DF | M[MA];
        else MA = DF | (M[MA] = (M[MA] + 1) & 07777);   /* incr before use */
        LAC = (LAC + M[MA]) & 017777;
        break;

    case 007:                                           /* TAD, indir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        if ((MA & 07770) == 00010)                      /* indirect; autoinc? */
            if (MODEL != VT78)                          /* on a 6100? */
                M[MA] = (M[MA] + 1) & 07777;            /* incr before use */
        MA = DF | M[MA];
        LAC = (LAC + M[MA]) & 017777;
        break;

/* Opcode 2, ISZ */
// BUGBUG: The implementation PDP5 PC in location 0 currently ignores ISZ 0.
// AND 0, TAD 0, and DCA 0 are implemented. JMS 0 and JMP 0 should never
// occur in valid PDP-5 code..

    case 010:                                           /* ISZ, dir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        M[MA] = MB = (M[MA] + 1) & 07777;               /* field must exist */
        if (MB == 0)
            PC = (PC + 1) & 07777;
        break;

    case 011:                                           /* ISZ, dir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        M[MA] = MB = (M[MA] + 1) & 07777;               /* field must exist */
        if (MB == 0)
            PC = (PC + 1) & 07777;
        break;

    case 012:                                           /* ISZ, indir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        if ((MA & 07770) != 00010)                      /* indirect; autoinc? */
            MA = DF | M[MA];
        else MA = DF | (M[MA] = (M[MA] + 1) & 07777);   /* incr before use */
        MB = (M[MA] + 1) & 07777;
        if (MEM_ADDR_OK (MA))
            M[MA] = MB;
        if (MB == 0)
            PC = (PC + 1) & 07777;
        break;

    case 013:                                           /* ISZ, indir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        if ((MA & 07770) == 00010)                      /* indirect; autoinc? */
            if (MODEL != VT78)                          /* on a 6100? */
                M[MA] = (M[MA] + 1) & 07777;            /* incr before use */
        MA = DF | M[MA];
        MB = (M[MA] + 1) & 07777;
        if (MEM_ADDR_OK (MA))
            M[MA] = MB;
        if (MB == 0)
            PC = (PC + 1) & 07777;
        break;

/* Opcode 3, DCA */

    case 014:                                           /* DCA, dir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        M[MA] = LAC & 07777;
        // Implement PDP5 PC in location 0.
        if ((MA == 0) && (MODEL == PDP5))
            PC = (M[0]+1) & 07777;                      /* Update PDP-5 PC */
        LAC = LAC & 010000;
        break;

    case 015:                                           /* DCA, dir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        M[MA] = LAC & 07777;
        // Implement PDP5 PC in location 0.
        if ((MA == 0) && (MODEL == PDP5))
            PC = (M[0]+1) & 07777;                      /* Update PDP-5 PC */
        LAC = LAC & 010000;
        break;

    case 016:                                           /* DCA, indir, zero */
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        if ((MA & 07770) != 00010)                      /* indirect; autoinc? */
            MA = DF | M[MA];
        else MA = DF | (M[MA] = (M[MA] + 1) & 07777);   /* incr before use */
        if (MEM_ADDR_OK (MA))
            M[MA] = LAC & 07777;
        // Implement PDP5 PC in location 0.
        if ((MA == 0) && (MODEL == PDP5))
            PC = (M[0]+1) & 07777;                      /* Update PDP-5 PC */
        LAC = LAC & 010000;
        break;

    case 017:                                           /* DCA, indir, curr */
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        if ((MA & 07770) == 00010)                      /* indirect; autoinc? */
            if (MODEL != VT78)                          /* on a 6100? */
                M[MA] = (M[MA] + 1) & 07777;            /* incr before use */
        MA = DF | M[MA];
        if (MEM_ADDR_OK (MA))
            M[MA] = LAC & 07777;
        // Implement PDP5 PC in location 0.
        if ((MA == 0) && (MODEL == PDP5))
            PC = (M[0]+1) & 07777;                      /* Update PDP-5 PC */
        LAC = LAC & 010000;
        break;

/* Opcode 4, JMS.  From Bernhard Baehr's description of the TSC8-75:

   (In user mode) the current JMS opcode is moved to the ERIOT register, the ECDF
   flag is cleared. The address of the JMS instruction is loaded into the ERTB
   register and the TSC8-75 I/O flag is raised. When the TSC8-75 is enabled, the
   target addess of the JMS is loaded into PC, but nothing else (loading of IF, UF,
   clearing the interrupt inhibit flag, storing of the return address in the first
   word of the subroutine) happens. When the TSC8-75 is disabled, the JMS is performed
   as usual. */

    case 020:                                           /* JMS, dir, zero */
        PCQ_ENTRY (MA);
        MA = IR & 0177;                                 /* dir addr, page zero */
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            }
        if (UF && tsc_enb) {                            /* user mode, TSC enab? */
            tsc_pc = (PC - 1) & 07777;                  /* save PC */
            int_req = int_req | INT_TSC;                /* request intr */
            }
        else {                                          /* normal */
            IF = IB;                                    /* change IF */
            UF = UB;                                    /* change UF */
            int_req = int_req | INT_NO_CIF_PENDING;     /* clr intr inhibit */
            MA = IF | MA;
            if (MEM_ADDR_OK (MA))
                M[MA] = PC;
            }
        PC = (MA + 1) & 07777;
        break;

    case 021:                                           /* JMS, dir, curr */
        PCQ_ENTRY (MA);
        MA = (MA & 007600) | (IR & 0177);               /* dir addr, curr page */
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            }
        if (UF && tsc_enb) {                            /* user mode, TSC enab? */
            tsc_pc = (PC - 1) & 07777;                  /* save PC */
            int_req = int_req | INT_TSC;                /* request intr */
            }
        else {                                          /* normal */
            IF = IB;                                    /* change IF */
            UF = UB;                                    /* change UF */
            int_req = int_req | INT_NO_CIF_PENDING;     /* clr intr inhibit */
            MA = IF | MA;
            if (MEM_ADDR_OK (MA))
                M[MA] = PC;
            }
        PC = (MA + 1) & 07777;
        break;

    case 022:                                           /* JMS, indir, zero */
        PCQ_ENTRY (MA);
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        if ((MA & 07770) != 00010)                      /* indirect; autoinc? */
            MA = M[MA];
        else MA = (M[MA] = (M[MA] + 1) & 07777);        /* incr before use */
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            }
        if (UF && tsc_enb) {                            /* user mode, TSC enab? */
            tsc_pc = (PC - 1) & 07777;                  /* save PC */
            int_req = int_req | INT_TSC;                /* request intr */
            }
        else {                                          /* normal */
            IF = IB;                                    /* change IF */
            UF = UB;                                    /* change UF */
            int_req = int_req | INT_NO_CIF_PENDING;     /* clr intr inhibit */
            MA = IF | MA;
            if (MEM_ADDR_OK (MA))
                M[MA] = PC;
            }
        PC = (MA + 1) & 07777;
        break;

    case 023:                                           /* JMS, indir, curr */
        PCQ_ENTRY (MA);
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        if ((MA & 07770) == 00010)                      /* indirect; autoinc? */
            if (MODEL != VT78)                          /* on a 6100? */
                M[MA] = (M[MA] + 1) & 07777;            /* incr before use */
        MA = M[MA];
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            }
        if (UF && tsc_enb) {                            /* user mode, TSC enab? */
            tsc_pc = (PC - 1) & 07777;                  /* save PC */
            int_req = int_req | INT_TSC;                /* request intr */
            }
        else {                                          /* normal */
            IF = IB;                                    /* change IF */
            UF = UB;                                    /* change UF */
            int_req = int_req | INT_NO_CIF_PENDING;     /* clr intr inhibit */
            MA = IF | MA;
            if (MEM_ADDR_OK (MA))
                M[MA] = PC;
            }
        PC = (MA + 1) & 07777;
        break;

/* Opcode 5, JMP.  From Bernhard Baehr's description of the TSC8-75:

   (In user mode) the current JMP opcode is moved to the ERIOT register, the ECDF
   flag is cleared. The address of the JMP instruction is loaded into the ERTB
   register and the TSC8-75 I/O flag is raised. Then the JMP is performed as usual
   (including the setting of IF, UF and clearing the interrupt inhibit flag). */


    case 024:                                           /* JMP, dir, zero */
        PCQ_ENTRY (MA);
        MA = IR & 0177;                                 /* dir addr, page zero */
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            if (tsc_enb) {                              /* TSC8 enabled? */
                tsc_pc = (PC - 1) & 07777;              /* save PC */
                int_req = int_req | INT_TSC;            /* request intr */
                }
            }
        IF = IB;                                        /* change IF */
        UF = UB;                                        /* change UF */
        int_req = int_req | INT_NO_CIF_PENDING;         /* clr intr inhibit */
        PC = MA;
        break;

/* If JMP direct, also check for idle (KSF/JMP *-1) and infinite loop */

    case 025:                                           /* JMP, dir, curr */
        PCQ_ENTRY (MA);
        MA = (MA & 007600) | (IR & 0177);               /* dir addr, curr page */
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            if (tsc_enb) {                              /* TSC8 enabled? */
                tsc_pc = (PC - 1) & 07777;              /* save PC */
                int_req = int_req | INT_TSC;            /* request intr */
                }
            }
        if (sim_idle_enab &&                            /* idling enabled? */
            (IF == IB)) {                               /* to same bank? */
            if (MA == ((PC - 2) & 07777)) {             /* 1) JMP *-1? */
                if (!(int_req & (INT_ION|INT_TTI)) &&   /*    iof, TTI flag off? */
                    (M[IB|((PC - 2) & 07777)] == OP_KSF)) /*  next is KSF? */
                    sim_idle (TMR_CLK, FALSE);          /* we're idle */
                }                                       /* end JMP *-1 */
            else if (MA == ((PC - 1) & 07777)) {        /* 2) JMP *? */
                if (!(int_req & INT_ION))               /*    iof? */
                    reason = STOP_LOOP;                 /* then infinite loop */
                else if (!(int_req & INT_ALL))          /*    ion, not intr? */
                    sim_idle (TMR_CLK, FALSE);          /* we're idle */
                }                                       /* end JMP */
            }                                           /* end idle enabled */
        IF = IB;                                        /* change IF */
        UF = UB;                                        /* change UF */
        int_req = int_req | INT_NO_CIF_PENDING;         /* clr intr inhibit */
        PC = MA;
        break;

    case 026:                                           /* JMP, indir, zero */
        PCQ_ENTRY (MA);
        MA = IF | (IR & 0177);                          /* dir addr, page zero */
        if ((MA & 07770) != 00010)                      /* indirect; autoinc? */
            MA = M[MA];
        else MA = (M[MA] = (M[MA] + 1) & 07777);        /* incr before use */
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            if (tsc_enb) {                              /* TSC8 enabled? */
                tsc_pc = (PC - 1) & 07777;              /* save PC */
                int_req = int_req | INT_TSC;            /* request intr */
                }
            }
        IF = IB;                                        /* change IF */
        UF = UB;                                        /* change UF */
        int_req = int_req | INT_NO_CIF_PENDING;         /* clr intr inhibit */
        PC = MA;
        break;

    case 027:                                           /* JMP, indir, curr */
        PCQ_ENTRY (MA);
        MA = (MA & 077600) | (IR & 0177);               /* dir addr, curr page */
        if ((MA & 07770) == 00010)                      /* indirect; autoinc? */
            if (MODEL != VT78)                          /* on a 6100? */
                M[MA] = (M[MA] + 1) & 07777;            /* incr before use */
        MA = M[MA];
        if (UF) {                                       /* user mode? */
            tsc_ir = IR;                                /* save instruction */
            tsc_cdf = 0;                                /* clear flag */
            if (tsc_enb) {                              /* TSC8 enabled? */
                tsc_pc = (PC - 1) & 07777;              /* save PC */
                int_req = int_req | INT_TSC;            /* request intr */
                }
            }
        IF = IB;                                        /* change IF */
        UF = UB;                                        /* change UF */
        int_req = int_req | INT_NO_CIF_PENDING;         /* clr intr inhibit */
        PC = MA;
        break;

/* Opcode 7, OPR group 1 */

    case 034:case 035:                                  /* OPR, group 1 */
        /* TODO: PDP-5 and PDP-8/S generate random results for complement and
           rotate.  This is because both are attempted together, and the
           set and reset of individual bits occur together.
        */
        /* TODO: Prior to the 8/I and 8/L generate random results for increment
           and rotate.  This is because both are attempted together, and
           the set and reset of individual bits occur together.
        */
        switch ((IR >> 4) & 017) {                      /* decode IR<4:7> */
        case 0:                                         /* nop */
            break;
        case 1:                                         /* CML */
            LAC = LAC ^ 010000;
            break;
        case 2:                                         /* CMA */
            LAC = LAC ^ 07777;
            break;
        case 3:                                         /* CMA CML */
            LAC = LAC ^ 017777;
            break;
        case 4:                                         /* CLL */
            LAC = LAC & 07777;
            break;
        case 5:                                         /* CLL CML = STL */
            LAC = LAC | 010000;
            break;
        case 6:                                         /* CLL CMA */
            LAC = (LAC ^ 07777) & 07777;
            break;
        case 7:                                         /* CLL CMA CML */
            LAC = (LAC ^ 07777) | 010000;
            break;
        case 010:                                       /* CLA */
            LAC = LAC & 010000;
            break;
        case 011:                                       /* CLA CML */
            LAC = (LAC & 010000) ^ 010000;
            break;
        case 012:                                       /* CLA CMA = STA */
            LAC = LAC | 07777;
            break;
        case 013:                                       /* CLA CMA CML */
            LAC = (LAC | 07777) ^ 010000;
            break;
        case 014:                                       /* CLA CLL */
            LAC = 0;
            break;
        case 015:                                       /* CLA CLL CML */
            LAC = 010000;
            break;
        case 016:                                       /* CLA CLL CMA */
            LAC = 07777;
            break;
        case 017:                                       /* CLA CLL CMA CML */
            LAC = 017777;
            break;
            }                                           /* end switch opers */

        /* Implement CMA rotate rubbish on early models. */
        if ((MODEL < PDP8_) && (IR & 040)) {
            if (IR & 016)
               LAC ^= 07777;
        }

        if (IR & 01) {                                  /* IAC */
            LAC = (LAC + 1) & 017777;
            // Implement IAC rotate rubbish on early models.
            if ((MODEL < PDP8L) && (IR & 016))
                LAC ^= 07777;
        }

        switch ((IR >> 1) & 07) {                       /* decode IR<8:10> */
        case 0:                                         /* nop */
            break;
        case 1:                                         /* BSW */
            if (MODEL < PDP8E)
                break; /* no BSW */
            LAC = (LAC & 010000) | ((LAC >> 6) & 077) | ((LAC & 077) << 6);
            break;
        case 2:                                         /* RAL */
            LAC = ((LAC << 1) | (LAC >> 12)) & 017777;
            break;
        case 3:                                         /* RTL */
            LAC = ((LAC << 2) | (LAC >> 11)) & 017777;
            break;
        case 4:                                         /* RAR */
            LAC = ((LAC >> 1) | (LAC << 12)) & 017777;
            break;
        case 5:                                         /* RTR */
            LAC = ((LAC >> 2) | (LAC << 11)) & 017777;
            break;
        case 6:                                         /* RAL RAR - undef */
            /* Model dependent */
            if (MODEL < PDP8L)
                LAC = LAC & ((LAC >> 1) | (LAC << 12)) & 017777;
            else if (MODEL < PDP8E)
                LAC = ((LAC << 1) | (LAC >> 12)) & ((LAC >> 1) | (LAC << 12)) & 017777;
            else if (MODEL < DMI)
                LAC = LAC & (IR | 010000);              /* uses AND path */
            else
                /* R3L */
                LAC = (LAC&010000) + ((LAC&0777)<<3) + ((LAC&07000)>>9);
            break;
        case 7:                                         /* RTL RTR - undef */
            /* Model dependent */
            if (MODEL < PDP8L)
                LAC = LAC & ((LAC >> 2) | (LAC << 11)) & 017777;
            else if (MODEL < PDP8E)
                LAC = ((LAC << 2) | (LAC >> 11)) & ((LAC >> 2) | (LAC << 11)) & 017777;
            else if (MODEL < PDP8A)
                LAC = (LAC & 010000) | (MA & 07600) | (IR & 0177);
            else if (MODEL < VT78)
                LAC = (LAC & 010000) | PC;
            break;                                      /* uses address path */
            }                                           /* end switch shifts */
        break;                                          /* end group 1 */

/* OPR group 2.  From Bernhard Baehr's description of the TSC8-75:

   (In user mode) HLT (7402), OSR (7404) and microprogrammed combinations with
   HLT and OSR: Additional to raising a user mode interrupt, the current OPR
   opcode is moved to the ERIOT register and the ECDF flag is cleared. */

    case 036:case 037:                                  /* OPR, groups 2, 3 */
        if ((IR & 01) == 0) {                           /* group 2 */
            switch ((IR >> 3) & 017) {                  /* decode IR<6:8> */
            case 0:                                     /* nop */
                break;
            case 1:                                     /* SKP */
                PC = (PC + 1) & 07777;
                break;
            case 2:                                     /* SNL */
                if (LAC >= 010000)
                    PC = (PC + 1) & 07777;
                break;
            case 3:                                     /* SZL */
                if (LAC < 010000)
                    PC = (PC + 1) & 07777;
                break;
            case 4:                                     /* SZA */
                if ((LAC & 07777) == 0)
                    PC = (PC + 1) & 07777;
                break;
            case 5:                                     /* SNA */
                if ((LAC & 07777)
                    != 0) PC = (PC + 1) & 07777;
                break;
            case 6:                                     /* SZA | SNL */
                if ((LAC == 0) || (LAC >= 010000))
                    PC = (PC + 1) & 07777;
                break;
            case 7:                                     /* SNA & SZL */
                if ((LAC != 0) && (LAC < 010000))
                    PC = (PC + 1) & 07777;
                break;
            case 010:                                   /* SMA */
                if ((LAC & 04000) != 0)
                    PC = (PC + 1) & 07777;
                break;
            case 011:                                   /* SPA */
                if ((LAC & 04000) == 0)
                    PC = (PC + 1) & 07777;
                break;
            case 012:                                   /* SMA | SNL */
                if (LAC >= 04000)
                    PC = (PC + 1) & 07777;
                break;
            case 013:                                   /* SPA & SZL */
                if (LAC < 04000)
                    PC = (PC + 1) & 07777;
                break;
            case 014:                                   /* SMA | SZA */
                if (((LAC & 04000) != 0) || ((LAC & 07777) == 0))
                    PC = (PC + 1) & 07777;
                break;
            case 015:                                   /* SPA & SNA */
                if (((LAC & 04000) == 0) && ((LAC & 07777) != 0))
                    PC = (PC + 1) & 07777;
                break;
            case 016:                                   /* SMA | SZA | SNL */
                if ((LAC >= 04000) || (LAC == 0))
                    PC = (PC + 1) & 07777;
                break;
            case 017:                                   /* SPA & SNA & SZL */
                if ((LAC < 04000) && (LAC != 0))
                    PC = (PC + 1) & 07777;
                break;
                }                                       /* end switch skips */
            if (IR & 0200)                              /* CLA */
                LAC = LAC & 010000;
            if ((IR & 06) && UF) {                      /* user mode? */
                int_req = int_req | INT_UF;             /* request intr */
                tsc_ir = IR;                            /* save instruction */
                tsc_cdf = 0;                            /* clear flag */
                }
            else {
                if (IR & 04)                            /* OSR */
                    LAC = LAC | SR;
                if (IR & 02)                            /* HLT */
                    reason = STOP_HALT;
                }
            break;
            }                                           /* end if group 2 */

/* OPR group 3 standard

   MQA!MQL exchanges AC and MQ, as follows:

        temp = MQ;
        MQ = LAC & 07777;
        LAC = LAC & 010000 | temp;
*/
        if (MODEL < PDP8I)
            temp = 0;                                   /* no SWP */
        else
            temp = MQ;                                  /* group 3 */
        if (IR & 0200)                                  /* CLA */
            if (MODEL != PDP8L)                         /* NOP on 8/L */
                LAC = LAC & 010000;
        if (IR & 0020) {                                /* MQL */
            if ((MODEL < PDP8E) && (cpu_unit.flags & UNIT_NOEAE)) {
                reason = stop_inst;                     /* EAE not present */
                break;
            } else {
                MQ = LAC & 07777;
                LAC = LAC & 010000;
            }
        }
        if (IR & 0100)                                  /* MQA */
            if ((MODEL < PDP8E) && (cpu_unit.flags & UNIT_NOEAE)) {
                reason = stop_inst;                     /* EAE not present */
                break;
            } else {
                LAC = LAC | temp;
            }
        if ((IR & 0056) && (cpu_unit.flags & UNIT_NOEAE)) {
            reason = stop_inst;                         /* EAE not present */
            break;
        }

/* OPR group 3 EAE

   The EAE operates in two modes:

        Mode A, PDP-8/I compatible
        Mode B, extended capability

   Mode B provides eight additional subfunctions; in addition, some
   of the Mode A functions operate differently in Mode B.

   The mode switch instructions are decoded explicitly and cannot be
   microprogrammed with other EAE functions (SWAB performs an MQL as
   part of standard group 3 decoding).  If mode switching is decoded,
   all other EAE timing is suppressed.
*/

        if (IR == 07431) {                              /* SWAB */
            if (MODEL < PDP8E) {
                reason = stop_inst;                     /* no mode B */
                break;
            }
            emode = 1;                                  /* set mode flag */
            break;
            }
        if (IR == 07447) {                              /* SWBA */
            if (MODEL < PDP8E) {
                reason = stop_inst;                     /* no mode B */
                break;
            }
            emode = gtf = 0;                            /* clear mode, gtf */
            break;
            }

/* If not switching modes, the EAE operation is determined by the mode
   and IR<6,8:10>:

   <6:10>       mode A          mode B          comments

   0x000        NOP             NOP
   0x001        SCL             ACS
   0x010        MUY             MUY             if mode B, next = address
   0x011        DVI             DVI             if mode B, next = address
   0x100        NMI             NMI             if mode B, clear AC if
                                                 result = 4000'0000
   0x101        SHL             SHL             if mode A, extra shift
   0x110        ASR             ASR             if mode A, extra shift
   0x111        LSR             LSR             if mode A, extra shift
   1x000        SCA             SCA
   1x001        SCA + SCL       DAD
   1x010        SCA + MUY       DST
   1x011        SCA + DVI       SWBA            NOP if not detected earlier
   1x100        SCA + NMI       DPSZ            
   1x101        SCA + SHL       DPIC            must be combined with MQA!MQL
   1x110        SCA + ASR       DCM             must be combined with MQA!MQL
   1x111        SCA + LSR       SAM

   EAE instructions which fetch memory operands use the CPU's DEFER
   state to read the first word; if the address operand is in locations
   x0010 - x0017, it is autoincremented.
*/

        if (emode == 0)                                 /* mode A? clr gtf */
            gtf = 0;
        switch ((IR >> 1) & 027) {                      /* decode IR<6,8:10> */

        case 020:                                       /* mode A, B: SCA */
            LAC = LAC | SC;
            break;
        case 000:                                       /* mode A, B: NOP */
            break;

        case 021:                                       /* mode B: DAD */
            if (emode) {
                MA = IF | PC;
                if ((MA & 07770) != 00010)              /* indirect; autoinc? */
                    MA = DF | M[MA];
                else MA = DF | (M[MA] = (M[MA] + 1) & 07777); /* incr before use */
                MQ = MQ + M[MA];
                MA = DF | ((MA + 1) & 07777);
                LAC = (LAC & 07777) + M[MA] + (MQ >> 12);
                MQ = MQ & 07777;
                PC = (PC + 1) & 07777;
                break;
                }
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 001:                                       /* mode B: ACS */
            if (emode) {
                SC = LAC & 037;
                LAC = LAC & 010000;
                }
            else {                                      /* mode A: SCL */
                if (MODEL < PDP8I) {
                    reason = stop_inst;                 /* no SCL */
                    break;
                }
                SC = (~M[IF | PC]) & 037;
                PC = (PC + 1) & 07777;
                }
            break;

        case 022:                                       /* mode B: DST */
            if (emode) {
                MA = IF | PC;
                if ((MA & 07770) != 00010)              /* indirect; autoinc? */
                    MA = DF | M[MA];
                else MA = DF | (M[MA] = (M[MA] + 1) & 07777); /* incr before use */
                if (MEM_ADDR_OK (MA))
                    M[MA] = MQ & 07777;
                MA = DF | ((MA + 1) & 07777);
                if (MEM_ADDR_OK (MA))
                    M[MA] = LAC & 07777;
                PC = (PC + 1) & 07777;
                break;
                }
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 002:                                       /* MUY */
            MA = IF | PC;
            if (emode) {                                /* mode B: defer */
                if ((MA & 07770) != 00010)              /* indirect; autoinc? */
                    MA = DF | M[MA];
                else MA = DF | (M[MA] = (M[MA] + 1) & 07777); /* incr before use */
                }
            temp = (MQ * M[MA]) + (LAC & 07777);
            LAC = (temp >> 12) & 07777;
            MQ = temp & 07777;
            PC = (PC + 1) & 07777;
            SC = 014;                                   /* 12 shifts */
            break;

        case 023:                                       /* mode B: SWBA */
            if (emode)
                break;
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 003:                                       /* DVI */
            MA = IF | PC;
            if (emode) {                                /* mode B: defer */
                if ((MA & 07770) != 00010)              /* indirect; autoinc? */
                    MA = DF | M[MA];
                else MA = DF | (M[MA] = (M[MA] + 1) & 07777); /* incr before use */
                }
            if ((LAC & 07777) >= M[MA]) {               /* overflow? */
                LAC = LAC | 010000;                     /* set link */
                MQ = ((MQ << 1) + 1) & 07777;           /* rotate MQ */
                SC = 0;                                 /* no shifts */
                }
            else {
                temp = ((LAC & 07777) << 12) | MQ;
                MQ = temp / M[MA];
                LAC = temp % M[MA];
                SC = 015;                               /* 13 shifts */
                }
            PC = (PC + 1) & 07777;
            break;

        case 024:                                       /* mode B: DPSZ */
            if (emode) {
                if (((LAC | MQ) & 07777) == 0)
                    PC = (PC + 1) & 07777;
                break;
                }
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 004:                                       /* NMI */
            temp = (LAC << 12) | MQ;                    /* preserve link */
            for (SC = 0; ((temp & 017777777) != 0) &&
                (temp & 040000000) == ((temp << 1) & 040000000); SC++)
                temp = temp << 1;
            LAC = (temp >> 12) & 017777;
            MQ = temp & 07777;
            if (emode && ((LAC & 07777) == 04000) && (MQ == 0))
                LAC = LAC & 010000;                     /* clr if 4000'0000 */
            break;

        case 025:                                       /* mode B: DPIC */
            if (emode) {
                temp = (LAC + 1) & 07777;               /* SWP already done! */
                LAC = MQ + (temp == 0);
                MQ = temp;
                break;
                }
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 5:                                         /* SHL */
            SC = (M[IF | PC] & 037) + (emode ^ 1);      /* shift+1 if mode A */
            if (SC > 25)                                /* >25? result = 0 */
                temp = 0;
            else temp = ((LAC << 12) | MQ) << SC;       /* <=25? shift LAC:MQ */
            LAC = (temp >> 12) & 017777;
            MQ = temp & 07777;
            PC = (PC + 1) & 07777;
            SC = emode? 037: 0;                         /* SC = 0 if mode A */
            break;

        case 026:                                       /* mode B: DCM */
            if (emode) {
                temp = (-LAC) & 07777;                  /* SWP already done! */
                LAC = (MQ ^ 07777) + (temp == 0);
                MQ = temp;
                break;
                }
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 6:                                         /* ASR */
            SC = (M[IF | PC] & 037) + (emode ^ 1);      /* shift+1 if mode A */
            temp = ((LAC & 07777) << 12) | MQ;          /* sext from AC0 */
            if (LAC & 04000)
                temp = temp | ~037777777;
            if (emode && (SC != 0))
                gtf = (temp >> (SC - 1)) & 1;
            if (SC > 25)
                temp = (LAC & 04000)? -1: 0;
            else temp = temp >> SC;
            LAC = (temp >> 12) & 017777;
            MQ = temp & 07777;
            PC = (PC + 1) & 07777;
            SC = emode? 037: 0;                         /* SC = 0 if mode A */
            break;

        case 027:                                       /* mode B: SAM */
            if (emode) {
                temp = LAC & 07777;
                LAC = MQ + (temp ^ 07777) + 1;          /* L'AC = MQ - AC */
                gtf = (temp <= MQ) ^ ((temp ^ MQ) >> 11);
                break;
                }
            LAC = LAC | SC;                             /* mode A: SCA then */
        case 7:                                         /* LSR */
            SC = (M[IF | PC] & 037) + (emode ^ 1);      /* shift+1 if mode A */
            temp = ((LAC & 07777) << 12) | MQ;          /* clear link */
            if (emode && (SC != 0))
                gtf = (temp >> (SC - 1)) & 1;
            if (SC > 24)                                /* >24? result = 0 */
                temp = 0;
            else temp = temp >> SC;                     /* <=24? shift AC:MQ */
            LAC = (temp >> 12) & 07777;
            MQ = temp & 07777;
            PC = (PC + 1) & 07777;
            SC = emode? 037: 0;                         /* SC = 0 if mode A */
            break;
            }                                           /* end switch */
        break;                                          /* end case 7 */

/* Opcode 6, IOT.  From Bernhard Baehr's description of the TSC8-75:

   (In user mode) Additional to raising a user mode interrupt, the current IOT
   opcode is moved to the ERIOT register. When the IOT is a CDF instruction (62x1),
   the ECDF flag is set, otherwise it is cleared. */

    case 030:case 031:case 032:case 033:                /* IOT */
        if (UF) {                                       /* privileged? */
            int_req = int_req | INT_UF;                 /* request intr */
            tsc_ir = IR;                                /* save instruction */
            if ((IR & 07707) == 06201)                  /* set/clear flag */
                tsc_cdf = 1;
            else tsc_cdf = 0;
            break;
            }
        device = (IR >> 3) & 077;                       /* device = IR<3:8> */
        pulse = IR & 07;                                /* pulse = IR<9:11> */
        iot_data = LAC & 07777;                         /* AC unchanged */
        switch (device) {                               /* decode IR<3:8> */

        case 000:                                       /* CPU control */
            switch (pulse) {                            /* decode IR<9:11> */

            case 0:                                     /* SKON */
                if (MODEL < PDP8E)
                    break;                              /* no SKON */
                if (int_req & INT_ION)
                    PC = (PC + 1) & 07777;
                int_req = int_req & ~INT_ION;
                break;

            case 1:                                     /* ION */
                int_req = (int_req | INT_ION) & ~INT_NO_ION_PENDING;
                break;

            case 2:                                     /* IOF */
                int_req = int_req & ~INT_ION;
                break;

            case 3:                                     /* SRQ */
                if (MODEL < PDP8E) {
                    reason = stop_inst;                 /* no SRQ */
                    break;
                }
                if (int_req & INT_ALL)
                    PC = (PC + 1) & 07777;
                break;

            case 4:                                     /* GTF */
                if (MODEL < PDP8E) {
// BUGBUG: Straight-8 with (type 189) ADC instruction goes here.
// BUGBUG: Reason codes need fixing!!
                    reason = stop_inst;                 /* no GTF */
                    break;
                }
                LAC = (LAC & 010000) |
                      ((LAC & 010000) >> 1) | (gtf << 10) |
                      (((int_req & INT_ALL) != 0) << 9) |
                      (((int_req & INT_ION) != 0) << 7) | SF;
                break;

            case 5:                                     /* RTF */
                if (MODEL < PDP8E) {
                    reason = stop_inst;                 /* no RTF */
                    break;
                }
                gtf = ((LAC & 02000) >> 10);
                UB = (LAC & 0100) >> 6;
                IB = (LAC & 0070) << 9;
                DF = (LAC & 0007) << 12;
                LAC = ((LAC & 04000) << 1) | iot_data;
                int_req = (int_req | INT_ION) & ~INT_NO_CIF_PENDING;
                break;

            case 6:                                     /* SGT */
                if (MODEL < PDP8E) {
// BUGBUG: PDP-12 with (KF12B) APION instruction goes here.
// BUGBUG: (KF12B option also conflicts with DECtape IOTs.)
                    reason = stop_inst;                 /* no SGT */
                    break;
                }
                if (gtf)
                    PC = (PC + 1) & 07777;
                break;

            case 7:                                     /* CAF */
                if (MODEL < PDP8E) {
                    reason = stop_inst;                 /* no CAF */
                    break;
                }
                gtf = 0;
                emode = 0;
                int_req = int_req & INT_NO_CIF_PENDING;
                dev_done = 0;
                int_enable = INT_INIT_ENABLE;
                LAC = 0;
                reset_all (1);                          /* reset all dev */
                break;
                }                                       /* end switch pulse */
            break;                                      /* end case 0 */

        case 020:case 021:case 022:case 023:
        case 024:case 025:case 026:case 027:            /* memory extension */
            switch (pulse) {                            /* decode IR<9:11> */

            case 1:                                     /* CDF */
                DF = (IR & 0070) << 9;
                break;

            case 2:                                     /* CIF */
                IB = (IR & 0070) << 9;
                int_req = int_req & ~INT_NO_CIF_PENDING;
                break;

            case 3:                                     /* CDF CIF */
                DF = IB = (IR & 0070) << 9;
                int_req = int_req & ~INT_NO_CIF_PENDING;
                break;

            case 4:
                switch (device & 07) {                  /* decode IR<6:8> */

                case 0:                                 /* CINT */
                    int_req = int_req & ~INT_UF;
                    break;

                case 1:                                 /* RDF */
                    LAC = LAC | (DF >> 9);
                        break;

                case 2:                                 /* RIF */
                    LAC = LAC | (IF >> 9);
                    break;

                case 3:                                 /* RIB */
                    LAC = LAC | SF;
                    break;

                case 4:                                 /* RMF */
                    UB = (SF & 0100) >> 6;
                    IB = (SF & 0070) << 9;
                    DF = (SF & 0007) << 12;
                    int_req = int_req & ~INT_NO_CIF_PENDING;
                    break;

                case 5:                                 /* SINT */
                    if (int_req & INT_UF)
                        PC = (PC + 1) & 07777;
                    break;

                case 6:                                 /* CUF */
                    UB = 0;
                    int_req = int_req & ~INT_NO_CIF_PENDING;
                    break;

                case 7:                                 /* SUF */
                    UB = 1;
                    int_req = int_req & ~INT_NO_CIF_PENDING;
                    break;
                    }                                   /* end switch device */
                break;
            
            default:
                reason = stop_inst;
                break;
                }                                       /* end switch pulse */
            break;                                      /* end case 20-27 */

        case 010:                                       /* power fail */
            switch (pulse) {                            /* decode IR<9:11> */

            case 1:                                     /* SBE */
                break;

            case 2:                                     /* SPL */
                if (int_req & INT_PWR)
                    PC = (PC + 1) & 07777;
                break;

            case 3:                                     /* CAL */
                int_req = int_req & ~INT_PWR;
                break;

            default:
                reason = stop_inst;
                break;
                }                                       /* end switch pulse */
            break;                                      /* end case 10 */

        case 014:                                       /* LINC or PDP12 */
        case 015:                                       /* LINC */
        case 016:                                       /* LINC */
        case 017:                                       /* LINC */
            if (linciot(device, pulse))                              /* Do IOT if needed */
                break;                                  /* IOT was done */
            /* FALL THROUGH */

        default:                                        /* I/O device */
            if (dev_tab[device]) {                      /* dev present? */
                iot_data = dev_tab[device] (IR, iot_data);
                LAC = (LAC & 010000) | (iot_data & 07777);
                if (iot_data & IOT_SKP)
                    PC = (PC + 1) & 07777;
                if (iot_data >= IOT_REASON)
                    reason = iot_data >> IOT_V_REASON;
                }
            else reason = stop_inst;                    /* stop on flag */
            break;
        }                                               /* end switch device */
        break;                                          /* end case IOT */
    }                                                   /* end switch opcode */
}

/*
   The LINC does all arithmetic in one's complement.

   Bits are renumbered from the LINC convention to the PDP-8 convention,
   which is to say that bit 0 is sign/MSB and bit 11 is LSB.  (LINC
   documentation uses the other convention.)

   The LINC has three instruction formats: memory reference, index,
   miscellaneous.  The memory reference format is:

     0  1  2  3  4  5  6  7  8  9 10 11
   +--+--+--+--+--+--+--+--+--+--+--+--+
   |  op |         page offset         |        memory reference
   +--+--+--+--+--+--+--+--+--+--+--+--+

   <0:1>        mnemonic        action

    01          ADD             L'AC = AC + M[MA]
    10          STC             M[MA] = AC, AC = 0
    11          JMP             PC = MA

    MA = IF'PC<0:1>'IR<2:11>

   The indexed format is:

     0  1  2  3  4  5  6  7  8  9 10 11
   +--+--+--+--+--+--+--+--+--+--+--+--+
   | 0  0| 1|     op    | I|   index   |        indexed reference
   +--+--+--+--+--+--+--+--+--+--+--+--+

   The operation depends on bits <2:7>, while the treatment of
   bits <8:11> is special for the value of 0, and regular otherwise.

   For the special value 0, the PC is used.  The value in the word
   following the instruction is used to form the effective address,
   then the PC is incremented, so that the address is not executed.

   For other values of index, index refers to an address in low memory.
   The value in that address is used to form the effective address,
   then that memory location is incremented.

   When bit 7 (I) is set, the increment is performed before, rather
   than after the effective address is calculated.

   Note that address increments are two's complement.

   Note that address calculations are 10 bit.
   (BUGBUG: Not true if bit 1 is set!!)

   The miscellaneous format is:

     0  1  2  3  4  5  6  7  8  9 10 11
   +--+--+--+--+--+--+--+--+--+--+--+--+
   | 0  0  0|     op    | I|   index   |        no memory reference
   +--+--+--+--+--+--+--+--+--+--+--+--+

   The miscellaneous class consists of those instructions where bits
   <0:2> are all zero.  No effective address is used, and bits <8:11>
   encode an operan, count, etc.

*/
void
do_linc()
{
    int32 ea;
    int32 tmp, h, i;

    /*
        This is taken largely from chapter 3 of the PDP-12 System
        Reference Manual, DEC-12-SRZC-D.

        The index registers live in IF, in locations 0000-00017.
        START 20 key starts at address 0020, START 400 at offset 0400.

        Interrupts are always taken to field 0.  PDP-8 interrupts go
        to location 00000, and interrupts in LINC mode go to 00040.
        In either case, the return address is stored, and execution
        resumes at the (mode dependant) address + 1.

        LINC instruction traps are similar, but go to 00140.

        The low 2 bits of IF are actually in the high 2 bits of PC.

        The 02000 bit in a LINC address indirection indicates to use the
        5 bit DF instead of IF, and is the only way to use the LINC DF.

        LINC DF is initialized from IF/PC during the LINC instruction.
    */
    int index = IR & 017;
    if (IR < 01000)                                     /* Index class? */
        /* Alpha class (00xxx) */
        ea = index;                                     /* No, use reg */
    else if (IR < 02000) {
        /* Index (beta) class (01xxx) */
        if (index) {
            ea = (PC&06000) + index;                    /* Registers in IF */
            if (IR & 020) {                             /* Pre-increment? */
                switch (IR & 01740) {
                    case 1300: /* LDH */
                    case 1340: /* STH */
                    case 1400: /* SHD */
                        /* These increment specially by a half-word */
                        M[ea] = M[ea] + 04000;
                        if (M[ea] & 010000) /* End-around carry */
                           M[ea] = (M[ea]+1) & 01777;
                        break;
                    default:
                        M[ea] = (M[ea]&06000) + ((M[ea]+1)&01777);
                }
            }
fprintf(stderr, "ea reg: m[%04o] == %04o, PC = %05o\n", ea, M[ea], PC);
fprintf(stderr, "ea reg: ea = %04o, PC = %05o\n", ea, PC);
        } else {
            ea = PC;
            PC = (PC&06000) + ((PC+1)&01777);
fprintf(stderr, "ea pc: ea = %04o, PC = %05o\n", ea, PC);
        }
        if ((IR & 037) != 020) {                        /* Indirect? */
            /* Set H so that it's available after indirection. */
            h = M[ea] & 04000;
fprintf(stderr, "ea I: ea = %04o, PC = %05o\n", ea, PC);
fprintf(stderr, "ea I: ldf = %04o, IR = %04o\n", LDF, IR);
            if (M[ea] & 02000)
                ea = (LDF<<10) + (M[ea]&01777);
            else
                ea = (PC&06000) + (M[ea]&01777);
fprintf(stderr, "ea I: ea = %04o, IR = %05o\n", ea, IR);
        } else {
            /* Set H to 0 since there's no indirection. */
            h = 0;
        }
fprintf(stderr, "ea b: ea = %04o, PC = %05o\n", ea, PC);
fprintf(stderr, "ea b: ea = %04o, IR = %04o\n", ea, IR);
    } else {                                            /* Direct addressing */
        /* Direct addressing */
        ea = (PC&06000) + (IR&01777);
    }
//fprintf(stderr, "do_linc() PC=%05o\r\n", PC);
    if (hst_lnt) {                                      /* history enabled? */
        hst_p = (hst_p + 1);                            /* next entry */
        if (hst_p >= hst_lnt)
            hst_p = 0;
        hst[hst_p].pc = MA | HIST_PC;                   /* save PC, IR */
        hst[hst_p].ir = IR;
        hst[hst_p].lac = LAC;                           /* save LAC, MQ */
        hst[hst_p].mq = MQ;
        hst[hst_p].ea = ea;
    }

//fprintf(stderr, "\tdo_linc() IR=%04o\r\n", IR);
    /*
        Now that the effective address, if any is sorted, let's see
        which instruction we're doing.  Most of the time, the low
        five bits have already been dealt with, so don't use them
        again here.  Also, if any of the top two bits are set the
        middle bits have been dealt with already.

        Note that MA contains IF'PC.
    */
    switch (IR & 06000) {
        case 06000: /* JMP */
fprintf(stderr, "jmp: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
            M[PC&06000] = PC;
            PC = ea;
//          M[0] = 06000 + (PC&01777) + 1;              /* Stow ret. addr */
//          PC = (PC&06000) + ea;                       /* Load new PC */
fprintf(stderr, "jmp: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
            break;
        case 04000: /* STC */
// BUGBUG: Here and elsewhere, honor IF/DF in LINC ea.
            M[ea] = LAC & 07777;
            LAC &= 010000;
fprintf(stderr, "stc: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "stc: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
            break;
        case 02000: /* ADD */
// BUGBUG: Here and elsewhere, honor IF/DF in LINC ea.
// BUGBUG: I don't think this is supposed to interact with LINK.
            LAC = LAC + M[ea];
            LAC += !!(LAC&010000);                      /* One's complement */
            break;
        case 00000: /* other */

// BUGBUG: Z Register
// The Z register is the LSB 12 bits of MUL results.  Sort of like MQ.
// Identified with MQ in the PDP-12?  Affected by CLR MUL DSC SAM ROR ROL.

            switch ((IR >> 5) & 037) {                  /* decode IR<2:6> */
                case 000: /* other */
                    switch (IR & 017) {                 /* decode IR<7:11> */
                        case 000: /* HLT */
                            reason = STOP_HALT;
                            break;
                        case 002: /* PDP */
                            LINC = 0;
                            break;
                        case 005: /* ZTA */
                            LAC = (LAC&010000) | (MQ>>1);
                            break;
                        case 010: /* ENI */
                            break;
                        case 011: /* CLR */
                            LAC = MQ = 0;
                            break;
                        case 013: /* MSC13 */
// BUGBUG: Set WTM in LINCtape controller if MARK button pressed..
                            break;
                        case 014: /* ATR */
// BUGBUG: Set relay register from 6 LSB of LAC.
                            break;
                        case 015: /* RTA */
// BUGBUG: Set AC from relay register.
                            break;
                        case 016: /* NOP */
                            /* fully implemented! */
                            break;
                        case 017: /* COM */
                            LAC ^= 07777;
                            break;
                        default:  /* undefined */
                            /* implemented as NOPs */
                            break;
                    }
                    break;
                case 001: /* SET */
                    ea = (PC&06000) + ea;
fprintf(stderr, "set: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
                    if (IR & 020) {
                        tmp = PC;
                    } else {
                        tmp = (PC&06000) + (M[PC] & 01777);
                    }
fprintf(stderr, "set: val = %04o, PC = %05o, ea = %04o\n", M[tmp], PC, ea);
                    M[ea] = M[tmp];
                    PC = (PC&06000) + ((PC+1)&01777);   /* Bump PC */
fprintf(stderr, "set: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
                    break;
                case 002: /* SAM */
// BUGBUG: Sample signal indicated by ea.  Leave result in 8 LSB of AC.
// 0-7 are potentiometers.  10-17 are analog inputs.
// BUGBUG: Asynchronous conversion is not implemented.
                    break;
                case 003: /* DIS */
// BUGBUG: Display a point at AC:3-11, M[ea]:3-11.  Use M[ea]:0 to determine
// which scope.  Horizontal axis is unsigned, vertical is signed.
                    break;
                case 004: /* XSK */
                    ea += PC & 06000; /* Registers are in IF */
                    if (IR & 020) /* indexing requested */
                        M[ea] = (M[ea]&06000) + ((M[ea]+1)&01777);
                    if ((M[ea]&01777) == 01777) /* skip if at end */
                        PC = (PC&06000) + ((PC+1)&01777); /* Bump PC */
                    break;
                case 005: /* ROL */
// BUGBUG: What is the relationship with the Z register??
// ROL doesn't affect MQ.
                    ea &= 017;
                    if (IR & 020) {
                        /* Rotate with LINK */
fprintf(stderr, "rotate class: IR = %04o, PC = %05o, AC = %05o\n", IR, PC, LAC);
                        for (i = 0; i < ea; i++)
                            LAC = ((LAC<<1) + (LAC>>12)) & 017777;
fprintf(stderr, "rotate class: IR = %04o, PC = %05o, AC = %05o\n", IR, PC, LAC);
                    } else {
                        /* Rotate without LINK */
fprintf(stderr, "rotate class: IR = %04o, PC = %05o, AC = %05o\n", IR, PC, LAC);
                        tmp = LAC & 010000; /* remember LINK */
                        LAC &= 07777;      /* clear LINK */
                        for (i = 0; i < ea; i++)
                            LAC = ((LAC<<1) + (LAC>>11)) & 07777;
                        LAC |= tmp; /* restore LINK */
fprintf(stderr, "rotate class: IR = %04o, PC = %05o, AC = %05o\n", IR, PC, LAC);
                    }
                    break;
                case 006: /* ROR */
                    // ROL and SCR shift into Z.
                    ea &= 017;
                    if (IR & 020) {
                        /* Rotate with LINK */
                        for (i = 0; i < ea; i++) {
                            MQ = (MQ>>1) + ((LAC&01)<<11);
                            LAC = (LAC>>1) + ((LAC&01)<<12);
                        }
                    } else {
                        /* Rotate without LINK */
                        tmp = LAC & 010000; /* remember LINK */
                        LAC &= 07777;      /* clear LINK */
                        for (i = 0; i < ea; i++) {
                            MQ = (MQ>>1) + ((LAC&01)<<11);
                            LAC = (LAC>>1) + ((LAC&01)<<11);
                        }
                        LAC |= tmp; /* restore LINK */
                    }
                    break;
                case 007: /* SCR */
                    // ROL and SCR shift into Z.
                    ea &= 017;
                    if (IR & 020) {
                        /* Shift right to LINK */
                        for (i = 0; i < ea; i++) {
                            MQ = (MQ>>1) + ((LAC&01)<<11);
                            LAC = ((LAC&01)<<12)+(LAC&04000)+((LAC&07777)>>1);
                        }
                    } else {
                        /* Shift right without LINK */
                        tmp = LAC & 010000; /* remember LINK */
                        LAC &= 07777;      /* clear LINK */
                        for (i = 0; i < ea; i++) {
                            MQ = (MQ>>1) + ((LAC&01)<<11);
                            LAC = (LAC&04000) + (LAC>>1);
                        }
                        LAC |= tmp; /* restore LINK */
                    }
                    break;
                case 010: /* SXL */
// BUGBUG: Skip if the digital input is not grounded.
// BUGBUG: 015 is Key struck input!
                    tmp = 0;
                    if (IR & 020) /* reverse sense */
                        tmp = !tmp;
                    if (tmp)
                        PC = (PC&06000) + ((PC+tmp)&01777); /* Bump PC */
                    break;
                case 011: /* SNS */
                    tmp = 0;
                    ea &= 017;
                    switch (ea) {
                    case 000: /* SW 0 */
                    case 001: /* SW 0 */
                    case 002: /* SW 0 */
                    case 003: /* SW 0 */
                    case 004: /* SW 0 */
                    case 005: /* SW 0 */
// BUGBUG: Skip on sense switch (0-5).
// This is not the/either switch register, but rather another set of six.
                        tmp = 1;
                        break;
                    case 010: /* AZE */
                        tmp = LAC&07777;
                        /* Beware negative zero */
                        if (tmp & 04000)
                            tmp ^= 07777;
                        tmp = !tmp;
                        break;
                    case 011: /* APO */
                        tmp = !(LAC&04000);
                        break;
                    case 012: /* LZE */
                        tmp = !(LAC&010000);
                        break;
                    case 013: /* IBZ */
// BUGBUG: Either tape unit is up to speed and at an interblock zone.
                        break;
                    case 015: /* ZZZ */
                        tmp = !(MQ&01);
                        break;
                    case 016: /* SKP */
                        tmp = 1;
                        break;
                    }
fprintf(stderr, "skip class: IR = %04o, PC = %05o+%d\n", IR, PC, tmp);
                    if (IR & 020) /* reverse sense */
                        tmp = !tmp;
fprintf(stderr, "skip class: IR = %04o, PC = %05o+%d\n", IR, PC, tmp);
                    if (tmp)
                        PC = (PC&06000) + ((PC+tmp)&01777); /* Bump PC */
                    break;
                case 012: /* OPR */
// BUGBUG: Operate digital channel.  If (IR&020), pause as needed.
// BUGBUG: 015 is Keyboard read and release.
// BUGBUG: 016 is Right Switch Register.
// BUGBUG: 017 is Left Switch Register.
                    break;
                case 020: /* LDA */
fprintf(stderr, "LDA: ea = %04o, PC = %05o\n", ea, PC);
                    LAC = (LAC&010000) + M[ea]; /* Load AC */
                    break;
                case 021: /* STA */
                    M[ea] = LAC&07777; /* Store AC */
                    break;
                case 022: /* ADA */
                    /* One's complement add to AC. */
                    tmp = LAC & 010000; /* remember LINK */
                    LAC = (LAC&07777) + M[ea];
                    if (LAC & 010000)
                        LAC = (LAC&07777) + 1;
                    LAC |= tmp; /* restore LINK */
                    break;
                case 023: /* ADM */
                    /* One's complement add to memory. */
                    M[ea] = (LAC&07777) + M[ea];
                    if (M[ea] & 010000)
                        M[ea] = (M[ea]&07777) + 1;
                    LAC = (LAC&010000) + M[ea];
                    break;
                case 024: /* LAM */
                    /* Link add to memory. */
fprintf(stderr, "lam: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "lam: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
fprintf(stderr, "lam: IR = %04o, PC = %05o, LAC = %05o\n", IR, PC, LAC);
                    if (LAC & 010000)
                        LAC = (LAC&07777) + 1;
                    LAC = (LAC&010000) | ((LAC&07777) + M[ea]);
                    M[ea] = LAC & 07777;
fprintf(stderr, "lam: IR = %04o, PC = %05o, LAC = %05o\n", IR, PC, LAC);
                    break;
                case 025: /* MUL */
fprintf(stderr, "mul in: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "mul in: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
fprintf(stderr, "mul in: IR = %04o, PC = %05o, LAC = %05o\n", IR, PC, LAC);
                    /* First, form the unsigned product. */
                    if (LAC & 04000)
                        tmp = (~LAC) & 07777;
                    else
                        tmp = LAC & 07777;
                    if (M[ea] & 04000)
                        tmp *= (~M[ea]) & 07777;
                    else
                        tmp *= M[ea];
                    /* At this point, the result in tmp is the 22 bit  */ 
                    /* absolute value of the result.  MQ is always the */
                    /* absolute value of the low 11 bits.              */
                    MQ = (tmp&03777) << 1;
fprintf(stderr, "mul: IR = %04o, PC = %05o, tmp = %04o\n", IR, PC, tmp);
                    /* Compute the sign of the result. */
                    LAC = ((LAC&04000) ^ (M[ea]&04000)) * 3;
fprintf(stderr, "mul: IR = %04o, PC = %05o, sign = %04o\n", IR, PC, LAC);
                    /* Correct the sign of the result. */
                    if (LAC & 010000)
                        tmp = ~tmp;
                    /* Which half should we leave in AC? */
                    if (IR & 017)
                        h = M[IR&017] & 02000;
                    else
                        h = (IR&020) << 6;
                    LAC = (LAC&010000) + ((LAC&010000)>>1);
                    if (h)
                        LAC += tmp >> 11;
                    else
                        LAC += tmp & 03777;
fprintf(stderr, "mul out: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "mul out: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
fprintf(stderr, "mul out: IR = %04o, PC = %05o, LAC = %05o\n", IR, PC, LAC);
                    break;
                case 026: /* LDH */
// BUGBUG: I believe the index register has already been indexed here!
                    /* Perform half indexing */
                    tmp = IR & 017;
fprintf(stderr, "ldh: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "ldh: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
fprintf(stderr, "ldh: IR = %04o, PC = %05o, h = %04o\n", IR, PC, h);
                    if (h & 04000)
                        LAC = (LAC&010000) + (M[ea]&077);
                    else
                        LAC = (LAC&010000) + (M[ea]>>6);
                    break;
                case 027: /* STH */
// BUGBUG: I believe the index register has already been indexed here!
                    /* Perform half indexing */
                    tmp = IR & 017;
fprintf(stderr, "sth: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "sth: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
fprintf(stderr, "sth: IR = %04o, PC = %05o, h = %04o\n", IR, PC, h);
                    if (h & 04000)
                        M[ea] = (M[ea]&07700) + (LAC&077);
                    else
                        M[ea] = ((LAC&077)<<6) + (M[ea]&077);
fprintf(stderr, "sth: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
                    break;
                case 030: /* SHD */
// BUGBUG: I believe the index register has already been indexed here!
fprintf(stderr, "shd: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "shd: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
fprintf(stderr, "shd: IR = %04o, PC = %05o, h = %04o\n", IR, PC, h);
                    if (h & 04000)
                        tmp = (M[ea]&077) != (LAC&077);
                    else
                        tmp = (M[ea]>>6) != (LAC&077);
                    if (tmp)
                        PC = (PC&06000) + ((PC+1)&01777);   /* Bump PC */
fprintf(stderr, "shd: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "shd: IR = %04o, PC = %05o, m[ea] = %04o\n", IR, PC, M[ea]);
                    break;
                case 031: /* SAE */
fprintf(stderr, "sae: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
fprintf(stderr, "sae: IR = %04o, LAC = %05o, m[ea] = %04o\n", IR, LAC, M[ea]);
                    if ((LAC&07777) == M[ea])
                        PC = (PC&06000) + ((PC+1)&01777);   /* Bump PC */
fprintf(stderr, "sae: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
                    break;
                case 032: /* SRO */
fprintf(stderr, "sro: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
                    if ((M[ea]&01) == 0) {
                        PC = (PC&06000) + ((PC+1)&01777);   /* Bump PC */
                        M[ea] = M[ea]>>1;
                    } else {
                        M[ea] = 04000 + (M[ea]>>1);
                    }
fprintf(stderr, "sro: IR = %04o, PC = %05o, ea = %04o\n", IR, PC, ea);
                    break;
                case 033: /* BCL */
                    LAC &= ~M[ea];
                    break;
                case 034: /* BSE */
                    LAC |= M[ea];
                    break;
                case 035: /* BCO */
                    LAC ^= M[ea];
                    break;
                case 037: /* DSC */
// BUGBUG: Display the character.  X coordinate is in index register 1.
// Y coordinate in AC.  The H bit selects which display.  4 Pixels per point.
// Coordinates updated in index register 1 and AC.  Z register destroyed.
                    break;
                default: /* undefined instruction */
                    break;
            } /* end inner switch */
//fprintf(stderr, "\tdo_linc() IR=%04o done\r\n", IR);
            break;
    } /* end outer switch */
//fprintf(stderr, "do_linc() PC=%04o\r\n", PC);
}

/*
    There are two implementations of the LINC interface.

    In the transistor implementation, the LINC is a separate processor
    with it's own register set.  A pile of IOTs are used to externally
    manipulate these registers before beginning/resuming the execution
    of LINC code.

    In the TTL implementation, the registers and machine state are shared.
    Once the begins execution, it is expected to load it's own state, if
    needed.  This seems to generate, on average, a lot less code.

    For the transistor models we store LINC state separately from the
    main registers, then swap their values in when the LINC starts and stops.
*/
t_bool linciot(device, pulse)
int device, pulse;
{
    if ((MODEL == PDP12) && (device == 014))
        if (pulse & 01) {
            LDF = (IF<<2) + ((PC&06000)>>10);   /* LINC IF to DF */
            LINC = 1;                           /* Just start the LINC */
            return TRUE;
        }
    if (MODEL != LINC8)
        return FALSE;                           /* No LINC IOTs */
    /*
        We do need to implement the LINC-8 specific IOTs on this
        model.
    */
    switch (device) {                           /* decode IR<3:8> */
        case 014:                               /* ICON, IBAC, ILES, INTS */
            switch (pulse) {
            case 1:                             /* ICON */
                /* 6141 IOT takes argument in AC to determine function */
                switch (LAC & 017) {
//BUGBUG: Implement these.
                    case 000:                   /* Clear MOTION */
                        break;
                    case 001:                   /* AC to MOTION */
                        break;
                    case 002:                   /* Set SEARCH */
                        break;
                    case 003:                   /* On BLOCK */
                        break;
                    case 004:                   /* Off SEARCH */
                        break;
                    case 005:                   /* On WRITE */
                        break;
                    case 006:                   /* Off WRITE */
                        break;
                    case 007:                   /* CLEAR INTERRUPTS */
                        break;
                    case 010:                   /* SELECT LINC */
                        break;
                    case 011:                   /* DESELECT LINC */
                        break;
                    case 012:                   /* Start LINC */
//BUGBUG: Save PDP state.
//BUGBUG: Restore saved LINC state, then switch to LINC mode.
                        break;
                    case 013:                   /* Delat RESTART */
                    case 014:                   /* Z = 0 */
                    case 015:                   /* Z |= B */
//BUGBUG: Implement these.
                        break;
                    case 016:                   /* NOP */
                    case 017:                   /* NOP */
                        break;
                } /* LAC & 017 */
                break; /* 6141 */
            case 3:                             /* IBAC */
                LAC = (LAC&010000) | B;         /* Read B Register */
                break; /* 6143 */
            case 5:                             /* ILES */
                LAC = (LAC&010000) | SR;        /* Read Left Switches */
                break; /* 6145 */
            case 7:                             /* INTS */
//BUGBUG: Implement LINC interrupt status bits
                break; /* 6147 */
            } /* switch (pulse) */
            break; /* case 014 */
//BUGBUG: Implement the other LINC8 IOTs.
        case 015:                               /* ICS1, ICS2, IMBS */
            switch (pulse) {
            case 1:                             /* ICS1 */
//BUGBUG: Need an implementation of the LINC switches
                break;
            case 3:                             /* ICS2 */
//BUGBUG: Need an implementation of the LINC switches
                break;
            case 5:                             /* IMBS */
                LAC = (LAC&010000) + (LDF<<5) + LIF; /* Fields to AC */
                break;
            case 7:                             /* NOP */
                break;
            } /* switch (pulse) */
            break;
        case 016:                               /* IACB, IACS, ISSP, IACA */
            switch (pulse) {
            case 1:                             /* IACB */
                B = LAC & 07777;                /* Load B register */
                break;
            case 3:                             /* IACS */
                S = LAC & 07777;                /* Load S register */
                B = 0;                          /* Clear B register */
                break;
            case 5:                             /* ISSP */
                B = P;                          /* Save P to B */
                P = LAC & 01777;                /* Load P */
                S = 0;                          /* Clear S */
                break;
            case 7:                             /* IACA */
                B = LAC & 07777;                /* Load B */
                A = B;                          /* Load A */
                break;
            } /* switch (pulse) */
            break;
        case 017:                               /* IAAC, IZSA, IACF */
            switch (pulse) {
            case 1:                             /* IAAC */
                B = A;                          /* Copy A to B */
                LAC = (LAC&010000) | B;         /* Copy B to AC */
                break;
            case 3:                             /* IZSA */
                A = Z;                          /* Copy Z to A */
                B = 0;                          /* Clear B */
                break;
            case 5:                             /* IACF */
//BUGBUG: Set state flip flops from AC2:11.
                break;
            case 7:                             /* NOP */
                break;
            } /* switch (pulse) */
            break;
    }
    return TRUE;
}
