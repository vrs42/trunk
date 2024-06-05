//
// MS-DOS primitives for the flip-chip tester.
//
#include <stdio.h>

//
// Get the character indicated present by _kbhit().
//
extern int _kbhit();
extern int _getch();
#define fgets _fgets
extern char *_fgets(char *s, int size, FILE *restrict stream);
