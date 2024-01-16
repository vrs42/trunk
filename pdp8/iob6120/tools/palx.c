/************************************************************************/
/*                                                                      */
/*    PPPPPPPPPP        AAAAAAAA      LL              XX          XX    */
/*    PPPPPPPPPPP      AAAAAAAAAA     LL              XX          XX    */
/*    PP        PP    AA        AA    LL               XX        XX     */
/*    PP        PP    AA        AA    LL                XX      XX      */
/*    PP        PP    AA        AA    LL                 XX    XX       */
/*    PP        PP    AA        AA    LL                  XX  XX        */
/*    PPPPPPPPPPP     AA        AA    LL                    XX          */
/*    PPPPPPPPPP      AA        AA    LL                    XX          */
/*    PP              AAAAAAAAAAAA    LL                  XX  XX        */
/*    PP              AAAAAAAAAAAA    LL                 XX    XX       */
/*    PP              AA        AA    LL                XX      XX      */
/*    PP              AA        AA    LL               XX        XX     */
/*    PP              AA        AA    LLLLLLLLLLLL     XX        XX     */
/*    PP              AA        AA    LLLLLLLLLLLL     XX        XX     */
/*                                                                      */
/*                               Bob Armstrong                          */
/*                          August 1981/February 1999                   */
/*                                                                      */
/************************************************************************/


/*
		Copyright (C) 1999 by Robert Armstrong

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANT-
   ABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
   Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, visit the website of the Free
   Software Foundation, Inc., www.gnu.org.
*/


/*
 REVISION HISTORY

   21-Feb-99    RLA     - allow '%', '$', '_' and '.' in identifiers
                        - be sure an origin setting gets sent to the .bin file
                          if the program starts at address 0001
    3-Apr-00    RLA     - Make it compile on VMS under DEC C...
    4-Apr-00    RLA     - fix up the listing slightly so that tabs line up.
                        - add the .PAGE pseudo op
                        - add the .IM6100 and .HM6120 pseudo ops
                        - make .SIXBIT fold the string to upper case
                        - make the literals show up in the listing before
                          the .END, not after!
                        - make PALX support multiple fields and add the
                          .FIELD pseudo op
                        - add the memory bitmap to the listing
                          (this is a way cool feature!)
                        - Under some conditions, EvaluateOperand() fails to
                          return a value.  This leads to some very puzzling
                          and undeserved error messages when assembling!
    5-Apr-00    RLA     - Add a symbol cross reference to the listing
    6-Apr-00    RLA     - Finally, finally, fix the nagging "gratuitous P
                          error when a page is exactly full" problem!
                        - If the syntax for .HM6120 or .IM6100 was illegal,
                          the line wouldn't get printed in the listing.
                        - Add the .VECTOR pseudo op to set the reset vector
                          on the 6100 and 6120 microprocessors...
    7-Apr-00    RLA     - Store the "." in pseudo ops as part of the actual
                          name in the symbol table.  This way there's no
                          conflict if the user happens to define a symbol in
                          his program with the same name.
                        - Do away with the PSEUDO_OPS enumeration and just
                          store the address of the routine directly in
                          the symbol table.
                        - Add real support for both the 6120 hardware stack,
                          and software stack emulations on the 6100, with
                          the .STACK, .PUSH, .POP, .PUSHJ and .POPJ pseudo ops.
                        - Add the Harris mnemonics for HLTFLG, PNLTRP, PWRON
                          and BTSTRP to the 6120 extended symbols.
                        - I forgot to specify _O_TRUNC when opening the BIN
                          file, so if you assembled a program, edited it to
                          make it shorter and assembled it again, part of the
                          original BIN file would be left at the end of the
                          new one!  This lead to one very hard to find bug!
    8-Apr-00    RLA     - The value of R3L (7014) was incorrect
    9-Apr-00    RLA     - .FIELD needs to dump out the literals _before_
                          sending the field change frame to the binary file,
                          otherwise the literals go into the new field!
   10-Apr-00    RLA     - Add the table of contents (aka TOC) to the listing.
   14-Apr-00    RLA     - Remove the "smart" P error test generated by
                          CheckBitMap - it prevented us from doing to many
                          clever things in BOOTS 6120.
   15-Apr-00    RLA     - Add the .TEXT pseudo op to generate packed ASCII.
   19-Apr-00    RLA     - Remove the BTSTRP, PWRON, PNLTRP and HLTFLG mnemonics.
   21-Apr-00    RLA     - Always start the table of contents on an odd numbered
                          page.  That'll be an upward facing page if a listing 
                          is printed double sided.
                        - Add the Memory Map and Symbol Table headings to the
                          table of contents.
                        - Add escape codes (e.g. \t, \r, \d, etc) to the strings
                          for .ASCIZ, .TEXT and .SIXBIT.
    3-May-00    RLA     - Add the & (logical AND) and | (logical OR) operators
                          to arithmetic expressions.
                        - If there are no literals on the current page, then
                          allow the PC to flow freely onto the next page.  This
                          makes it possible to generate long strings of data or
                          text without PALX requiring arbitrary .PAGE statements
                          to break them up.
                        - In .END, if there are no literals just leave the final
                          PC it is, but if there are literals then dump them and
                          advance the PC to the start of the next page.  This is
                          important because the PC at .END is the program break.
    4-May-00    RLA     - Fix the \t string escape - the code for tab is 011, not
                          010 (there was a day when I would have just known that,
                          but these days I have to look it up!).
                        - Modify the .TEXT, .ASCIZ and .SIXBIT pseudo ops to list
                          list only the address and not all the individual words
                          of code generated.  It just made the listing file way
                          too long to show all those words of code!
   22-Jan-01    RLA     - To help with spliting SBC6120 into multiple fields,
                          add the "F" error to flag off-field references.
                        - Since off-field references aren't always an error, add
                          the .NOWARN psuedo op to allow specified error codes
                          to be explicitly suppressed.
   30-Jan-01    RLA     - If we encounter a .BLOCK statement which would cause
                          the page to overflow, we helpfully try to calculate
                          the maximum space that we could reserve and allocate
                          that.  Unfortunately, if the page is already past full
                          we calculate a negative number, which ends up reserving
                          a very large number of words!

 BUGS
   
 SUGGESTIONS
   The possibility exists that we could use the bitmap to determine which
   locations have been filled with code and which are unused, and this
   information could be used to generate P errors rather than always
   checking the PC against the LiteralBase.  This has the advantage that
   it could detect code that gets overwritten later in the assembly.
*/
     
#include <unistd.h>     /* read(), etc...                               */
#include <stdio.h>      /* printf(), scanf(), fopen(), etc...           */
#include <stdlib.h>     /* exit(), malloc(), free(), ...                */
#include <string.h>     /* strlen(), strcpy(), strcat(), etc...         */
#include <ctype.h>      /* islower(), toupper(), etc...                 */
#include <assert.h>     /* assert() (what else???)                      */
#include <time.h>       /* asctime(), localtime(), struct tm, etc...    */
#ifndef VMS
#include <fcntl.h>      /* _O_TRUNC, _O_WRONLY, etc...                  */
#else
#include <unixio.h>     /* Unix equivalents for DECC/VAXC...            */
#include <fcntl.h>      /* same as the U*nx counter part                */
#include <stat.h>       /* ditto, but note the absence of the "sys/"!   */
#endif

/* VAXC/DECC has slightly different names for these C RTL symbols...    */
#ifndef S_IREAD
#define S_IREAD        S_IRUSR
#define S_IWRITE       S_IWUSR
#endif
#ifndef _O_IREAD
#define _S_IREAD        S_IREAD
#define _S_IWRITE       S_IWRITE
#define _O_CREAT        O_CREAT
#define _O_WRONLY       O_WRONLY
#define _O_TRUNC        O_TRUNC
#ifndef _O_BINARY
#define _O_BINARY       0
#endif
#define _write          write
#define _read           read
#define _open           open
#define _close          close
#endif


/************************************************************************/
/***********              D e c l a r a t i o n s              **********/
/************************************************************************/

#define PALX    "PALX"
#define TITLE   "IM6100/HM6120 Assembly Language"
#define VERSION 332

//#define HASHSIZE        1039    /* maximum entries in the symbol table  */
#define HASHSIZE        1163    /* maximum entries in the symbol table  */
#define LINES_PER_PAGE  65      /* number of lines per listing page     */
#define LIST_TYPE       ".lst"  /* default type for listing files       */
#define BINARY_TYPE     ".bin"  /*    "      "   "  binary    "         */
#define SOURCE_TYPE     ".plx"  /*    "      "   "  source    "         */

/*   The following constants determine the error codes printed in the   */
/* listing at the start of the bad line....                             */
#define ER_IFN          'N'     /* illegal format for number            */
#define ER_SYM          'S'     /* a symbol has been improperly defined */
#define ER_UDF          'U'     /* undefined symbol                     */
#define ER_MDF          'M'     /* multiply defined                     */
#define ER_SYN          'X'     /* syntax error                         */
#define ER_RAN          'A'     /* number out of range                  */
#define ER_PAF          'P'     /* page full error                      */
#define ER_MIC          'O'     /* illegal micro-coded combination      */
#define ER_SCT          'W'     /* illegal off page reference           */
#define ER_POP          'Z'     /* badly formed pseudo op               */
#define ER_OFF          'F'     /* off field reference warning          */

/* Primitive data types... */             
typedef unsigned int UINT;      /* unsigned integer of at least 16 bits */
typedef unsigned char UCHAR;    /* unsigned character of exactly 8 bits */
typedef char STRING[256];       /* generic character strings            */
typedef char IDENTIFIER[11];    /* any identifier (aka symbol)          */
#define EOS  '\0'               /*  end of string character             */
typedef int BOOLEAN;            /* TRUE/FALSE data type                 */
#ifndef TRUE
#define FALSE (0)               /*  logical falsehood                   */
#define TRUE  (~FALSE)          /*  logical truth                       */
#endif

/* Convenient shorthand macros... */
#define STREQL(x,y)     (strcmp(x,y) == 0)
#define CAP(x)          ((char) (islower(x) ? toupper(x) : x))


/* Symbol Table Data */
/*   One table is used to store all identifiers, including both built   */
/* in machine opcodes, pseudo-operations, in addition to user defined   */
/* symbols.  Symbol table entries contain a name, a value and a symbol  */
/* type.  The latter comes from the following enum and defines the      */
/* usage of the symbol.  The value depends on the type, as follows:     */
/*                                                                      */
/*  * For user defined symbols, Value is simply the "value" defined     */
/*  * For machine instructions, Value is the "value" of the opcode      */
/*  * For pseudo ops, Value is the address of an internal routine       */
/*                                                                      */

enum _SYMBOL_TYPES {    /* Types of symbols in the symbol table:        */
                        /* User defined symbol table entries...         */
  SF_UDF,               /*   an undefined symbol                        */
  SF_TAG,               /*   a label (aka tag)                          */
  SF_EQU,               /*   an equate                                  */
  SF_OPDEF,             /*   a user defined opcode (by .OPDEF xyz)      */
  SF_MDF,               /*   a multiply defined symbol                  */
                        /* Built in machine opcode entries...           */
  OP_MRI,               /*   memory reference instruction               */
  OP_OPR,               /*   operate microinstruction                   */
  OP_IOT,               /*   standard (traditional) input/output        */
  OP_PIE,               /*   peripheral interface element (IM6101)      */
  OP_PIO,               /*   parallel I/O (IM6103)                      */
  OP_CXF,               /*   change field (CDF/CIF) instruction         */
                        /* Built in pseudo operators...                 */
  PO_POP                /*   and pseudo operation                       */
};
typedef enum _SYMBOL_TYPES SYMBOL_TYPE;

struct _CREF {          /* Cross reference data for symbols...          */
  UINT     nLine;       /*   source line number of this reference       */
  BOOLEAN  fDefinition; /*   TRUE if this reference defines the symbol  */
  struct _CREF *pNext;  /*   next reference to this symbol              */
};
typedef struct _CREF CREF;

struct _SYMBOL {        /* Data associated with a user symbol...        */
  char        *Name;    /*   the name of the symbol                     */
  SYMBOL_TYPE  Type;    /*   symbol type (pseudo-op, label, etc)        */
  long         Value;   /*   the value of the symbol                    */
  CREF    *pFirstRef;   /*   first CREF block in the reference chain    */
  CREF    *pLastRef;    /*   last    "    "    "  "      "       "      */
};
typedef struct _SYMBOL SYMBOL;

struct _TOC {           /* Table of contents (TOC) entries              */
  char        *pTitle;  /*   the string (from .TITLE) of this section   */
  UINT         nPage;   /*   corresponding listing page number          */
  struct _TOC *pNext;   /*   next table of contents entry               */
};
typedef struct _TOC TOC;

/* Variables */
                                /* Source file variables...             */
STRING  szSourceFile;           /*   name of the current source file    */
FILE   *pSourceFile;            /*   file handle of the source          */
UINT    nSourceLine;            /*   count of source lines read         */
STRING  szSourceText;           /*   text of the current source line    */
                                /* Listing file variables...            */
STRING  szListFile;             /*   name of the listing file           */
FILE   *pListFile;              /*   listing file handle                */
UINT    nListPages;             /*   count of pages printed             */
UINT    nLinesThisPage;         /*   count of lines on this page        */
BOOLEAN fNewPage;               /*   start a new page in the listing    */
STRING  szProgramTitle;         /*   current .TITLE string for listing  */
STRING  szErrorFlags;           /*   error flags for this source line   */
                                /* Binary file variables...             */
STRING  szBinaryFile;           /*   name of the binary file            */
int     fdBinaryFile;           /*   binary (object) file descriptor    */
UINT    nLastBinaryAddress;     /*   address of last word punched       */
UINT    nBinaryChecksum;        /*   running checksum of binary data    */
UCHAR   abBinaryData[64];       /*   buffer for writing BIN data        */
UINT    cbBinaryData;           /*   number of bytes used in the buffer */
                                /* Literal pool variables...            */
