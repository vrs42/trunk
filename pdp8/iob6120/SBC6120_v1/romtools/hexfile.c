//++                                                                    
// hexfile.c
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
//   This module contains routines to read and write files in the standard
// Intel HEX format.  Only the 00 (data) and 01 (end of file) record types
// are recognized.
//
// NOTE:
//   Although this library in general supports ROM sizes larger than 64K, this
// code won't handle HEX files with more than 16 bit addresses.  It can't - I
// don't know how the Intel standard deals with ROMs larger than 64K!
//                                                                      
// REVISION HISTORY:
// 02-JAN-00    RLA     Stolen from the ROMCKSUM project...
//--
#include <stdio.h>      // printf(), fprintf(), etc...
#include "romtools.h"   // declarations for this entire library


//++
//LoadHex
//
//   This function will load a standard Intel format HEX file into memory.
// It returns the number of bytes actually read from the file (which may not
// be the same as the ROM size since, unlike a binary file, the bytes don't
// have to be contiguous), or -1 if any error occurs.  In the latter case,
// an error message is also printed.
//--
PUBLIC long LoadHex (
  LPCSTR  lpszFile,             // name of the file to read
  HPBYTE  hpbMemory,    // memory image to receive the data
  long    cbOffset,             // offset to be applied to addresses
  long    cbMemory)             // maximum size of the memory image
{
  FILE   *fpHex;                // handle of the file we're reading
  long    cbTotal;              // number of bytes loaded from file
  int     cbRecord;             // length       of the current .HEX record
  UINT    nRecAddr;             // load address "   "     "      "     "
  int     nType;                // type         "   "     "      "     "
  int     nChecksum;    // checksum     "   "     "      "     "
  BYTE    b;                    // temporary for the data byte read...
  UINT    nLine;                // current line number (for error messages)
  
  // Open the hex file and, if we can't, then we can go home early...
  if ((fpHex=fopen(lpszFile, "rt")) == NULL) {
    fprintf(stderr, "%s: unable to read file\n", lpszFile);
    return -1;
  }
  
  for (cbTotal = 0, nLine = 1;  nType != 1;  ++nLine) {
    // Read the record header - length, load address and record type...
    if (fscanf(fpHex, ":%2x%4x%2x", &cbRecord, &nRecAddr, &nType) != 3) {
      fprintf(stderr, "%s: format error (1) in line %d\n", lpszFile, nLine);
      fclose(fpHex);  return -1;
    }

    // The only allowed record types (now) are 1 (EOF) and 0 (DATA)...
    if (nType > 1) {
      fprintf(stderr, "%s: unknown record type (0x%02X) in line %d\n", lpszFile, nType, nLine);
      fclose(fpHex);  return -1;
    }
    
    // Begin accumulating the checksum, which includes all these bytes...
    nChecksum = cbRecord + HIBYTE(nRecAddr) + LOBYTE(nRecAddr) + nType;

    // Read the data part of this record and load it into memory...
    for (; cbRecord > 0;  --cbRecord, ++nRecAddr, ++cbTotal) {
      if (fscanf(fpHex, "%2x", &b) != 1) {
        fprintf(stderr, "%s: format error (2) in line %d\n", lpszFile, nLine);
        fclose(fpHex);  return -1;
      }
      if ((nRecAddr+cbOffset < 0) || (nRecAddr+cbOffset >= cbMemory)) {
        fprintf(stderr, "%s: address (0x%04X) out of range in line %d\n", lpszFile, nRecAddr, nLine);
        fclose(fpHex);  return -1;
      }
      hpbMemory[nRecAddr+cbOffset] = b;  nChecksum += b;
    }

    //   Finally, read the checksum at the end of the record.  That byte,
    // plus what we've recorded so far, should add up to zero if everything's
    // kosher.
    if (fscanf(fpHex, "%2x\n", &b) != 1) {
      fprintf(stderr, "%s: format error (3) in line %d\n", lpszFile, nLine);
      fclose(fpHex);  return -1;
    }
    nChecksum = (nChecksum + b) & 0xFF;
    if (nChecksum != 0) {
      fprintf(stderr, "%s: checksum error (0x%02X) in line %d\n",  lpszFile, nChecksum, nLine);
      fclose(fpHex);  return -1;
    }
  }

  // Everything was fine...
  fprintf(stderr, "%s: %ld bytes loaded\n", lpszFile, cbTotal);
  fclose(fpHex);
  return cbTotal;
}


//++
//DumpHex
//
//   This procedure writes a memory dump in standard Intel HEX file format.
// It's the logical inverse of LoadHex() and, like that routine, it's limited
// to 64K maximum.  It returns FALSE if there's any kind of error while writing
// the file.
//--
PUBLIC BOOL DumpHex (
  LPCSTR  lpszFile,             // name of the file to read
  HPBYTE  hpbMemory,    // memory image to receive the data
  long    cbOffset,             // offset to be applied to addresses
  long    cbMemory)             // maximum size of the memory image
{
  FILE   *fpHex;                // handle of the file we're reading
  int     cbRecord;             // length       of the current .HEX record
  UINT    nRecAddr;             // load address "   "     "      "     "
  int     nChecksum;    // checksum     "   "     "      "     "
  long    nMemAddr;             // current memory address
  int     i;                    // temporary...

  // Open the output file for writing...
  if ((fpHex=fopen(lpszFile, "wt")) == NULL) {
    fprintf(stderr, "%s: unable to write file\n", lpszFile);
    return FALSE;
  }

  // Dump all of memory...
  for (nMemAddr = 0;  nMemAddr < cbMemory;  nMemAddr += cbRecord) {

    // Figure out the record size and address for that record.  
    nRecAddr = (UINT) (nMemAddr + cbOffset);
    cbRecord = 16;
    if ((long) cbRecord > (cbMemory-nMemAddr))  cbRecord = (int) (cbMemory-nMemAddr);

    // Write the record header (for a type 0 record)...
    fprintf(fpHex, ":%02X%04X00", cbRecord, nRecAddr); 
    
    // Start the checksum calculation...
    nChecksum = cbRecord + HIBYTE(nRecAddr) + LOBYTE(nRecAddr) + 00 /*nType*/;

    // And dump all the data bytes in this record.
    for (i = 0;  i < cbRecord;  ++i) {
      fprintf(fpHex, "%02X", hpbMemory[nMemAddr+i]);
      nChecksum += hpbMemory[nMemAddr+i];
    }

    // Write out the checksum byte and finish off this record.
    fprintf(fpHex,"%02X\n", (-nChecksum) & 0xFF);
  }

  //   Don't forget to write an EOF record, which is easy in our case, since it
  // doesn't contain any variable data.
  fprintf(fpHex, ":00000001FF\n");
  fprintf(stderr,"%s: %ld bytes written\n", lpszFile, cbMemory);
  fclose(fpHex);
  return TRUE;
}
