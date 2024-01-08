//++                                                                    
// bindump.c
//                                                                      
// Copyright (c) 2000 by Robert Armstrong.
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
//   This program dumps a file in PDP-8 BIN loader format.  It's useful for
// finding corrupted BIN files (say, from buggy assemblers :-) and doesn't
// make any attempt to interpret the data.  It just lists the frames as it
// finds them.
//
//   usage:
//              bindump file
//
//                                                                      
// REVISION HISTORY:
// 07-APR-00    RLA     Stolen from the Eight project...
//--                                                                    
#include <stdio.h>              // printf(), fprintf(), etc...          
#include <stdlib.h>             // malloc(), free(), exit(), ...
#include <ctype.h>              // isprint(), ...
#include <string.h>             // strlen(), ...
#include <io.h>                 // _read(), _open(), et al...           
#include <fcntl.h>              // _O_RDONLY, _O_BINARY, etc...

// "Standard" types...
typedef unsigned short UINT;
typedef unsigned char UCHAR;
typedef int BOOL;
#define FALSE (0)
#define TRUE (~FALSE)

// Private variables global to this module...
int   hBinFile;                 // handle, from open(), of the input file
UCHAR abBinBuffer[512];         // buffer for reading data blocks
int   cbBinBuffer;              // number of bytes in the buffer now
int   nBinBufPos;               // next byte in the buffer to be used
UINT  nBinFrame;                // current tape frame
UINT  nBinChecksum;             // checksum accumulator


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

struct _OPDEF {
  UINT  nOpcode;
  char *pszText;
};
typedef struct _OPDEF OPDEF;

//   Memory reference instruction mnemonics.  Unlike all the other tables,
// this one has to be in numerical order...
OPDEF MRIs[] = {
  {00000, "AND"},  {01000, "TAD"},  {02000, "ISZ"},
  {03000, "DCA"},  {04000, "JMS"},  {05000, "JMP"}
};

// Operate microinstructions...
OPDEF OPRs[] = {
  {07000, "NOP"},       {07001, "IAC"},         {07002, "BSW"},
  {07004, "RAL"},       {07006, "RTL"},         {07010, "RAR"},
  {07012, "RTR"},       {07020, "CML"},         {07040, "CMA"},
  {07041, "CIA"},       {07100, "CLL"},         {07104, "CLL RAL"},
  {07106, "CLL RTL"},   {07110, "CLL RAR"},     {07112, "CLL RTR"},
  {07120, "STL"},       {07200, "CLA"},         {07201, "CLA IAC"},
  {07240, "CLA CMA"},   {07204, "GLK"},         {07240, "STA"},
  {07300, "CLA CLL"},   {07400, "NOP"},         {07402, "HLT"},
  {07404, "OSR"},       {07410, "SKP"},         {07420, "SNL"},
  {07430, "SZL"},       {07440, "SZA"},         {07450, "SNA"},
  {07460, "SZA SNL"},   {07470, "SNA SZL"},     {07500, "SMA"},
  {07510, "SPA"},       {07520, "SMA SNL"},     {07530, "SPA SZL"},
  {07540, "SMA SZA"},   {07550, "SPA SNA"},     {07560, "SMA SZA SNL"},
  {07570, "SPA SNA SZL"},                       {07600, "CLA"},
  {07610, "SKP CLA"},   {07620, "SNL CLA"},     {07630, "SZL CLA"},
  {07640, "SZA CLA"},   {07650, "SNA CLA"},     {07660, "SZA SNL CLA"},
  {07670, "SNA SZL CLA"},                       {07700, "SMA CLA"},
  {07710, "SPA CLA"},   {07720, "SMA SNL"},     {07730, "SPA SZL CLA"},
  {07740, "SMA SZA CLA"},                       {07750, "SPA SNA CLA"},
  {07760, "SMA SZA SNL CLA"},                   {07770, "SPA SNA SZL CLA"},
  {07604, "LAS"},       {07401, "NOP"},         {07421, "MQL"},
  {07501, "MQA"},       {07521, "SWP"},         {07601, "CLA"},
  {07621, "CAM"},       {07701, "ACL"},         {07721, "CLA SWP"},
  {07301, "CLA CLL IAC"},                       {07340, "CLL CLA CMA"},

  // Special mnemonics...  
  {07305, "NL0002"},    {07325, "NL0003"},      {07307, "NL0004"},
  {07327, "NL0006"},    {07332, "NL2000"},      {07350, "NL3777"},
  {07330, "NL4000"},    {07333, "NL6000"},      {07346, "NLM3"},
  {07344, "NLM2"}
//  {07201, "NL0001"},
//    case 07326:  printf("\tNL0002\t");  return;
//    case 07350:  printf("\tNL3777\t");  return;
//    case 07330:  printf("\tNL4000\t");  return;
//    case 07352:  printf("\tNL5777\t");  return;
//    case 07346:  printf("\tNL7775\t");  return;
//    case 07344:  printf("\tNL7776\t");  return;
//    case 07240:  printf("\tNL7777\t");  return;
//    case 07325:  printf("\tNL0003\t");  return;
//    case 07307:  printf("\tNL0004\t");  return;
//    case 07327:  printf("\tNL0006\t");  return;
//    case 07333:  printf("\tNL6000\t");  return;
//    case 07203:  printf("\tNL0100\t");  return;
//    case 07215:  printf("\tNL0010\t");  return;
};
#define OPRMAX (sizeof(OPRs) / sizeof(OPDEF))
  
