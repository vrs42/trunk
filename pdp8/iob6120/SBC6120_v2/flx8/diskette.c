/*++									*/
/* diskette.c								*/
/*									*/
/* DESCRIPTION:								*/
/*   This module implements the low level access routines for physical	*/
/* diskette drives and image files, and the end result of all that work	*/
/* is really just two routines, ReadOS8Block() and WriteOS8Block().	*/
/* Implementing these, especially for access to physical diskettes,	*/
/* requires all kinds of obscure knowledge, like the sector inter-	*/
/* leaving scheme used on the RX50, or the twelve bit words to eight 	*/
/* bit bytes conversion algorithm on the RX01.				*/
/*									*/
/* Copyright (C) 1994 by Robert Armstrong                               */
/*                                                                      */
/* This program is free software; you can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License, or    */
/* (at your option) any later version.                                  */
/*                                                                      */
/* This program is distributed in the hope that it will be useful, but  */
/* WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANT- */
/* ABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General    */
/* Public License for more details.                                     */
/*                                                                      */
/* You should have received a copy of the GNU General Public License    */
/* along with this program; if not, visit the website of the Free       */
/* Software Foundation, Inc., www.gnu.org.                              */
/*                                                                      */
/* REVISION HISTORY:							*/
/* dd-mmm-yy	who	description					*/
/*  ?-???-??	RLA	New file.					*/
/*  9-May-00	RLA	Add VM01 and RK05 support.			*/
/*  6-Jul-01	RLA	Add ID01 support.				*/
/*--									*/

/* Include files... */
#include <stdio.h>	/* NULL, printf(), scanf(), et al		*/
#include <string.h>	/* strlen(), strcpy(), strcat(), etc...		*/
#include <stdlib.h>	/* malloc(), exit(), etc...			*/
#ifdef VMS
#include <unixio.h>	/* VMS versions of _read(), _write(), etc...	*/
#include <file.h>	/* VMS versions of O_RDWR, O_CREAT, etc...	*/
#include <stat.h>	/* VMS versions of S_IWRITE, etc...		*/
#define  O_BINARY    0	/* VMS doesn't have this, so we ignore it	*/
#include <starlet.h>	/* sys$qiow(), et al.				*/
#include <iodef.h>	/* IO$_READPBLK, etc...				*/
#include <lib$routines.h> /* lib$signal(), etc...			*/
#else
#include <io.h>		/* open(), read(), write(), etc...		*/
#include <fcntl.h>	/* O_RDWR, O_CREAT, O_BINARY, etc...		*/
#include <sys\stat.h>	/* S_IWRITE, S_IREAD, et al...			*/
#endif
#ifdef MSDOS
#include <dos.h>	/* _int86(), _int86x(), _REGS, etc...		*/
#endif
#include <assert.h>	/* assert() macro (what else??)			*/
#include "types.h"	/* universal data type declarations		*/
#include "diskette.h"	/* function prototypes for this module		*/
#include "command.h"	/* Message(), et. al.				*/


PRIVATE BOOLEAN  fReadOnly;	/* TRUE if the current diskette is R/O	*/
PRIVATE BOOLEAN  fVirtualDisk;	/* TRUE if a virtual diskette is mounted*/
PRIVATE int      hVirtualDisk;	/* Current virtual diskette file handle	*/
PRIVATE int      hPhysicalDisk;	/* Current physical disk unit/handle	*/
PRIVATE UINT	 nMaxPartition;	/* Size of ID01, in OS/8 partitions	*/
PRIVATE STRING   szDiskName;	/* Name of virtual or physical device	*/
PRIVATE UINT     nPartition = 0;/* Current partition in use 		*/
PRIVATE DISKTYPE nDiskType	/* Type of the diskette mounted		*/
			    = NODISK;


/************************************************************************/
/****************        R X 0 1    S U P P O R T        ****************/
/************************************************************************/

/* RX01VBN - compute virtual block number for RX01 */
PRIVATE long RX01VBN (UINT nTrack, UINT nSector)
{
  assert((nTrack > 0) && (nTrack <= 76) && (nSector > 0) && (nSector <= 26));
  assert(fVirtualDisk);
  return (nTrack/*-1*/)*26 + (nSector-1);
} /*RX01VBN*/


/* ReadRX01 - read a sector from a RX01 (virtual or physical) */
PRIVATE void ReadRX01 (UINT nTrack, UINT nSector, UINT8 *pbData)
{
  long lOffset;
  if (fVirtualDisk) {
    lOffset = RX01VBN(nTrack, nSector) * (long) RX01_SECTOR_SIZE;
    assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
    assert(read(hVirtualDisk, pbData, RX01_SECTOR_SIZE) == RX01_SECTOR_SIZE);
  } else {
#ifdef VMS
    unsigned long lVBN, lStatus;  struct _IOSB iosb;
    lVBN = nTrack<<16 | nSector;
    lStatus = sys$qiow (0, hPhysicalDisk, IO$_READPBLK, &iosb, 0, 0,
      pbData, RX01_SECTOR_SIZE, lVBN, 0, 0, 0);
    if ((     lStatus & 1) == 0) lib$signal(lStatus);
    if ((iosb.wStatus & 1) == 0) lib$signal(iosb.wStatus);
#else
    assert(FALSE);  /* physical disk operations not implemented */
#endif
  }
} /*ReadRX01*/


