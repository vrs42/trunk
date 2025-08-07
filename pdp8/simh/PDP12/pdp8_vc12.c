/* pdp8_vc12.c: PDP-12 display simulator

   Copyright (c) 2004, Philip L. Budne
   Copyright (c) 1993-2003, Robert M. Supnik

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
   THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

   Except as contained in this notice, the names of the authors shall not be
   used in advertising or otherwise to promote the sale, use or other dealings
   in this Software without prior written authorization from the authors.

   VC12         Display for the PDP-12
   15-May-22    VRS     Adapted from the PDP-1 display code
   02-Feb-04    PLB     Revamp intensity levels
   02-Jan-04    DAG     Provide dummy global when display not supported
   16-Sep-03    PLB     Update for SIMH 3.0-2
   12-Sep-03    PLB     Add spacewar switch support
   04-Sep-03    PLB     Start from pdp1_lp.c

*/

#ifdef USE_DISPLAY
#include "pdp8_defs.h"
#include "display/display.h"
#include "sim_video.h"

#if 0
extern int32 ios, cpls, iosta, PF;
int32 chan;
#else
int32 ios, cpls, iosta, PF;
int32 CHAN;     /* Channel mask */
#endif
extern int32 stop_inst;

t_stat vc12_svc (UNIT *uptr);
t_stat vc12_reset (DEVICE *dptr);

/* VC12 data structures

   vc12_dev      VC12 device descriptor
   vc12_unit     VC12 unit
   vc12_reg      VC12 register list
*/

#define CYCLE_TIME 5                    /* 5us memory cycle */
#define VC12_WAIT (50/CYCLE_TIME)       /* 50us */

UNIT vc12_unit = {
        UDATA (&vc12_svc, UNIT_ATTABLE, 0), VC12_WAIT };

static t_bool vc12_stop_flag = FALSE;

static void vc12_quit_callback (void)
{
    vc12_stop_flag = TRUE;
}

t_stat vc12_set_chan (UNIT *uptr, int32 val, CONST char *cptr, void *desc)
{
    CHAN = val & 03;
    return SCPE_OK;
}

t_stat vc12_show_chan (FILE *st, UNIT *uptr, int32 val, CONST void *desc)
{
    switch (CHAN) {
    case 0:
        fprintf (st, "no display");
        break;
    case 1:
    case 2:
        fprintf (st, "channel %d", CHAN);
        break;
    case 3:
        fprintf (st, "channels 1 and 2");
        break;
    }
    return SCPE_OK;
}

#define DEB_VMOU      SIM_VID_DBG_MOUSE             /* Video mouse */
#define DEB_VKEY      SIM_VID_DBG_KEY               /* Video key */
#define DEB_VCUR      SIM_VID_DBG_CURSOR            /* Video cursor */
#define DEB_VVID      SIM_VID_DBG_VIDEO             /* Video */

DEBTAB vc12_deb[] = {
    { "VMOU",    DEB_VMOU, "Video Mouse" },
    { "VKEY",    DEB_VKEY, "Video Key" },
    { "VCUR",    DEB_VCUR, "Video Cursor" },
    { "VVID",    DEB_VVID, "Video Video" },
    { NULL, 0 }
};

REG vc12_reg[] = {
    { ORDATAD (CHAN, CHAN, 2, "channel selector") },
};

MTAB vc12_mod[] = {
    { MTAB_XTD|MTAB_VDV, 0, "ICHANNEL", NULL, &vc12_set_chan, NULL, NULL },
    { MTAB_XTD|MTAB_VDV, 0, "CHANNEL", NULL, NULL, &vc12_show_chan, NULL },
};

DEVICE vc12_dev = {
    "VC12", &vc12_unit, 0, 0,
    1, 10, 31, 1, 8, 8,
    NULL, NULL, &vc12_reset,
    NULL, NULL, NULL,
    NULL, DEV_DISABLE | DEV_DEBUG,
    0, vc12_deb
};