// Input/Output instructions...
OPDEF IOTs[] = {
  //   Extended memory IOTs.  Putting the CIF/CDF/CXF instructions in here is
  // kind of chincy, but it works and it's easy!
  {06214, "RDF"},    {06224, "RIF"},    {06234, "RIB"},    {06244, "RMF"},
  {06201, "CDF\t0"},  {06211, "CDF\t1"},  {06221, "CDF\t2"},  {06231, "CDF\t3"},
  {06241, "CDF\t4"},  {06251, "CDF\t5"},  {06261, "CDF\t6"},  {06271, "CDF\t7"},
  {06202, "CIF\t0"},  {06212, "CIF\t1"},  {06222, "CIF\t2"},  {06232, "CIF\t3"},
  {06242, "CIF\t4"},  {06252, "CIF\t5"},  {06262, "CIF\t6"},  {06272, "CIF\t7"},
  {06203, "CXF\t0"},  {06213, "CXF\t1"},  {06223, "CXF\t2"},  {06233, "CXF\t3"},
  {06243, "CXF\t4"},  {06253, "CXF\t5"},  {06263, "CXF\t6"},  {06273, "CXF\t7"},

  // Processor IOTs...
  {06000, "SKON"},   {06001, "ION"},    {06002, "IOF"},    {06003, "SRQ"},
  {06004, "GTF"},    {06005, "RTF"},    {06006, "SGT"},    {06007, "CAF"},

  // RX8E IOTs...
  {06750, "SEL"},    {06751, "LCD"},    {06752, "XDR"},    {06753, "STR"},
  {06754, "SER"},    {06755, "SDN"},    {06756, "INTR"},   {06757, "INIT"},

  // Standard console (e.g. KL8E) IOTs...
  {06030, "KCF"},    {06031, "KSF"},    {06032, "KCC"},    {06034, "KRS"},
  {06035, "KIE"},    {06036, "KRB"},    {06040, "SPF"},    {06041, "TSF"},
  {06042, "TCF"},    {06044, "TPC"},    {06045, "TSK"},    {06046, "TLS"},

  // Standard clock IOTs..
  //{06135, "CLLE"},   {06136, "CLCL"},   {06137, "CLSK"},

  // High speed reader/punch (PC8E/PR8E/PP8E) IOTs...
  //{06010, "RPE"},    {06011, "RSF"},    {06012, "RRB"},    {06014, "RFC"},
  //{06016, "RCC"},    {06020, "PCE"},    {06021, "PSF"},    {06022, "PCF"},
  //{06024, "PPC"},    {06026, "PLS"},

  // LE8E line printer IOTs...  
  //{06660, "PSSF"},   {06661, "PSKF"},   {06662, "PCLF"},   {06664, "PSTB"},
  //{06665, "PCIE"},   {06666, "PCLB"},

  // HM6120 unique IOTs...
  {06246, "WSR"},    {06256, "GCF"},    {06206, "PR0"},    {06216, "PR1"},
  {06226, "PR2"},    {06236, "PR3"},    {06266, "CPD"},    {06276, "SPD"},
  // These conflict with SKON, SRQ and GTF...
  //{06000, "PRS"},    {06003, "PGO"},    {06004, "PEX"},
  {06205, "PPC1"},   {06245, "PPC2"},   {06215, "PAC1"},   {06255, "PAC2"},
  {06225, "RTN1"},   {06265, "RTN2"},   {06235, "POP1"},   {06275, "POP2"},
  {06207, "RSP1"},   {06227, "RSP2"},   {06217, "LSP1"},   {06237, "LSP2"},
  
  // DECmate-II (PC-278) special IOTs...
  {06050, "6050\t; set keyboard flag"},
  {06051, "6051\t; skip on keyboard flag"},
  {06052, "6052\t; clear the AC (keyboard)"},
  {06053, "6053\t; keyboard nop"},
  {06054, "6054\t; OR keyboard data to AC"},
  {06055, "6055\t; set/clear keyboard input interrupt enable"},
  {06056, "6056\t; read keyboard data"},
  {06057, "6057\t; keyboard nop"},
  {06110, "6110\t; set keyboard flag"},
  {06111, "6111\t; skip on keyboard output flag"},
  {06112, "6112\t; keyboard nop"},
  {06113, "6113\t; keyboard nop"},
  {06114, "6114\t; transmit keyboard data"},
  {06115, "6115\t; set/clear keyboard output interrupt enable"},
  {06116, "6116\t; transmit keyboard data and clear AC"},
  {06117, "6117\t; keyboard nop"}
  
};
#define IOTMAX (sizeof(IOTs) / sizeof(OPDEF))



