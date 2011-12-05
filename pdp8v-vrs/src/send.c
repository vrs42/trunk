/****************************************************************
 *
 *		RIM Client, Version 0.2
 *		K. McQuiggin, July 1998
 *      mcquiggi@sfu.ca
 *
 *		Utility to transmit a RIM format file from the host
 *      machine to a pdp-8. The pdp-8 should be running the
 *      RIM loader routine prior to starting this program.
 *
 *      Change the serial port, baud rate, and delay factor 
 *      as required. A delay of "4" on a Pentium 166 MHz
 *      PC seems to work. Of course this could be reworked to
 *      look nicer, with appropriate delay system calls etc.
 *
 *      Input should be a file in RIM loader format. If you're 
 *		starting with an ASCII file, run the "batch-rim" utility
 *		on the text file first, to create the RIM format file. Then
 *		use this utility to send the RIM file to the pdp-8.
 *
 *		Output goes to the serial port, which should be connected
 *		via appropriate cable to the pdp-8.
 *
 *      This is alpha quality code, use and modify as required!
 *
 *      Kevin 
 *
 ****************************************************************/

#include <stdio.h>
#include <sgtty.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/time.h>

#define		SERIAL_PORT		"/dev/ttyd1"
#define		DELAY			4

main(int argc, char **argv)
{
	char            c;
	int             to;
	FILE           *from;
	struct sgttyb   tncstty;
	int             i, j;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s inputfile \n", argv[0]);
		exit(1);
	}
	printf("PDP-8 RIM Loader, Version 0.2\n");
	if ((from = fopen(argv[1], "r")) == NULL) {
		perror(argv[1]);
		exit(1);
	}
	if ((to = open(SERIAL_PORT, O_WRONLY | O_NONBLOCK)) == -1) {
		perror("Can't open serial port");
		exit(1);
	}
	if (ioctl(to, TIOCGETP, (char *) &tncstty) == -1) {
		perror("Can't read serial port settings");
		close(to);
		exit(1);
	}
	tncstty.sg_ispeed = B4800;
	tncstty.sg_ospeed = B4800;
	tncstty.sg_flags |= RAW;
	if (ioctl(to, TIOCSETP, (char *) &tncstty) == -1) {
		perror("Can't set serial port settings");
		close(to);
		exit(1);
	}
	printf("Sending... ");
	c = ' ';
	while (c != EOF) {
		c = getc(from);
		for (i = 1; i <= DELAY; i++)
			for (j = 0; j <= 32766; j++) {
				;	/* Delay! */
			}
		if (write(to, &c, 1) != 1) {
			perror("Could not write to serial port");
			close(to);
			close(from);
			exit(1);
		}
	}
	printf("\nEnd of File!\n");
	close(to);
	close(from);
	exit(0);
}