/*
 * DISplay instruction routine
*/
int32 vc12_dis (int32 inst, int32 io, int32 ac)
{
    int32 x, y;
    int level, chan;

    if (vc12_dev.flags & DEV_DIS)                   /* disabled? */
        return (stop_inst << IOT_V_REASON) | io;    /* stop if requested */

    /*
     * The channel is encoded in the high bit of the register.
     * Display only the channel(s) currently selected.
    */
    chan = !!(io & 04000);
    if (!(CHAN & (1<<chan)))
        return io;

    x = io & 0777;                      /* low nine bits of io */
    y = ac & 0777;                      /* low nine bits of ac */
    /*
     * The X axis is unsigned, and needs no special treatment here.
     * The Y axis has is signed, so we need to add 0400, ignoring
     * carry out.  (Hence "^" instead of "+".)
     *
     * Oddly, x and y are two's complement, not one's complement.
     */
    y ^= 0400;

    /*
     * Center our display in the VR14 window.
    */
    x += 256;
    y += 128;

    // Currently ignoring color. */

    level = DISPLAY_INT_MAX;

    if (display_point(x,y,level,0)) {
        /* Ignore light pen hit for now. */
    }
    sim_activate (&vc12_unit, vc12_unit.wait);  /* activate */

    return io;
}

/*
 * Unit service routine
 */
t_stat vc12_svc (UNIT *uptr)
{
    display_age(vc12_unit.wait*CYCLE_TIME, 0);
    sim_activate_after (&vc12_unit, vc12_unit.wait*CYCLE_TIME); /* requeue! */
    if (vc12_stop_flag) {
        vc12_stop_flag = FALSE;         /* reset flag after we notice it */
        return SCPE_STOP;
    }
    return SCPE_OK;
}

#ifdef VC12_INPUT /* The VC12 is currently output only! */
static void vc12_joy_motion (int device, int axis, int value)
{
    if (device < 2 && axis < 1) {
        int mask = 0;
        int shift = 14 * device;
        if (value < -10000)
            mask = 010;
        else if (value > 1000)
            mask = 004;
        spacewar_switches &= ~(014 << shift);
        spacewar_switches |= mask << shift;
    }
}

static void vc12_joy_button (int device, int button, int state)
{
    if (device < 2 && button < 2) {
        /* Button 0 is fire, 1 is thrust. */
        int mask = 1 << button;
        mask <<= 14 * device;
        if (state)
            spacewar_switches |= mask;
        else
            spacewar_switches &= ~mask;
    }
}
#endif /* VC12_INPUT */

/* Reset routine */

t_stat vc12_reset (DEVICE *dptr)
{
    if (dptr->flags & DEV_DIS) {
        display_close(dptr);
    } else {
        display_init(DISPLAY_TYPE, PIX_SCALE, dptr);
        display_reset();
        vid_register_quit_callback (&vc12_quit_callback);
        CHAN = 3; /* Both channels visible */
#ifdef VC12_INPUT /* The VC12 is currently output only! */
        vid_register_gamepad_motion_callback (vc12_joy_motion);
        vid_register_gamepad_button_callback (vc12_joy_button);
#endif
    }
    sim_cancel (&vc12_unit);            /* deactivate unit */
    return SCPE_OK;
}

#ifdef VC12_INPUT /* The VC12 is currently output only! */
int32 spacewar (int32 inst, int32 dev, int32 io)
{
    if (vc12_dev.flags & DEV_DIS)                           /* disabled? */
        return (stop_inst << IOT_V_REASON) | io;        /* stop if requested */
    return spacewar_switches;
}
#endif

/* These are needed for display.c */
//void cpu_get_switches(unsigned long *p1, unsigned long *p2) { };
//void cpu_set_switches(unsigned long l1, unsigned long l2) { };

#else  /* USE_DISPLAY not defined */
char pdp12_vc12_unused;   /* sometimes empty object modules cause problems */
#endif /* USE_DISPLAY not defined */