/* WriteRX01 - write a sector to a RX01 (virtual or physical) */
PRIVATE void WriteRX01 (UINT nTrack, UINT nSector, UINT8 *pbData)
{
  long lOffset;
  if (fVirtualDisk) {
    lOffset = RX01VBN(nTrack, nSector) * (long) RX01_SECTOR_SIZE;
    assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
    assert(write(hVirtualDisk, pbData, RX01_SECTOR_SIZE) == RX01_SECTOR_SIZE);
  } else {
#ifdef VMS
    unsigned long lVBN, lStatus;  struct _IOSB iosb;
    lVBN = nTrack<<16 | nSector;
    lStatus = sys$qiow (0, hPhysicalDisk, IO$_WRITEPBLK, &iosb, 0, 0,
      pbData, RX01_SECTOR_SIZE, lVBN, 0, 0, 0);
    if ((     lStatus & 1) == 0) lib$signal(lStatus);
    if ((iosb.wStatus & 1) == 0) lib$signal(iosb.wStatus);
#else
    assert(FALSE);  /* physical disk operations not implemented */
#endif
  }
} /*WriteRX01*/


/* RX01BytesToPDP8Words							 */
/*   This procedure will convert 128 bytes of RX01 data into 64 words of */
/* 12 bit data.  The real hardware does this by re-blocking the serial	 */
/* bit stream from the floppy, so it ends up all the bits are compressed */
/* into the first part of the sector and the last part is unused.	 */
PRIVATE void RX01BytesToPDP8Words (UINT8 *pb, UINT16 *pw)
{
  UINT i;
  for (i = 0;  i < 32;  ++i) {
    pw[2*i]   = (UINT16) ((pb[3*i] << 4) | (pb[3*i+1] >> 4));
    pw[2*i+1] = (UINT16) (((pb[3*i+1] & 0x0f) << 8) | pb[3*i+2]);
  }
} /*RX01BytesToPDP8Words*/


/* RX01PDP8WordsToBytes - this is the reverse of RX01BytesToWords */
PRIVATE void RX01PDP8WordsToBytes (UINT16 *pw, UINT8 *pb)
{
  UINT i;
  for (i = 0;  i < 32;  ++i) {
    pb[3*i]   = (UINT8) (pw[2*i] >> 4);
    pb[3*i+2] = (UINT8) (pw[2*i+1] & 0xff);
    pb[3*i+1] = (UINT8) (((pw[2*i] & 0x0f) << 4) | (pw[2*i+1] >> 8));
  }
} /*RX01PDP8WordsToBytes*/


/* RX01NextSector							 */
/*   After RX01LBNToSector is called, this procedure should then be used */
/* to compute the addresses of the subsequent 3 sectors in an OS/8 RX01	 */
/* logical block.							 */
PRIVATE void RX01NextSector (UINT *pnTrack, UINT *pnSector)
{
 if (*pnSector == 26) {
    *pnSector = 1;  ++*pnTrack;
    assert(*pnTrack < 77);
  } else {
    if (*pnSector < 25)
      *pnSector += 2;
    else
      *pnSector = 2;
  }
} /*RX01NextSector*/


/* RX01OS8LBNToSector							*/
/*   This procedure will figure out the first RX01 sector corresponding	*/
/* to a given OS/8 logical block number.  It duplicates the skew and	*/
/* interleave used by the OS/8 RX8E handler.  Remember that on an RX01	*/
/* each OS/8 block takes FOUR sectors - this just computes the address	*/
/* of the first.							*/
PRIVATE void RX01OS8LBNToSector (UINT nBlock, UINT *pnTrack, UINT *pnSector)
{
  static UINT anSectorMap[13] =
    {1, 9, 17, 25, 8, 16, 24, 5, 13, 21, 4, 12, 20};
  UINT x;
  assert((nBlock >= 0) && (nBlock <= 493));
  *pnTrack = 2 * (nBlock / 13) + 1;
  x = nBlock % 13;
  if (x >= 7) ++*pnTrack;
  *pnSector = anSectorMap[x];
} /*RX01OS8LBNToSector*/


/* ReadRX01OS8Block							*/
/*   This procedure will read one OS/8 virtual block from a RX01 disk-	*/
/* ette.  It can handle either physical or virtual RX01s, and knows all	*/
/* about the logical/physical address mapping, sector interleave and 8	*/
/* to 12 bit conversions used by OS/8.					*/
PRIVATE void ReadRX01OS8Block (UINT nBlock, UINT16 *pwData)
{
  UINT nTrack, nSector, i;
  UINT8 abRawData[RX01_SECTOR_SIZE];
  RX01OS8LBNToSector(nBlock, &nTrack, &nSector);
  for (i = 0;  i < 4;  ++i) {
    ReadRX01(nTrack, nSector, abRawData);
    RX01BytesToPDP8Words(abRawData, pwData+64*i);
    RX01NextSector(&nTrack, &nSector);
  }
} /*ReadRX01OS8Block*/


/* WriteRX01OS8Block - just like ReadRX01Block, but for writing */
PRIVATE void WriteRX01OS8Block (UINT nBlock, UINT16 *pwData)
{
  UINT nTrack, nSector, i;
  UINT8 abRawData[RX01_SECTOR_SIZE];
  RX01OS8LBNToSector(nBlock, &nTrack, &nSector);
  for (i = 0;  i < 4;  ++i) {
    RX01PDP8WordsToBytes(pwData+64*i, abRawData);
    WriteRX01(nTrack, nSector, abRawData);
    RX01NextSector(&nTrack, &nSector);
  }
} /*WriteRX01OS8Block*/


/************************************************************************/
/****************        R X 5 0    S U P P O R T        ****************/
/************************************************************************/

