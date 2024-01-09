#include <stdio.h>
#include <dos.h>
#include <bios.h>
#include <memory.h>
#include <ctype.h>

#define DRIVE	1

typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef unsigned long  DWORD;

#pragma pack(1)
struct _EXTENDED_DRIVE_PARAMETERS {
  WORD	wBufferSize;	// size of buffer (001Ah for v1.x, 001Eh for v2.x)
  WORD  wFlags;		// information flags (see #0199) 
  DWORD dwCylinders;	// number of physical cylinders on drive
  DWORD dwHeads;	// number of physical heads on drive
  DWORD dwSPT;		// number of physical sectors per track
  DWORD dwTotalSectors[2];// total number of sectors on drive
  WORD  wSectorSize;	// bytes per sector
  DWORD dwEDDConfig;	// EDD configuration parameters (see #0201) 
};

struct _DISK_ADDRESS_PACKET {
  BYTE  bPacketSize;	// 10h (size of packet)
  BYTE  bReserved;	// reserved (0)
  WORD  wCount;		// number of blocks to transfer (max 007Fh for Phoenix EDD)
  void __far *lpBuffer;	// transfer buffer
  DWORD dwLBA[2];	// starting absolute block number
};
#pragma pack()


unsigned CheckExtendedDiskSupport (BYTE nDrive)
{
  union _REGS inregs, outregs;

  inregs.h.ah = 0x41;  inregs.x.bx = 0x55AA;  inregs.h.dl = nDrive | 0x80;
  
  _int86 (0x13, &inregs, &outregs);
  
  if (outregs.x.cflag) {
    fprintf(stderr, "diskdump: BIOS Extended Disk Support not detected\n");
    return 0;
  }
  
  printf("BIOS extended disk support version %02Xh detected\n", outregs.h.ah);
  if (outregs.x.cx & 0x01) printf("\tExtended disk access functions supported.\n");
  if (outregs.x.cx & 0x02) printf("\tRemovable drive functions supported.\n");
  if (outregs.x.cx & 0x04) printf("\tEnhanced disk drive (EDD) functions supported.\n");
  printf("\n");
  return 1;
}

unsigned CheckExtendedDiskParameters (BYTE nDrive)
{
  union _REGS inregs, outregs;  struct _SREGS segregs;
  struct _EXTENDED_DRIVE_PARAMETERS params;
  void __far *lpParams = &params;

  inregs.h.ah = 0x48;  inregs.h.dl = nDrive | 0x80;
  inregs.x.si = _FP_OFF(lpParams);
  segregs.ds  = _FP_SEG(lpParams);
  memset(&params, 0, sizeof(params));
  params.wBufferSize = sizeof(params);
  
  _int86x (0x13, &inregs, &outregs, &segregs);

  if (outregs.x.cflag) {
    fprintf(stderr, "diskdump: Get Extended Disk Parameters error 0x%02X\n", outregs.h.ah);
    return 0;
  }
  
  printf("Drive %d parameters:\n", nDrive);
  printf("\tDrive Flags = %04Xh\n", params.wFlags);
  printf("\tTotal cylinders   = %ld\n", params.dwCylinders);
  printf("\tTotal heads       = %ld\n", params.dwHeads);
  printf("\tSectors per track = %ld\n", params.dwSPT);
  printf("\tTotal sectors = %ld %ld\n", params.dwTotalSectors[1], params.dwTotalSectors[0]);
  printf("\tSector size   = %d\n", params.wSectorSize);
  printf("\n");
  return 1;    
}

unsigned ReadSector (BYTE nDrive, DWORD dwLBA, void __far *lpBuffer)
{
  union _REGS inregs, outregs;  struct _SREGS segregs;
  struct _DISK_ADDRESS_PACKET dap;
  void __far *lpDAP = &dap;
  
  memset(&dap, 0, sizeof(dap));
  dap.bPacketSize = sizeof(dap);
  dap.wCount = 1;  dap.dwLBA[1] = 0;  dap.dwLBA[0] = dwLBA;
  dap.lpBuffer = lpBuffer;

  inregs.h.ah = 0x42;  inregs.h.dl = nDrive | 0x80;
  inregs.x.si = _FP_OFF(lpDAP);
  segregs.ds  = _FP_SEG(lpDAP);
  
  _int86x (0x13, &inregs, &outregs, &segregs);

  if (outregs.x.cflag) {
    fprintf(stderr, "diskdump: extended read error 0x%02X\n", outregs.h.ah);
    return 0;
  }

  printf("Drive %d sector %ld\n", nDrive, dwLBA);
  return 1;
}

void DumpByteSector (BYTE __far *lpBuffer)
{
  unsigned i, j;
  for (i = 0;  i < 512;  i += 16) {
    printf("%03X/  ", i);
    for (j = 0;  j < 8;  ++j) printf(" %02X", lpBuffer[i+j]);
    printf("  ");
    for (j = 0;  j < 8;  ++j) printf(" %02X", lpBuffer[i+j+8]);
    printf("  ");
    for (j = 0;  j < 16;  ++j)
      printf("%c", isprint(lpBuffer[i+j]) ? lpBuffer[i+j] : '.');
    printf("\n");
  }
}

/* Simple PDP-8 and OS/8 data conversions... */
#define SixToChar(x)            /* convert SIXBIT character to a char   */ \
        ((char) ( ((x) == 0) ? ' ' : ((x) >= 32) ? (x) : ((x) | 0100) ))
#define WordToChars(w,c1,c2)    /* convert a SIXBIT word to two chars   */ \
        c1 = SixToChar((w) >> 6),  c2 = SixToChar((w) & 077)

void DumpPDP8Sector (WORD __far *lpBuffer)
{
  unsigned nOffset, i;  char c1, c2;
  
  for (nOffset = 0;  nOffset < 256;  nOffset += 8) {
    printf("%04o/", nOffset);
    for (i = 0;  i < 8;  ++i) printf(" %04o", lpBuffer[nOffset+i] & 07777);

    /* Now write the same 8 words as 16 SIXBIT characters */
    printf("  ");
    for (i = 0;  i < 8;  ++i) {
      WordToChars(lpBuffer[nOffset+i], c1, c2);  printf("%c%c", c1, c2);
    }
    printf("\n");
  }

  printf("\n");
}


void main (void)
{
  DWORD dw;  BYTE abBuffer[512];
  if (!CheckExtendedDiskSupport(DRIVE)) return;
  CheckExtendedDiskParameters (DRIVE);
  
  for (dw = 0;  dw < 10;  ++dw) {  
    ReadSector(DRIVE, dw*4096L+1L, &abBuffer);
    DumpPDP8Sector((WORD __far *) &abBuffer);
  }
}
