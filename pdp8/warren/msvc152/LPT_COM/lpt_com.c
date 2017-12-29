/*
 *  lpt_com.c    send data out LPT port to a serial com port
 *
 *  compile with Microsoft C 1.52 with command line:
 *
 *      cl /W4 lpt_com.c
 */

#include <conio.h>
#include <dos.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char rawline[256];



void lpt_byte( unsigned int Byte, unsigned int LptPort, unsigned long Delay )
{
    unsigned int  i,j;

	unsigned long Count;
	unsigned int Bits;
	unsigned int Mask;
	
    printf( "%c", Byte );
    Bits  = Byte << 2;
    Bits |= 0xFC01;
    _disable();		/* turn off interrupts */
    for (i=0, Mask=1; i<11; i++,Mask<<=1) {
	    j = (Bits & Mask) ? 0xFF : 0x00;
	    _outp( LptPort, j );
	    for (Count = 0L; Count < Delay; Count++);
	}
    _enable();		/* turn on interrupts */
}



void main( int argc, char *argv[])
{
    unsigned int i;

    char *szFilename;
    char *szPort;
    char *szDelay;

    FILE *infile;
    unsigned int  LptPort;
    unsigned long Delay;
	

    if (argc != 4) {
        printf( "lpt_com file port delaycount\n" );
        printf( "   file    text file to send\n" );
        printf( "   port    printer port (0x278 or 0x378)\n" );
        printf( "   delay   arbritary delay number (changes baud)\n" );
        exit( 1 );
    }

    szFilename = argv[1];
    szPort     = argv[2];
    szDelay    = argv[3];

    infile = fopen( szFilename, "rt" );
    if (infile == (FILE *)NULL) {
        printf( "ERROR: could not open file: %s\n", szFilename );
        exit( 1 );
    }
    printf( "file is open: %s\n", szFilename );
    sscanf( szPort, "%x",   &LptPort );
    printf( "port is 0x%04X\n", LptPort );
    sscanf( szDelay, "%lu", &Delay );
    printf( "delay is %lu\n", Delay );

    while (!feof( infile )) {
        fgets( rawline, sizeof(rawline), infile );
        if (strchr( rawline, '\n' ) == (char *)NULL){
            printf( "ERROR: did not file newline in string:\n%s\n", rawline );
            exit( 1 );
        }
        for (i=0; rawline[i] != '\n'; i++) {
            lpt_byte( rawline[i], LptPort, Delay );
        }
        lpt_byte( '\r', LptPort, Delay );
        lpt_byte( '\n', LptPort, Delay );
    };

    fclose( infile );
    
    printf( "done\n" );

}
