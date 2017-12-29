/************************************************************************/
/*                                                                      */
/*      mk_test.c	generate test for PDP-8 card tester					*/
/*                                                                      */
/*      compile with Microsoft C 1.52 with command line:                */
/*              cl /W4 mk_test.c                                         */
/*                                                                      */
/************************************************************************/

#define VERSION_STRING  "version 1.0  June 3, 2015"

#define MAX_INPUTS	8		/* maximum inputs per gate	*/

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


enum {
	BOARD_SINGLE	= 1,
	BOARD_DOUBLE	= 2
} board_width;
unsigned int    usable_pins;
unsigned int	max_inputs;
unsigned int    inputs;
unsigned int    outputs;
unsigned int	max_gates;
enum {
	OUTPUT_NORMAL   = 1,
	OUTPUT_INVERTED = 2
} out_type;
enum {
	GATE_AND	= 1,
	GATE_OR		= 2
} gate_type;

FILE * out_file;


void print_test( int gate, unsigned int input_vector )
{
	unsigned int	i;
	unsigned int	j;
	unsigned int	mask;
	unsigned int	bit;
	unsigned int	output;



	for (i = 0; i < outputs; i++)
	{
		if ((gate != -1) && (i != gate))
		{
			/* not testing this gate, print spaces	*/
			for (j = 0; j < inputs; j++) fprintf( out_file, " " );
			/* output */
			fprintf( out_file, " " );		
		}
		else
		{
			/* testing this gate	*/

			/* print input pattern	*/
			mask = 1U << (inputs - 1);

			output = (gate_type == GATE_AND) ? 1 : 0;
			do {
				bit      = (input_vector & mask) ? 1 : 0;
				output   = (gate_type == GATE_AND) ? (output & bit) : (output | bit);
				fprintf( out_file, "%u", bit );
				mask >>= 1;
			} while (mask);

			/* print output value	*/
			if (output > 1)
			{
				printf( "Broken software\r\n" );
				exit( 1 );
			}
			if (out_type == OUTPUT_INVERTED)
			{
				output = 1 - output;
			}
			fprintf( out_file, "%u", output );
		}
	}
    fprintf( out_file, "\r\n" );
}