/* RX50VBN - compute virtual block number for RX50  */
PRIVATE UINT RX50VBN (UINT nTrack, UINT nSector)
{
  /* Are the RX50 VBNs from 0..n-1 or 1..n ??? */
  UINT nVBN, nSkew;
  assert((nTrack > 0) && (nTrack <= 80) && (nSector > 0) && (nSector <= 10));
  nSkew = 5-((nTrack-1) % 5);
  if (nSkew = 5) nSkew = 0;
  nVBN = (nTrack/*-1*/)*10 + (((nSector-1)/2)+nSkew) % 5;
  if ((nSector & 1) == 0) nVBN += 5;
  return nVBN;
} /*RX50VBN*/


/* ReadRX50 - read a sector from a RX50 (virtual or physical) */
PRIVATE void ReadRX50 (UINT nTrack, UINT nSector, UINT8 *pbData)
{
  long lOffset;
  if (fVirtualDisk) {
    lOffset = (long) RX50VBN(nTrack, nSector) * (long) RX50_SECTOR_SIZE;
    assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
    assert(read(hVirtualDisk, pbData, RX50_SECTOR_SIZE) == RX50_SECTOR_SIZE);
  } else {
    assert(FALSE);  /*physical disk operations not implemented*/
#ifdef NOTIMPLEMENTED
    var vbn, status: INTEGER;  iosb: $IOSB;
    status := $QIOW(,DiskChannel,IO$_READLBLK,iosb,,,data,RX50SECTSIZE,vbn,,);
    if (not odd(status)) then $SIGNAL(status);
    if (not odd(iosb.status)) then $SIGNAL(iosb.status);
#endif
  }
} /*ReadRX50*/


/* WriteRX50 - write a sector to a RX50 (virtual or physical) */
PRIVATE void WriteRX50 (UINT nTrack, UINT nSector, UINT8 *pbData)
{
  long lOffset;
  if (fVirtualDisk) {
    lOffset = (long) RX50VBN(nTrack, nSector) * (long) RX50_SECTOR_SIZE;
    assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
    assert(write(hVirtualDisk, pbData, RX50_SECTOR_SIZE) == RX50_SECTOR_SIZE);
  } else {
    assert(FALSE);  /*physical disk operations not implemented*/
#ifdef OBSOLETE
    var vbn, status: INTEGER;  iosb: $IOSB;
    status := $QIOW(,DiskChannel,IO$_WRITELBLK,iosb,,,data,RX50SECTSIZE,vbn,,);
    if (not odd(status)) then $SIGNAL(status);
    if (not odd(iosb.status)) then $SIGNAL(iosb.status);
#endif
  }
} /*WriteRX50*/


/* RX50BytesToPDP8Words							*/
/*   This procedure will convert 512 bytes of RX50 data into 256 words	*/
/* of 12 bit data.  Unfortunately, the RX50 uses a different algorithm	*/
/* for this than the RX01.  On the RX50, it simply reads/writes 16 bit	*/
/* words and truncates them to 12 bits.					*/
PRIVATE void RX50BytesToPDP8Words (UINT8 *pb, UINT16 *pw)
{
  UINT i;
  for (i = 0;  i < 256;  ++i) {
    pw[i] = (UINT16) (pb[2*i] | ((pb[2*i+1] & 0x0f) << 8));
  }
} /*RX50BytesToPDP8Words*/


/* RX50PDP8WordsToBytes - the reverse of RX50BytesToWords */
PRIVATE void RX50PDP8WordsToBytes (UINT16 *pw, UINT8 *pb)
{
  UINT i;
  for (i = 0;  i < 256;  ++i) {
    pb[2*i]   = (UINT8) (pw[i] & 0xff);
    pb[2*i+1] = (UINT8) (pw[i] >> 8);
  }
} /*RX50PDP8WordsToBytes*/


/* RX50OS8LBNToSector							 */
/*   This procedure will convert an OS/8 logical block number to the	 */
/* corresponding RX50 physical track and sector.  It allows for the skew */
/* and interleave used by the DECmate-II RX50 handler.  Note that on the */
/* RX50 there is only one physical sector per OS/8 logical block.	 */
PRIVATE void RX50LBNToSector (UINT nBlock, UINT *pnTrack, UINT *pnSector)
{
  UINT temp;
  assert((nBlock >= 0) && (nBlock <= 769));
  *pnTrack = (nBlock / 10)+1;  temp = nBlock % 10;
  *pnSector = temp*2+1;
  if (*pnSector > 10) *pnSector -= 9;
} /*RX50LBNToSector*/


/* ReadRX50OS8Block							*/
/*   This procedure will read one OS/8 virtual block from a RX50 disk-	*/
/* ette.  This case is easier than the RX01 in that one OS8 block is	*/
/* exactly one RX50 sector, but this procedure still has to know about	*/
/* the logical to physical translation used by the OS/8 RX50 driver.	*/
PRIVATE void ReadRX50OS8Block (UINT nBlock, UINT16 *pwData)
{
  UINT nTrack, nSector;
  UINT8 abRawData[RX50_SECTOR_SIZE];
  RX50LBNToSector(nBlock, &nTrack, &nSector);
  ReadRX50(nTrack, nSector, abRawData);
  RX50BytesToPDP8Words(abRawData, pwData);
} /*ReadRX50OS8Block*/


/* WriteRX50OS8Block - just like ReadRX50OS8Block, but for writing */
PRIVATE void WriteRX50OS8Block (UINT nBlock, UINT16 *pwData)
{
  UINT nTrack, nSector;
  UINT8 abRawData[RX50_SECTOR_SIZE];
  RX50LBNToSector(nBlock, &nTrack, &nSector);
  RX50PDP8WordsToBytes(pwData, abRawData);
  WriteRX50(nTrack, nSector, abRawData);
} /*WriteRX50OS8Block*/


