/* diskette.h */
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
#ifndef _DISKETTE_H_
#define _DISKETTE_H_

/* Standard disk geometry parameters... */
#define RX01_SECTOR_SIZE	128	/* Size a RX01 disk sector		*/
#define RX50_SECTOR_SIZE	512	/*  "   " RX50  "      "		*/
#define ID01_SECTOR_SIZE	512	/*  "   " ID01  "      "		*/
#define VM01_SECTOR_SIZE        192	/*  "   " VM01 memory sector		*/
#define VM01_BANK_SIZE	       4096	/*  "   " VM01 memory bank (21 sectors)	*/
/*   There's a minor hack here - the RK05 actually has 256 12 bit words per	*/
/* sector, but the low level code only deals with 8 bit data.  So we simply lie */
/* to it, and read/write each 256 word sector as 512 bytes. The upper four bits	*/
/* of each pair of bytes is unused...						*/
#define RK05_SECTOR_SIZE	512	/* RK05 sector size,in bytes		*/

typedef enum {				/* Type of the diskette in use		*/
  RX01,					/* 8"    SSSD floppy diskette		*/
  RX50,					/* 5.25" SSDD floppy diskette		*/
  VM01,					/* SBC6120 RAM disk 			*/
  ID01,					/* SBC6120 IDE/ATA disk			*/
  RK05,					/* RK05 image files from WinEight	*/
  NODISK				/* no device mounted			*/
} DISKTYPE;


#ifdef MSDOS
#pragma pack(1)
/*   This structure is used by BIOS INT 13h, subfunction 48h, to obtain the	*/
/* characteristics of an IDE disk drive...					*/
struct _EXTENDED_DRIVE_PARAMETERS {
  unsigned short nParamSize;		/* size of this structure (001Eh)	*/
  unsigned short nFlags;		/* information flags (see #0199) 	*/
  unsigned long  lPhysicalCylinders;	/* number of physical cylinders 	*/
  unsigned long  lPhysicalHeads;	/* number of physical heads on drive	*/
  unsigned long  lSectorsPerTrack;	/* number of physical sectors per track	*/
  unsigned long  lTotalSectors[2];	/* total number of sectors on drive	*/
  unsigned short nSectorSize;		/* bytes per sector (should be 512!)	*/
  unsigned long  lEDDConfig;		/* EDD configuration parameters		*/
};

/*   This structure is used by BIOS INT 13h, subfunctions 42h and 43h, to	*/
/* specify the parameters for extended disk reads and writes...			*/
struct _DISK_ADDRESS_PACKET {
  unsigned char  bPacketSize;		/* size of this structure (10h)		*/
  unsigned char  bReserved;		/* reserved (must be zero)		*/
  unsigned short nTransferCount;	/* number of sectors to transfer	*/
  void __far    *lpBuffer;		/* segmented address of buffer		*/
  unsigned long  lLBA[2];		/* starting absolute block number	*/
};
#pragma pack()
#endif /*MSDOS*/

#ifdef VMS
/* This structure is used by the VMS $QIO[W] calls... */
struct _IOSB {
  unsigned short wStatus;	/* read/write completion status		*/
  unsigned short wCount;	/* transfer count (bytes)		*/
  unsigned long  wDevice;	/* device specific information		*/
};
#endif /*VMS*/


void CloseDisk (void);
BOOLEAN OpenDisk (BOOLEAN fVirtual, BOOLEAN fRead, DISKTYPE nType, char *pszName);
BOOLEAN CreateDisk (BOOLEAN fVirtual, DISKTYPE nType, char *pszName);
BOOLEAN DiskMounted (void);
DISKTYPE DiskType (void);
char *DiskName (void);
BOOLEAN ReadOnly (void);
void ReadOS8Block (UINT nBlock, UINT16 *pwData);
void WriteOS8Block (UINT nBlock, UINT16 *pwData);
BOOLEAN SetPartition (UINT nPartition);
BOOLEAN GetPartition (UINT *pnPartition);

#endif
