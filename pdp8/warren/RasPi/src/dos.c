#include "bcm2835.h"
#include <dos.h>
#include <ctype.h>
#include <unistd.h>
#include <stdio.h>

//
// MS-DOS primitives for the flip-chip tester.
//
extern unsigned short lpt_base;

//
// Low level I/O.  LPT Port base address is assumed to be in the extern "lpt_base".
//
volatile unsigned int *PortLev = 0;

void
dos_bcm2835()
{
    int i;

    bcm2835_init();
    //PortLev = ((unsigned char *)bcm2835_gpio) + BCM2835_GPLEV0;
    PortLev = bcm2835_gpio + BCM2835_GPLEV0 / 4;
    // 
    // Set I/O direction for each GPIO we intend to access.
    // Also, disable pull-ups for output pins, but enable them
    // for input pins.
    //
    for (i = 8; i < 16; i++) {
	bcm2835_gpio_fsel(i, BCM2835_GPIO_FSEL_OUTP);
        bcm2835_gpio_set_pud(i, BCM2835_GPIO_PUD_OFF);
    }
    for (i = 16; i < 24; i++) {
	bcm2835_gpio_fsel(i, BCM2835_GPIO_FSEL_INPT);
        bcm2835_gpio_set_pud(i, BCM2835_GPIO_PUD_UP);
    }
}

// This is overkill for just one status bit!
// (Control bits are unused after initialization.)
unsigned char lp_invert[] = {
    0x0, 0x80, 0xB
};

int
do_inp(unsigned short port)
{
    register int i = port-lpt_base;
    register int val;
    val = *PortLev;		// Get the value
    val >>= 8*(i+1);		// Shift the value
// Tricky inverted inversion here compensates for removed LS06 inverter chip.
    val ^= ~lp_invert[i];	// Perform inversion as needed.
    return val & 0xFF;
}

//
// Tried to do byte wide writes, but they didn't seem to work.
// Fall back to tried-and-true library calls, which want 32 bit / values.
//
void
do_outp(unsigned short port, int val)
{
    register int i = port-lpt_base;
    if (i) return;		// Ignore writes to everything except the data port.
//  val ^= lp_invert[i];	// No inversion needed for data output.
    i = 8*(i+1);		// Bits to shift
    val <<= i;			// Shift the value
    i = 0xFF << i;		// ... and a mask
    bcm2835_gpio_write_mask(val, i); // Set and clear the bits of the relevant byte.
    bcm2835_gpio_write_mask(val, i); // Slow down just a hair.
    //bcm2835_delayMicroseconds(1); // Too slow.
}

//
// These once-only versions of _inp() and _outp() initialize the library, 
// set the regular routines to called henceforth, and finally punt to the 
// regular routines.
//
int init_inp(unsigned short port)
{
    dos_bcm2835();
    _inp = do_inp;
    _outp = do_outp;
    return do_inp(port);
}

void init_outp(unsigned short port, int val)
{
    dos_bcm2835();
    _inp = do_inp;
    _outp = do_outp;
    return do_outp(port, val);
}

//
// Finally, everything is in place to initialize the function pointers.
//
int (*_inp)(unsigned short port) = init_inp;
void (*_outp)(unsigned short port, int val) = init_outp;


//
// Convert a string (in place) to uppercase.
// A kludge is added to uppercase the file names, to mimic the MS-DOS 
// behavior.  '\' is also "uppercased" to '/' so that the result will 
// be Linux compatible.
//
char *
_strupr(char *str)
{
    char * p;
    for (p = str; *p; p++) {
	*p = toupper(*p);
	// Kludge: Treat backslash as a lowercase slash.
        if (*p == '\\')
	    *p = '/';
    }
    return str;
}