/************************************************************************/
/****************        R K 0 5    S U P P O R T        ****************/
/************************************************************************/

/* RK05VBN - compute virtual block number for RK05s */
PRIVATE UINT RK05VBN (UINT nCylinder, UINT nHead, UINT nSector)
{
  return (((nCylinder * 2) + nHead) * 16) + nSector;
}


/* ReadRK05 */
/*   This routine reads one logical sector of 256 words from the RK05 	*/
/* image.  By this point the partitioning has already been taken into	*/
/* account and the cylinder represents the actual disk address.  Note	*/
/* that this routine reads twelve bit words directly from the image 	*/
/* file, so there's no need for a RK05BytesToPDP8Words() step...	*/
PRIVATE void ReadRK05 (UINT nCylinder, UINT nHead, UINT nSector, UINT16 *pwData)
{
  long lOffset = (long) RK05VBN(nCylinder, nHead, nSector) * (long) RK05_SECTOR_SIZE;
  assert(fVirtualDisk); /* There's no physical RK05 support! */
  assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
  assert(read(hVirtualDisk, pwData, RK05_SECTOR_SIZE) == RK05_SECTOR_SIZE);
} /*ReadRK05*/


/* WriteRK05 - write a sector to an RK05 image */
PRIVATE void WriteRK05 (UINT nCylinder, UINT nHead, UINT nSector, UINT16 *pwData)
{
  long lOffset = (long) RK05VBN(nCylinder, nHead, nSector) * (long) RK05_SECTOR_SIZE;
  assert(fVirtualDisk); /* There's no physical RK05 support! */
  assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
  assert(write(hVirtualDisk, pwData, RK05_SECTOR_SIZE) == RK05_SECTOR_SIZE);
} /*WriteRK05*/


/* RK05OS8LBNToSector */
/*   This procedure will convert an OS/8 block number into a RK05 phy-	*/
/* sical, cylinder/head/sector, address.  The RK05 has a geometry of 16	*/
/* sectors per track, 2 tracks (or heads) per cylinder, and 203 cyl-	*/
/* inders per drive. The OS/8 handler for the RK8E maps these to blocks	*/
/* in the most straight forward way - LBN 0 is C/H/S 0/0/0, LBN 1 is 	*/
/* 0/0/1, LBN 16 is 0/1/0, LBN 32 is 1/0/0, etc.  No interleaving is	*/
/* used, which suprises me a little.					*/
/*									*/
/*   The tricky part is to take into account the selected partition.	*/
/* The OS/8 handler splits the drive _exactly_ in half, which each 	*/
/* partition getting 101.5 cylinders (yep, the top half, head 0, of	*/
/* cylinder 101 belongs to the first partition and the bottom half,	*/
/* head 1, belongs to the second partition).  So for partition 1, LBN	*/
/* 0 is at 101/1/0, LBN 16 is at 102/0/0, and so on.  It seems like it	*/
/* would have been easier to split the drive using the head select (all	*/
/* of partition 0 is head 0, and all of partition 1 is head 1), but it	*/
/* it wasn't done that way...						*/
PRIVATE void RK05LBNToSector (UINT nBlock, UINT nPartition,
	     UINT *pnCylinder, UINT *pnHead, UINT *pnSector)
{
  UINT nRemainder;
  /*   It's easy for us to duplicate the OS/8 partitioning scheme just	*/
  /* by offsetting all LBNs in the second partition by the OS/8 size of	*/
  /* a partition - 3248 blocks.  But before you think the OS/8 authors	*/
  /* picked their partitioning system for the same reason, remember	*/
  /* that they had to deal with twelve bit arithmetic, and this calc-	*/
  /* ulation wouldn't have worked!					*/
  nBlock += nPartition * 3248;
  *pnCylinder = nBlock / (2*16);  nRemainder = nBlock % (2*16);
  *pnHead = nRemainder / 16;  nRemainder = nBlock % 16;
  /*   It appears that RK05 sectors were numbered starting from zero,	*/
  /* not one as they are with the RX01/RX02/RX50s...			*/
  *pnSector = nRemainder;
}


/* ReadRK05OS8Block - read one OS/8 block from the selected partition */
PRIVATE void ReadRK05OS8Block (UINT nPart, UINT nBlock, UINT16 *pwData)
{
  UINT nCylinder, nHead, nSector;
  RK05LBNToSector(nBlock, nPart, &nCylinder, &nHead, &nSector);
  ReadRK05(nCylinder, nHead, nSector, pwData);
} /*ReadRK05OS8Block*/


/* WriteRK05OS8Block - just like ReadRK05OS8Block, but for writing */
PRIVATE void WriteRK05OS8Block (UINT nPart, UINT nBlock, UINT16 *pwData)
{
  UINT nCylinder, nHead, nSector;
  RK05LBNToSector(nBlock, nPart, &nCylinder, &nHead, &nSector);
  WriteRK05(nCylinder, nHead, nSector, pwData);
} /*WriteRK05OS8Block*/


/************************************************************************/
/****************        V M 0 1    S U P P O R T        ****************/
/************************************************************************/

/*   Each VM01 (.VMD) file is a byte-for-byte image of an SBC6120 SRAM 	*/
/* or EPROM.  Because a 512Kb RAM chip requires far more address bits	*/
/* than a PDP-8 can muster, the SBC6120 hardware segments it into 128	*/
/* banks of 4Kb each.  For convenience here we treat banks as if they	*/
/* were sectors, and the VM01 becomes a device with 128 sectors per	*/
/* track, one cylinder and one head.  The SBC6120 firmware stores 21	*/
/* pages of 128 twelve bit words in each bank, packed "two for three"	*/
/* requiring 192 eight bit bytes per page.  Twenty one pages of 192 	*/
/* bytes each takes 4032 bytes - the remaining 64 bytes of each bank 	*/
/* are used by the firmware memory diagnostic and are never used to	*/
/* store data.								*/

