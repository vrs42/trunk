/************************************************************************/
/*                                                                      */
/*      mk_pat.c        generate patterns for PDP-8 card tester         */
/*                                                                      */
/*      compile with Microsoft C 1.52 with command line:                */
/*              cl /W4 tester.c                                         */
/*                                                                      */
/************************************************************************/

#define VERSION_STRING  "version 0.0  4/19/12"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void main( void )
{
    unsigned int    inputs;
    unsigned int    outputs;
    unsigned int    i;
    unsigned int    j;
    unsigned int    index;
    unsigned int    bit;


    printf( "number of inputs per gates? " );
    scanf( "%u", &inputs );
    printf( "number of gates? " );
    scanf( "%u", &outputs );

    index = 1;
    printf( "\n" );
    printf( "PINS\n" );
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            printf( "%2u I A   E -\n", index );
            index++;
        }
        printf( "%2u O A\n", index );
        index++;
    }
    printf( "\n" );
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            printf( "I" );
        }
        printf( "O" );
    }
    printf( "\n" );

    /* line of zeroes   */
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            printf( "0" );
        }
        printf( "1" );
    }
    printf( "\n" );

    for (i = 0; i < outputs; i++)
    {
        for (index = 0; index < (1U << inputs); index++)
        {
            for (j = 0; j < (i * (inputs + 1)); j++) printf( " " );
            for (j = 0; j < inputs; j++)
            {
                bit      = (index & (1U << (inputs - j - 1))) ? 1 : 0;
                printf( "%u", bit );
            }
            printf( "%u", (index < ((1U << inputs) - 1)) ? 1 : 0 );
            for (j = 0; j < ((outputs - 1 - i) * (inputs + 1)); j++) printf( " " );
            printf( "\n" );
        }
        for (j = 0; j < (i * (inputs + 1)); j++) printf( " " );
        for (j = 0; j < inputs; j++) printf( "0" );
        printf( "1" );
        for (j = 0; j < ((outputs - 1 - i) * (inputs + 1)); j++) printf( " " );
        printf( "\n" );
    }

    /* line of zeroes   */
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            printf( "0" );
        }
        printf( "1" );
    }
    printf( "\n" );

    /* line of ones */
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            printf( "1" );
        }
        printf( "0" );
    }
    printf( "\n" );

    for (i = 0; i < outputs; i++)
    {
        for (index = 0; index < (1U << inputs); index++)
        {
            for (j = 0; j < (i * (inputs + 1)); j++) printf( " " );
            for (j = 0; j < inputs; j++)
            {
                bit      = (index & (1U << (inputs - j - 1))) ? 1 : 0;
                printf( "%u", bit );
            }
            printf( "%u", (index < ((1U << inputs) - 1)) ? 1 : 0 );
            for (j = 0; j < ((outputs - 1 - i) * (inputs + 1)); j++) printf( " " );
            printf( "\n" );
        }
    }

    /* line of ones */
    for (i = 0; i < outputs; i++)
    {
        for (j = 0; j < inputs; j++)
        {
            printf( "1" );
        }
        printf( "0" );
    }
    printf( "\n" );
}