UINT    nLiteralBase;           /*   first free literal pool address    */
UINT    anLiteralData[0200];    /*   literal pool for this page         */
                                /* Symbol table variables...            */
SYMBOL  *Symbols[HASHSIZE];     /*   symbols (all of 'em!)              */
TOC     *pFirstTOC;             /*   first table of contents entry      */
TOC     *pLastTOC;              /*   last    "    "    "       "        */
                                /* Software stack opcodes from .STACK   */
UINT    nPUSH, nPOP;            /*   opcodes for .PUSH and .POP         */
UINT    nPUSHJ, nPOPJ;          /*   opcodes for .PUSHJ and .POPJ       */
                                /* Miscellaneous...                     */
UINT    nPass;                  /*   current assembler pass (1 or 2)    */
UINT    nPC;                    /*   current instruction location       */
UINT    nField;                 /*   current instruction field (0..7)   */
UINT    nCPU;                   /*   selected CPU (either 6100 or 6120) */
UINT    nErrorCount;            /*   count of errors in this file       */
UCHAR   abBitMap[32768/8];      /*   bitmap of unused memory words      */
STRING  szIgnoredErrors;        /*   error flags that we can ignore     */

                        

/************************************************************************/
/***********   S y m b o l   T a b l e   M a n a g e m e n t   **********/
/************************************************************************/


/* HashCode */
/*   This routine generates the hash code for a given identifier by     */
/* forming a RADIX-64 binary equivalent for the ordinal values of the   */
/* characters, and then dividing by the table length.  It's crude, but  */
/* good enough for now.  Note that the hashing results are markedly     */
/* better when the symbol table size (e.g. HASHSIZE) is prime!          */
UINT HashCode  (char *pName)
{
  long Hash = 0;
  for (;  *pName != EOS;  ++pName)
    Hash = (Hash * (long) '_') + (long) (*pName - ' ');
  if (Hash < 0) Hash = -Hash;
  return (UINT) (Hash % (long) HASHSIZE);
}


/* LookupSymbol */
/*   This function performs a hashed search of the symbol table to find */
/* the specified name.  If the name is in the table, then the address   */
/* of the corresponding symbol record is returned. If no match is found */
/* (i.e the symbol is undefined) and fEnter is TRUE, then a new symbol  */
/* table entry is created for this name. The new entry will have a type */
/* of SF_UDF (undefined) and all other fields zero, and the caller can  */
/* change these (including the type!) to the correct values.  If the    */
/* name is not in the symbol table and fEnter is FALSE, then NULL is    */
/* returned and nothing is entered into the table.                      */
/*                                                                      */
/*   NOTE:  This is a fairly primitive hashed search with linear        */
/* probing...                                                           */
SYMBOL *LookupSymbol (char *pName, BOOLEAN fEnter)
{
  UINT nHash, nInitialHash;  SYMBOL *pNew;  char *pNameCopy;
  
  /*   Compute the hash code of this symbol and use it for the inital   */
  /* stab into the table.  If that entry doesn't match, then search     */
  /* forward from there.  If we find a NULL entry in the table, then we */
  /* can quit with the knowledge that this symbol isn't defined.        */
   nHash = nInitialHash = HashCode(pName);
  while (Symbols[nHash] != NULL) {
    if (STREQL(Symbols[nHash]->Name, pName)) return Symbols[nHash];
    nHash = (nHash + 1) % HASHSIZE;
    if (nHash == nInitialHash) {
       /*   The symbol table is completely full and this symbol isn't   */
       /* in there (and, of course, there's no place to add it!).       */
       fprintf(stderr,"%s - Symbol table full.  Assembly aborted.\n", PALX);
       exit(EXIT_FAILURE);
    }
  }

  /*   This symbol isn't defined, but nHash points to where it should   */
  /* go if it were defined.  Allocate memory for a new record and fill  */
  /* it in with the symbol's name.  Note that we have to create a copy  */
  /* of the name string, since we can't depend on the original being    */
  /* permanent!                                                         */
  if (!fEnter) return NULL;
  pNew = (SYMBOL *) malloc (sizeof(SYMBOL));
  pNameCopy = (char *) malloc (strlen(pName)+1);
  if ((pNew == NULL)  ||  (pNameCopy == NULL)) {
    fprintf(stderr,"%s - Unable to allocate memory.  Assembly aborted.\n", PALX);
    exit(EXIT_FAILURE);
  }
  memset(pNew, 0, sizeof(SYMBOL));  strcpy(pNameCopy, pName);
  pNew->pFirstRef = pNew->pLastRef = NULL;
  pNew->Name = pNameCopy;  pNew->Type = SF_UDF;
  return Symbols[nHash] = pNew;
}


/* AddReference */
/*   This routine will add another entry to the cross reference chain   */
/* for the symbol.  It's fairly simple, but a couple of subtle things   */
/* happen here - first, since we always process the source lines in     */
/* order (well, duh!) we don't need to sort the CREF chains _if_ we're  */
/* careful to always add new references to the end of the chain rather  */
/* than the beginning.  The SYMBOL structure keeps separate pointers to */
/* the beginning and end of the CREF chain for just that reason. Second,*/
/* it's possible for the same source line to reference the same symbol  */
/* more than once, but in that case we don't want duplicate entries in  */
/* the chain.  Since the list is in order, if the current source line   */
/* already added a reference to this symbol we know it will be the last */
/* one on the list, and we don't have to do an expensive search of the  */
/* entire CREF chain to find it. Finally, we accumulate cross reference */
/* data only under pass 2 - otherwise we'd have a whole set of complete */
/* duplicates from each pass!                                           */
void AddReference (SYMBOL *pSym, BOOLEAN fDefinition)
{
  CREF *pNew;
  if (nPass != 2) return;
  /* If we already have a reference to this line, then quit... */
  if ((pSym->pLastRef!=NULL) && (pSym->pLastRef->nLine==nSourceLine)) return;
  /* Create a new CREF block... */
  pNew = (CREF *) malloc(sizeof(CREF));
  if (pNew == NULL) {
    fprintf(stderr,"%s - Unable to allocate memory.  Assembly aborted.\n", PALX);
    exit(EXIT_FAILURE);
  }
  memset(pNew, 0, sizeof(CREF));
  pNew->nLine = nSourceLine;  pNew->fDefinition = fDefinition;
  /* Add it to the end of the chain... */
  if (pSym->pLastRef != NULL) {
    pSym->pLastRef->pNext = pNew;  pSym->pLastRef = pNew;
  } else {
    /* If there's no pLastRef, we know there must be no pFirstRef! */
    pSym->pFirstRef = pSym->pLastRef = pNew;
  }
}


/* AddTOC */                                
/*   We keep a table of contents (TOC), which is a simple list of every */
/* title string we find along with the listing page number where it     */
/*  occurs. After pass 2, the entire TOC is printed at the end of the   */
/* listing file.  It'd look better if it appeared at the beginning of   */
/* the listing, of course, but that would mean we'd have to accumulate  */
/* the TOC information on pass 1, and there's no convenient way to know */
/* the listing page numbers on that pass.  If you print the listing you */
/* can always physically move the TOC page back to the beginning!       */
void AddTOC (char *pTitle)
{
  TOC *pTOC;  char *pTitleCopy;

  /* Create a new TOC structure and fill out all the fields... */
  pTOC = (TOC *) malloc (sizeof(TOC));
  pTitleCopy = (char *) malloc (strlen(pTitle)+1);
  if ((pTOC == NULL)  ||  (pTitleCopy == NULL)) {
    fprintf(stderr,"%s - Unable to allocate memory.  Assembly aborted.\n", PALX);
    exit(EXIT_FAILURE);
  }
  memset(pTOC, 0, sizeof(TOC));  strcpy(pTitleCopy, pTitle);
  pTOC->pTitle = pTitleCopy;

  /*   The page number we put in the TOC is the current listing page,   */
  /* unless fNewPage is set.  That means we also found a form feed on   */
  /* this source line (which happens all the time with .TITLE!) and in  */
  /* that case this line will actually start the _next_ page...         */
  pTOC->nPage = fNewPage ? nListPages+1 : nListPages;

  /*   Link this entry into the TOC.  Since we want the listing to be   */
  /* sorted by page number, we have to always add new entries to the    */
  /* _end_ of the list rather than the beginning...                     */
  if (pLastTOC == NULL) {
    pTOC->pNext = NULL;  pFirstTOC = pLastTOC = pTOC;
  } else {
    pLastTOC->pNext = pTOC;  pLastTOC = pTOC;
  }
}


/* Forward declarations for all pseudo operations... */                                
void DotEND    (char *);
void DotORG    (char *);
void DotDATA   (char *);
void DotTITLE  (char *);
void DotASCIZ  (char *);
void DotTEXT   (char *);
void DotBLOCK  (char *);
void DotSIXBIT (char *);
void DotOPDEF  (char *);
void DotPAGE   (char *);
void DotFIELD  (char *);
void DotIM6100 (char *);
void DotHM6120 (char *);
void DotVECTOR (char *);
void DotSTACK  (char *);
void DotPUSH   (char *);
void DotPOP    (char *);
void DotPUSHJ  (char *);
void DotPOPJ   (char *);
void DotNOWARN (char *);


/* InitializeSymbols */
/*   This function is called once, at startup, to add all the built in  */
/* names to the symbol table, including both machine instructions and   */
/* pseudo operations.  We'd like these to be compiled into a static     */
/* table, of course, but with a hash table that's not easily done...    */
void InitializeSymbols (void)
{
  SYMBOL *pSym;  UINT i;
  for (i = 0;  i < HASHSIZE;  ++i)  Symbols[i] = NULL;

  /* These macros reduce the amount of typing... */
#define SYM(n,v,t)      \
  pSym = LookupSymbol(n, TRUE);  pSym->Type = t;  pSym->Value = v;
#define MRI(n,v)        SYM(n, v, OP_MRI)
#define OPR(n,v)        SYM(n, v, OP_OPR)
#define IOT(n,v)        SYM(n, v, OP_IOT)
#define PIE(n,v)        SYM(n, v, OP_PIE)
#define PIO(n,v)        SYM(n, v, OP_PIO)
#define CXF(n,v)        SYM(n, v, OP_CXF)
#define EQU(n,v)        SYM(n, v, SF_EQU)
#define POP(n,v)        SYM(n, (long) &v, PO_POP)

  /* PDP-8 memory reference instructions */
  MRI("AND",  00000);   MRI("TAD",  01000);   MRI("ISZ",  02000);
  MRI("DCA",  03000);   MRI("JMS",  04000);   MRI("JMP",  05000);

  /* PDP-8 operate instructions */
  OPR("NOP",  07000);   OPR("IAC",  07001);   OPR("RAL",  07004);
  OPR("RTL",  07006);   OPR("RAR",  07010);   OPR("RTR",  07012);
  OPR("BSW",  07002);   OPR("CML",  07020);   OPR("CMA",  07040);
  OPR("CIA",  07041);   OPR("CLL",  07100);   OPR("STL",  07120);
  OPR("CLA",  07200);   OPR("GLK",  07204);   OPR("STA",  07240);
  OPR("HLT",  07402);   OPR("OSR",  07404);   OPR("SKP",  07410);
  OPR("SNL",  07420);   OPR("SZL",  07430);   OPR("SZA",  07440);
  OPR("SNA",  07450);   OPR("SMA",  07500);   OPR("SPA",  07510);
  OPR("LAS",  07604);   OPR("MQL",  07421);   OPR("MQA",  07501);
  OPR("SWP",  07521);   OPR("CAM",  07621);   OPR("ACL",  07701);

  /* Standard PDP-8 memory extension instructions */
  CXF("CDF",  06201);   CXF("CIF",  06202);   CXF("CXF",  06203);
  IOT("RDF",  06214);   IOT("RIF",  06224);   IOT("RIB",  06234);
  IOT("RMF",  06244);

  /* Standard PDP-8 processor IOT instructions */
  IOT("SKON", 06000);  IOT("ION",  06001);  IOT("IOF",  06002);
  IOT("SRQ",  06003);  IOT("GTF",  06004);  IOT("RTF",  06005);
  IOT("SGT",  06006);  IOT("CAF",  06007);

  /* Pseudo operations... */
  POP(".END",    DotEND);     POP(".ORG",    DotORG);
  POP(".DATA",   DotDATA);    POP(".TITLE",  DotTITLE);
  POP(".ASCIZ",  DotASCIZ);   POP(".BLOCK",  DotBLOCK);
  POP(".SIXBIT", DotSIXBIT);  POP(".OPDEF",  DotOPDEF);
  POP(".PAGE",   DotPAGE);    POP(".FIELD",  DotFIELD);
  POP(".IM6100", DotIM6100);  POP(".HM6120", DotHM6120);
  POP(".VECTOR", DotVECTOR);  POP(".STACK",  DotSTACK);
  POP(".PUSH",   DotPUSH);    POP(".POP",    DotPOP);
  POP(".PUSHJ",  DotPUSHJ);   POP(".POPJ",   DotPOPJ);
  POP(".TEXT",   DotTEXT);    POP(".NOWARN", DotNOWARN);
}