// Output an origin setting statement to the assembly language file...
void SetOrigin (UINT nAddress)
{
  printf("\t.ORG\t%04o\n", nAddress);
}

// Output a field setting statement to the assembly language file...
void SetField (UINT nField)
{
  printf("\t.FIELD\t%o\n", nField);
}

// Output a .PAGE pseudo op...
void NextPage (void)
{
  printf("\n\t.PAGE\n\n");
}


// Search an OPDEF table for a matching instruction...
OPDEF *FindOpdef (UINT nWord, OPDEF pTable[], UINT nCount)
{
  UINT i;
  for (i = 0;  i < nCount;  ++i)
    if (nWord == pTable[i].nOpcode) return &(pTable[i]);
  return NULL;
}


// Disassemble an MRI instruction...
void DoMRI (char *pszBuffer, UINT nAddress, UINT nWord)
{
  UINT nOP = (nWord >> 9) & 7;
  UINT nEA = nWord & 0177;
  if (nWord & 0200) nEA |= nAddress & 07600;
  sprintf(pszBuffer, 
    "%s\t%c%04o", MRIs[nOP].pszText, (nWord & 0400) ? '@' : ' ', nEA);
}


// Disassemble a single instruction...
char *DoOpcode (UINT nAddress, UINT nWord)
{
  OPDEF *pOpdef;
  static char szBuffer[256];

  if ((nWord > 0377 ) && (nWord < 06000)) {
    DoMRI(szBuffer, nAddress, nWord);  return szBuffer;
  } else if (nWord < 07000) {
    pOpdef = FindOpdef(nWord, IOTs, IOTMAX);
    if (pOpdef != NULL) return pOpdef->pszText;
  } else {
    pOpdef = FindOpdef(nWord, OPRs, OPRMAX);
    if (pOpdef != NULL) return pOpdef->pszText;
  }    
  sprintf(szBuffer, "%04o", nWord);  return szBuffer;
}  