/* ReadVM01 - read a bank (not a sector!) from a virtual VM01 image */
PRIVATE void ReadVM01 (UINT nBank, UINT8 *pbData)
{
  long lOffset = (long) nBank * (long) VM01_BANK_SIZE;
  assert(fVirtualDisk);  /* There's no support for a physical VM01! */
  assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
  assert(read(hVirtualDisk, pbData, VM01_BANK_SIZE) == VM01_BANK_SIZE);
} /*ReadVM01*/


/* WriteVM01 - write a bank (not a sector!) to a VM01 image */
PRIVATE void WriteVM01 (UINT nBank, UINT8 *pbData)
{
  long lOffset = (long) nBank * (long) VM01_BANK_SIZE;
  assert(fVirtualDisk);  /* There's no support for a physical VM01! */
  assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
  assert(write(hVirtualDisk, pbData, VM01_BANK_SIZE) == VM01_BANK_SIZE);
} /*WriteVM01*/


/* VM01BytesToPDP8Words */
/*   This procedure will convert 192 bytes into 128 PDP-8 words using	*/
/* the same algorithm as the SBC6120 firmware.  It's just a standard	*/
/* OS/8 "three for two" packing.					*/
PRIVATE void VM01BytesToPDP8Words (UINT8 *pb, UINT16 *pw)
{
  UINT i;
  for (i=0;  i<128;  i+=2, pw+=2) {
    *pw     = *pb++;
    *(pw+1) = *pb++;
    *pw     |= (*pb   & 0x0F) << 8;
    *(pw+1) |= (*pb++ & 0xF0) << 4;
  }
}


/* VM01PDP8WordsToBytes - the reverse of VM01BytesToPDP8Words */
PRIVATE void VM01PDP8WordsToBytes (UINT16 *pw, UINT8 *pb)
{
  UINT i;
  for (i=0;  i<128;  i+=2, pw+=2) {
    *pb++ = (UINT8) (*pw    & 0xFF);
    *pb++ = (UINT8) (*(pw+1) & 0xFF);
    *pb++ = (UINT8) (((*(pw+1) >> 4) & 0xF0) | ((*pw >> 8) & 0x0F));
  }
}


/* VM01PageToBank - compute bank and offset for VM01 page number */
PRIVATE void VM01PageToBank (UINT nPage, UINT *pnBank, UINT *pnOffset)
{
  *pnBank = nPage / 21;
  *pnOffset = (nPage % 21) * VM01_SECTOR_SIZE;
}


/* ReadVM01OS8Block							*/
/*   This procedure will read one OS/8 virtual block from a VM01 image.	*/
/* The SBC6120 firmware stores data in the SRAMs in 128 word PDP-8	*/
/* pages, so each OS/8 block requires two consectutively numbered pages	*/
/* to be read.  There's no guarantee that these two pages will be in	*/
/* the same bank, and we have to allow for the possibility that they're	*/
/* split.								*/
PRIVATE void ReadVM01OS8Block (UINT nBlock, UINT16 *pwData)
{
  UINT8 abRawData[VM01_BANK_SIZE];
  UINT nBank1, nBank2, nOffset;

  /* Read the first page (one half) of the block... */
  VM01PageToBank(nBlock*2, &nBank1, &nOffset);
  ReadVM01(nBank1, abRawData);
  VM01BytesToPDP8Words(abRawData+nOffset, pwData);

  /* And read the second half of the block...  */
  VM01PageToBank(nBlock*2+1, &nBank2, &nOffset);
  if (nBank2 != nBank1) ReadVM01(nBank2, abRawData);
  VM01BytesToPDP8Words(abRawData+nOffset, pwData+128);
} /*ReadVM01OS8Block*/


/* WriteVM01OS8Block - just like ReadVM01OS8Block, but for writing */
PRIVATE void WriteVM01OS8Block (UINT nBlock, UINT16 *pwData)
{
  UINT8 abRawData[VM01_BANK_SIZE];
  UINT nBank1, nBank2, nOffset;

  /*   Be careful here - since we're only changing part of a bank (192	*/
  /* bytes out of 4096!) we have to read in the old contents of the	*/
  /* bank, then update part of it, and write it back...			*/
  VM01PageToBank(nBlock*2, &nBank1, &nOffset);
  ReadVM01(nBank1, abRawData);
  VM01PDP8WordsToBytes(pwData, abRawData+nOffset);
  VM01PageToBank(nBlock*2+1, &nBank2, &nOffset);
  if (nBank2 != nBank1) {
    WriteVM01(nBank1, abRawData);  ReadVM01(nBank2, abRawData);
  }
  VM01PDP8WordsToBytes(pwData+128, abRawData+nOffset);
  WriteVM01(nBank2, abRawData);
} /*WriteVM01OS8Block*/


/************************************************************************/
/****************        I D 0 1    S U P P O R T        ****************/
/************************************************************************/

