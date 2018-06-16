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
// Low level I/O.  Port is assumed to be in the extern "lpt_base".
//
volatile unsigned char *PortBase = 0;

void
dos_bcm2835()
{
    int i;

    bcm2835_init();
    PortBase = ((unsigned char *)bcm2835_gpio) + 1;
    // 
    // Set I/O direction for each GPIO we intend to access.
    // We set data to 001 for output, others to 000 for input.
    // This sets us up to later ignore writes to the LPT Control port.
    // (The tester code can try to test control port, but it isn't 
    // actually used when talking SPI to the tester.)
    //
#if 1
    for (i = 8; i < 24; i++) {
	bcm2835_gpio_fsel(i, i < 1/*6*/);
    }
#else
	bcm2835_gpio_fsel(8, 1);
	bcm2835_gpio_fsel(9, 1);
	bcm2835_gpio_fsel(10, 1);
	bcm2835_gpio_fsel(11, 1);
	bcm2835_gpio_fsel(12, 1);
	bcm2835_gpio_fsel(13, 1);
	bcm2835_gpio_fsel(14, 1);
	bcm2835_gpio_fsel(15, 1);

	bcm2835_gpio_fsel(16, 0);
	bcm2835_gpio_fsel(17, 0);
	bcm2835_gpio_fsel(18, 0);
	bcm2835_gpio_fsel(19, 0);
	bcm2835_gpio_fsel(20, 0);
	bcm2835_gpio_fsel(21, 0);
	bcm2835_gpio_fsel(22, 0);
	bcm2835_gpio_fsel(23, 0);

	bcm2835_gpio_fsel(24, 0);
	bcm2835_gpio_fsel(25, 0);
	bcm2835_gpio_fsel(26, 0);
	bcm2835_gpio_fsel(27, 0);
	bcm2835_gpio_fsel(28, 0);
	bcm2835_gpio_fsel(29, 0);
	bcm2835_gpio_fsel(30, 0);
//	bcm2835_gpio_fsel(31, 0); // BUGBUG -- crashes system
#endif
//fprintf(stderr, "Not dead yet\n");
//sleep(1);
//exit(0);
}

int
do_inp(unsigned short port)
{
//fprintf(stderr, "read port %04x\n", port);
//fflush(stderr); //sleep(1);
    return *(PortBase+(port-lpt_base));
}

void
do_outp(unsigned short port, int val)
{
//fprintf(stderr, "write %02x to port %04x\n", val, port);
//fflush(stderr); if ((val&0xFE) != 0x6) sleep(1);
    *(PortBase+(port-lpt_base)) = val;
}

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


int (*_inp)(unsigned short port) = init_inp;
void (*_outp)(unsigned short port, int val) = init_outp;


//
// Convert a string (in place) to uppercase.
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
