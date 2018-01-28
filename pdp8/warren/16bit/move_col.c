/************************************************************************/
/*                                                                      */
/*	move_col.c	move a column in a PDP-8 card tester test				*/
/*                                                                      */
/*      compile with Microsoft C 1.52 with command line:                */
/*              cl /W4 /AL move_col.c                                   */
/*                                                                      */
/************************************************************************/

#define START_MOVE_STRING	"****MOVEHERE****"

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
	unsigned int	temp;
	unsigned int	column_old;					/* zero-based array index	*/
	unsigned int	column_new;					/* zero-based array index	*/
	unsigned int	move_flag;					/* 0=not moving			*/

	char			buffer[MAX_STRING + 1];		/* plus trailing 0		*/
	char		   *ptr;						/* pointer to buffer	*/
	unsigned int	length;						/* buffer length		*/
	unsigned int	length_max;					/* longest buffer		*/

	FILE		   *file_in;


#define ARG_FILE_IN			1
#define ARG_COLUMN_OLD		2
#define ARG_COLUMN_NEW		3
#define NUM_ARGS			4
	

	printf( "move_col   moves 1 test column in a PDP8 card tester test\n" );
	printf( VERSION_STRING "\n" );

	if (argc != NUM_ARGS)
	{
		printf( "usage: move_col in_file old_column new_column\n" );
		printf( "where:\n" );
		printf( "      in_file       input PDP8 card tester test file\n" );
		printf( "      old_column    column to move (1 to 80)\n" );
		printf( "      new_column    new location (pre-move numbering) (1 to 80)\n" );
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

	/* old (from) column		*/
	i = sscanf( argv[ ARG_COLUMN_OLD ], "%u", &temp );
	if (i != 1)
	{
		printf( "ERROR: could not sscanf 'old_column': %s\n", argv[ ARG_COLUMN_OLD ] );
		exit( 1 );
	}
	if (temp > 80)
	{
		printf( "ERROR: 'old_column' is greater than 80: %u\n", temp );
		exit( 1 );
	}
	if (temp < 1)
	{
		printf( "ERROR: 'old_column' is less than 1: %u\n", column_old );
		exit( 1 );
	}
	column_old = temp - 1;		/* zero-based array index	*/

	/* new (to) column		*/
	i = sscanf( argv[ ARG_COLUMN_NEW ], "%u", &temp );
	if (i != 1)
	{
		printf( "ERROR: could not sscanf 'new_column': %s\n", argv[ ARG_COLUMN_NEW ] );
		exit( 1 );
	}
	if (temp > 80)
	{
		printf( "ERROR: 'new_column' is greater than 80: %u\n", temp );
		exit( 1 );
	}
	if (temp < 1)
	{
		printf( "ERROR: 'new_column' is less than 1: %u\n", temp );
		exit( 1 );
	}
	column_old = temp - 1;		/* zero-based array index	*/

	printf( "swapping column %u and column %u\n", column_old + 1, column_new + 1 );


	/* process input file	*/	
	
	move_flag = 0;
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

		if (move_flag == 0)
		{
			if (strcmp( buffer, START_MOVE_STRING ) == 0)
			{
				move_flag = 1;
			}
			/* print lines before START_MOVE_STRING	*/
			printf( "%s\n", buffer );
		}
		else
		{
			/* moving	*/
			if ((length == 0) || (buffer[0] == ';'))
			{
				/* print empty lines and comments	*/
				printf( "%s\n", buffer );
			}
			else
			{
				j = column_new;
				if (j < column_old) j = column_old;
				{
					/* extend the string	*/
					while (strlen(buffer) <= j) strcat( buffer, " ");
				}							
				
				/* copy preceding columns	*/
				i = 0;
				while ((i < column_new) && (i < column_old))
				{
					printf( "%c", buffer[i] );
					i++;
				}
				
				/* do the 1st column	*/
				if (i == column_new)
				{
					printf( "%c", buffer[column_old] );
					j = column_old;
				}
				else
				{
					/* must be column_old	*/
					i++;		/* skip old column */
					j = column_new;
				}

				/* copy columns between new and old	*/
				while (i < j)
				{
					printf( "%c", buffer[i] );
					i++;
				}

				/* do the 2nd column	*/
				if (i == column_new)
				{
					printf( "%c", buffer[column_old] );
				}
				else
				{
					/* must be old column	*/
					i++;
				}

				/* do trailing columns	*/
				while( i < length )
				{
					printf( "%c", buffer[i] );
					i++;
				}
				printf( "\n" );
			}
		}
	}
	fclose( file_in );
}