/*   The ID01 disk format, whether physical or virtual, couldn't be	*/
/* simpler. IDE disks naturally use 512 byte sectors, and we just treat */
/* each sector as 256 sixteen bit words.  The upper four bits of each	*/
/* word are ignored, and the remainder make a single OS/8 block of 256	*/
/* twelve bit words.  The SBC6120 hardware and BTS6120 firmware do it	*/
/* exactly the same way...						*/
/*									*/
/*   Since all disk acess is done LBA mode, we can simply use the OS/8	*/
/* block number directly as the disk address.  No conversion to track,	*/
/* head and sector is required.  The partitioning scheme is equally	*/
/* simple - each ID01 partition is always exactly 4096 blocks/sectors,	*/
/* so we can compute the physical disk LBA as 4096*nPart + nBlock .	*/
/*									*/
/*   Note that FLX8 supports ID01 partitions only for physical disks -	*/
/* virtual ID01 images are always exactly one partition.		*/

/* ReadID01OS8Block - read one OS/8 block from the selected ID01 partition */
PRIVATE void ReadID01OS8Block (UINT nPart, UINT nBlock, UINT16 *pwData)
{
  long lLBA = (fVirtualDisk ? 0 : (long) nPart<<12) + (long) nBlock;
  UINT i;

  if (fVirtualDisk) {
    /* Read a virtual ID01 disk file... */
    long lOffset = lLBA * (long) ID01_SECTOR_SIZE;
    assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
    assert(read(hVirtualDisk, pwData, ID01_SECTOR_SIZE) == ID01_SECTOR_SIZE);

  } else {                                            
    /* Read a physical sector from an IDE drive attached to this PC! */
#ifdef MSDOS
    union _REGS inregs, outregs;  struct _SREGS segregs;
    struct _DISK_ADDRESS_PACKET DiskAddress;
    void __far *lpDAP = &DiskAddress;
    memset(&DiskAddress, 0, sizeof(DiskAddress));
    DiskAddress.bPacketSize = sizeof(DiskAddress);
    DiskAddress.nTransferCount = 1;  DiskAddress.lpBuffer = pwData;
    DiskAddress.lLBA[1] = 0;  DiskAddress.lLBA[0] = lLBA;
    inregs.h.ah = 0x42;  inregs.h.dl = hPhysicalDisk | 0x80;
    inregs.x.si = _FP_OFF(lpDAP);  segregs.ds  = _FP_SEG(lpDAP);
    _int86x (0x13, &inregs, &outregs, &segregs);
    assert(outregs.x.cflag == 0);
#else
    assert(FALSE);  /* physical disk operations not implemented */
#endif
  }
  
  /*   Mask all the data words in the block to 12 bits.  For a real,	*/
  /* legitimate drive written by the SBC6120 this shouldn't be needed,	*/
  /* but just to be safe we'll do it in case this drive's never been	*/
  /* near a SBC6120 before...						*/
  for (i = 0;  i < ID01_SECTOR_SIZE/2;  ++i)  pwData[i] &= 07777;

} /*ReadID01OS8Block*/


/* WriteID01OS8Block - write one OS/8 block to the selected ID01 partition */
PRIVATE void WriteID01OS8Block (UINT nPart, UINT nBlock, UINT16 *pwData)
{
  long lLBA = (fVirtualDisk ? 0 : (long) nPart<<12) + (long) nBlock;

  if (fVirtualDisk) {
    long lOffset = lLBA * (long) ID01_SECTOR_SIZE;
    assert(lseek(hVirtualDisk, lOffset, SEEK_SET) == lOffset);
    assert(write(hVirtualDisk, pwData, ID01_SECTOR_SIZE) == ID01_SECTOR_SIZE);

  } else {
    /* Write a physical sector to an IDE drive attached to this PC! */
#ifdef MSDOS
    union _REGS inregs, outregs;  struct _SREGS segregs;
    struct _DISK_ADDRESS_PACKET DiskAddress;
    void __far *lpDAP = &DiskAddress;
    memset(&DiskAddress, 0, sizeof(DiskAddress));
    DiskAddress.bPacketSize = sizeof(DiskAddress);
    DiskAddress.nTransferCount = 1;  DiskAddress.lpBuffer = pwData;
    DiskAddress.lLBA[1] = 0;  DiskAddress.lLBA[0] = lLBA;
    inregs.h.ah = 0x43;  inregs.h.al = 0;  inregs.h.dl = hPhysicalDisk | 0x80;
    inregs.x.si = _FP_OFF(lpDAP);  segregs.ds  = _FP_SEG(lpDAP);
    _int86x (0x13, &inregs, &outregs, &segregs);
    assert(outregs.x.cflag == 0);
#else
    assert(FALSE);  /* physical disk operations not implemented */
#endif
  }

} /*WriteID01OS8Block*/