// Disassemble a single instruction...
void Disassemble (UINT nAddress, UINT nWord)
{
  char *pszOpcode = DoOpcode(nAddress, nWord);
  printf("\t%-1s\t", pszOpcode);
  if (strlen(pszOpcode) < 9) printf("\t");
  printf("; %04o/ %04o", nAddress, nWord);
  if ((nWord < 0377) && isprint(nWord & 0177))  printf("  '%c'", nWord & 0177);
  printf("\n");
}


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//   This function reads and returns the next byte from the BIN file.   
// If there are no more bytes, it returns FALSE.  It's fairly simple... 
BOOL ReadBinByte (UCHAR *pb)
{
  int Count;
  if (nBinBufPos >= cbBinBuffer) {
    Count = _read(hBinFile, abBinBuffer, sizeof(abBinBuffer));
    if (Count <= 0) return FALSE;
    cbBinBuffer = Count;  nBinBufPos = 0;
  }
  *pb = abBinBuffer[nBinBufPos++];
  return TRUE;
}


//   This routine reads the next frame from the BIN file, which is a    
// little more complex.  Since paper tape is only 8 bits wide, twelve   
// bit PDP-8 words are split up into two six bit bytes which together   
// are called a "frame".  The upper two bits of the first byte are used 
// as a code to describe the type of the frame.  The upper bits of the  
// second byte are, so far as I know, unused and are always zero.  This 
// function returns a 14 bit tape frame - 12 bits of data plus the type 
// bits from the first byte.  A complication is that the BIN checksum   
// accumulates the bytes on the tape, not the frames, so we have to     
// calculate it here.  The caller can't do it...                        
BOOL ReadBinFrame (UINT *pnFrame)
{
  UCHAR b;

  // Read the first byte - this is the high order part of the frame... 
  if (!ReadBinByte(&b)) return FALSE;
  *pnFrame = b << 6;
  
  //   Frame types 2 (leader/trailer) and 3 (field settings) are single 
  // bytes - there is no second data byte in these frames!  More over,  
  // these frame types are _not_ counted towards the checksum!          
  if ((*pnFrame & 020000) != 0) return TRUE;
  
  // Frame types 0 (data) and 1 (address) are normal 12 bit data.... 
  nBinChecksum += b;
  if (!ReadBinByte(&b)) return FALSE;
  *pnFrame |= b & 077;  nBinChecksum += b;

  return TRUE;
}


//   This function loads one segment of a BIN format tape image.  Most  
// tapes have only one segment (i.e. <leader> <data> <trailer> <EOT>),  
// but a few (e.g. FOCAL69 with the INIT segment) are <leader> <data-1> 
// <trailer-1>/<leader-2> <data-2> ... <trailer-n> <EOT>.  When this    
// function is called the leader has already been skipped and the first 
// actual data frame is passed in wFrame. When we return, the data will 
// have been read and wFrame will contain a leader/trailer code.  The   
// big problem is the checksum, which looks just like a data frame.  In 
// fact, the only way we can tell that it is a checksum and not data is 
// because of its position as the very last frame on the tape.  This    
// means that every time we find a data frame, we have to look ahead at 
// the next frame to see whether it's a leader/trailer.  If it is, then 
// the current frame is a checksum. If it isn't, then the current frame 
// is data to be stored!                                                
//                                                                      
//   The return value is the number of PDP-8 data words read, or -1 if the
// tape format is bad (e.g. a mismatched checksum).           
int LoadBinSegment (void)
{
  UINT  nAddress = 0200;        // current loading address
  UINT  nCount   = 0;           // count of data words read and stored  
  UINT  nNextFrame;             // next tape frame, for look ahead      

  // Load tape frames until we hit the end!   
  while (TRUE) {
    switch (nBinFrame & 030000) {

      case 000000:
        //   This is a data frame. It could be either data to be stored 
        // in memory, or a checksum.  The only way to know is to peek   
        // at the next frame...                                         
        if (!ReadBinFrame(&nNextFrame)) return -1;
        if (nNextFrame == 020000) {
          //   This is the end of the tape, so this frame must be the   
          // checksum.  Make sure that it matches our value and then we 
          // are done loading.  One slight problem is that the checksum 
          // bytes shouldn't be added to the checksum accumulator, but  
          // ReadBINFrame() has already done it.  We'll subtract them 
          // back out to compensate...                                  
          nBinChecksum = (nBinChecksum - (nBinFrame >> 6) - (nBinFrame & 077)) & 07777;
          printf("; Checksum, expected = %04o, Actual = %04o\n", nBinChecksum, nBinFrame);
          if (nBinChecksum != nBinFrame) return -1;
          return nCount;
        } else {
          // Real data...
          Disassemble(nAddress, nBinFrame & 07777);
          if ((++nAddress & 0177) == 0) NextPage();
          ++nCount;
        }
        nBinFrame = nNextFrame;
        // Don't read the next frame this time - we already did that! 
        continue;

      case 010000:
        //   Frame type 1 sets the loading origin.  The address is only 
        // twelve bits - the field can be set by frame type 3...
        nAddress = nBinFrame & 07777;  SetOrigin(nAddress);
        break;
        
      case 020000:
        //  Frame type 2 are leader/trailer codes, and these are usually 
        // handled under case 000000, above.  If we find one here it    
        // means that the tape didn't end with a data frame, and hence  
        // there was no checksum.  I don't think this ever happens in   
        // real life, so we'll consider it a bad tape...                
        fprintf(stderr, "\t\t**** Unexpected  leader/trailer\n");
        return -1;
        
      case 030000:
        //  Type 3 frames set the loading field... 
        SetField((nBinFrame >> 9) & 7);
        break;
    }

    // Read the next tape frame and keep on going. 
    if (!ReadBinFrame(&nBinFrame)) return -1;

  }
}


