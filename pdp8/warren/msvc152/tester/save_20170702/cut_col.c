/************************************************************************/
/*                                                                      */
/*	cut_col.c	remove columns from a PDP-8 card tester test	*/
/*                                                                      */
/*      compile with Microsoft C 1.52 with command line:                */
/*              cl /W4 /AL cut_col.c                                    */
/*                                                                      */
/************************************************************************/

#define VERSION_STRING  "version 1.0 July 2, 2017"

#define _CRT_SECURE_NO_WARNINGS	1	/* disable Microsoft 'old library' warnings	*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define MAX_STRING  120

void main( int argc, char *argv[])
{
	unsigned int	i;
	unsigned int	j;
	unsigned int	column_first;
	unsigned int	column_last;
	unsigned int	cut_flag;					/* 0=not cutting		*/

	char			buffer[MAX_STRING + 1];		/* plus trailing 0		*/
	char		   *ptr;						/* pointer to buffer	*/
	unsigned int	length;						/* buffer length		*/
	unsigned int	length_max;					/* longest buffer		*/

	FILE		   *file_in;


#define ARG_FILE_IN			1
#define ARG_COLUMN_FIRST	2
#define ARG_COLUMN_LAST		3
#define NUM_ARGS			4
	

	printf( "cut_col   removes test columns from a PDP8 card tester test\n" );
	printf( VERSION_STRING "\n" );

	if (argc != NUM_ARGS)
	{
		printf( "usage: cut_col in_file first_column last_column\n" );
		printf( "where:\n" );
		printf( "      in_file       input PDP8 card tester test file\n" );
		printf( "      first_column  first column to cut (1 to 80)\n" );
		printf( "      last_column   last  column to cut (first_column to 80)\n" );
		exit( 1 );
	}


	/* process arguments	*/

	/* input file	*/
	file_in = fopen( argv[ ARG_FILE_IN ], "rb" );
	if (file_in == (FILE *)NULL)
	{
		printf( "ERROR: could not open 'in_file': %s\n", argv[ ARG_FILE_IN ] );
		exit( 1 );
	}

	/* first column		*/
	i = sscanf( argv[ ARG_COLUMN_FIRST ], "%u", &column_first );
	if (i != 1)
	{
		printf( "ERROR: could not sscanf 'first_column': %s\n", argv[ ARG_COLUMN_FIRST ] );
		exit( 1 );
	}
	if (column_first > 80)
	{
		printf( "ERROR: 'first_column' is greater than 80: %u\n", column_first );
		exit( 1 );
	}
	if (column_first < 1)
	{
		printf( "ERROR: 'first_column' is less than 1: %u\n", column_first );
		exit( 1 );
	}

	/* last column		*/
	i = sscanf( argv[ ARG_COLUMN_LAST ], "%u", &column_last );
	if (i != 1)
	{
		printf( "ERROR: could not sscanf 'last_column': %s\n", argv[ ARG_COLUMN_LAST ] );
		exit( 1 );
	}
	if (column_last > 80)
	{
		printf( "ERROR: 'last_column' is greater than 80: %u\n", column_last );
		exit( 1 );
	}
	if (column_last < column_first)
	{
		printf( "ERROR: 'last_column' is less than 'first_column': %u\n", column_last );
		exit( 1 );
	}

	/* process input file	*/	
	
	cut_flag = 0;
	while (!feof( file_in ))
    {
		fgets( buffer, sizeof( buffer ), file_in );
        if (feof( file_in )) break;;
		length = strlen( buffer );
		if (length_max < length) length_max = length;
		if (length >= (sizeof(buffer) - 1))
		{
			printf( "ERROR: string too long:\n%s\n", buffer );
			exit( 1 );
		}

		/* remove trailing carriage return, newline	*/
		ptr = strchr( buffer, '\n' );
        if (ptr != (char *)NULL) *ptr = '\0';
        ptr = strchr( buffer, '\r' );
        if (ptr != (char *)NULL) *ptr = '\0';

		if (cut_flag == 0)
		{
			if (strcmp( buffer, "****CUTHERE****" ))
			{
				cut_flag = 1;
			}
		}
		else
		{
			/* cutting	*/
			if ((length > 0) && (buffer[0] != ';'))
			{
				/* remove columns	*/
	  			i = column_first - 1;		/* zero-base array	*/
				j = column_last + 1 -1;		/* zero-base array	*/
				for (;;)		/* will break when done	*/
				{
					if (j >= length) 
					{
						buffer[i] = (char) 0;
						length = i;
						break;
					}
					else
					{
						buffer[i] = buffer[j];
						i++;
						j++;
					}
				}
			}
		}
		printf( "%s\n", buffer );
	}
	fclose( file_in );
}