/* OpenPhysicalID01 */
/*   This procedure will open a physical ID01 drive under MSDOS.  There	*/
/* isn't anything that actually needs to be done to open the drive, but	*/
/* we can take this opportunity to verify that this BIOS supports the	*/
/* INT 13 Enhanced Drive Services.  We need these extensions to be able	*/
/* to access the drive directly in LBA mode without any CHS translation	*/
/* getting in the way.  We also determine the capacity of the drive and	*/
/* save that away for later range checking of the partition numbers.	*/
PRIVATE BOOLEAN OpenPhysicalID01 (char *pszName, BOOLEAN fRead)
{
#ifdef MSDOS
  union _REGS inregs, outregs;  struct _SREGS segregs;
  struct _EXTENDED_DRIVE_PARAMETERS DriveParams;
  void __far *lpParams = &DriveParams;  char *pszEnd;

  /*   The "file name" for a physical ID01 should simply be a number	*/
  /* specifying the unit number of the IDE disk drive on the PC.  This 	*/
  /* will usually be "1" - the primary slave.				*/
  hPhysicalDisk = (int) strtol(pszName, &pszEnd, 10);
  if ((*pszEnd != EOS) || (hPhysicalDisk < 0) || (hPhysicalDisk > 3)) {
    Message('E', "Invalid physical IDE unit %s", pszName);  return FALSE;
  }

  /*  INT 13h, function 41h, is used to test for the presence of a BIOS	*/
  /* with Enhanced Disk Drive support.					*/  
  inregs.h.ah = 0x41;  inregs.x.bx = 0x55AA;  inregs.h.dl = 0x80;
  _int86 (0x13, &inregs, &outregs);
  /*   If the carry flag is set, then this BIOS doesn't know anything	*/
  /* about enhanced disk services.  However even if the carry flag is	*/
  /* clear, we still need to check the bitmap of supported functions	*/
  /* (returned in CX) to verify that extended disk access functions are	*/
  /* present...								*/  
  if (outregs.x.cflag || ((outregs.x.cx & 1) == 0)) {
    Message('E', "This BIOS does not support extended disk access");
    return FALSE;
  }

  /*   Now use INT 13h, subfunction 48H, to find the size of the drive	*/
  /* in physical sectors.  If this function fails, then the unit most	*/
  /* likely doesn't exist.  Note that the BIOS actually allows for 64	*/
  /* bits in the drive size, but that's _huge_ !!  We only use 32 bits	*/
  /* of the drive size, and the SBC6120/BTS6120 actually only uses 24.	*/
  inregs.h.ah = 0x48;  inregs.h.dl = hPhysicalDisk | 0x80;
  inregs.x.si = _FP_OFF(lpParams);  segregs.ds  = _FP_SEG(lpParams);
  memset(&DriveParams, 0, sizeof(DriveParams));
  DriveParams.nParamSize = sizeof(DriveParams);
  _int86x (0x13, &inregs, &outregs, &segregs);
  if (outregs.x.cflag)  return FALSE;
  assert(DriveParams.lTotalSectors[1] == 0);
  nMaxPartition = (UINT) (DriveParams.lTotalSectors[0] >> 12);
  Message('I', "ID01 supports %d OS/8 partitions", nMaxPartition);   

  return TRUE;
#else

  /* Non-MSDOS machines don't support ID01 (at least not yet!)... */
  return FALSE;
#endif
}


/************************************************************************/
/*************   G E N E R I C   D I S K E T T E   I / O   **************/
/************************************************************************/

/* ReadOS8Block								 */
/*   This procedure will read one OS/8 virtual block from the current	 */
/* disk device.  It knows how to handle diskette addressing and the 8 to */
/* 12 bit conversions for both RX01 and RX50 diskettes.  Note that an	 */
/* OS/8 block is always 256 words long.					 */
PUBLIC void ReadOS8Block (UINT nBlock, UINT16 *pwData)
{
  switch (nDiskType) {
    case RX01:  ReadRX01OS8Block(            nBlock, pwData);  break;
    case RX50:  ReadRX50OS8Block(            nBlock, pwData);  break;
    case VM01:  ReadVM01OS8Block(            nBlock, pwData);  break;
    case ID01:  ReadID01OS8Block(nPartition, nBlock, pwData);  break;
    case RK05:  ReadRK05OS8Block(nPartition, nBlock, pwData);  break;
    default:    assert(FALSE);
  }
} /*ReadOS8Block*/


/* WriteOS8Block - just like ReadOS8Block, but for writing */
PUBLIC void WriteOS8Block (UINT nBlock, UINT16 *pwData)
{
  assert(!fReadOnly);
  switch (nDiskType) {
    case RX01:  WriteRX01OS8Block(            nBlock, pwData);  break;
    case RX50:  WriteRX50OS8Block(            nBlock, pwData);  break;
    case VM01:  WriteVM01OS8Block(            nBlock, pwData);  break;
    case ID01:  WriteID01OS8Block(nPartition, nBlock, pwData);  break;
    case RK05:  WriteRK05OS8Block(nPartition, nBlock, pwData);  break;
    default:    assert(FALSE);
  }
} /*WriteOS8Block*/


/* OpenDisk								 */
/*   This procedure will open either a virtual disk file or a physical	 */
/* diskette device. It gets all its inputs through the global parameters */
/* describing the current diskette.  If it is unable to open the device	 */
/* or file, it will return FALSE.					 */
PUBLIC BOOLEAN OpenDisk
  (BOOLEAN fVirtual, BOOLEAN fRead, DISKTYPE nType, char *pszName)
{
  /* If there's currently a disk open, then close it first... */
  if (nDiskType != NODISK) CloseDisk();
  
  /* And return TRUE if we can actually open the disk... */
  if (fVirtual)  {
    int flags = O_BINARY | (fRead ? O_RDONLY : O_RDWR);
    hVirtualDisk = open(pszName, flags, 0);
    if (hVirtualDisk == -1) return FALSE;
  } else {
    switch (nType) {
      case RX01:
      case RX50: return FALSE;  /* Not yet implemented */
      case ID01: if (!OpenPhysicalID01(pszName, fRead)) return FALSE;
      		 break;
      /* Otherwise physical disk operations not implemented for this device */
      default: return FALSE;
    }
  }

  /* Initialize all the disk parameters... */
  strcpy(szDiskName, pszName);  nDiskType = nType;
  fReadOnly = fRead;  fVirtualDisk = fVirtual;  nPartition = 0;
  return TRUE;  
} /*OpenDisk*/