//   This function will load an entire BIN tape, given its file name.  It
// returns TRUE if the file is loaded successfully and FALSE if there was
// some error.
BOOL ReadBinFile (char *lpszFileName)
{
  UINT  nSegments = 0;  // number of segments in this tape            
  UINT  nWords    = 0;  //   "     " words     "   "    "             
  UINT  cwSegment;      // number of words loaded from this segment   
  UCHAR b;              // temporary 8 bit data                       

  // Open the file (after giving it the default type, of course). 
  hBinFile = _open(lpszFileName, _O_RDONLY | _O_BINARY);
  if (hBinFile == -1) {
    fprintf(stderr, "%s: unable to read file\n", lpszFileName);
    return FALSE;
  }
  cbBinBuffer = nBinBufPos = 0;

  //   Some tape images begin with the name of the actual name of the   
  // program, in plain ASCII text.  Apparently the real DEC BIN loader  
  // ignores anything before the start of the leader, so we'll do the   
  // same...                                                            
  while (TRUE) {
    if (!ReadBinByte(&b)) return -1;
    if (b == 0200) break;
    printf("\t%03o\tIgnored\n", b);
  }

  while (TRUE) {
    nBinChecksum = 0;

    // Skip the leader and find the first data frame... 
    while (TRUE) {
      if (!ReadBinFrame(&nBinFrame)) {
        // We've found the end of the file...
        fprintf(stderr, "%s: %u segments, %u words\n", lpszFileName, nSegments, nWords);
        _close(hBinFile);
        return TRUE;
      }
      if (nBinFrame != 020000) break;
      printf("; Leader/Trailer\n");
    }
  
    // Load this segment of the tape... 
    cwSegment = LoadBinSegment();
    if (cwSegment <= 0) return 0;
    nWords += cwSegment;  ++nSegments;
  }
}

//++
// The main program...
//--
int main (int argc, char *argv[])
{
  char *szInputFile;
  
  // If there are no arguments, then just print the help and exit...
  if (argc != 2) {
    fprintf(stderr, "Usage:\n");
        fprintf(stderr,"\tbindump input-file\n");
    return EXIT_SUCCESS;
  }
  
  szInputFile = argv[1];
  //SetFileType(szInputFile, ".bin");

  if (!ReadBinFile(szInputFile)) return EXIT_FAILURE;
  return EXIT_SUCCESS;
}