/* IntersilMnemonics */
/*   This routine will load the extra symbols used in the Intersil      */
/* manuals for the IM6100, IM6101, IM6102 and IM6103 parts...           */
void IntersilMnemonics (void)
{
  SYMBOL *pSym;

  /* IM6101 Peripheral Interface Element (PIE) instructions */
  PIE("READ1", 06000);  PIE("READ2", 06010);  PIE("WRITE1",06001);
  PIE("WRITE2",06011);  PIE("SKIP1", 06002);  PIE("SKIP2", 06003);
  PIE("SKIP3", 06012);  PIE("SKIP4", 06013);  PIE("RCRA",  06004);
  PIE("WCRA",  06005);  PIE("WCRB",  06015);  PIE("WVR",   06014);
  PIE("SFLAG1",06006);  PIE("SFLAG3",06016);  PIE("CFLAG1",06007);
  PIE("CFLAG3",06017);

  /* IM6103 Parallel I/O (PIO) instructions */
  PIO("SETPA", 06300);  PIO("CLRPA", 06301);  PIO("WPA",   06302);
  PIO("RPA",   06303);  PIO("SETPB", 06304);  PIO("CLRPB", 06305);
  PIO("WPB",   06306);  PIO("RPB",   06307);  PIO("SETPC", 06310);
  PIO("CLRPC", 06311);  PIO("WPC",   06312);  PIO("RPC",   06313);
  PIO("SKPOR", 06314);  PIO("SKPIR", 06315);  PIO("WSR",   06316);
  PIO("RSR",   06317);

  /* IM6102 Memory Extension, DMA and clock (MEDIC) instructions */
  IOT("LIF",  06254);
  IOT("CLZE", 06130);  IOT("CLSK", 06131);  IOT("CLOE", 06132);
  IOT("CLAB", 06133);  IOT("CLEN", 06134);  IOT("CLSA", 06135);
  IOT("CLBA", 06136);  IOT("CLCA", 06137);   
  IOT("LCAR", 06205);  IOT("RCAR", 06215);  IOT("LWCR", 06225);
  CXF("LEAR", 06206);  IOT("REAR", 06235);  IOT("LFSR", 06245);
  IOT("RFSR", 06255);  IOT("WRVR", 06275);  IOT("SKOF", 06265);   
}


/* HarrisMnemonics */
/*   Like IntersilMnemonics(), this routine will load the special names */
/* used by Harris in the 6120 documentation.  The other member of the   */
/* Harris family, the 6121, didn't have any special mnemonics!          */
void HarrisMnemonics (void)
{
  SYMBOL *pSym;

  /* HM6120 "Extra" instructions */
  OPR("R3L",  07014);  IOT("WSR",  06246);  IOT("GCF",  06256);
  IOT("PR0",  06206);  IOT("PR1",  06216);  IOT("PR2",  06226);
  IOT("PR3",  06236);  IOT("PRS",  06000);  IOT("PGO",  06003);
  IOT("PEX",  06004);  IOT("CPD",  06266);  IOT("SPD",  06276);

  /* HM6120 stack (Yes - a PDP-8 with a stack!) instructions */
  IOT("PPC1", 06205);  IOT("PPC2", 06245);  IOT("PAC1", 06215);
  IOT("PAC2", 06255);  IOT("RTN1", 06225);  IOT("RTN2", 06265);
  IOT("POP1", 06235);  IOT("POP2", 06275);  IOT("RSP1", 06207);
  IOT("RSP2", 06227);  IOT("LSP1", 06217);  IOT("LSP2", 06237);

  /*   These flags are returned by the 6120 after a PRS instruction.    */
  /* They aren't really opcodes, but these mnemonics do appear in the   */
  /* Harris databooks, so I guess we'll define them!                    */
  /*EQU("BTSTRP", 04000);  EQU("PNLTRP", 02000);*/
  /*EQU("PWRON",  00400);  EQU("HLTFLG", 00200);*/
}


/* CompareSymbols - compare two symbols for sorting */
int CompareSymbols (const void *p1, const void *p2)
{
  const SYMBOL *s1 = *((SYMBOL **) p1);
  const SYMBOL *s2 = *((SYMBOL **) p2);
  if ((s1 == NULL) && (s2 == NULL)) return  0;
  if ((s1 == NULL) && (s2 != NULL)) return  1;
  if ((s1 != NULL) && (s2 == NULL)) return -1;
  return strcmp((s1)->Name, (s2)->Name);
}


/* SortSymbols */
/*   This function will sort the symbol table (using the qsort() from   */
/* the C RTL).  Since symbol table entries are normally placed based    */
/* on hash codes, this routine ruins that and LookupSymbol() will no    */
/* longer function after it is used.   SortSymbols() is called only     */
/* after assembly is completed and just before listing the symbols.     */
void SortSymbols (void)
{
  qsort(&Symbols, HASHSIZE, sizeof(SYMBOL *), &CompareSymbols);
}



/************************************************************************/
/***********           F i l e   O p e r a t i o n s           **********/
/************************************************************************/

#define USE_FTIME	// Use the file mtime instead of the current date.
#ifdef USE_FTIME
#include <sys/stat.h>
#define time(p) (fstat(fileno(pSourceFile), &statbuf), *p = statbuf.st_mtime)
struct stat statbuf;
#endif
/* GetSystemDate - return the system date in the format "dd-mmm-yy" ... */
void GetSystemDate (char *pText)
{
  time_t tTime;  struct tm *pTM;
  char *szMonths[] = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN",
                      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
  time(&tTime);  pTM = localtime(&tTime);
  sprintf(pText, "%02d-%3s-%02d",
    pTM->tm_mday, szMonths[pTM->tm_mon], (pTM->tm_year % 100));
}


/* GetSystemTime - return the system time in the format "hh:mm:ss" ...  */
void GetSystemTime (char *pText)
{
  time_t tTime;  struct tm *pTM;
  time(&tTime);  pTM = localtime(&tTime);
  sprintf(pText, "%02d:%02d:%02d", pTM->tm_hour, pTM->tm_min, pTM->tm_sec);
}


/* Flag */
/*   Errors in the source file are handled in a fairly trivial way -    */
/* lines which have errors will show one or more error characters next  */
/* to the line number in the listing file.  These error characters are  */
/* single character mnemonics for the type of error (e.g. "U" for an    */
/* undefined symbol, "X" for a syntax error, etc).  It's fairly simple  */
/* minded, but this is the traditional way of handling errors in PDP    */
/* assemblers!                                                          */
/*                                                                      */
/*   A list of the error characters for the current source line is kept */
/* in szErrorFlags, and this routine will add a new error to the list.  */
/* The error flags are then dumped to the listing file via List() and   */
/* reset to a null string for the next time around.                     */
/*                                                                      */
/*   The user may specify, via the .NOWARN pseudo-op, a list of one or  */
/* more error codes that are to be ignored. If the error being reported */
/* is one of those then we just forget it, but it's the user's job to   */
/* ensure that the correct code is being generated!                     */
BOOLEAN Flag (char ch)
{
  UINT nLen = strlen(szErrorFlags);

  /* If this is one of the errors to be ignored, then so be it... */
  if (strchr(szIgnoredErrors, ch) != NULL) return FALSE;
    
  /* If this character is already in the flags, then don't add it twice! */
  if (strchr(szErrorFlags, ch) != NULL) return FALSE;  
  
  /* Otherwise, add this one to the list... */
  if (nLen < sizeof(szErrorFlags)-1) {
    szErrorFlags[nLen] = ch;  szErrorFlags[nLen+1] = EOS;
  }

  /* Count the total number of errors in this file */
  ++nErrorCount;
  
  /*   This function always returns FALSE, which makes it convenient to */
  /* say things like "return Fail(ER_SYN)" elsewhere in this code.  The */
  /* return value of this function has no other significance...         */
  return FALSE;
}


/* NewPage */
/*   This routine starts a new page in the listing file and prints the  */
/* pretty header for it...                                              */
void NewPage (void)
{
  STRING szDate, szTime;
  /* Get a timestamp for the listing... */
  GetSystemDate(szDate);  GetSystemTime(szTime);
  /* Start a new page and print our name and the page number... */
  if (nListPages > 0)  fprintf(pListFile, "\f");
  fprintf(pListFile, "\n%s - %s V%d.%02d RLA %30s%10s%7s%4d\n",
    PALX, TITLE, (VERSION/100), (VERSION % 100),
    szDate, szTime, "Page", ++nListPages);
  /* Print the second line with the file name and program title... */
  fprintf(pListFile, "%-60s%40s\n", szProgramTitle, szSourceFile);
  /* A few blank lines and we're ready... */
  fprintf(pListFile, "\n\n");  nLinesThisPage = 1;
  fNewPage = FALSE;
}


/* ListLine */
/*   All output to the listing file, with the exception of the new page */
/* header and the symbol table dump, is done by this routine to give    */
/* everything consistent formatting.  This routine prints a line number */
/* the error characters, if any, and then an address field, a generated */
/* code file, and a source text field.  Any or all of the last four     */
/* items may be omitted when appropriate (e.g. lines which contain only */
/* comments show only the source text but no address or code)...        */
void ListLine (FILE *hList, UINT *pField, UINT *pAddress, UINT *pCode, BOOLEAN fSource)
{
  /*   Print the error characters and, if we will be showing the source */
  /* text, the source line number as well...                            */
  if (fSource)
    fprintf(hList, "%4d%-4s", nSourceLine, szErrorFlags);
  else
    fprintf(hList, "    %-4s", szErrorFlags);
    
  /* Print the address field (in octal), if needed... */
  if ((pField != NULL) && (pAddress != NULL))
    fprintf(hList, "%01o%04o", *pField, *pAddress);
  else
    fprintf(hList, "     ");
  fprintf(hList, "    ");

  /* And print the generated code (also in octal).... */
  if (pCode != NULL)
    fprintf(hList, "%04o", *pCode);
  else
    fprintf(hList, "    ");

  /*   And finally print the source text, if it exists.  Note that if   */
  /* do print the source text, we don't print a newline since there's   */
  /* already one at the end of the source line!                         */
  if (fSource) {
    fprintf(hList, "\t");  fputs(szSourceText, hList);
  } else
    fprintf(hList, "\n");
}


/* List */
/*   This function has the same parameters as ListLine(), however this  */
/* one will print the line both to the listing file and, if this line   */
/* contains any errors, to stderr.  After printing it always clears the */
/* error flags...                                                       */
void List (UINT *pField, UINT *pAddress, UINT *pCode, BOOLEAN fSource)
{
  if ((++nLinesThisPage > LINES_PER_PAGE) || fNewPage)  NewPage();
  ListLine(pListFile, pField, pAddress, pCode, fSource);
  if (strlen(szErrorFlags) > 0)
    ListLine(stderr, pField, pAddress, pCode, fSource);
  szErrorFlags[0] = EOS;
}


/* ListSummary */
/*   This function will write a summary of the program size and the     */
/* total error count to both the listing file and to stderr...          */
void ListSummary (void)
{
  /* See if there's enough room on this page for the summary... */
  nLinesThisPage += 5;
  if (nLinesThisPage > LINES_PER_PAGE)  NewPage();
  fprintf(pListFile, "\n\n\n");

  /* Print the program break message to the listing and stderr... */
  fprintf(pListFile, "%s - Program break is %05o\n", PALX, (nField<<12) + nPC);
  fprintf(stderr,    "%s - Program break is %05o\n", PALX, (nField<<12) + nPC);

  /* Now summarize the number of errors found... */
  if (nErrorCount > 0) {
    fprintf(pListFile, "%s - %d errors detected\n", PALX, nErrorCount);
    fprintf(stderr,    "%s - %d errors detected\n", PALX, nErrorCount);
  } else {
    fprintf(pListFile, "%s - No errors detected\n", PALX);
    fprintf(stderr,    "%s - No errors detected\n", PALX);
  }
}


/* ListSymbols */
/*   This routine dumps the symbol table along with the cross reference */
/* information to the listing file.  Each symbol is listed, one per     */
/* line, with its value and a list of the source lines that refer to    */
/* it.  In the cross reference, the source line that defines a symbol   */
/* is indicated by an asterisk.  Undefined symbols and multiply defined */
/* symbols are also listed and shown as such.  Built in symbols, such   */
/* as machine ops and pseudo ops, are also listed _if_ they are used at */
/* least once in the source.  Even though the values of these symbols   */
/* aren't exciting, the cross reference information can be useful. Note */
/* that this routine does NOT sort the symbol table - you'll probably   */
/* want to do that, by calling SortSymbols(), first.                    */
void ListSymbols (void)
{
  UINT nSymbol, nCREF;  SYMBOL *pSym;  CREF *pCREF;
  strcpy(szProgramTitle, "Symbol Table");  NewPage();  AddTOC(szProgramTitle);

  for (nSymbol = 0;  nSymbol < HASHSIZE;  ++nSymbol) {
    if ((pSym = Symbols[nSymbol]) == NULL) continue;
    
    /* Print the symbol's type and value... */
    switch (pSym->Type) {
      /* User defined symbols... */
      case SF_UDF:
        fprintf(pListFile, "%-10s -UDF-    ", pSym->Name);
        break;
      case SF_MDF:
        fprintf(pListFile, "%-10s -MDF-    ", pSym->Name);
        break;
      case SF_TAG:
        fprintf(pListFile, "%-10s %05o    ", pSym->Name, (UINT) pSym->Value);
        break;
    
      /* Built in symbols... */
      case OP_MRI:  case OP_OPR:  case OP_IOT:  case OP_PIE:
      case OP_PIO:  case OP_CXF:  case SF_EQU:  case SF_OPDEF:
        if (pSym->pFirstRef == NULL) continue;
        fprintf(pListFile, "%-10s  %04o    ", pSym->Name, (UINT) pSym->Value);
        break;
      case PO_POP:
        if (pSym->pFirstRef == NULL) continue;
        fprintf(pListFile, "%-10s -POP-    ", pSym->Name);
        break;

        /* All other symbol types (are there any others?) are suppressed... */
      default:
        continue;
    }
    
    /* Now display the cross reference chain for this symbol... */
    for (pCREF=pSym->pFirstRef, nCREF=0;  pCREF!=NULL;  pCREF=pCREF->pNext) {
      if ((++nCREF % 8) == 0) {
        fprintf(pListFile, "\n");
        if (++nLinesThisPage > LINES_PER_PAGE)  NewPage();
        fprintf(pListFile, "                    ");
      }
      fprintf(pListFile, "%6d%c", pCREF->nLine, (pCREF->fDefinition ? '*' : ' '));
    }

    /* Finish this line and we're done... */
    fprintf(pListFile, "\n");
    if (++nLinesThisPage > LINES_PER_PAGE)  NewPage();
    
  }
}