/* WriteEmptyImage */
/*   This procedure will write a virtual diskette full of zero sectors.	*/
PRIVATE BOOLEAN WriteEmptyImage (UINT cbSector, UINT nSectors)
{
  UINT i;  UINT8 abSector[VM01_BANK_SIZE];
  assert(cbSector <= VM01_BANK_SIZE);
  memset(abSector, 0, cbSector);
  for (i=0;  i < nSectors;  ++i) {
    if ((UINT) write(hVirtualDisk, abSector, cbSector) != cbSector) return FALSE;
  }
  return TRUE;
} /* WriteEmptyImage */


/* CreateDisk								 */
/*   This procedure will create and initialize (as required by the local */
/* operating system) a virtual diskette file.  Note that this procedure	 */
/* cannot be called while a diskette is already mounted, as it uses the	 */
/* same global file handle.  The new diskette file is left opened after	 */
/* this procedure is done.						 */
PUBLIC BOOLEAN CreateDisk (BOOLEAN fVirtual, DISKTYPE nType, char *pszName)
{
  /*   We can only "create" virtual disks, so if this is a physical 	*/
  /* disk then just open it instead....					*/
  if (!fVirtual)
    return OpenDisk(fVirtual, FALSE, nType, pszName);
    
  /* If there's currently a disk open, then close it first... */
  if (nDiskType != NODISK) CloseDisk();
  
  /* Open the image file... */  
  hVirtualDisk = open(pszName,
    O_RDWR | O_BINARY | O_CREAT | O_EXCL, S_IREAD | S_IWRITE);
  if (hVirtualDisk == -1) return FALSE;
  
  /* Initialize all the disk parameters... */
  strcpy(szDiskName, pszName);  nDiskType = nType;
  fReadOnly = FALSE;  fVirtualDisk = fVirtual;  nPartition = 0;

  /* Write a file full of the correct number of zero sectors... */
  switch (nDiskType) {
    case RX01:  return WriteEmptyImage(RX01_SECTOR_SIZE, 77*26);
    case RX50:  return WriteEmptyImage(RX50_SECTOR_SIZE, 80*10);
    case VM01:  return WriteEmptyImage(VM01_BANK_SIZE,   128);
    case ID01:  return WriteEmptyImage(ID01_SECTOR_SIZE, 4096);
    case RK05:  return WriteEmptyImage(RK05_SECTOR_SIZE, 203*16*2);
    default:    assert(FALSE);
  }
} /*CreateDisk*/


/* CloseDisk								*/
/*   This procedure will close the current diskette file.  It works for	*/
/* both physical and virtual disks.					*/
PUBLIC void CloseDisk (void)
{
  /* Close the device or virtual disk file... */
  if (fVirtualDisk) {
    close(hVirtualDisk);
  } else {
    switch (nDiskType) {
      case RX01:
      case RX50: break;	/* Not yet implemented! */
      case ID01: break;	/* No action required */
      /* Otherwise physical disk operations not implemented for this device */
      default: assert(FALSE);
    }
  }

  /* And reset all the internal variables... */  
  fReadOnly = fVirtualDisk = FALSE;  szDiskName[0] = EOS;  nDiskType = NODISK;
} /*CloseDisk*/


/* DiskMounted - return TRUE if any type of diskette is mounted */
PUBLIC BOOLEAN DiskMounted (void)  {return nDiskType != NODISK;}

/* DiskType - return the type (e.g. RX01, RX50) of the current diskette */
PUBLIC DISKTYPE DiskType (void)  {return nDiskType;}

/* DiskName - return the name, in ASCIZ, of the current drive or image */
PUBLIC char *DiskName (void)  {return szDiskName;}

/* ReadOnly - return TRUE if the current diskette is read only */
PUBLIC BOOLEAN ReadOnly (void)  {return fReadOnly;}


/* SetPartition */
/*   The maximum possible size for an OS/8 mass storage device is 4095	*/
/* blocks, but unfortunately the RK05 holds 6,496 blocks or about 50%	*/
/* more than the limit.  The OS/8 designers handled this by making the	*/
/* RK8E handler split the physical drive into two logical partitions,	*/
/* called RKA0 and RKB0 (or RKA1/RKB1 for unit 1, RKA2/RKB2, etc). When	*/
/* the RL01 came along it had more than twice the OS/8 limit and things	*/
/* got even worse, so it has three partitions - RL0A, RL0B and RL0C are	*/
/* different partitions of physical unit 0.  The RL02 has no less than	*/
/* five partitions - A, B, C, D, and E.					*/
/*									*/
/*   This routine sets the current partition in use.  If the partition	*/
/* is illegal, or the current disk type doesn't support partitions, 	*/
/* then FALSE is returned and nothing changes.				*/
PUBLIC BOOLEAN SetPartition (UINT nPart)
{
  /* For the RK05, the partition has to be either 0 (A) or 1 (B)... */
  if ((nDiskType == RK05)  &&  (nPart < 2)) {
    nPartition = nPart;  return TRUE;
  /*   For ID01s the partition can be anything up to what the physical	*/
  /* size of the disk will allow.  FLX8 only supports partitions for	*/
  /* physical ID01s - a virtual ID01 image file is always exactly one	*/
  /* partition!								*/
  } else if ((nDiskType == ID01) && !fVirtualDisk && (nPart < nMaxPartition)) {
    nPartition = nPart;  return TRUE;
  } else
    return FALSE;
} /*SetPartition*/


/* GetPartition - return the current partition in use, or zero if none. */
PUBLIC BOOLEAN GetPartition (UINT *pnPartition)
{
  if ((DiskType() == RK05)  ||  ((DiskType() == ID01) && !fVirtualDisk)) {
    *pnPartition = nPartition;  return TRUE;
  } else {
    *pnPartition = 0;  return FALSE;
  }
} /*GetPartition*/
