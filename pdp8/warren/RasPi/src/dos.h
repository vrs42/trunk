//
// MS-DOS primitives for the flip-chip tester.
//

//
// Low level I/O.  Port is assumed to be 0x378 or 0x379.
extern int (*_inp)(unsigned short port);
extern void (*_outp)(unsigned short port, int val);


//
// Convert a string (in place) to uppercase.
//
extern char *_strupr(char *str);