/* FlushBinary */
/*   This procedure will write the current contents of the binary file  */
/* buffer to the file. Don't forget to call it before closing the file! */
void FlushBinary (void)
{
  int nCount;
  nCount = _write(fdBinaryFile, abBinaryData, cbBinaryData);
  if ((UINT) nCount != cbBinaryData) {
    fprintf(stderr, "Error writing binary file. Assembly aborted.\n");
    exit(EXIT_FAILURE);
  }
  cbBinaryData = 0;
}


/* PutBinary */
/*   This procedure will write one byte to the binary file.  As a side  */
/* effect, it also accumulates a checksum of the bytes punched...       */
void PutBinary (UCHAR nByte)
{
  if (cbBinaryData >= sizeof(abBinaryData))  FlushBinary();
  abBinaryData[cbBinaryData++] = nByte;
  /*   Note: Leader/trailer bytes (0200) and field setting bytes (03xx) */
  /* are _not_ included in the checksum!!!                              */
  if ((nByte & 0200) == 0)  nBinaryChecksum += nByte;
}


/* PunchLeader - punch leader/trailer frames on binary "tape"...        */
void PunchLeader (void)
{
  UINT i;
  for (i = 0;  i < 32;  ++i)  PutBinary(0200);
}


/* PunchField - punch a field change frame to the binary "tape"...      */
void PunchField (UINT nField)
{
  PutBinary((UCHAR) (0300 | (nField << 3)));
}


/* Punch */
/*   This function will write a word to the binary file.  This file is  */
/* kept in standard PDP-8 BIN loader format, which lets us store 12 bit */
/* words, address, and field information, in 8 bit bytes.               */
void Punch (UINT nAddress, UINT nCode)
{
  if (nAddress != (nLastBinaryAddress+1)) {
    PutBinary((UCHAR) (((nAddress >> 6) & 077) | 0100));
    PutBinary((UCHAR) (nAddress & 077));
  }
  nLastBinaryAddress = nAddress;
  PutBinary((UCHAR) ((nCode >> 6) & 077));
  PutBinary((UCHAR) (nCode & 077));
}


/* PunchChecksum - writes the current checksum to the binary file...    */
void PunchChecksum (void)
{
  UINT nSum = nBinaryChecksum & 07777;
  PutBinary((UCHAR) (nSum >> 6));
  PutBinary((UCHAR) (nSum & 077));
  PunchLeader();  FlushBinary();
}


/* MarkBitMap */
/*   We keep a map, one bit per PDP-8 word, of all the words in the     */
/* 32KW PDP-8 memory space.  Every time a word is filled by assembled   */
/* code, we mark that location by setting its bit and at the end of the */
/* assembly we can print a nice map of all the free memory locations.   */
void MarkBitMap (UINT nField, UINT nAddress)
{
  UINT  nIndex = ((nField << 12) | nAddress) / 8;
  UCHAR nMask = (UCHAR) (1 << (nAddress & 7));
  abBitMap[nIndex] |= nMask;
}


#ifdef UNUSED
/* CheckBitMap */
/*   This routine tests the memory bitmap entry for a specific location */
/* and returns TRUE if that location is marked as "in use" already...   */
BOOLEAN CheckBitMap (UINT nField, UINT nAddress)
{
  UINT  nIndex = ((nField << 12) | nAddress) / 8;
  UCHAR nMask = (UCHAR) (1 << (nAddress & 7));
  return (abBitMap[nIndex] & nMask) != 0;
}
#endif


/* ClearBitMap */
/*   This clears all the bits in the memory map.  It's normally called  */
/* only once, at the very beginning of the assembly...                  */
void ClearBitMap (void)
{
  memset(abBitMap, 0, sizeof(abBitMap));
}


/* CountBitMapEmpty */
/*   This routine will count and return the number of empty words in    */
/* the bitmap starting from nStart.  Note that this doesn't count the   */
/* exact number of words - it rounds off to the nearest multiple of 8   */
/* so it can count whole bytes!                                         */
UINT CountBitMapEmpty (UINT nStart)
{
  UINT nCount = 0;  nStart = nStart / 8;
  while (   ((nStart+nCount) < sizeof(abBitMap))
         && (abBitMap[nStart+nCount] == 0))
    ++nCount;
  return nCount*8;
}


/* ListBitMapLine */
/*   This routine writes one line of the memory map to the listing      */
/* file.  A line contains 64 bits corresponding to one half of a PDP-8  */
/* memory page.  A bit is a one if the word is used, and zero if it is  */
/* free.                                                                */
void ListBitMapLine (UINT nStart)
{
  UINT nWord, i;
  fprintf(pListFile, "%05o/", nStart);
  /* Each byte contains eight bits, for eight PDP-8 words... */
  for (nWord = 0;  nWord < 64;  nWord += 8) {
    UCHAR b = abBitMap[(nStart+nWord)/8];
    fprintf(pListFile, " ");
    /* Unfortunately there's no "%b", we we have to do it the hard way! */
    for (i = 0;  i < 8;  ++i) {
      fprintf(pListFile, "%1d", b & 1);  b >>= 1;
    }
  }
  fprintf(pListFile, "\n");
}


/* ListBitMap */
/*   This routine dumps the memory bitmap to the listing file in a      */
/* format that's familiar to anyone who has ever used the OS/8 BITMAP   */
/* utility.  Note that it displays the bitmap only for memory fields    */
/* that have at least one word actually used.                           */
void ListBitMap (void)
{
  UINT nField, nPage;
  strcpy(szProgramTitle, "Memory Map");
  fNewPage = TRUE;  AddTOC(szProgramTitle);

  for (nField = 0;  nField < 8;  ++nField) {
    /* If this whole field is unused, then just skip it completely... */
    if (CountBitMapEmpty(nField<<12) >= 4096) continue;
    /*   At least one page in this field is used, so we'll print all of */
    /* them.  Each page takes two lines at 64 words per line, and we    */
    /* add a blank line in between, so a complete field takes two pages */
    /* in the listing.                                                  */
    for (nPage = 0;  nPage < 32;  ++nPage) {
      if ((nPage == 0) || (nPage == 16))  NewPage();
      ListBitMapLine((nField<<12) | (nPage<<7));
      ListBitMapLine((nField<<12) | (nPage<<7) | 64);
      fprintf(pListFile, "\n");
    }
  }

  fprintf(pListFile, "\n");
}


/* ListTOC */
/*   This routine dumps the table of contents to the listing file. It's */
/* pretty simple, even though it does go to a little extra effort to    */
/* make the output pretty...                                            */
void ListTOC (void)
{
  TOC *pTOC;    char szBuffer[80];
  /*   We always start the TOC listing on an odd numbered page.  That   */
  /* way, if the listing is printed on double sided paper, the TOC will */
  /* be on an upward facing page.                                       */
  if ((nListPages & 1) != 0)
    {strcpy(szProgramTitle, "");  NewPage();}
  strcpy(szProgramTitle, "Table of Contents");  NewPage();
  for (pTOC = pFirstTOC;  pTOC != NULL;  pTOC = pTOC->pNext) {
    strcpy(szBuffer, pTOC->pTitle);
    if ((strlen(szBuffer) & 1) != 0) strcat(szBuffer, " ");
    while (strlen(szBuffer) < 64) strcat(szBuffer, " .");
    if (++nLinesThisPage > LINES_PER_PAGE)  NewPage();
    fprintf(pListFile, "\t%s%4d\n", szBuffer, pTOC->nPage);
  }
}



/************************************************************************/
/***********  S i m p l e   L e x i c a l   F u n c t i o n s  **********/
/************************************************************************/


/* iseol - return TRUE at the end of the parseable line... */
#define iseol(c)        (((c) == ';')  ||  ((c) == '\n')  ||  ((c) == EOS))

/* isid1 - return TRUE if c is a legal start-of-identifier character... */
#define isid1(c)        (isalpha(c) || ((c)=='%') || ((c)=='$') || ((c)=='_'))

/* isid2 - return TRUE if c is a legal identifier character... */
#define isid2(c)        (isid1(c) || isdigit(c) || ((c)=='.'))


/* SpanWhite - skip over any white space characters on the line... */
char SpanWhite (char **pText)
{
  /* In this program, newline is not a white space!! */
  while (isspace(**pText)  &&  (**pText != '\n')) ++*pText;
  return **pText;
}


/* ScanName */
/*   This function will scan any string of alphanumeric characters from */
/* the source line and return in in pName. If the string is longer than */
/* allowed by nMax, then only the first nMax-1 (to allow for a EOS) are */
/* actually returned in pName, _however_ they will all be scanned and   */
/* skipped.  Note that the first character of the identifier must be    */
/* alphabetic (i.e. not a digit).  If this routine can't find at least  */
/* one alphabetic character then it will return FALSE and a null name.  */
BOOLEAN ScanName (char **pText, char *pName, UINT Max)
{
  SpanWhite(pText);  *pName = EOS;
  if (!isid1(**pText)) return FALSE;
  while (isid2(**pText)) {
    if (Max > 1)  {
      *pName++ = CAP(**pText);  --Max;
    }
    ++*pText;
  }
  *pName = EOS;
  return TRUE;
}


/* ScanNumber */
/*   This routine scans a number from the input line. and the number    */
/* may be in either the decimal or octal radixes, as indicated by a '.' */
/* or  'd'  suffix for decimal, or 'b' for octal.  If no radix is given */
/* then the octal radix will be used.  This procedure will return FALSE */
/* if the number is illegal for some reason (e.g. '8' or '9' in octal   */
/* number or if not even one digit can be found).                       */
BOOLEAN ScanNumber (char **pText, UINT *pValue)
{
  BOOLEAN fDecimal, fNull;
  UINT nOctal, nDecimal;

  /* initialize everything... */
  SpanWhite(pText);
  nOctal = nDecimal = 0;  fDecimal = FALSE;  fNull = TRUE;

  /* scan all the digits in the number...*/
  while (isdigit(**pText)) {
    nDecimal = (nDecimal*10) + (**pText-'0');
    nOctal   = (nOctal<<3) | (**pText-'0');
    if (**pText > '7')  fDecimal = TRUE;
    fNull = FALSE;  ++*pText;
  }
  
  /* is there a radix suffix ?? */
  if (fNull) return Flag(ER_IFN);
  if (CAP(**pText) == 'B') {
    /* B for Octal ????? */
    if (fDecimal) return Flag(ER_IFN);
    *pValue = nOctal;  ++*pText;
  } else if ((CAP(**pText) == 'D')  ||  (**pText == '.')) {
    *pValue = nDecimal;  ++*pText;
  } else
    *pValue = fDecimal ? nDecimal : nOctal;
    
  return TRUE;    
}



/************************************************************************/
/***********       E x p r e s s i o n    S c a n n e r        **********/
/************************************************************************/


/* Forward references... */
BOOLEAN EvaluateExpression (char **pText, UINT *pValue);
BOOLEAN EvaluateOpcode (char **pText, SYMBOL *pOP, UINT *pValue);


/* EvaluateSymbol */
/*   This function is used by the expression scanner to evaluate the    */
/* value of any symbol that it finds.  The symbol might be something    */
/* simple like a user defined label or equate, it might be an opcode    */
/* (e.g. "TAD xyz"), or it might be something undefined or illegal. One */
/* way or another, this routine will compute a value for the symbol and */
/* return it.  This function returns TRUE for success and FALSE for any */
/* error...                                                             */
BOOLEAN EvaluateSymbol (char **pText, char *pName, UINT *pValue)
{
  SYMBOL *pSym = LookupSymbol(pName, TRUE);
  /* Under pass 2, add a cross reference entry for this symbol... */
  AddReference(pSym, FALSE);

  switch (pSym->Type) {

    /*   Labels return a 12 bit address, minus the field information,   */
    /* but if the field of the symbol does not match the current field, */
    /* give an "off field" warning.                                     */
    case SF_TAG:
      if (((((UINT) pSym->Value) >> 12) & 7) != nField)  Flag(ER_OFF);
      *pValue = ((UINT) pSym->Value) & 07777;  return TRUE;
      
    /* Equated symbols return their value, as-is... */
    case SF_EQU:
      *pValue = (UINT) pSym->Value;  return TRUE;
      
    /* Opcodes evaluate their operand and return a complete instruction... */
    case SF_OPDEF:
    case OP_MRI:
    case OP_OPR:
    case OP_IOT:
    case OP_PIE:
    case OP_PIO:
    case OP_CXF:
      return EvaluateOpcode (pText, pSym, pValue);
      
    /* Undefined and multiply defined symbols flag errors... */
    case SF_UDF:
      *pValue = 0;  Flag(ER_UDF);  return FALSE;
    case SF_MDF:
      *pValue = 0;  Flag(ER_MDF);  return FALSE;
    
    /* Any other symbol type is bad news... */
    default:
      *pValue = 0;  Flag(ER_SYM);  return FALSE;
  }
}