void main( int argc, char *argv[] )
{
    unsigned int    i;
    unsigned int    j;
    unsigned int    index;


	/* process arguments		*/

	#define ARG_OUT_FILE	1
	#define NUM_ARGS		2


	if (argc != NUM_ARGS)
	{
		fprintf( stderr, "mk_test   make PDP-8 tester test framework\r\n" );
		fprintf( stderr, "usage:  mk_test  'out_file'\r\n" );
		fprintf( stderr, "   where  'out_file' is the output file\r\n" );
		exit( 1 );
	}

	out_file = fopen( argv[ ARG_OUT_FILE ], "wb" );
	if (out_file == (FILE *)NULL)
	{
		fprintf( stderr, "could not open for output: %s\r\n", argv[ ARG_OUT_FILE ] );
		exit( 1 );
	}
	
	
	/* done processing arguments	*/	
	
	
	
	for (;;)		/* will break on success	*/
	{
		printf( "\r\n" );
		printf( " %u. Single board\r\n", BOARD_SINGLE );
		printf( " %u. Double board\r\n", BOARD_DOUBLE );
		printf( "Board width? " );
		scanf( "%u", &board_width );
		printf( "\r\n" );
		if (board_width == BOARD_SINGLE)	break;		/* break on success	*/
		if (board_width == BOARD_DOUBLE)	break;		/* break on success	*/
		printf( "Board width must be %u or %u.\r\n", BOARD_SINGLE, BOARD_DOUBLE );
	}
	usable_pins = board_width * ((2 * 18) - 3);		/* 2 sides of 18 pins minus 3 power pins	*/
	max_inputs = usable_pins - 1;
	if (max_inputs > MAX_INPUTS) max_inputs = MAX_INPUTS;
	for (;;)		/* will break on success	*/
	{
		printf( "\r\n" );
		printf( "number of inputs per gates (1 to %u)? ", max_inputs );
		scanf( "%u", &inputs );
		printf( "\r\n" );
		if ((inputs >= 1) && (inputs <= max_inputs)) break;		/* break on success	*/
		printf( "inputs must be 1 to %u\r\n", max_inputs );
	}

	max_gates = usable_pins / (inputs + 1);
    for (;;)		/* will break on success	*/
	{
		printf( "\r\n" );
		printf( "number of gates (1 to %u)? ", max_gates );
		scanf( "%u", &outputs );
		printf( "\r\n" );
		if ((outputs >= 1) && (outputs <= max_gates)) break;		/* break on success	*/
		printf( "gates must be 1 to %u\r\n", max_gates );
	}	

    for (;;)		/* will break on success	*/
	{
		printf( "\r\n" );
		printf( " %u. normal   output\r\n", OUTPUT_NORMAL );
		printf( " %u. inverted output\r\n", OUTPUT_INVERTED );
		printf( "output type? " );
		scanf( "%u", &out_type );
		printf( "\r\n" );
		if (out_type == OUTPUT_NORMAL)		break;	/* break on success	*/
		if (out_type == OUTPUT_INVERTED)	break;	/* break on success	*/
		printf( "output type must be %u or %u\r\n", OUTPUT_NORMAL, OUTPUT_INVERTED );
	}

    for (;;)		/* will break on success	*/
	{
		printf( "\r\n" );
		printf( " %u. %sAND\r\n", GATE_AND, (out_type == OUTPUT_INVERTED) ? "N" : "" );
		printf( " %u. %sOR\r\n",	GATE_OR,  (out_type == OUTPUT_INVERTED) ? "N" : "" );
		printf( "gate type? " );
		scanf( "%u", &gate_type );
		printf( "\r\n" );
		if (gate_type == GATE_AND)	break;	/* break on success	*/
		if (gate_type == GATE_OR)	break;	/* break on success	*/
		printf( "gate type must be %u or %u\r\n", GATE_AND, GATE_OR );
	}
	printf( "\r\n" );
	printf( "generating test skeleton for:\r\n" );
	printf( "   %s board with %u usable pins\r\n", (board_width == BOARD_SINGLE) ? "Single" : "Double", usable_pins );
	printf( "   %u %s%s gates with %u inputs each\r\n", 
			outputs, 
			(out_type == OUTPUT_INVERTED)	? "N" : "",
			(gate_type == GATE_AND)			? "AND" : "OR",
			inputs												);


	fprintf( out_file, "test skeleton generated by 'mk_test.c'\r\n" );
	fprintf( out_file, "   %s board with %u usable pins\r\n", (board_width == BOARD_SINGLE) ? "Single" : "Double", usable_pins );
	fprintf( out_file, "   %u %s%s gates with %u inputs each\r\n", 
						outputs, 
						(out_type == OUTPUT_INVERTED)	? "N" : "",
						(gate_type == GATE_AND)			? "AND" : "OR",
						inputs												);

	/* generate skeleton for PINS section	*/
	fprintf( out_file, "\r\n" );
    fprintf( out_file, "PINS\r\n" );
    index = 1;
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            fprintf( out_file, "%2u I A   E -\r\n", index );
            index++;
        }
        fprintf( out_file, "%2u O A\r\n", index );
        index++;
    }
    fprintf( out_file, "\r\n" );
    
	
	/* print IOs	*/
	for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++) 
        {
            fprintf( out_file, "I" );
        }
        fprintf( out_file, "O" );
    }
    fprintf( out_file, "\r\n" );

    /* initial conditions of zeroes	*/
    fprintf( out_file, "; initial conditions- all inputs zero\r\n" );
	print_test( -1, 0 );	/* -1 for all gates	*/

    for (i = 0; i < outputs; i++)
    {
	    fprintf( out_file, "; test one gate with all input patterns, other gate inputs are zero\r\n" );
        for (index = 0; index < (1U << inputs); index++)
        {
			print_test( i, index );		/* just test gate 'i'	*/
        }

		/* restore initial conditions of zeroes	*/
		fprintf( out_file, "; restore initial conditions- all inputs zero\r\n" );
		print_test( -1, 0 );	/* -1 for all gates	*/
    }

			
	/* initial conditions of ones	*/

	fprintf( out_file, "; initial conditions- all inputs one\r\n" );
	print_test( -1, (1U << inputs) - 1 );	/* -1 for all gates	*/


    for (i = 0; i < outputs; i++)
    {
	    fprintf( out_file, "; test one gate with all input patterns, other gate inputs are one\r\n" );
        for (index = 0; index < (1U << inputs); index++)
        {
			print_test( i, index );		/* just test gate 'i'	*/
        }

		/* last index leaves initial conditions of ones	*/
    }

	print_test( -1, (1U << inputs) - 1 );	/* -1 for all gates	*/

	print_test( -1, 0 );	/* -1 for all gates	*/

    fprintf( out_file, "; last line\r\n" );
}
