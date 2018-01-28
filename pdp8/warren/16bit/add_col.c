/************************************************************************/
/*                                                                      */
/*	add_col.c	add columns to a PDP-8 card tester test					*/
/*                                                                      */
/*      compile with Microsoft C 1.52 with command line:                */
/*              cl /W4 /AL add_col.c                                    */
/*                                                                      */
/************************************************************************/

#define START_ADD_STRING	"****ADDHERE****"

#define VERSION_STRING  "version 1.0 July 3, 2017"

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
	unsigned int	column_num;
	unsigned int	add_flag;					/* 0=not adding			*/

	char			buffer[MAX_STRING + 1];		/* plus trailing 0		*/
	char		   *ptr;						/* pointer to buffer	*/
	unsigned int	length;						/* buffer length		*/
	unsigned int	length_max;					/* longest buffer		*/

	FILE		   *file_in;


#define ARG_FILE_IN			1
#define ARG_COLUMN_FIRST	2
#define ARG_COLUMN_NUM		3
#define NUM_ARGS			4
	

	printf( "add_col   adds test columns to a PDP8 card tester test\n" );
	printf( VERSION_STRING "\n" );

	if (argc != NUM_ARGS)
	{
		printf( "usage: add_col in_file first_column last_column\n" );
		printf( "where:\n" );
		printf( "      in_file       input PDP8 card tester test file\n" );
		printf( "      first_column  first column to add (1 to 80)\n" );
		printf( "      num_column    number of columns to add (1 to 8)\n" );
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

	/* number column		*/
	i = sscanf( argv[ ARG_COLUMN_NUM ], "%u", &column_num );
	if (i != 1)
	{
		printf( "ERROR: could not sscanf 'num_column': %s\n", argv[ ARG_COLUMN_NUM ] );
		exit( 1 );
	}
	if (column_num > 8)
	{
		printf( "ERROR: 'num_column' is greater than 8: %u\n", column_num );
		exit( 1 );
	}
	if (column_num < 1)
	{
		printf( "ERROR: 'num_column' is less than 1: %u\n", column_num );
		exit( 1 );
	}

	printf( "adding %u columns starting at column %u\n", column_num, column_first );


	/* process input file	*/	
	
	add_flag = 0;
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
		length = strlen( buffer );

		if (add_flag == 0)
		{
			if (strcmp( buffer, START_ADD_STRING ) == 0)
			{
				add_flag = 1;
			}
			/* copy lines before START_ADD_STRING	*/
			printf( "%s\n", buffer );
		}
		else
		{
			/* adding	*/
			if ((length > 0) && (buffer[0] != ';'))
			{
				/* copy columns before the add (add Zs if too short)	*/
				for (i = 0; i < (column_first - 1); i++)	/* zero-based array	*/
				{
					if (i < length)
					{
						printf( "%c", buffer[i] );
					}
					else
					{
						printf( "Z" );
					}
				}	
				
				/* add the new columns	*/
				for (j = 0; j < column_num; j++)
				{
					printf( "Z" );
				}
				/* copy remaining columns	*/
				while (i < length)
				{
					printf( "%c", buffer[i] );
					i++;
				}
				printf( "\n" );
			}
			else
			{
				/* copy empty lines and comments	*/
				printf( "%s\n", buffer );
			}
		}
	}
	fclose( file_in );
}