/* EvaluateLiteral */
/*   This function is invoked whenever the expression scanner finds a   */
/* literal value (i.e. "[...]").  This routine skips over the opening   */
/* left bracket (we know it's there!), evaluates the expression, enters */
/* it into the literal table, and then returns the address of that      */
/* entry (which is the actual value of the literal!).                   */
BOOLEAN EvaluateLiteral (char **pText, UINT *pValue)
{
  UINT nValue, nLoc, i;

  /* Skip the '[', evaluate the expression, and the match the ']'... */
  assert(**pText == '[');  ++*pText;  *pValue = 0;
  if (!EvaluateExpression(pText, &nValue)) return Flag(ER_SYN);
  if (**pText != ']') return Flag(ER_SYN);
  ++*pText;


  /*   See if this value is already in the literal table.  If it is,    */
  /* then we can reuse the existing entry...                            */
  for (nLoc = nLiteralBase;  (i = nLoc & 0177) != 0;  ++nLoc) {
    if (nValue == anLiteralData[i]) {
      *pValue = nLoc;  return TRUE;
    }
  }

  /*   Otherwise enter this data into the literal pool and return its   */
  /* address.  Be sure that the literals don't overrun the code already */
  /* generated on this page!                                            */
  if (nLiteralBase <= nPC+1)
    return Flag(ER_PAF);
  else {
    --nLiteralBase;  *pValue = nLiteralBase;
    anLiteralData[nLiteralBase & 0177] = nValue;
    return TRUE;
  }
}


/* EvaluateString */
/*   This routine gets called when the expression scanner finds a quote */
/* mark.  It will grab the next character, return its ASCII value (no   */
/* big trick there!), and then check the next character for the closing */
/* quote mark.  If no closing quote is found then it flags an error and */
/* returns FALSE....                                                    */
BOOLEAN EvaluateString (char **pText, UINT *pValue)
{
  assert(**pText == '\"');  ++*pText;
  *pValue = (UINT) **pText;  ++*pText;
  if (**pText != '\"') return Flag(ER_SYN);
  ++*pText;
  return TRUE;
}


/* EvaluateOperand */
/*   This routine gets called by the expression scanner to evaluate     */
/* any form of arithmetic operand.  It looks at the next non-space      */
/* character to figure out what the operand might be - a number, a      */
/* quoted string, a symbol, etc... It returns TRUE and the value of the */
/* operand if all is well, and FALSE if there's a problem.  In the      */
/* latter case an error code will have already been added via Flag().   */
BOOLEAN EvaluateOperand (char **pText, UINT *pValue)
{
  BOOLEAN fNegative=FALSE;  IDENTIFIER szName;
  *pValue = 0;

  /* is this a leading sign (+ or -) ??? */
  if ((SpanWhite(pText) == '+')  ||  (**pText == '-')) {
    fNegative = **pText == '-';
    ++*pText;  SpanWhite(pText);
  }

  if ((**pText == '*')  ||  (**pText == '.')) {
    /* return the current location */
    *pValue = nPC;  ++*pText;
  } else if (**pText == '[') {
    /* literal expression */
    if (!EvaluateLiteral(pText, pValue)) return FALSE;
  } else if (**pText == '\"') {
    /* quoted string */
    if (!EvaluateString(pText, pValue)) return FALSE;
  } else if (isdigit(**pText)) {
    /* a number */
    if (!ScanNumber(pText, pValue)) return FALSE;
  } else if (isid1(**pText)) {
    /* an identifier */
    ScanName(pText, szName, sizeof(szName));
    if (!EvaluateSymbol(pText, szName, pValue)) return FALSE;
  } else {
    /* otherwise this must be an error... */
    Flag(ER_SYN);  return FALSE;
  }
  
  /* Be sure to apply the sign to the number.. */
  if (fNegative) *pValue = (4096-*pValue) & 07777;
  return TRUE;
}


/* EvaluateExpression */
/*   This routine puts all those above ones together to scan a complete */
/* arithmetic expression. This scanner will stop on the first character */
/* that it can't interpret as an operator - in a normally formed expr-  */
/* ession this might be a ']', a ')', or the end of the line.  If any   */
/* errors are found it will return FALSE and flag the appropriate error */
/* character to the listing...                                          */
BOOLEAN EvaluateExpression (char **pText, UINT *pValue)
{
  UINT nOpnd;  char chOP;

  /* We always start out with an operand... */
  *pValue = 0;
  if (!EvaluateOperand(pText, pValue)) return FALSE;

  while (TRUE) {
  
    /*   The next non-blank character must be an operator, so if it's   */
    /* not one we recognize (and currently we recognize only + and - !) */
    /* then this is as far as we can parse...                           */
    chOP = SpanWhite(pText);
    if (    (chOP != '-')  &&  (chOP != '+')
         && (chOP != '&')  &&  (chOP != '|')) return TRUE;
    ++*pText;

    /*   If it's a legal operator, then evaluate the operand and */
    /* calculate the result...                                   */
    if (!EvaluateOperand(pText, &nOpnd)) return FALSE;
    switch (chOP) {
      case '+':  *pValue = (*pValue +       nOpnd)  & 07777;    break;
      case '-':  *pValue = (*pValue + (4096-nOpnd)) & 07777;    break;
      case '&':  *pValue = (*pValue & nOpnd) & 07777;  break;
      case '|':  *pValue = (*pValue | nOpnd) & 07777;  break;
    }

  }  
}


/* EvaluateMRI */
/*   This routine will parse an MRI (memory reference) instruction and  */
/* compute the final opcode.  It handles the indirect addressing flag   */
/* (@), scans the operand to determine its address, and decides whether */
/* current page or zero page addressing is appropriate...               */
BOOLEAN EvaluateMRI (char **pText, SYMBOL *pMRI, UINT *pValue)
{
  UINT nAddress;
  *pValue = (UINT) pMRI->Value;
  
  if (SpanWhite(pText) == '@') {
    /* Indirect addressing... */
    *pValue |= 0400;  ++*pText;
  }

  /* Evaluate the operand and figure out the addressing mode... */
  if (!EvaluateExpression(pText, &nAddress)) return FALSE;
  if ((nAddress & 07600) == 0) {
    /* Page zero addressing ... */
    *pValue |= nAddress;
  } else if ((nAddress & 07600) == (nPC & 07600)) {
    /* Current page addressing ... */
    *pValue |= 0200 | (nAddress & 0177);
  } else
    return Flag(ER_SCT);
    
  return TRUE;
}


/* OPRGroup - return the group (1, 2 or 3) of an operate micro instruction */
UINT OPRGroup (UINT nOpcode)
{
  if ((nOpcode & 07400) == 07000) return 1;
  if ((nOpcode & 07401) == 07400) return 2;
  if ((nOpcode & 07401) == 07401) return 3;
  return 0;
}


/* EvaluateOPR */
/*   This routine will parse an operate microinstruction and return its */
/* final value.  Operate instructions can be combined on the same line  */
/* by simply writing them with spaces in between (e.g. "CLA CLL CML" or */
/* "SPA SNA"), and because of that this function just keeps reading and */
/* parsing names from the source line until it finds some special       */
/* character, such as EOS, ']', ';', etc...                             */
BOOLEAN EvaluateOPR (char **pText, SYMBOL *pOPR, UINT *pValue)
{
  IDENTIFIER szName;

  *pValue = (UINT) pOPR->Value;
  while (TRUE) {
    if (!ScanName(pText, szName, sizeof(szName))) return TRUE;
    pOPR = LookupSymbol(szName, TRUE);  AddReference(pOPR, FALSE);
    if (pOPR->Type != OP_OPR) return Flag(ER_MIC);
    /*   Check for a combination of operate instructions from different */
    /* groups and flag an error. The CLA instruction is a special case, */
    /* since it exists in all three groups (and hence can be combined   */
    /* with anything).  The symbol table, however, contains only the    */
    /* group 1 version (opcode 7200) of CLA.                            */
    if (    (*pValue != 07200) && (((UINT) pOPR->Value) != 07200)
         && (OPRGroup(*pValue) != OPRGroup((UINT) pOPR->Value))) Flag(ER_MIC);
    *pValue |= pOPR->Value;
  }
}


/* EvaluateCXF */
/*   This routine parses change field instructions (e.g. CIF, CDF, or   */
/* both). The argument is just the new field number, however PALX       */
/* differs from PAL8 in how it is handled.  In PALX the field number is */
/* from 0 to 7 and we'll position it correctly in the instruction, but  */
/* in PAL8 the field number is simply OR'ed with the instruction so it  */
/* must be multiplied by 8 (e.g. 10, 20, 30, etc. in octal).            */
BOOLEAN EvaluateCXF (char **pText, SYMBOL *pCXF, UINT *pValue)
{
  UINT nField;
  if (!EvaluateExpression(pText, &nField)) return FALSE;
  if (nField > 7)  return Flag(ER_RAN);
  *pValue = ((UINT) pCXF->Value) | (nField << 3);
  return TRUE;
}


/* EvaluateEIO (PIE/PIO) */
/*   This function evaluates the IM6101 (PIE) and IM6103 (PIO)          */
/* instructions.  These take an argument which is the select address    */
/* for the chip, and this address must be shifted over and positioned   */
/* correctly in the opcode...                                           */
BOOLEAN EvaluateEIO (char **pText, SYMBOL *pEIO, UINT *pValue)
{
  UINT nAddress;
  if (!EvaluateExpression(pText, &nAddress)) return FALSE;
  if (pEIO->Type == OP_PIE) {
    if ((nAddress == 0)  ||  (nAddress > 31)) return Flag(ER_RAN);
    *pValue = ((UINT) pEIO->Value) | (nAddress << 4);
  } else if (pEIO->Type == OP_PIO) {
    if ((nAddress == 0)  ||  (nAddress > 3)) return Flag(ER_RAN);
    *pValue = ((UINT) pEIO->Value) | (nAddress << 4);
  }
  return TRUE;
}


/* EvaluateOpcode */
/*   This routine is called when we find that a machine instruction     */
/* needs to be evaluated.  This function will parse the operands for    */
/* the isntruction (if any) and assemble the complete opcode which is   */
/* returned in pValue.  The parsing stops when it finds any character   */
/* that can't be interpreted as part of the instruction - usually it's  */
/* EOS, ';', ')' or ']', but it's up to the caller to verify that the   */
/* expected terminator is found.  As usual, this routine returns TRUE   */
/* if all is well and FALSE if there is some kind of syntax error...    */
BOOLEAN EvaluateOpcode (char **pText, SYMBOL *pOP, UINT *pValue)
{
  switch (pOP->Type) {

    /* process a memory reference instruction... */
    case OP_MRI:
    case SF_OPDEF:
      if (!EvaluateMRI(pText, pOP, pValue)) return FALSE;
      break;

    /* this routine processes an operate micro-instruction */
    case OP_OPR:
      if (!EvaluateOPR(pText, pOP, pValue)) return FALSE;
      break;

    /* here to process a cdf or cif instruction... */
    case OP_CXF:
      if (!EvaluateCXF(pText, pOP, pValue)) return FALSE;
      break;

    /* here to process a pie or pio instruction... */
    case OP_PIE:
    case OP_PIO:
      if (!EvaluateEIO(pText, pOP, pValue)) return FALSE;
      break;

    /* here to precess an iot instructon... */
    case OP_IOT:
      *pValue = (UINT) pOP->Value;
      break;
  }

  return TRUE;
}



/************************************************************************/
/***********         U t i l i t y   F u n c t i o n s         **********/
/************************************************************************/


/* OutputCode */
/*   This function will send the word of code to both the object file   */
/* and the listing and then increment the PC. This function is normally */
/* used only by pseudo-ops such as .ASCIZ or .SIXBIT to show the extra  */
/* words of code generated, and the listing line will contain only the  */
/* address and generated code with no source text.  On pass 1, this     */
/* function increments the PC only and nothing is sent to either output */
/* file.                                                                */
void OutputCode (UINT nCode, BOOLEAN fList, BOOLEAN fSource)
{
  /*   If this code is going to overwrite the literal pool, then cause  */
  /* a P (page full) error.  However, if there are no literals on this  */
  /* page then we want to let the PC flow freely from one page to the   */
  /* next, because this lets us generate long strings of data or text   */
  /* without needing arbitrary .PAGE statements to break it up.  If the */
  /* PC does flow onto the next page, however, we do have to be careful */
  /* to reset the literal base - just because there aren't any literals */
  /* on this page doesn't mean there won't be any on the next!          */
  if (nPC >= nLiteralBase) {
    if ((nLiteralBase & 0177) == 0) 
      nLiteralBase = (nPC & 07600) + 0200;
    else
      Flag(ER_PAF);
  }
  /*   If this word is already marked as used (if, for example, two   */
  /* separate pieces of code are accidentally origined to the same    */
  /* place) then flag it as an error...                               */
  /*if (CheckBitMap(nField, nPC)) Flag(ER_PAF);*/
  /* List and punch the generated code... */
  if (nPass == 2) {
    if (fList) List(&nField, &nPC, &nCode, fSource);
    Punch(nPC, nCode);  MarkBitMap(nField, nPC);
  }
  ++nPC;
}


/* DumpLiterals */
/*   This routine will dump the current literal pool into the object    */
/* and the listing file.  This is done whenever the programmer uses the */
/* .ORG pseudo-op to move to another page, or when we reach the end of  */
/* the source file.                                                     */
void DumpLiterals(void)
{
  UINT nLoc, i;

  /* there is no literal processing under pass 1.... */
  if (nPass != 2) return;
  
  /* output all the literals that we have... */
  for (nLoc = nLiteralBase;  (i = nLoc & 0177) != 0;  ++nLoc) {
    List(&nField, &nLoc, &(anLiteralData[i]), FALSE);
    Punch(nLoc, anLiteralData[i]);  MarkBitMap(nField, nLoc);
  }
}


/* SetPC */
/*   This function is similar to IncrementPC, except that it sets the   */
/* current location to the absolute value given.  If the new PC is on a */
/* different page than the current PC, the literal pool must be dumped  */
/* and re-initialized before the location can be changed.  If the new   */
/* location specified is greater than 07777, an error is flagged and    */
/* nothing is changed.                                                  */
BOOLEAN SetPC (UINT nNew)
{
  if (nNew > 07777) {
    Flag(ER_RAN);  return FALSE;
  } else {
    /*   There's a small (if there is such a thing) hack here - if the  */
    /* previous page was exactly full and had no literals, then the PC  */
    /* will actually be the first word of the _next_ page now.  If the  */
    /* .ORG is also to the next page, then testing for the new PC and   */
    /* the old PC on the same page actually succeeds. This is a problem */
    /* because the literal base never gets reset in that case. The hack */
    /* is to test the PC against the old literal base as well to see if */
    /* the previous page was indeed full!                               */
    if (((nNew & 07600) != (nPC & 07600)) || (nPC == nLiteralBase)) {
      DumpLiterals();  nLiteralBase = (nNew & 07600) + 0200;
    }
    nPC = nNew;  return TRUE;
  }
}  


