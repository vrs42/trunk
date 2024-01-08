// romtools.h - standard declarations for ROM tools library routines...
//
// Copyright (C) 1999 by Robert Armstrong.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANT-
// ABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
// Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, visit the website of the Free
// Software Foundation, Inc., www.gnu.org.
//
// REVISION HISTORY:
// 19-DEC-99  RLA     New file.
//--

// Some fairly conventional declarations...
typedef unsigned char BYTE;
typedef BYTE __huge *HPBYTE;
typedef unsigned short WORD;
typedef WORD __huge *HPWORD;
typedef unsigned long LONG;
typedef LONG __huge *HPLONG;

typedef unsigned int UINT;
typedef unsigned char UCHAR;
typedef unsigned long ULONG;
typedef char far *LPSTR;
typedef const char far *LPCSTR;

// Handy macros for assembling larger values from small ones...
#define HIBYTE(x)  ((BYTE) (((x) >> 8) & 0xFF))
#define LOBYTE(x)  ((BYTE) ((x) & 0xFF))

// Conventional BOOLean data types....
typedef int BOOL;
#define FALSE   0
#define TRUE    (~FALSE)

// Modifiers for public and private (at the module level) declarations...
#define PRIVATE static
#define PUBLIC

#define FAIL(pgm,msg)			\
  {fprintf(stderr, pgm ": " msg "\n");  exit(EXIT_FAILURE);}
#define FAIL1(pgm,msg,arg)		\
  {fprintf(stderr, pgm ": " msg "\n", arg);  exit(EXIT_FAILURE);}
#define WARN(pgm,msg)			\
  fprintf(stderr, pgm ": " msg "\n");

// Function prototypes for binfile.c ...
extern long LoadBinary (LPCSTR lpszFileName, HPBYTE hpMemory, long lSize);
extern BOOL DumpBinary (LPCSTR lpszFileName, HPBYTE hpMemory, long lSize);

// Function prototypes for hexfile.c ...
extern long LoadHex (LPCSTR lpszFileName, HPBYTE hpMemory, long lOffset, long lSize);
extern BOOL DumpHex (LPCSTR lpszFileName, HPBYTE hpMemory, long lOffset, long lSize);

// Function prototypes for misc.c...
extern void SetFileType (LPSTR lpszName, LPCSTR lpszType);
extern long LoadHexOrBinary (LPSTR lpszName, HPBYTE hpMemory, long lOffset, long lSize);
extern BOOL DumpHexOrBinary (LPSTR lpszName, HPBYTE hpMemory, long lOffset, long lSize);
