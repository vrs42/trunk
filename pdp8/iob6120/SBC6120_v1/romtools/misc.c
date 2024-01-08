//++
// misc.c
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
//--
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include "romtools.h"


//++
//   This routine will apply a default extension to a file that doesn't
// already have one...
//--
PUBLIC void SetFileType (LPSTR lpszName, LPCSTR lpszType)
{
  char szExt[_MAX_EXT];
  _splitpath(lpszName, NULL, NULL, NULL, szExt);
  if (strlen(szExt) == 0) strcat(lpszName, lpszType);
}


//++
//   This routine will attempt to figure out whether the file is in Intel Hex
// or raw binary format and load it accordingly.  It guesses the file's format
// based on the extension - .HEX for an Intel file and .BIN for binary.  If the
// file has no extension, then it will test to see if either a .HEX or .BIN
// file exists and go from there.  If neither a .HEX or .BIN file exists or
// the file has an unrecognized extension (.e.g ".TXT" or something) then an
// error message is printed and -1 is returned.
//--
PUBLIC long LoadHexOrBinary (LPSTR lpszName, HPBYTE hpMemory, long lOffset, long lSize)
{
  char szExt[_MAX_EXT];  UINT cbName;
  _splitpath(lpszName, NULL, NULL, NULL, szExt);

  // If the user specified the file's type, then do what he said...
  if (stricmp(szExt, ".hex") == 0)
    return LoadHex(lpszName, hpMemory, lOffset, lSize);
  if (stricmp(szExt, ".bin") == 0)
    return LoadBinary(lpszName, hpMemory, lSize);
    
  // If the file has an unknown extension, then punt...
  if (strlen(szExt) > 0) {
    fprintf(stderr, "%s: unknown file type\n", lpszName);  return -1;
  }

  //   Otherwise, give the file a default extension of .HEX and see if that
  // actually exists.  If it doesn't, then try .BIN in the same way.
  cbName = strlen(lpszName);  strcat(lpszName, ".hex");
  if (_access(lpszName, 0) != -1)
    return LoadHex(lpszName, hpMemory, lOffset, lSize);
  lpszName[cbName] = '\0';  strcat(lpszName, ".bin");
  if (_access(lpszName, 0) != -1)
    return LoadBinary(lpszName, hpMemory, lSize);
    
  // The file is nowhere to be found...
  lpszName[cbName] = '\0';
  fprintf(stderr,"%s: can not find either .hex or .bin file\n", lpszName);
  return -1;
}


//++
//   This routine will write either an Intel Hex format file or a raw binary
// file depending on the extension of the filename - .HEX for Intel or .BIN
// for binary.  If the file has an extension but it isn't one of these two, 
// then we'll print an error message and quit.  If the file has no extension
// at all, then we'll default to writing a .HEX file...
//--
PUBLIC BOOL DumpHexOrBinary (LPSTR lpszName, HPBYTE hpMemory, long lOffset, long lSize)
{
  char szExt[_MAX_EXT];
  _splitpath(lpszName, NULL, NULL, NULL, szExt);

  // If there's no extension, default to .HEX...
  if (strlen(szExt) == 0) {
    strcat(lpszName, ".hex");
    return DumpHex(lpszName, hpMemory, lOffset, lSize);
  }

  //   Otherwise the file has an extension specified - if it's one we know how
  // to deal with, then do that.
  if (stricmp(szExt, ".hex") == 0)
    return DumpHex(lpszName, hpMemory, lOffset, lSize);
  if (stricmp(szExt, ".bin") == 0)
    return DumpBinary(lpszName, hpMemory, lSize);
  
  // If we don't recognize the extension, then punt...
  fprintf(stderr,"%s: specify either .hex or .bin\n", lpszName);
  return FALSE;
}