/* GetString */
/*  This function parses the argument string for the .ASCIZ and .SIXBIT */
/* pseudo-ops.  Either of these accepts a string of characters quoted   */
/* by the first non-blank character following the pseudo-op. It returns */
/* FALSE if there are any syntax errors in the statement...             */
BOOLEAN GetArgumentString (char **pText, char *pString, UINT nMax)
{
  char chQuote;  UINT nLen=0;
  pString[0] = EOS;

  /* The first non-blank character is the string quote character... */
  chQuote = SpanWhite(pText);
  if (iseol(chQuote))  return Flag(ER_SYN);
  ++*pText;

  /* Accumulate the characters out of the string... */
  while ((**pText != chQuote) && (**pText != EOS)) {
    if (nLen >= nMax-1) return Flag(ER_SYN);
    pString[nLen++] = **pText;  ++*pText;
  }
  ++*pText;
  if (!iseol(SpanWhite(pText))) return Flag(ER_SYN);

  /* Terminate the string and return its length... */
  pString[nLen] = EOS;
  return TRUE;
}


/* ExpandEscapes */
/*   This function expands the escape sequences allowed in PALX strings */
/* for the .SIXBIT, .ASCIZ and .TEXT pseudo ops.  The escape sequences  */
/* currently recognized are:                                            */
/*                                                                      */
/*      \r - replaced by a carriage return (015) character              */
/*      \n - replaced by a line feed (012) character                    */
/*      \t - replaced by a horizontal tab (010) character               */
/*      \d - replaced by the current date                               */
/*      \h - replaced by the current time                               */
/*      \\ - replaced by a single backslash ("\") character             */
BOOLEAN ExpandEscapes (char *pOld, char *pNew, UINT nMax)
{
  STRING sz;  UINT nLen = 0;
  pNew[0] = EOS;
  while (*pOld != EOS) {

    /* Any non-escape characters are just copied literally to the result... */
    if (*pOld != '\\') {
      if (nLen >= nMax-1) return Flag(ER_SYN);
      pNew[nLen++] = *pOld++;
      continue;
    }

    if (nLen >= nMax-1) return Flag(ER_SYN);
    switch ((*++pOld)) {
      /* These cases are all fairly easy... */
      case 'r':  pNew[nLen++] = (char) 015;  break;
      case 'n':  pNew[nLen++] = (char) 012;  break;
      case 't':  pNew[nLen++] = (char) 011;  break;

      /* Date and time are a little harder... */
      case 'd':  case 'h':
        if (*pOld == 'd')  GetSystemDate(sz);  else GetSystemTime(sz);
        if ((strlen(sz)+nLen) >= nMax-1) return Flag(ER_SYN);
        strcpy(pNew+nLen, sz);  nLen += strlen(sz);
        break;
      
      /* Illegal escape sequence... */
      default: return Flag(ER_SYN);
    }
    ++pOld;
  }
  
  pNew[nLen] = EOS;
}



/************************************************************************/
/***********        P s e u d o    O p e r a t i o n s         **********/
/************************************************************************/


/* DotTITLE */
/*   This routine is called to process the .TITLE pseudo-op.  We ignore */
/* any white space after the pseudo-op, and then any remaining text on  */
/* the line becomes the title for this program.  The program title is   */
/* printed on the banner of every page in the listing.                  */
/*                                                                      */
void DotTITLE (char *pText)
{
  UINT nLen;

  /*  This pseudo op doesn't generate any code, so we can safely ignore */
  /* it under pass 1...                                                 */
  if (nPass == 1) return;

  /* Make sure we have some kind of operand. */
  if (iseol(SpanWhite(&pText)))
    Flag(ER_SYN);
  else {
    /* The rest of the line becomes the title. */
    strcpy(szProgramTitle, pText);
    /* Remove the newline from the end of the string... */
    nLen = strlen(szProgramTitle);  szProgramTitle[nLen-1] = EOS;
    /* Create a new TOC entry for this string. */
    AddTOC(szProgramTitle);
  }
  List(NULL, NULL, NULL, TRUE);
}


/* DotField */
/*   The ".FIELD n" pseudo op changes the current assembly field to n.  */
/* Since almost all the assembly is don in terms of twelve bit PDP-8    */
/* addresses, this has suprisingly little effect.  About all it does is */
/* output a field change frame to the binary file and reset the PC to   */
/* 0200 of the new field...                                             */
void DotFIELD (char *pText)
{
  UINT nNew=0;
  if (EvaluateExpression(&pText, &nNew) && iseol(*pText)) {
    if (nNew < 010) {
      //   We have to be a little careful about the order we do things - 
      // first, we set the PC off page to force out the literal pool, then
      // we output a field change frame, and finally we reset the origin to
      // 0200 in the new field!
      SetPC(0);  nField = nNew;
      if (nPass == 2) PunchField(nField);
      SetPC(0200);
    } else
      Flag(ER_RAN);
  } else
    Flag(ER_SYN);
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);
}


/* DotORG */
/*   This routine handles the .ORG pseudo-op, which takes a single      */
/* numeric argument that is the new PC.  If the new location is in a    */
/* different page, then the current literal pool is dumped first...     */
void DotORG (char *pText)
{
  UINT nLoc=0;
  
  if (EvaluateExpression(&pText, &nLoc) && iseol(*pText))
    SetPC(nLoc);
  else
    Flag(ER_SYN);
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);
}


/* DotPAGE */
/*   The .PAGE pseudo-op performs essentially the same function as ORG, */
/* but in this case we work with PDP-8 code pages instead. A .PAGE with */
/* no operand advances the location counter to the start of the next    */
/* code page, and ".PAGE n" moves to the start of page number n.        */
void DotPAGE (char *pText)
{
  UINT nPage=0;

  if (iseol(SpanWhite(&pText)))
    SetPC((nPC + 0177) & 07600);
  else if (EvaluateExpression(&pText, &nPage) && iseol(*pText))
    SetPC(nPage << 7);
  else
    Flag(ER_SYN);
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);
}


/* DotEND */
/*   This routine processes the .END pseudo-op.  Suprisingly, this      */
/* currently does nothing - assembly ends when we reach the end of the  */
/* source file...                                                       */
void DotEND (char *pText)
{
  if (!iseol(SpanWhite(&pText))) Flag(ER_SYN);
  /*   If there are literals on this page, then do the equivalent of a  */
  /* .PAGE to get the literal pool dumped out in the right place...     */
  if ((nLiteralBase & 0177) != 0)  SetPC((nPC + 0177) & 07600);
  if (nPass == 2)  List(NULL, NULL, NULL, TRUE);
}


/* DotOPDEF */
/*   This function processes .OPDEF, which allows user define MRI style */
/* instructions to be added to the symbol table.  The syntax of this    */
/* statement goes something like ".OPDEF MYMRI=1000" ...                */
void DotOPDEF (char *pText)
{
  IDENTIFIER szName;  SYMBOL *pSym;  UINT nValue=0;
  
  /* Parse the name of the symbol and then its value... */
  if (   ScanName(&pText, szName, sizeof(szName))
      && (SpanWhite(&pText) == '=')
      && ++pText, EvaluateExpression(&pText, &nValue)
      && iseol(*pText)) {
    /* The statement is syntactically legal - define the new MRI... */
    pSym = LookupSymbol(szName, TRUE);  AddReference(pSym, TRUE);
    if (nPass == 1) {
      if (pSym->Type == SF_UDF) {
        pSym->Type = SF_OPDEF;  pSym->Value = (long) nValue;
      } else
        pSym->Type = SF_MDF;
    } else {
      if (pSym->Type != SF_OPDEF)  Flag(ER_SYM);
    }
  } else
    /* The syntax is invalid */
    Flag(ER_SYN);
    
  if (nPass == 2)  List(NULL, NULL, &nValue, TRUE);
}


/* DotASCIZ */
/*   This routine processes the .ASCIZ pseudo-op, which generates one   */
/* or more data words with each word containing a single ASCII char-    */
/* acter from the argument string...                                    */
void DotASCIZ (char *pText)
{
  STRING szText, szData;  UINT i;

  /* Parse the source statement... */
  GetArgumentString (&pText, szText, sizeof(szText));
  ExpandEscapes(szText, szData, sizeof(szData));
    
  /* Under pass 2, list the line containg the text itself first... */
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);

  /*   And finally we can output the data.  Note that if there were any */
  /* syntax errors, the string will be null so nothing gets output...   */
  for (i = 0;  szData[i] != EOS;  ++i) {
    OutputCode((UINT) szData[i], FALSE, FALSE);
  }

  /* Be sure to terminate the string with a null byte... */
  OutputCode(0, FALSE, FALSE);
}


/* DotTEXT */
/*   The .TEXT pseudo op generates literal ASCII text strings, packed   */
/* three characters into two words in the standard OS/8 packing scheme. */
/* Contrast this to .ASCIZ, which generates ASCII strings one character */
/* per word.  Like .ASCIZ, .TEXT also marks the end of the string with  */
/* a null byte, however it always guarantees that an entire full twelve */
/* bit word of zeros ends the string, not just a byte.                  */
void DotTEXT (char *pText)
{
  STRING szText, szData;  UINT i;

  /* Parse the source statement and, under pass 2, list it... */
  GetArgumentString (&pText, szText, sizeof(szText));
  ExpandEscapes(szText, szData, sizeof(szData));
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);

  for (i = 0;  i < strlen(szData);  i += 3) {
    int nLeft = strlen(&(szData[i]));
    if (nLeft >= 3) {
      OutputCode((((szData[i+2] >> 4) & 0xF) << 8) | szData[i],   FALSE, FALSE);
      OutputCode((( szData[i+2]       & 0xF) << 8) | szData[i+1], FALSE, FALSE);
    } else {
      if (nLeft > 0) OutputCode(szData[i], FALSE, FALSE);
      if (nLeft > 1) OutputCode(szData[i+1], FALSE, FALSE);
    }
  }

  /* Always end the string with a full word of zeros... */  
  OutputCode(0, FALSE, FALSE);
}  


/* DotSIXBIT */
/*   This routine processes the .SIXBIT pseudo-op, which is essentially */
/* the same as .ASCIZ except that it outputs pairs of SIXBIT characters */
/* per word rather than single ASCII bytes.  Note that the brain-dead   */
/* OS/8 SIXBIT algorithm is used, rather than the better DECsystem-10   */
/* version....                                                          */
void DotSIXBIT (char *pText)
{
  STRING szText, szData;  UINT i, nCode, nChar;

  /* Parse the source statement... */
  GetArgumentString (&pText, szText, sizeof(szText));
  ExpandEscapes(szText, szData, sizeof(szData));
    
  /* Under pass 2, list the line containg the text itself first... */
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);

  /* and finally generate data for all the sixbit characters... */
  for (i = 0;  szData[i] != EOS;  ++i) {
    nChar = (CAP(szData[i]) - ' ') & 077;
    if (i & 1) {
      nCode |= nChar;  OutputCode(nCode, FALSE, FALSE);
    } else
      nCode = nChar << 6;
  }
  
  /*  If there's an odd number of characters then be sure to flush the  */
  /* last half-word.  Note that no special terminator, such as a null   */
  /* byte, is used for .SIXBIT...                                       */
  if (i & 1)  OutputCode(nCode, FALSE, FALSE);
}


/* DotBLOCK */
/*   This procedure implements the .BLOCK pseudo-op, which reserves one */
/* or more words of memory for storage.  This pseudo-op actually causes */
/* a jump in the binary file addresses, and the memory words reserved   */
/* are not initialized to any particular value.  Note that .BLOCK 0 is  */
/* specifically allowed as a no-op place holder...                      */
void DotBLOCK (char *pText)
{
  UINT nLen, i;
 
  /* Evaluate the argument and if it's malformed, treat it as zero... */
  if (!EvaluateExpression(&pText, &nLen) || !iseol(*pText))  nLen = 0;

  /* Make sure the range doesn't exceed the current page... */  
  if ((nPC + nLen) > nLiteralBase) {
    Flag(ER_PAF);
    nLen = (nLiteralBase > nPC) ? (nLiteralBase - nPC) : 0;
  }
  
  /*   Even though .BLOCK doesn't generate any code, we still want to   */
  /* show these locations as used in the bitmap!                        */
  for (i = 0;  i < nLen;  ++i)  MarkBitMap(nField, nPC+i);

  /* List the line and bump the PC, but don't actually generate any code... */  
  if (nPass == 2)  List(&nField, &nPC, NULL, TRUE);
  nPC += nLen;
}


