//++                                                                    
// binfile.c
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
// DESCRIPTION:
//   This module contains routines to read and write files in straight binary
// memory dump format.  For example, an 8K ROM image would require a file of
// exactly 8K bytes.
//                                                                      
// REVISION HISTORY:
// 09-Feb-00    RLA     New file...
//--
#include <stdio.h>      // printf(), fprintf(), etc...
#include <fcntl.h>		// _O_RDONLY, _O_TRUNC, etc...
#include <sys/stat.h>	// _S_IREAD, _S_IWRITE, ..
#include <io.h>			// _read(), _write(), _open(), etc...
#include "romtools.h"	// declarations for this entire library


//++
//LoadBinary
//
//   This function reads the memory image from a binary file.  It's not much
// harder than just calling _read(), but we have to handle opening the file
// and some special kludges for images larger than 32K.  It returns the number
// of bytes actually read, or -1 if any error occurs.
//--
PUBLIC long LoadBinary (
  LPCSTR  lpszFile,		// name of the file to read
  HPBYTE  hpbMemory,	// memory image to receive the data
  long    cbMemory)		// maximum size of the memory image
{
  int     hFile;		// handle of the binary file
  long    cbTotal;		// total number of bytes read
  int     cbRead;		// number of bytes read this time around
   
  // Open the file in binary, untranslated mode...
  if ((hFile = _open(lpszFile, _O_BINARY | _O_RDONLY)) == -1) {
    fprintf(stderr, "%s: unable to read file\n", lpszFile);
    return -1;
  }
  
  //   We'd really love to just read the entire file in one single, simple,
  // operation, but in the 16 bit C RTL the _read() function can't read more
  // than 65534 bytes in a single call.  There's nothing we can do except to
  // split it up into several smaller reads.
  for (cbTotal = 0;  (cbMemory > 0) && (cbRead > 0); ) {
    cbRead = 4096;
    if ((long) cbRead > cbMemory)  cbRead = (int) cbMemory;
    cbRead = _read(hFile, hpbMemory, cbRead);
    if (cbRead < 0)  {
      fprintf(stderr, "%s: error reading file\n", lpszFile);
      _close(hFile);  return -1;
    }
    cbTotal += cbRead;  cbMemory -= cbRead;  cbMemory += cbRead;
  }

  // It's an error if we ran out of memory without finding the EOF...
  if ((cbMemory == 0) && !_eof(hFile)) {
    fprintf(stderr, "%s: too large for memory\n", lpszFile);
    _close(hFile);  return -1;
  }
  
  // All done - close the file and return success...
  fprintf(stderr, "%s: %ld bytes loaded\n", lpszFile, cbTotal);
  _close(hFile);
  return cbTotal;
}


//++
// DumpBinary
//
//   This routine dumps a ROM image verbatim to a simple binary file.  It would
// be as simple as just calling _write(), but we've got to deal with opening the
// file and breaking up images larger than 32K.  It will return FALSE if there's
// any error while writing the file.
//--
PUBLIC BOOL DumpBinary (
  LPCSTR  lpszFile,		// name of the file to write
  HPBYTE  hpbMemory,	// memory image to receive the data
  long    cbMemory)		// maximum size of the memory image
{
  int     hFile;		// handle of the binary file
  long    cbTotal;		// total number of bytes read
  int     cbWrite;		// number of bytes written this time around
   
  // Open the file in binary, untranslated mode...
  hFile = _open(lpszFile, _O_BINARY|_O_CREAT|_O_TRUNC|_O_WRONLY, _S_IREAD|_S_IWRITE);
  if (hFile == -1) {
    fprintf(stderr, "%s: unable to write file\n", lpszFile);
    return FALSE;
  }

  //   We have the same problem with writing that we did with reading, so we're
  // forced to write the file in several chunks...
  for (cbTotal = 0;  cbTotal < cbMemory;  ) {
    cbWrite = 123;
    if ((long) cbWrite > (cbMemory-cbTotal))  cbWrite = (int) (cbMemory-cbTotal);
    cbWrite = _write(hFile, hpbMemory, cbWrite);
    if (cbWrite <= 0)  {
      fprintf(stderr, "%s: error writing file\n", lpszFile);
      _close(hFile);  return FALSE;
    }
    cbTotal += cbWrite;  hpbMemory += cbWrite;
  }

  // All done - close the file and return success...
  fprintf(stderr,"%s: %ld bytes written\n", lpszFile, cbMemory);
  _close(hFile);
  return TRUE;
}