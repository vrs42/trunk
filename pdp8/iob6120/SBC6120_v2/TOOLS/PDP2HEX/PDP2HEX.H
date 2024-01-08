//++
// pdp2hex.h
//
//   Copyright (C) 2000 by Robert Armstrong.  All rights reserved.
//
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the GNU General Public License as
//   published by the Free Software Foundation; either version 2 of the
//   License, or (at your option) any later version.
//
//   This program is distributed in the hope that it will be useful, but
//   WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANT-
//   ABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
//   Public License for more details.
//
//   You should have received a copy of the GNU General Public License
//   along with this program; if not, visit the website of the Free
//   Software Foundation, Inc., www.gnu.org.
//--
#ifndef _PDP2HEX_H_
#define _PDP2HEX_H_

// Compilation parameters...
#define PDP_MEM_SIZE 32768      // maximum size of PDP-8 memory, ever!

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

// Standard MAX() and MIN() macros...
#define MAX(a,b) ( (a) < (b) ? (b) : (a) )
#define MIN(a,b) ( (a) < (b) ? (a) : (b) )

// Conventional BOOLean data types....
typedef int BOOL;
#define FALSE   0
#define TRUE    (~FALSE)

#define FAIL(pgm,msg)                   \
  {fprintf(stderr, pgm ": " msg "\n");  exit(EXIT_FAILURE);}
#define FAIL1(pgm,msg,arg)              \
  {fprintf(stderr, pgm ": " msg "\n", arg);  exit(EXIT_FAILURE);}
#define WARN(pgm,msg)                   \
  fprintf(stderr, pgm ": " msg "\n");

// Modifiers for public and private (at the module level) declarations...
#define PRIVATE static
#define PUBLIC

// External functions prototypes...
extern BOOL LoadPDP (LPCSTR lpszFileName, HPWORD hpwMemory, WORD cwMemory);
extern long LoadBinary (LPCSTR lpszFileName, HPBYTE hpMemory, long lSize);
extern BOOL DumpBinary (LPCSTR lpszFileName, HPBYTE hpMemory, long lSize);
extern long LoadHex (LPCSTR lpszFileName, HPBYTE hpMemory, long lOffset, long lSize);
extern BOOL DumpHex (LPCSTR lpszFileName, HPBYTE hpMemory, long lOffset, long lSize);
extern void SetFileType (LPSTR lpszName, LPCSTR lpszType);
extern long LoadHexOrBinary (LPSTR lpszName, HPBYTE hpMemory, long lOffset, long lSize);
extern BOOL DumpHexOrBinary (LPSTR lpszName, HPBYTE hpMemory, long lOffset, long lSize);

#endif  // ifndef _PDP2HEX_H_