/* DotDATA */
/*   This routine handles the .DATA pseudo-op, which generates one or   */
/* more words of data.  It isn't all that useful, since the line ".DATA */
/* XYZ" is equivalent to just writing "XYZ", however one advantage is   */
/* that .DATA allows several words of code to be generated (e.g. ".DATA */
/* A, B, C".                                                            */
void DotDATA (char *pText)
{
  UINT nCode, nWords, i;  char *p;

  /*   There must be a better way!!  This doesn't even really work -    */
  /* consider the statement ".DATA 1, [.DATA 2,3], 4" for example...    */
  
  /*   The first thing we want to do is go thru and count the number of */
  /* words this statement will generate.  We do this by simply counting */
  /* the commas, but this is trickier than it sounds because there may  */
  /* be ASCII strings in expressions that contain commas (e.g. .DATA 1, */
  /* ",", 2 ...).                                                       */
  nWords = 1;  p = pText;
  while (!iseol(*p)) {
    if (*p == ',') {
      ++nWords;  ++p;
    } else if (*p == '\"') {
      for (++p;  ((*p != '\"') && (*p != '\n'));  ++p)  ;
      if (*p == '\"') ++p;
    } else
      ++p;
  }

  /*   On pass 1, all we care about is the number of words generated so */
  /* we can just increment the PC and quit now.  In fact, we don't want */
  /* to evaluate the expressions because they likely contain symbols    */
  /* that aren't defined yet on pass 1, and we don't want them entered  */
  /* into the symbol table as undefined!                                */
  if (nPass == 1) {nPC += nWords;  return;}

  /*   Now go thru and parse all the expressions once, but don't store  */
  /* any of the code words generated.  We do this so that if there are  */
  /* any syntax errors in the expressions, the error characters will be */
  /* printed on the same line with the .DATA statement.  Just for fun,  */
  /* we also count the number of data words we find this way - if it    */
  /* doesn't agree with what we used on pass 1 then we flag an error.   */
  for (p = pText, i = 1;  ;  ++i, ++p) {
    EvaluateExpression(&p, &nCode);
    if (iseol(SpanWhite(&p))) break;
    if (*p != ',')  Flag(ER_SYN);
  }
  if (i != nWords) Flag(ER_SYN);
  List(NULL, NULL, NULL, TRUE);

  /*   Now generate the actual binary code.  Note that we always _must_ */
  /* generate exactly as many words as we found on pass 1, or we'll     */
  /* cause phase errors in the assembly!                                */
  for (p = pText, i = 0;  i < nWords;  ++i, ++p) {
    if (!EvaluateExpression(&p, &nCode)) nCode = 0;
    OutputCode(nCode, TRUE, FALSE);
    if (iseol(SpanWhite(&p))) break;
  }
}


/* DotIM6100 and DotIM6120 */
/*   These pseudo ops select the CPU (either the Intersil IM6100 or the */
/* Harris HM6120) and add the appropriate CPU specific symbols to the   */
/* symbol table. We also remember the current CPU in nCPU in case other */
/* pseudo ops want to behave differently on differnt CPUs, but none     */
/* currently do!                                                        */
void ChangeCPU (char *pText, UINT n, void (*pMnemonics) (void))
{
  if (iseol(SpanWhite(&pText))) {
    (*pMnemonics)();  nCPU = n;
  } else
    Flag(ER_SYN);
  if (nPass == 2) List(NULL, NULL, NULL, TRUE);
}
void DotIM6100 (char *pText) {ChangeCPU(pText, 6100, &IntersilMnemonics);}
void DotHM6120 (char *pText) {ChangeCPU(pText, 6120, &HarrisMnemonics);}


/* DotVECTOR */
/*   The .VECTOR pseudo op generates a reset vector for the IM6100 and  */
/* HM6120 microprocessors.  On reset, these chips set the PC to 7777    */
/* and execute whatever instruction is there - the convention being to  */
/* put a JMP to actual program start in that location.  If the start    */
/* address is also on page 7600, .VECTOR generates a simple JMP to this */
/* address in location 7777.  If the start address is on another page,  */
/* .VECTOR generates two words of code - a JMP @7776 in location 7777,  */
/* and the actual start address in 7776.                                */
/*                                                                      */
/*   You might be wondering why we need a special pseudo op for this    */
/* at all - can't we do the same thing with a .ORG or two?  Well, you   */
/* can but it effectively prevents you from using any literals on page  */
/* 7600.  The advantage to .VECTOR is that it actually takes advantage  */
/* of the literal pool to generate the vectors, and still leaves it     */
/* available for other code on page 7600 to use.  It also looks cool!   */
void DotVECTOR (char *pText)
{
  UINT nVector=0;

  /* This can't be used on a "generic" PDP-8... */
  if (nCPU == 0) Flag(ER_POP);
  
  /*   If we aren't already on page 7600, then reset the origin to the  */
  /* start of that page (we have to - otherwise we couldn't generate    */
  /* literals on this page!).                                           */
  if ((nPC & 07600) != 07600) SetPC(07600);
  
  /*   If we're already on page 7600 and code has already assembled     */
  /* which generated literals, then we're going to overwrite some of    */
  /* those literals.  There's nothing we can do to avoid this, but we   */
  /* can at least generate an error message so the user knows he messed */
  /* up..                                                               */
  if (nLiteralBase != 010000) Flag(ER_PAF);
  
  /*   On pass 2, try to evaluate the actual start address for this     */
  /* program.  On pass 1 we don't care what it is...                    */
  if (nPass == 2) {
    if (!EvaluateExpression(&pText, &nVector) || !iseol(*pText)) Flag(ER_SYN);
  }
  
  /*   And now the magic part.  If the startup address is on page 7600, */
  /* then put a literal in location 7777 with a simple JMP (5200) to    */
  /* this location.  If the startup address is on another page, then    */
  /* put a JMP @7776 (5776) in location 7777 and the actual address in  */
  /* location 7776.  In either case, leave the literal base set just    */
  /* below the words we generated so other literals can be generated on */
  /* this page..                                                        */
  if ((nVector & 07600) != 07600) {
    anLiteralData[0177] = 05776;
    anLiteralData[0176] = nVector;
    nLiteralBase = 07776;
  } else {
    anLiteralData[0177] = 05200 | (nVector & 0177);
    nLiteralBase = 07777;
  }
  
  /*   There's no need to actually output any code here - sooner or     */
  /* later we will get around to calling DumpLiterals() and that will   */
  /* actually output the vectors.                                       */

  /* Under pass two, list this line and we're done. */
  if (nPass == 2) List(NULL, NULL, &nVector, TRUE);
}


/* DotSTACK */
/*  .STACK lets the programmer set the opcodes associated with the four */
/* stack pseudo ops - .PUSH, .POP, .PUSHJ and .POPJ.  Because the 6120  */
/* has not one but _two_ hardware stacks, this pseudo op can be used to */
/* select the stack in use.  Although the IM6100 (and a real PDP-8 for  */
/* that matter) don't have a hardware stack they can emulate one with   */
/* software and this same pseudo op can be used to set the instructions */
/* (almost always JMS or JMPs) associated with the software simulation. */
/* This makes it easy to port the same source code to either CPU.       */
void DotSTACK (char *pText)
{
  /*   This pseudo op doesn't generate any code, so on pass 1 we can    */
  /* safely skip it...                                                  */
  if (nPass == 1) return;
  
  /* There always have to be exactly four operands... */
  if (!EvaluateExpression(&pText, &nPUSH)  || (*pText++ != ',')) Flag(ER_SYN);
  if (!EvaluateExpression(&pText, &nPOP)   || (*pText++ != ',')) Flag(ER_SYN);
  if (!EvaluateExpression(&pText, &nPUSHJ) || (*pText++ != ',')) Flag(ER_SYN);
  if (!EvaluateExpression(&pText, &nPOPJ)  || !iseol(*pText))    Flag(ER_SYN);

  /*   List the four opcodes defined, and that's all until we encounter */
  /* a .PUSH, .POP, .PUSHJ or .POPJ...                                  */
  List(NULL, NULL, NULL, TRUE);
  List(NULL, NULL, &nPUSH, FALSE);  
  List(NULL, NULL, &nPOP, FALSE);  
  List(NULL, NULL, &nPUSHJ, FALSE);  
  List(NULL, NULL, &nPOPJ, FALSE);  
}


/* DotPUSH, DotPOP, and DotPOPJ */
/*   These pseudo ops output the opcode for stack operations, as set by */
/* the .STACK pseudo op.  They're all basically the same and don't      */
/* really need to be a pseudo op - a plain, old fashioned symbol table  */
/* entry would suffice.  However there's no easy way in PALX to get the */
/* pseudo op notation (e.g. ".XYZ") for a plain symbol table entry, so  */
/* we'll have to invest a few lines of code...                          */
void StackFunction (char *pText, UINT nOpcode)
{
  /* There should never be any arguments for this one... */
  if (!iseol(SpanWhite(&pText))) Flag(ER_SYN);
  /* If the stack hasn't been defined with .STACK, then flag an error. */
  if (nOpcode == 0) Flag(ER_POP);
  OutputCode(nOpcode, TRUE, TRUE);
}
void DotPUSH (char *pText) {StackFunction(pText, nPUSH);}
void DotPOP  (char *pText) {StackFunction(pText, nPOP);}
void DotPOPJ (char *pText) {StackFunction(pText, nPOPJ);}


/* DotPUSHJ */
/*  .PUSHJ is slightly more complicated, enough so that this one really */
/* does need to be a pseudo op, because it takes an argument which is   */
/* the address of the subroutine to call.  .PUSHJ first outputs a word  */
/* of code containing simply the opcode for PUSHJ as defined by .STACK, */
/* and then in the second word it outputs a JMP instruction to the      */
/* subroutine entry point.  The argument to .PUSHJ works exactly as the */
/* operand for a JMP instruction, and if it is off page then then it    */
/* must be either a zero page reference or an "@[...]" link.            */
void DotPUSHJ (char *pText)
{
  UINT nJMP;  SYMBOL *pJMP = LookupSymbol("JMP", FALSE);

  /*  This always generates two words of code, so on pass 1 we can just */
  /* leave it at that...                                                */
  if (nPass == 1) {nPC += 2;  return;}
  
  /*   Output the opcode for PUSHJ.  If it hasn't been defined yet by a */
  /* .STACK invocation, then flag an error too.                         */
  if (nPUSHJ == 0) Flag(ER_POP);
  OutputCode(nPUSHJ, TRUE, TRUE);
  
  /*   Now evaluate the operand and generate a second word of code as   */
  /* if this were a real JMP instruction...                             */
  EvaluateMRI(&pText, pJMP, &nJMP);
  if (!iseol(SpanWhite(&pText))) Flag(ER_SYN);
  OutputCode(nJMP, TRUE, FALSE);  
}


/* DotNOWARN */
/*   The .NOWARN pseudo op gives a list of one or more error codes,     */
/* specified by their single letter mnemonic, which are to be ignored.  */
/* Needless to say, it's still the user's responsibility to ensure that */
/* the right code is being generated!                                   */
void DotNOWARN (char *pText)
{
  UINT nLen;  char ch;
  szIgnoredErrors[0] = EOS;  nLen = 0;  ch = SpanWhite(&pText);
 
  /*   The remainder of the line after .NOWARN specifies one or more    */
  /* error letters to be ignored, optionally separated by spaces. Note  */
  /* that a null argument isn't illegal - it simply says that all       */
  /* errors are to be reported!                                         */
  while (!iseol(ch)) {
    if (!isalpha(ch)) Flag(ER_SYN);
    szIgnoredErrors[nLen++] = CAP(ch);  szIgnoredErrors[nLen] = EOS;
    ++pText;  ch = SpanWhite(&pText);
  }

  if (nPass == 2)  List(NULL, NULL, NULL, TRUE);
}



/************************************************************************/
/***********     F i r s t   &   S e c o n d   P a s s e s     **********/
/************************************************************************/


/* CheckFormFeed */
/*   This function will check the current source line for the presence  */
/* of an ASCII form feed character.  If it finds one, then it deletes   */
/* the form feed and sets the fNewPage flag which will cause the List() */
/* procedure to force a new page in the listing after we've processed   */
/* this line...                                                         */
void CheckFormFeed (void)
{
  char *p;
  while ((p=strchr(szSourceText, '\f')) != NULL) {
    strcpy(p, p+1);  fNewPage = TRUE;
  }
}


/* CheckLabel */
/*   This function will check the current source line for the presence  */
/* of one or more labels (aka tags, e.g. "XYZ:") and will process any   */
/* that it finds.  On pass 1, labels are entered into the symbol table  */
/* with a value equated to the current location.  On pass 2 there's no  */
/* need to re-define the tags, but we do check their entry in the       */
/* symbol table to see if they have any errors (e.g. multiply defined)  */
/* associated with them so that these errors can be flagged in the      */
/* listing file.  This function returns TRUE if it finds and processes  */
/* at least one label...                                                */
BOOLEAN CheckLabel (char **pText)
{
  IDENTIFIER szLabel;  char *pLabel;  SYMBOL *pSym;  BOOLEAN fFound=FALSE;

  while (TRUE) {
    /*   The only way to know whether there's a label is to scan over   */
    /* the name and then look for the ":".  If it turns out that there  */
    /* is no label, then the original pText pointer is left unchaged so */
    /* there's no need to back up...                                    */
    pLabel = *pText;
    if (!ScanName(&pLabel, szLabel, sizeof(szLabel))) return fFound;
    SpanWhite (&pLabel);
    if (*pLabel != ':') return fFound;
    
    /* We've found a label. Advance the text pointer to skip over it... */
    *pText = pLabel + 1;  pSym = LookupSymbol(szLabel, TRUE);
    AddReference(pSym, TRUE);
    if (nPass == 1) {
      /* On pass 1, enter this label into the symbol table... */
      if (pSym->Type == SF_UDF) {
        pSym->Type = SF_TAG;  pSym->Value = (long) ((nField<<12) | nPC);
      } else
        pSym->Type = SF_MDF;
    } else {
      /* On pass 2, check the symbol for errors... */
      if (pSym->Type != SF_TAG)  Flag(ER_SYM);
    }
    fFound = TRUE;
  }
}


/* CheckDefinition */
/*   This function will test the current source line to see if it is a  */
/* symbol definition of the form "XYZ=123", and process it if so.  This */
/* statement simple evaluates the expression on the right side of the   */
/* equal sign and defines the symbol to the left of the equal with this */
/* value.  This routine returns TRUE if the source line is a definition */
/* and in this case the entire line has been processed (and listed if   */
/* this is pass 2) when we return....                                   */
BOOLEAN CheckDefinition (void)
{
  IDENTIFIER szName;  char *pText;  UINT nValue;  SYMBOL *pSym;
  
  /*   We need to keep the original source line pointer unchanged, so   */
  /* that we can list the entire line when we're done parsing...        */
  pText = szSourceText;
  
  /* See if this even is a symbol definition... */
  if (!ScanName(&pText, szName, sizeof(szName))) return FALSE;
  SpanWhite (&pText);
  if (*pText != '=') return FALSE;
    
  /*   It is - parse the expression and calculate its value.  Note that */
  /* we evaluate symbol definitions on pass 1, but we still parse the   */
  /* expression all over again on pass 2.  This ensures that any errors */
  /* in the expression get reported in the listing file!                */
  ++pText;  nValue = 0;
  if (EvaluateExpression(&pText, &nValue)) {
    if (!iseol(*pText))  Flag(ER_SYN);
  }
  
  /* Enter the symbol into the symbol table... */
  pSym = LookupSymbol(szName, TRUE);  AddReference(pSym, TRUE);
  if (nPass == 1) {
    if (pSym->Type == SF_UDF) {
      pSym->Type = SF_EQU;  pSym->Value = (UINT) nValue;
    } else
      pSym->Type = SF_MDF;
  } else {
    if (pSym->Type != SF_EQU)  Flag(ER_SYM);
  }
  
  /* If this is pass 2, then list this line... */
  if (nPass == 2)  List(NULL, NULL, &nValue, TRUE);
  
  return TRUE;
}


/* CheckPseudoOp */
/*   This function will check the source line for a pseudo op (e.g.     */
/* .TITLE, .END, .BLOCK, etc) and, if it finds one, then it will invoke */
/* the correct routine to process it.  Since the pseudo-ops do many     */
/* different functions, everything that happens, including listing the  */
/* source line, is determined by the pseudo op's routine.  TRUE is      */
/* returned if we find a pseudo op, and FALSE if this is a normal kind  */
/* of statement...                                                      */
BOOLEAN CheckPseudoOp (char *pText)
{
  IDENTIFIER szName;  SYMBOL *pSym;
  
  /*   All pseudo ops current start with a ".", so we can exploit this  */
  /* to trivialize the test for the presence of a pseudo-op...          */
  if (SpanWhite(&pText) != '.')  return FALSE;
  
  /* Get the name and look it up in the symbol table... */
  ++pText;  szName[0] = '.';
  if (   !ScanName(&pText, szName+1, sizeof(szName))
      || ((pSym=LookupSymbol(szName, TRUE))->Type != PO_POP)) {
    /*   Either the "." isn't followed by an identifier, or the ident-  */
    /* ifier isn't defined as a pseudo-op.  In either case this state-  */
    /* ment is bogus.  On pass 1 we can just ignore it, but on pass 2   */
    /* we have to list it so that the user can see!                     */
    Flag(ER_POP);  AddReference(pSym, TRUE);
    if (nPass == 2)  List(NULL, NULL, NULL, TRUE);
    return TRUE;
  }

  /* Dispatch to the correct pseudo op function... */
  AddReference(pSym, FALSE);
  ((void (*) (char *)) (pSym->Value)) (pText);
  return TRUE;
}


/* Assemble */
/*   This routine will read and parse the entire source file.  It gets  */
/* called twice, once for each assembler pass. The caller is responsible*/
/* for opening the source, listing and binary files before calling this */
/* procedure.                                                           */
void Assemble (void)
{
  char *pText;  UINT nCode;  BOOLEAN fLabel;

  /* Initialize all the global variables... */
  nCPU = 0;  nPC = 0200;  nField = 0;  nLiteralBase = nPC + 0200;
  nErrorCount = nSourceLine = 0;  fNewPage = TRUE;
  szErrorFlags[0] = EOS;  szIgnoredErrors[0] = EOS;
  nPUSH = nPOP = nPUSHJ = nPOPJ = 0;
  nLastBinaryAddress = 010000;  nBinaryChecksum = 0;
  fprintf(stderr, "%s - %s, Pass %d\n", PALX, szSourceFile, nPass);
  
  while (fgets(szSourceText, sizeof(szSourceText), pSourceFile) != NULL) {
    pText = szSourceText;  ++nSourceLine;  CheckFormFeed();

    /*   First, check for a symbol definition (e.g. "XYZ=123").  We do  */
    /* this first, before even checking for labels, because putting a   */
    /* label on a symbol definition (e.g. "ABC: XYZ=123") is not legal! */
    /* If this source line is a symbol definition, then there's nothing */
    /* more that we need to do...                                       */    
    if (CheckDefinition()) continue;
    
    /*   Next, check to see if this line has any labels on it and if it */
    /* does then define them.  We need to remember if this line has any */
    /* label with the fLabel flag...                                    */
    fLabel = CheckLabel(&pText);
    
    /*   Now, if this source line is null (e.g. it's blank or contains  */
    /* only a comment) then we can just list it and forget it.  Usally  */
    /* these lines don't show either an address or generated code in    */
    /* the listing, _bowever_, if the line contains a label then we go  */
    /* ahead and show the address alone...                              */
    if (iseol(SpanWhite(&pText))) {
      if (nPass == 2)  List(&nField, (fLabel ? &nPC : NULL), NULL, TRUE);
      continue;
    }

    /*   See if this line contains a pseudo-op (e.g. .TITLE, .END, etc) */
    /* If it does, then the pseudo op routine is responsible for every- */
    /* thing that happens next, including listing the line.  This is    */
    /* because some pseudo-ops generate mroe than one word of code.     */
    if (CheckPseudoOp(pText)) continue;

    /*   If it's none of these things then this line must generate some */
    /* kind of code.  It could be a machine instruction, or it could    */
    /* just be some numeric expression (e.g. "X: 0077") - it doesn't    */
    /* matter either way.  On pass 1 we don't try to evaluate the       */
    /* expression because it may contain symbols that aren't defined    */
    /* yet, but on pass 2 we do evaluate it and output the code word    */
    /* generated.  On either pass, however, we increment the PC.        */      
    if (nPass == 2) {
      EvaluateExpression(&pText, &nCode);
      OutputCode(nCode, TRUE, TRUE);
    } else
      ++nPC;
  }

  /* Make sure there are no left over literals on the last page! */  
  if (nPass == 2) DumpLiterals();
}



/************************************************************************/
/***********           C o m m a n d    P a r s i n g           *********/
/************************************************************************/


/* ParseOptions */
/*   This function will parse the command line options and set up the   */
/* source, binary and list file names.  A source name is required, but  */
/* either or both of the listing and binary file names may be omitted.  */
/* It returns FALSE if the arguments are invalid...                     */
BOOLEAN ParseOptions (int argc, char *argv[])
{
  int i;
  szSourceFile[0] = szListFile[0] = szBinaryFile[0] = EOS;

  for (i = 1;  i < argc;  ++i) {
    if (STREQL(argv[i], "-l")) {
      if ((++i >= argc) || (strlen(szListFile) > 0)) return FALSE;
      strcpy(szListFile, argv[i]);
    } else if (STREQL(argv[i], "-b")) {
      if ((++i >= argc) || (strlen(szBinaryFile) > 0)) return FALSE;
      strcpy(szBinaryFile, argv[i]);
    } else if (argv[i][0] == '-') {
      return FALSE;
    } else {
      if (strlen(szSourceFile) > 0) return FALSE;
      strcpy(szSourceFile, argv[i]);
    }
  }

  return strlen(szSourceFile) > 0;
}


#ifndef MSDOS
/* _splitpath */
/*   This routine sill split up a VMS file specification into component */
/* parts.  It's equivalent to the MSDOS library function of the same    */
/* name.  It assumes that the VMS specification is syntactically legal- */
/* what happens to illegal names is anybody's guess...                  */
void _splitpath (char *pPath, char *pDrive, char *pDirectory, char *pName, char *pType)
{
  char *pStart, *p;  UINT nLen;
  pDrive[0] = pDirectory[0] = pName[0] = pType[0] = EOS;  pStart = pPath;
  /* First try to extract a device name... */
  p = strchr(pStart, ':');
  if (p != NULL) {
    nLen = p - pStart+1;  strncpy(pDrive, pStart, nLen);
    pDrive[nLen] = EOS;  pStart = p + 1;
  }
  /* Now the directory, if any... */
  p = strchr(pStart, ']');
  if (p != NULL) {
    nLen = p - pStart+1;  strncpy(pDirectory, pStart, nLen);
    pDirectory[nLen] = EOS;  pStart = p + 1;
  }
  /*  Next the file name.  This time, unlike the others, the terminator */
  /* (i.e. ".") is _not_ part of the name.  Also, if no dot is found,   */
  /* then the entire remainder of ths string is the name.               */
  p = strchr(pStart, '.');
  if (p != NULL) {
    nLen = p - pStart;  strncpy(pName, pStart, nLen);
    pName[nLen] = EOS;  pStart = p;
  } else {
    strcpy(pName, pStart);  pStart = pStart + strlen(pStart);
  }
  /*   And finally the extension (type).  There may be a VMS version    */
  /* number too, but we strip that off and discard it...                */
  strcpy(pType, pStart);  p = strchr(pType, ';');
  if (p != NULL) *p = EOS;
}
#endif


/* DefaultFile */
/*   This routine applies a set of "defaults" to a file specification - */
/* specifically a default extension (e.g. ".plx", ".bin", etc) and a    */
/* default path.  The latter is derived from a "related file", which is */
/* usually the source file.  This done so that binary files and listing */
/* files are by default placed in the same path as the source file.     */
void DefaultFile (char *pFileName, char *pRelatedName, char *pDefaultType)
{
  STRING szDrive, szDir, szName, szType;
  STRING szDefaultDrive, szDefaultDir, szDefaultName, szDummy;
  _splitpath(pFileName, szDrive, szDir, szName, szType);
  _splitpath(pRelatedName, szDefaultDrive, szDefaultDir, szDefaultName, szDummy);
  strcpy(pFileName, (strlen(szDrive) > 0) ? szDrive : szDefaultDrive);
  strcat(pFileName, (strlen(szDir)   > 0) ? szDir   : szDefaultDir);
  strcat(pFileName, (strlen(szName)  > 0) ? szName  : szDefaultName);
  strcat(pFileName, (strlen(szType)  > 0) ? szType  : pDefaultType);
}


/* OpenFiles */
/*   This routine opens all the necessary input and output files for    */
/* assembly - the source file, the binary file, and the listing file.   */
/* If any of the files cannot be opened, an error message is printed on */
/* stderr and this program is terminated.                               */
void OpenFiles (void)
{
#ifdef VMS
  char *p;
#endif
#ifdef MSDOS
  STRING szTemp;
#endif

  /* Apply the default extension, ".plx", to the input file... */
  DefaultFile(szSourceFile, "", SOURCE_TYPE);
  pSourceFile = fopen(szSourceFile, "r");
  if (pSourceFile == NULL) {
    fprintf(stderr,"%s - unable to read %s\n", PALX, szSourceFile);
    exit(EXIT_FAILURE);
  }
  
  /*   Derive the full path of the input file, including the actual     */
  /* drive and directory, for the listing.  This turns, for example,    */
  /* "myfile.plx" into "C:\BOB\PROJECTS\MYFILE.PLX" ...                 */
#ifdef VMS
  fgetname(pSourceFile, szSourceFile);  p = strchr(szSourceFile, ';');
  if (p != NULL) *p = EOS;
#endif
#ifdef MSDOS
  _fullpath(szTemp, szSourceFile, sizeof(szTemp));
  strcpy(szSourceFile, szTemp);  _strupr(szSourceFile);
#endif

  /*  The listing file defaults to the same name and path as the source */
  /* file with the extension .LST...                                    */
  DefaultFile(szListFile, szSourceFile, LIST_TYPE);
  pListFile = fopen(szListFile, "w");
  if (pListFile == NULL) {
    fprintf(stderr,"%s - unable to write %s\n", PALX, szListFile);
    exit(EXIT_FAILURE);
  }
  
  /* Ditto for the binary file, except with ".BIN". */
  DefaultFile(szBinaryFile, szSourceFile, BINARY_TYPE);
  fdBinaryFile = _open(szBinaryFile, 
    _O_WRONLY | _O_CREAT | _O_TRUNC | _O_BINARY, _S_IREAD | _S_IWRITE);
  if (fdBinaryFile == -1) {
    fprintf(stderr,"%s - unable to write %s\n", szBinaryFile);
    exit(EXIT_FAILURE);
  }
  cbBinaryData = 0;  PunchLeader();
}


/* main */
int
main (int argc, char *argv[])
{
  /* Parse the command line... */
  if (!ParseOptions(argc, argv)) {
    fprintf(stderr,"Usage: %s [-l listfile] [-b binaryfile] sourcefile\n", PALX);
    exit(EXIT_FAILURE);
  }
  
  /* Initialize... */
  fprintf(stderr, "%s - %s V%d.%02d RLA\n",
    PALX, TITLE, (VERSION / 100), (VERSION % 100));
  InitializeSymbols();  ClearBitMap();  pFirstTOC = pLastTOC = NULL;
  OpenFiles();

  /* Make the first pass and rewind the source file... */
  nPass = 1;  Assemble();
  if (fseek(pSourceFile, 0L, SEEK_SET) != 0) {
    fprintf(stderr,"%s - error rewinding source file\n", PALX);
    exit(EXIT_FAILURE);
  }

  /* Make the second pass and generate the binary and listing files. */
  nPass = 2;  Assemble();  PunchChecksum();
  ListSummary();  ListBitMap();
  SortSymbols();  ListSymbols();
  ListTOC();

  /* Close all the files and we're done... */  
  fclose(pSourceFile);  fclose(pListFile);  _close(fdBinaryFile);
  return EXIT_SUCCESS;
}
