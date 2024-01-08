	.TITLE	IOB6120 I/O Board extension ROM

;   Copyright (C) 2003 by J. Kearney, Bolton, Massachusetts
;   Portions adapted from and Copyrighted (C) 2001-2003
;   by R. Armstrong, Milpitas, California.
;
;   This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
;
;   This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
; for more details.
;
;   You should have received a copy of the GNU General Public License along
; with this program; if not, write to the Free Software Foundation, Inc.,
; 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
;

	.HM6120
	.STACK  PAC1, POP1, PPC1, RTN1
	.NOWARN	F

	.TITLE	Edit History

;
;  100		-- Beginning of recorded history (end of alpha development)
;
;  101		-- Added FPGA VHDL version display
;
;  102		-- Added disassembler, X and XP commands, hooked HELP and
;                  TYPEIR.
;
;  103		-- Removed rev 102 changes and incorporated them into BTS6120
;
;  104		-- added clock/calendar functions and commands
;
;
;  105		-- oops, clock registers were not being write-protected
;
;  106		-- fixed CF problem - BTS6120 now looks for 8 ramdisk RAMs,
;		   which are in the same memory space as the CF card.  Some
;                  CF cards interpret this probe as a bad command and set ERR.
;		   Added code to clear the command register before any
;                  other commands are issued by doing a RECALIBRATE(NOP).
;		   Also fixed a bug where, if the CF was not inserted during
;		   reset, the read hook would sometimes not be made properly.
;
;  107		-- added fix for ramdisk location 0 being cleared during
;		   power-up.  Set BTS memory offset to 0 so that disk
;		   starts at location 1.
;
;  110		-- In signon message, print the actual CFSIZE as the Compact
;		   flash size, rather than CFSIZE-1.
;
;  111		-- Add the support for hooking the BTS6120 monitor call 
;		   function table.
;
;  112		-- Add the GETCFS (Get COmpactFlash Size), RTODS (Read Time
;		   of day clock) and STODS (set Time of Day clock) ROM
;		   monitor calls.
;
;  113		-- The DA command accidentally (in the US version) sets the
;		   wrong register for the year.  Clean up and parameterize
;		   all the DS1302 registers to prevent this from happening!
;
VERSION=114

	.Title Constants and other definitions

;
; Configuration constants
;

BTSMINVERSION=240	; minimum version of BTS6120 that's acceptable
CFPARITION=7700		; CF partitions start here

;
; SBC6120 Memory map control for panel RAM access
;
		;   DIRECT	INDIRECT
		;   --------	--------
MM0=6400	;   EPROM	RAM	(automatically selected by a RESET)
MM1=6401	;   RAM		EPROM	(used during system initialization)
MM2=6402	;   RAM		RAM	(used almost all the time)
MM3=6403	;   RAM		DISK	(used to access RAM disk only)

;
; SBC6120 RAMdisk address register access
;

LDAR=6410

;
; SBC6120 IOTs to control serial port address
;

PRISLU=6412
PRIPORT=0030
PRICODE=0304

SECSLU=6413
SECPORT=0360
SECCODE=3637

; SLU IOTs

KCF=6000	; Set Receive flag
KCC=6002	; Clear receive flag and AC
TFL=6010 ; Set transmit flag
TSF=6011	; Skip if the console transmit flag is set
TCF=6012 ; Clear transmit flag and AC
TLS=6016	; Load AC into transmit buffer and clear the flag

;
; Mapping of EMAs to subsystems
;

CDF_ROM	   = CDF 1
CDF_CF	   = CDF 3
CDF_FPGA   = CDF 5
CDF_STATUS = CDF 7

CDF_BTS0   = CDF 0
CXF_BTS0   = CXF 0
CDF_BTS1   = CDF 1
CXF_BTS1   = CXF 1
CDF_BTS2   = CDF 2
CXF_BTS2   = CXF 2
CDF_HERE   = CDF 3
CIF_HERE   = CIF 3
CXF_HERE   = CXF 3

;
; CompactFlash registers
;

CF_DATA	= 0			; ADDRESS OF DATA REGISTER
CF_ERR	= 1			; ADDRESS OF ERROR REGISTER
CF_FEAT	= 1			; ADDRESS OF FEATURES REGISTER
CF_CNT	= 2			; ADDRESS OF SECTOR COUNT REGISTER
CF_LB0	= 3			; ADDRESS OF LB0-7 / SECTOR NUMBER REGISTER
CF_LB1	= 4			; ADDRESS OF LB8-15 / LOW CYLINDER REGISTER
CF_LB2	= 5			; ADDRESS OF LB16-23 / HIGH CYLINDER REGISTER
CF_LB3	= 6			; ADDRESS OF LB24-27 / HEAD/DRIVE REGISTER
CF_STAT	= 7			; ADDRESS OF STATUS REGISTER
CF_CMD	= 7			; ADDRESS OF COMMAND REGISTER

; IDE status register (REGSTS) bits...
STSBSY=0200	; busy
STSRDY=0100	; device ready
STSDF= 0040	; device fault
STSDSC=0020	; device seek complete
STSDRQ=0010	; data request
STSCOR=0004	; corrected data flag
STSERR=0001	; error detected

; IDE command codes (or at least the ones we use!)...
CMDIDD=354	; identify device
CMDRDS=040	; read sectors with retry
CMDWRS=060	; write sectors with retry
CMDRCL=020	; recalibrate

;
; Bit definitions on status port
;

STAT_INIT=0002
STAT_DONE=0001
STAT_JUMPER=0010
STAT_CFDETECT=0020
STAT_CFRDY=0040

;
; DS1302 Registers
;

DS_SEC=201	; seconds (0..59)
  DS_STOP=200	;  stop the clock when set
DS_MIN=203	; minutes (0..59)
DS_HOUR=205	; hours (0..23)
DS_MDAY=207	; day of the month (1..31)
DS_MON=211	; month (1..12)
DS_WDAY=213	; weekday (1..7)
DS_YEAR=215	; year
DS_CTRL=217	; control
  DS_WPROT=200	;  write protect bit

;
; FPGA IOTs
;

FVERSION=6422
FUNLOCK=6423
FSETCON=6424
FREPROG=6425
TESTSIG=6426
TESTBUS=6427

KEY=5253

;
; Vector table locations.  Encoded as (Offset * 2) + Field_Number
;

; Field 0 vectors
VRET0F2	=  0.
VUPC	=  2.			; V User PC
VUAC	=  4.			; V User AC
VUFLAGS	=  6.			; V User Flags
VSYSIN9	=  8.
VCONOUT	= 10.
VCONIN	= 12.
VOUTCHR	= 14.
VINCHRS	= 16.
VTOCT4	= 18.
VCRLF	= 20.
VSPACMP	= 22.
VSPACM0	= 24.
VBACKUP	= 26.
VEOLTST	= 28.
VEOLNXT	= 30.
VGET	= 32.
VOCTNW	= 34.
VRANGE	= 36.
VRESTA	= 38.
VCOMERR	= 40.
VTDECNW	= 42.
VNODISK	= 44.
VTYPEIR	= 46.			; V  print the current IR
VUIR	= 48.			; V  user IR
VADDR	= 50.			; V  start address returned from RANGE
VADDRFLD= 52.			; V  start field returned from RANGE
VHIGH	= 54.			; V  end address returned from RANGE
VHIGHFLD= 56.			; V  end field returned from RANGE
VBTSTRP	= 58.			; H  CPREQ signaled
VPARMAP	= 60.			; V  partition map
VRAMBAS	= 62.			; V starting offset - 1 in each field for RAM disk
; Field 1 vectors
VRET1F2	=  1.
VFUNTBL	= 3.			; V  table of ROM functions
VCMDTBL	= 5.			; V  table of monitor commands
VDISKRD	= 7.			; H  read IDE
VDISKWR	= 9.			; H  write IDE
VDKPART	= 13.			; V  partition number for DISKRD/WR
VDKRBN	= 15.			; V  block number for DISKRD/WR
VBUFPTR	= 17.			; V  offset for DISKRD/WR
VBUFCDF	= 19.			; V  field for DISKRD/WR
VBUFPNL	= 21.			; V  memory space for DISKRD/WR
VDKSIZE	= 23.			; V  size of IDE attached drive

;
; OPR microinstructions that load the AC with various special constants...
;
NL0000=CLA			; all models
NL0001=CLA IAC         		; all models
NL0002=CLA CLL CML     RTL	; all models
NL2000=CLA CLL CML     RTR	; all models
NL3777=CLA CLL     CMA RAR	; all models
NL4000=CLA CLL CML     RAR	; all models
NL5777=CLA CLL     CMA RTR	; all models
NL7775=CLA CLL     CMA RTL	; all models
NLM3=NL7775			; all models
NL7776=CLA CLL     CMA RAL	; all models
NLM2=NL7776			; all models
NL7777=CLA         CMA		; all models
NLM1=NL7777			; all models
NL0003=CLA STL IAC RAL		; PDP-8/I and later
NL0004=CLA CLL IAC RTL		; PDP-8/I and later
NL0006=CLA STL IAC RTL		; PDP-8/I and later
NL6000=CLA STL IAC RTR		; PDP-8/I and later
NL0100=CLA IAC BSW		; PDP-8/E and later
NL0010=CLA IAC R3L		; HM6120 only

	.Title Variables
	.FIELD 3

	.ORG	0000

BTSVER:	.BLOCK	1
F0VECTOR: .BLOCK 1
F1VECTOR: .BLOCK 1
F2VECTOR: .BLOCK 1
POP0T3:	.BLOCK	1
POP1T3:	.BLOCK	1
POP2T3:	.BLOCK	1

	.ORG	0010		; autoindex variables

ARGPTR:	.BLOCK	1
F0PATCH: .BLOCK	1
F1PATCH: .BLOCK	1
F2PATCH: .BLOCK	1
AX0:	.BLOCK	1
AX1:	.BLOCK	1
AX2:	.BLOCK	1
ASCP:	.BLOCK	1		; pointer for TASCIZ

	.ORG	0020

RAMPTR:	.BLOCK 1
PUSHAC:	.BLOCK	1
DESTA:	.BLOCK	1

; pointers to BTS6120 stuff we want to have available
; these will be set up by INITVECT ...
PRESTA:	 .BLOCK	1		; monitor restart vector (field 0)
PDKSIZE: .BLOCK	1
PPARMAP: .BLOCK	1
PDKPART: .BLOCK	1
PDKRBN:	 .BLOCK	1
PBUFPTR: .BLOCK	1
PBUFCDF: .BLOCK	1
PBUFPNL: .BLOCK	1
PDISKWR: .BLOCK	1
PDISKRD: .BLOCK	1
PNODISK: .BLOCK	1
PRAMBAS: .BLOCK	1
PFUNTBL: .BLOCK 1
PUPC:	 .BLOCK 1
PUAC:	 .BLOCK 1
PUFLAGS: .BLOCK 1
; .. to here

X0:	.BLOCK	1
X1:	.BLOCK	1
X2:	.BLOCK	1
X3:	.BLOCK	1

FPGAERR: .BLOCK	1
CFSIZE:	.BLOCK	1		; 0 if not present, else MB

BUFSIZ:	.BLOCK	1
CFPART:	.BLOCK	1
CFRBN:	.BLOCK	1

RWRET:	.BLOCK	1
CFTO:	.BLOCK	2

CKINIT:	.DATA	0		; 1=present
CCSET:	.DATA	0, 0, 0		; workspace for clock set function


	.TITLE Page Zero Utility Functions

	.ORG	0100

GETV:	0
	CLL
	RAR			; low bit into Link
	SZL
	 JMP	GETV1
GETV0:	TAD	F0VECTOR	; add base
	DCA	X0		; save vector address and clear AC
	CDF_BTS0
	TAD	@X0
	CDF_HERE
	JMP	@GETV
GETV1:	TAD	F1VECTOR	; add base
	DCA	X0		; save vector address and clear AC
	CDF_BTS1
	TAD	@X0
	CDF_HERE
	JMP	@GETV

;   This two routines will allow a routine in field 3 to simulate a .PUSHJ
; to a routines in field 0 or 1. The contents of the AC are preserved both
; ways across the call.
;
;CALL:
;	JMS	PJ0F3 or PJ1F3	; cross field call "PUSHJ to 0 From 2"
;	 <addr>			; address of a routine in field 1
;	<return here>		; with the AC preserved across the call
;
PJ0F3:	0			; call here with a JMS instruction
	DCA	PUSHAC		; save the caller's AC for a minute
	CDF_HERE
	TAD	@PJ0F3		; then get caller's argument
	DCA	DESTA		; that's the address of the routine to call
	TAD	PJ0F3		; now get caller's return address
	IAC			; and skip over the argument
	.PUSH			; put that on the stack
	CLA			; (PUSH doesn't clear the AC!)
	TAD	POP0T3		; the field 0 routine will return to
	.PUSH			; ...
	CLA			; ...
	TAD	PUSHAC		; restore the original AC contents
	CXF_BTS0		; call with IF = DF = 0
	JMP	@DESTA		; and go to the code in field 0

PJ1F3:	0			; call here with a JMS instruction
	DCA	PUSHAC		; save the caller's AC for a minute
	CDF_HERE
	TAD	@PJ1F3		; then get caller's argument
	DCA	DESTA		; that's the address of the routine to call
	TAD	PJ1F3		; now get caller's return address
	IAC			; and skip over the argument
	.PUSH			; put that on the stack
	CLA			; (PUSH doesn't clear the AC!)
	TAD	POP1T3		; the field 1 routine will return to
	.PUSH			; ...
	CLA			; ...
	TAD	PUSHAC		; restore the original AC contents
	CXF_BTS1		; call with IF = DF = 1
	JMP	@DESTA		; and go to the code in field 1

	.Title Initialization
;
; Extension ROM initialization entry point.  Called with AC containing the
; number of parameter words following the call.  This code is slightly
; tricky in that it is overlaid onto the variable area, and so care must
; be taken not to set any variables at locations that have not been executed yet

; also important: this entry point is called from page 1, and the parameters
; of course are there

	; this stuff overlays the first couple of variables
	.ORG	0

	.SIXBIT	/SBC6/		; 2 word signature, soon to be overwritten
IOBIN0: 0
	JMP	@[IOBIN1]

	.PAGE	1

CHKSUM:	.BLOCK	1

; first, build the return address and set up our parameter pointer

IOBIN1:	TAD	IOBIN0		; AC=num params, so now points past end of them
	.PUSH			; ... which is our return address

	NL7777
	TAD	IOBIN0		; get start of params - 1 for autoincr
	DCA	ARGPTR

; second, copy the parameters

	TAD	@ARGPTR		; fetch version number
	DCA	BTSVER		; stash it away for now

	TAD	@ARGPTR		; fetch and save F0VECTOR
	DCA	F0VECTOR
	TAD	@ARGPTR		; fetch and save F0PATCH-1
	DCA	F0PATCH

	TAD	@ARGPTR		; fetch and save F1VECTOR
	DCA	F1VECTOR
	TAD	@ARGPTR		; fetch and save F1PATCH-1
	DCA	F1PATCH

	TAD	@ARGPTR		; fetch and save F2VECTOR
	DCA	F2VECTOR
	TAD	@ARGPTR		; fetch and save F2PATCH-1
	DCA	F2PATCH

	CDF_BTS0
	TAD	@F0VECTOR	; get 1st vector to .POPJ hook
	DCA	POP0T3		; so that we can call Field 0 routines
	CDF_BTS1
	TAD	@F1VECTOR	; get 1st vector to .POPJ hook
	DCA	POP1T3		; so that we can call Field 1 routines
	CDF_BTS2
	TAD	@F2VECTOR	; get 1st vector to .POPJ hook
	DCA	POP2T3		; so that we can call Field 2 routines

; now call the various initializations.  If anything fails, return an
; error code to BTS6120

	PRISLU			; just in case

	TAD	BTSVER		; get back the version
	TAD	[-BTSMINVERSION] ; check it against our minimum requirement
	SMA CLA
	 JMP	 IOBIN2		; okay, same or newer than that
	NL0003			; error code 0003 - bad BTS version
	JMP	XINIT

IOBIN2:
	.PUSHJ	@[INITVECT]	; link calls into BTS from this code

	CDF_BTS0		; access Field 0

	; this is intended to fix a hardware bug that clears location 0 of each
	; NVRAM during startup.
	DCA	@PRAMBAS	; set ramdisk base offset to 1 (-1 for auto-inc)

	; n.b. autoincr AX0 was set up by INITVECT to point to SYSINI9-1
	TAD	[CXF_HERE]		; set up CXF / JMP @[.+1] / INI9HOOK
	DCA	@AX0

	NL0002			; compute address of constant INI9HOOK
	TAD	AX0
	AND	[0177]		; make into a JMP @.+1
	TAD	[5600]
	DCA	@AX0

	TAD	[INI9HOOK]	; and store the address
	DCA	@AX0

	CDF_HERE

	.PUSHJ	@[INITCFC]	; initialize CF
	.PUSHJ	@[CFHOOKS]	; hook up CFC
	.PUSHJ	@[MCHOOKS]	; add ROM Monitor call extensions

	.PUSHJ	@[IFPGA]	; initialize FPGA
	SZA			; on error, return
	 JMP	 XINIT

	.PUSHJ	@[ICONS]	; initialize console

	NL0001			; successful init, return code 1

; return to our regularly scheduled initialization
XINIT:	CXF_BTS2
	.POPJ

	.PAGE

;
; IFPGA: initialize FPGA
;
IFPGA:	CLA			; set up error return
	DCA	FPGAERR		; (assume no error)

	MM3			; access IOB address space

	CDF_STATUS		; check the FPGA INIT signal
	TAD	@0
	AND	[STAT_INIT]
	SNA CLA			; if it's low,
	 JMP	 FPGAE4		; ... FPGA not ready for bitstream

; copy fields 8..31 of the ROM to the FPGA

	TAD	[-24.]		; 24 fields
	DCA	X0
	TAD	[8.]		; first DAR field
	DCA	X1
	DCA	X2		; starting at offset 0

PROGPG: CDF_STATUS		; check for early finish
	TAD	@0
	AND	[STAT_DONE]
	SZA			; if it's high,
	 JMP	 FPGADC		; ... FPGA thinks it's configured

	TAD	X1		; set ROM field
	LDAR

PROGRM:	CDF_ROM			; fetch byte from ROM
	TAD	@X2
	CDF_FPGA		; send to FPGA
	DCA	@0

	ISZ	X2		; next in field
	 JMP	 PROGRM

	ISZ	X1		; next field
	ISZ	X0		; last field?
	 JMP	 PROGPG		; no, do next field

	CDF_STATUS		; check the FPGA DONE signal
	TAD	@0
	AND	[STAT_DONE]
	SNA			; if it's low,
	 JMP	 FPGAE5		; ... bitstream did not work

; now we do a self-test using IOTs that the FPGA should now be
; implementing

; the first test uses the TESTSIG IOT to make sure that SKIP, C0, and C1
; are properly connected and behave as expected

FPGADC:	NL0001			; ping SKIP only
	TESTSIG
	 JMP	 FPGAE6		; should skip
	TAD	[-0001]		; AC should be untouched
	SZA
	 JMP	 FPGAE8

	NL0004			; ping C0 only
	TESTSIG
	 JMP	 .+2		; should be no skip
	JMP	 FPGAE6
	SZA			; AC should have been cleared
	 JMP	 FPGAE7

	NL0002			; ping C1 only
	TESTSIG
	 JMP	 .+2		; should be no skip
	JMP 	FPGAE6
	TAD	[-5252]		; 5252 should have been read
	SZA
	 JMP	 FPGAE8

; the second test uses the TESTBUS IOT to make sure that all 12 data bus
; lines are connected and behave as expected

	TAD	[4000]
BUSTST:	DCA	X1
	TAD	X1
	TESTBUS			; should return complement
	TAD	X1		; now should be 7777
	IAC
	SZA
	 JMP	 FPGAE9
	TAD	X1     		; check next bit
	RTR
	SNA			; until whole word tested
	 JMP	 BUSTST

	CLA			; everything appears OK!
	JMP	RFPGA

FPGAE9:	ISZ	FPGAERR		; bus connection failure
FPGAE8:	ISZ	FPGAERR		; C1 failure
FPGAE7:	ISZ	FPGAERR		; C0 failure
FPGAE6:	ISZ	FPGAERR		; skip failure
FPGAE5:	ISZ	FPGAERR		; DONE inactive
FPGAE4:	ISZ	FPGAERR         ; INIT signal active
	NL0003
	TAD	FPGAERR
RFPGA:	MM2
	.POPJ

; Initialize console.  If the IOT1 GAL supports changing the SBC serial address,
; and the jumper is present, swap the the VT52 and the serial port.
; We can tell if the GAL has been updated because the PRISLU IOT will also
; set AC=0.

ICONS:  STA 			; make sure AC is non-zero
	PRISLU			; reset to primary address
	SZA CLA
	 .POPJ			; return if the AC did not clear

	TAD	[KEY]		; set the VT52 to the secondary address
	FUNLOCK                 ; in case jumper was removed w/o power off
	CLA
	TAD	[SECCODE]	; => ports 36/37
	FSETCON

; clear VT52 flags
	KCC+SECPORT
	TCF+SECPORT

	MM3			; get the status port
	CDF_STATUS
	CLA
	TAD	@0
	MM2

	AND	[STAT_JUMPER]	; get the jumper
	SZA			; and if it's not installed (1)
	 .POPJ			 ; ... leave the console at the serial port

; jumper is installed, switch console to VT52

	SECSLU			; set SBC6120 serial console to 36/37
	TAD	[KEY]
	FUNLOCK
	CLA
	TAD	[PRICODE]		; set VT52 to ports 03/04
	FSETCON

; clear flags on SBC port
	KCC+SECPORT
	TCF+SECPORT

	.POPJ			; done!

	.PAGE

;
; INITVECT: copy vectors that the extension ROM needs from
; the tables found in BTS6120
;
INITVECT: TAD	[PATCHTAB-1]
	DCA	AX1
	CDF_HERE
INVE1:	TAD	@AX1
	SNA
	 .POPJ
	DCA	AX2
	TAD	@AX1
	JMS	GETV
	DCA	@AX2
	JMP	INVE1

;
; INI9HOOK: BTS6120 will jump here once it has done its basic
; initialization and printed the banner and device information.
; It will do this because the first phase of IOB initialization
; patched in a jump to here.
;
INI9HOOK:
	CDF_HERE
	.PUSHJ	@[FIXCFC]
	
	CLA
	TAD	[CFCMSG-1]	; say
	.PUSHJ	@[TASCIZ]	; "CFC: "

	TAD	CFSIZE		; check size
	SZA
	 JMP	 SHOWCF
	TAD	[CNPMSG-1]	; say "No CF Card"
	JMP	CFEMG

SHOWCF:	JMS	PJ0F3
PTDEC:	0
	TAD	[CSZMSG-1]	; say
	.PUSHJ	@[TASCIZ]	; "MB - "

	DCA	@[SECBUF+94.]	; make ID string ASCIZ
	TAD	[SECBUF+54.-1]	; and print it

CFEMG:	.PUSHJ	@[TASCIZ]
	.PUSHJ	@[TCRLF]

	CLA			; is the FPGA alive?
	TAD	FPGAERR
	SZA
	 JMP	INI9B		; no, only perform inits that don't use it

	TAD	[SAMSG-1]	; say
	.PUSHJ	@[TASCIZ]	; "IOB: ROM V"
	TAD	[VERSION]
	JMS	PJ0F3		; then the version
PTOCT4:	0
	TAD	[S2MSG-1]	; say
	.PUSHJ	@[TASCIZ]	; ", FPGA V"
	FVERSION		; IOT to get FPGA version
	JMS	PJ0F3		; and print that
PTOCT4B: 0
	.PUSHJ	@[TCRLF]

	.PUSHJ	@[INITCC]	; check for/init the clock/calendar
	SPA SNA CLA		; skip if AC > 0, clear AC
	 JMP	 NOCCP		 ; -1 or 0, not present

	.PUSHJ	@[HOOKCMDS]	; add DA command, H hook

	TAD	[CCPMSG-1]	; say
	.PUSHJ	@[TASCIZ]	; "C/C: "
	.PUSHJ	@[DSPCC]	; then the date/time
	.PUSHJ	@[TCRLF]
NOCCP:

	;*** add other FPGA-related inits here ***

INI9B:	ISZ	PRESTA		; since it's a hook, the stored value is x-1
	CXF_BTS0		; but we just want to use it as a jmp vector
	JMP	@PRESTA		; and start the monitor

;
; TCRLF: print a newline
;
TCRLF:	JMS	PJ0F3
PCRLF:	0			; patched with BTS6120 CRLF routine
	.POPJ

;
; TASCIZ: print an ASCII string terminated by 0
;
TASCIZ:	DCA	ASCP		; save the pointer to the string
TASCI1:	TAD	@ASCP		; and get the first character
	SNA			; is this the end of the string ??
	 .POPJ 			; yes -- quit now
	JMS	PJ0F3		; no -- type this character
POUTCHR: 0			; patched with BTS6120 print char routine
	JMP	TASCI1		; and then loop until the end

	.PAGE
;
; CFHOOKS: intercept DISKRD and DISKWR so that we can seamlessly
; access the CF card via a partition number mapping
;
CFHOOKS:
	CDF_BTS1

	CLA
	TAD	PDISKRD
	DCA	AX0
	TAD	[DISKRDHOOK]
	.PUSHJ	INTCPT
	DCA	PDISKRD

	TAD	PDISKWR
	DCA	AX0
	TAD	[DISKWRHOOK]
	.PUSHJ	INTCPT
	DCA	PDISKWR

; Also disable NODISK so that we can do our own checking
; otherwise the BTS6120 disk commands would balk if there
; was no IDE drive installed. It would be nice if we could
; check here, but NODISK is called before the partition
; number has been parsed.

	CDF_BTS0

	TAD	PNODISK
	DCA	AX0
	TAD	[CLA CLL]
	DCA	@AX0
	TAD	[6225] ; [.POPJ]
	DCA	@AX0

	CDF_HERE
	.POPJ

;
; INTCPT: patch one routine that has 3 words at AX0+1 with the address in AC
;
INTCPT:	.PUSH
	CLA
	TAD	[CIF_HERE]	; set up CIF / JMP @[.+1] / <AC>
	DCA	@AX0

	NL0002			; compute address of constant
	TAD	AX0
	AND	[0177]		; make into a JMP @.+1
	TAD	[5600]
	DCA	@AX0

	.POP			; and store the address
	DCA	@AX0

	TAD	AX0		; and return next code address
	IAC
	.POPJ

	.PAGE

;
; INITCFC: check for a drive.  This is only used at startup to print
; a nice message, really, since it's also allowed to hot-plug a CF
; card.
;

INITCFC:
	CLA			; start out assuming that it's not present

	DCA	CFSIZE
	DCA	CFPART		; zero partition and block
	DCA	CFRBN

	JMS	@[CFRW]		; call the generic CF I/O routine
	CMDIDD			; with the IDE identify command
	RDTRANS			; and the Read loop

	SZL			; successful?
	 .POPJ			;  no - could not identify

	NLM2			; aka [-2]
	TAD	@[SECBUF+10.]	; make sure sector size is 512
	SZA
	 .POPJ

;   Drives report the total number of LBA addressable sectors in words
; 60 and 61.  Sectors are 512 bytes, so simply dividing this value by 2048
; gives us the total drive size in Mb.  This code patches together twelve
; bits out of the middle of this doubleword, after throwing away the least
; significant 11 bits to divide by 2048.  This allows us to determine the
; size of drives up to 4Gb in a single 12 bit word.
	TAD	@[SECBUF+120.]	; get the high byte of the low word
	RAR			; throw away the 3 least significant
	RTR			; ...
	AND	[37]		; keep just 5 bits from this byte
	DCA	CFSIZE		; save it for a minute
	TAD	@[SECBUF+123.]	; get the low byte of the high word
	RTL			; left justify the seven MSBs of it
	RTL			; ...
	RAL			; ...
	AND	[7740]		; ...
	TAD	CFSIZE		; put together all twelve bits
	DCA	CFSIZE

	.POPJ

; This is a bit of a kludge.  Some CF cards are confused by the probe
; that BTS6120 does for RAM disk RAMs.  So we reset the CF card's error
; register if it is installed _after_ the ramdisk test.

FIXCFC:	CLA
	TAD	CFSIZE
	SNA CLA
	 .POPJ

	MM3
	CDF_CF

	JMS	@[WTRDY]
	TAD	[CMDRCL]
	DCA	@[CF_CMD]

	CDF_HERE
	MM2

	.POPJ

	.TITLE Disk Read and Write
;
; DISKRDHOOK: all calls to DISKRD in BTS6120 come here instead.  Here we
; either return to the original IDE code or use the new CF code, depending
; on the partition number.  If a call is made on a non-existent IDE drive,
; we return an error code rather than bombing out to the monitor as used to
; happen.  That was based on the idea that if you had booted, you knew
; that a drive must exist.  Now, there is hot plugging and there is also
; the possibility of booting from one drive and trying to access the other,
; so an error return is preferable.
; n.b. note that the method of storing 12-bit words in 2 8-bit bytes is
; defined by BTS6120 so that we can interoperate with the IDE drive,
; for example copying partitions to and fro. 
;
DISKRDHOOK:
	DCA	BUFSIZ		; save size
	CLA CLL
	TAD	@PDKPART	; get partition and see if it's
	TAD	[-CFPARITION]	; in the CF zone
	SNL
	 JMP	 IDERD		; nope, must be for SBC IDE

	DCA	CFPART		; save partition number on CF

	TAD	@PDKRBN
	DCA	CFRBN

	JMS	@[CFRW]		; call generic CF I/O routine
	CMDRDS			; with IDE read command
	RDTRANS			; and read loop

	SZL			; error?
	 JMP	 DRDXIT		 ; yes - could not read

; we have a sector in SECBUF, now assemble words from it into the destination

	CDF_BTS1

	TAD	[SECBUF-1]	; from the sector buffer
	DCA	AX0

	TAD	@PBUFPTR	; to the passed-in destination
	DCA	AX1

	TAD	@PBUFCDF	; in the passed-in field
	DCA	CDFRD

	TAD	@PBUFPNL	; and the passed in main/panel space
	IAC
	SNA
	 TAD	 [SPD-CPD+1]	; make CPD or SPD from it
	TAD	[CPD-1]
	DCA	RDPD

	CDF_HERE
RDXFR:	TAD	@AX0		; make words from the bytes in the buffer
	BSW
	CLL RTL
	TAD	@AX0
CDFRD:	0
RDPD:	0
	DCA	@AX1		; and store them in the user's buffer
	SPD
	CDF_HERE
	ISZ	BUFSIZ
	 JMP	 RDXFR

	CDF_BTS1
	TAD	AX1		; update the output pointer
	DCA	@PBUFPTR	; for multi-block reads

	CLA CLL			; and return OK
DRDXIT:	CXF_BTS1
	.POPJ

IDERD:	CLA			; make sure an IDE drive exists
	TAD	@PDKSIZE
	SNA CLA
	 JMP	 @[NODISK]	; no, size was 0

	TAD	BUFSIZ		; chain to the original BTS6120
	CXF_BTS1		; DISKRD
	JMP	@PDISKRD

; RDTRANS: low-level read loop from CF to SECBUF
RDTRANS: 0
RDLP:	MM3
	CDF_CF
	TAD	@[CF_DATA]	; flip bytes as they come in
	MQL			; due to the way the CF 8-bit
	TAD	@[CF_DATA]	; interface works
	MM2
	CDF_HERE
	DCA	@RAMPTR
	ISZ	RAMPTR
	MQA
	DCA	@RAMPTR
	ISZ	RAMPTR
	 JMP	 RDLP
	JMP	@RDTRANS

	.PAGE

;
; DISKRDHOOK: all calls to DISKWE in BTS6120 come here instead.  All
; the discussion about DISKRD applies here too.
;
DISKWRHOOK:
	DCA	BUFSIZ		; save size
	CLA CLL
	TAD	@PDKPART	; get partition and see if it's
	TAD	[-CFPARITION]	; in the CF zone
	SNL
	 JMP	 IDEWR		; nope, must be for SBC IDE

	DCA	CFPART		; save partition number on CF

	TAD	@PDKRBN
	DCA	CFRBN

; we want to assemble a sector in SECBUF from words in the source buffer

	CDF_BTS1

	TAD	@PBUFPTR	; from the user buffer
	DCA	AX0

	TAD	@PBUFCDF	; in the user field
	DCA	WRXFR

	TAD	@PBUFPNL	; in the user memory area (panel/main)
	IAC
	SNA
	 TAD	 [SPD-CPD+1]
	TAD	[CPD-1]
	DCA	WRPD

	TAD	[SECBUF-1]	; to the sector buffer
	DCA	AX1

WRXFR:	0
WRPD:	0
	TAD	@AX0		; get the buffer word
	MQL
	SPD
	CDF_HERE
	MQA
	BSW
	RTR
	AND	[17]
	DCA	@AX1		; and break it into bytes
	MQA
	DCA	@AX1
	ISZ	BUFSIZ
	 JMP	 WRXFR

	CDF_BTS1
	TAD	AX0		; update the destination pointer
	DCA	@PBUFPTR	; for multi-block writes

	JMS	@[CFRW]		; call the generic CF I/O routine
	CMDWRS			; with the write sector command
	WRTRANS			; and the write loop

DWRXIT:	CXF_BTS1		; and return status returned from CFRW
	.POPJ

IDEWR:	CLA			; make sure an IDE drive exists
	TAD	@PDKSIZE
	SZA CLA
	 JMP	 HAVWDSK	 ; yes, size was non-zero

NODISK:	STA STL			; no, return -1 error
	CXF_BTS1
	.POPJ

HAVWDSK:TAD	BUFSIZ		; chain to the original BTS6120
	CXF_BTS1		; DISKWR
	JMP	@PDISKWR

; WRTRANS: write loop from SECBUF to the CF card
WRTRANS: 0
WRLP:	TAD	@RAMPTR		; reverse byte order during
	MQL			; transfer to match 8-bit access
	ISZ	RAMPTR		; method
	TAD	@RAMPTR
	MM3
	CDF_CF
	DCA	@[CF_DATA]
	MQA
	DCA	@[CF_DATA]
	MM2
	CDF_HERE
	ISZ	RAMPTR
	 JMP	WRLP
	JMP	@WRTRANS

	.PAGE

; CFRW: generic CF driver code.
;   entry: JMS, CFPART, CFRBN
;	inline parameters:
;	  Command	CF (IDE) command
;	  Handler	routine (JMS) to call for sector transfer
;			  called with SPD / MM2 / CDF_HERE
;			  should return with same
;   exit: L=AC=0 on success, L=1 AC=code on error

CFRW:	0			; call w/ JMS, follow by cmd, transfer vector

	NL0002			; get return address
	TAD	CFRW
	DCA	RWRET

; make sure a card is present

	MM3			; access status port
	CDF_STATUS

	TAD	@[0]
	AND	[STAT_CFDETECT]	; check the CF insert line
	SNA
	 JMP	HAVECF
	NL7777			; Error 7777 - no CF card
	JMP	RWERR1

; wait for CF ready

HAVECF:	CDF_CF
	TAD	[-200.]
	DCA	CFTO+1
	DCA	CFTO		; init timeout counter
WTRDY1:	TAD	@[CF_STAT]
	AND	[STSRDY+STSBSY]	; test the RDY & BSY flags
	TAD	[-STSRDY]	; wait for RDY set and BSY clear
	SNA CLA			; well?
	 JMP	 RDY1		 ; yes, ready!

	ISZ	CFTO
	 JMP	 WTRDY1
	ISZ	CFTO+1
	 JMP	 WTRDY1

	NLM2
	JMP	RWERR1
RDY1:				; set LBA
	TAD	CFRBN		; get the lower 12 bits of of the LBA
	DCA	@[CF_LB0]	; set the low LBA byte to b0..b7
	TAD	CFRBN		; get it again
	BSW			; shift right eight bits
	RTR			; so that b8..b11 are in b0..b3
	AND	[17]		; isolate them
	MQL			; save temporarily
	TAD	CFPART		; get the disk partition number
	AND	[17]		; isoloate the 4 lsb's
	CLL RTL			; shift them up into the 4 msb's
	RTL			; ...
	MQA			; and combine with the 4 msb's of the block
	JMS	WTRDY
	DCA	@[CF_LB1]	; set the middle LBA byte to that

	TAD	CFPART		; get the disk partition number again
	RTR			; get the 8 msb's into b0..b7
	RTR			; ...
	JMS	WTRDY
	DCA	@[CF_LB2]	; and store as the high LBA byte

	TAD	[340]		; select the master drive, 512 byte sectors,
	JMS	WTRDY
	DCA	@[CF_LB3]	; LBA mode, and store in highest LBA byte
	; there are more block number bits in there, but we can't use them

	NL0001			; read or write 1 sector only
	JMS	WTRDY
	DCA	@[CF_CNT]

; issue command

	MM2
	CDF_HERE
	TAD	@CFRW		; get the command
	MM3
	CDF_CF
	JMS	WTRDY
	DCA	@[CF_CMD]	; issue it

; wait for DRQ

WTDRQ1:	TAD	@[CF_STAT]
	CLL RAR			; test the error bit (AC11)
	SZL			;
	 JMP	 RWERR
	RAL			; no - restore the original status value
	AND	[STSDRQ+STSBSY]	; and test the DRQ and BSY flags
	TAD	[-STSDRQ]	; wait for DRQ set and BSY clear
	SZA CLA			; well?
	 JMP	 WTDRQ1		 ; no, no data is waiting or waited for

; call transfer loop

HAVEDRQ: TAD	[SECBUF]
	DCA	RAMPTR

	MM2
	CDF_HERE
	ISZ	CFRW		; point to transfer function vector
	TAD	@CFRW
	DCA	CFRW
	JMS	@CFRW		; and call it

; wait for ready again (important for write, but doesn't hurt read)

	MM3
	CDF_CF
WTRDY2:	TAD	@[CF_STAT]
	CLL RAR			; test the error bit (AC11)
	SZL			;
	 JMP	 RWERR
	RAL			; no - restore the original status value
	AND	[STSRDY+STSBSY]	; and test the BUSY and RDY flags
	TAD	[-STSRDY]	; wait for RDY/DSC set and BSY/DRQ clear
	SZA CLA			; well?
	 JMP	 WTRDY2		; no, not yet

	CLA CLL			; everything ok
RWRET0:	MM2
	CDF_HERE
	JMP	@RWRET

RWERR:	CLA
	TAD	@[CF_ERR]	; get error code
RWERR1:	STL			; there was an error - AC is code
	JMP	RWRET0

WTRDY:	0
	.PUSH
	CLA
LPWR:	TAD	@[CF_STAT]
	AND	[STSRDY+STSBSY]	; test the RDY flag
	TAD	[-STSRDY]
	SZA
	 JMP	 LPWR
	.POP
	JMP	@WTRDY


	.TITLE Command Extensions
	.PAGE

; HOOKCMDS: extend the BTS6120 commands.
; This function does 2 things:
;  1. Hooks the H command vector so that Help can be extended
;  2. Add new commands at the end of the command list

HOOKCMDS:
	CLA
	TAD	BTSHELP		; INITVECT put CMDTBL here
	DCA	X1		; now pointing at H(elp) entry

	CDF_BTS1
	ISZ	BTSHELP		; 1. move ptr to vector part
	TAD	@BTSHELP	; get current vector
	DCA	BTSHELP		; and save it

	TAD	[IOBHELP]	; change to our new Help implementation
	.PUSHJ	@[PATCHCMD]

EMPCMD: ISZ	X1		; search table for empty slots at end
	ISZ	X1
	TAD	@X1		; get cmd text
	SZA CLA			; 0 indicates end
	 JMP	 EMPCMD

	TAD	[NEWCMDS-1]
	DCA	AX1

ADDCMD: CDF_HERE
	TAD	@AX1		; get command text
	SNA			; end of list?
	 .POPJ			 ; yes - return
	CDF_BTS1
	DCA	@X1		; store in command table
	CDF_HERE
	TAD	@AX1		; and hook in implementation
	.PUSHJ	PATCHCMD
	JMP	ADDCMD

NEWCMDS:
	.SIXBIT	/DA/
	CMDDA
	0

; PATCHCMD: generates a stub function in the BTS6120 Field 0 patch area.
; Used to add commands to CMDTBL.
; Inputs:
;	AC 	Field 2 function to be jumped to
;	X1      pointer in current field. [pointer+1] will be set to the stub
;		address.
; Outputs:
;	X1	incremented by 2
; Side effects:
;	F0PATCH	3 words used
;	DF=1
;	AC=0

PATCHCMD:
	.PUSH			; save the function address
	ISZ	X1		; move pointer to cmd vector part
	NL0002			; generate address of stub in patch area
	TAD	F0PATCH		; note that commands are in Field 0 even though
	CDF_BTS1
	DCA	@X1		; the table is in Field 1.
	ISZ	X1		; move pointer to next cmd string part
	.POP

	CDF_BTS0
	DCA	@F0PATCH	; store function address in patch area
	TAD	[CXF_HERE]	; stub starts with CXF 2
	DCA	@F0PATCH
	NLM1            	; then a jump through the function address,
	TAD	F0PATCH		; which is 2 back (but now 1 because of preincr)
	AND	[177]		; make into a JMP @
	TAD	[5600]
	DCA	@F0PATCH	; and add to stub
	CDF_BTS1
	.POPJ

; DA Command - display or set date and time
;	DA			display date/time
;	DA mm/dd/yy hh:mm:ss	set date/time
;	  (format can be changed by editing the CTDTB table)
;

CMDDA:	JMS	PJ0F3		; get the next character
PSPACMP: 0
	SNA CLA			; is it the end of line?
	 JMP	 DSPTD		 ; yes - just print date

	JMS	PJ0F3		; backup input pointer so GET gets first
PBACKUP: 0			; parameter character

	JMS	@[CCRMW]	; unprotect clock registers
	 CNOWP			;
	JMS	@[CCRMW]	; stop the clock so that race conditions
	 CSTOP			; don't mess us up

	TAD	[CTDTB-1]	; point to start of format table
	DCA	AX2

; process next digit group
NXTDG:	TAD	@AX2		; get the register address
	SNA
	 JMP	 XITCC
	DCA	CCSET		; save it in parameter block
	TAD	@AX2		; get separator character
	JMS	@[PRSBCD]	; parse a number
	SZL			; error?
	 JMP	 XITCC		 ; yes - continue
	DCA	CCSET+2		; finish parameter block
	JMS	@[CCRMW]	; update the register
	 CCSET			; n.b. the clock will be started when writing
				; the seconds register because b7=0
	JMP	NXTDG		; do next group

XITCC:	JMS	CCOK

DSPTD:	TAD	[TDMSG-1]
	.PUSHJ	@[TASCIZ]
	.PUSHJ	@[DSPCC]
	.PUSHJ	@[TCRLF]
	CXF_BTS0
	.POPJ

CCOK:	0
	JMS	@[CCRMW]	; just in case of error
	 CSTRT
	JMS	@[CCRMW]	; protect clock registers
	 CWP			; and fall through into display
	JMP	@CCOK

BTSHELP: 0

; IOBHELP: Replacement Help command.  First calls the original, then
; prints our new help texts.

IOBHELP:
	TAD	BTSHELP		; get original help routine
	DCA	BTSHLP2
	JMS	PJ0F3		; and call it
BTSHLP2: 0

	TAD	[HLPLST-1]	; point to the list of help messages
	DCA	AX2		; in an auto index register
HLPLP:	TAD	@AX2		; get the next help message
	SNA			; end of list?
	 JMP	 HLPDN		; yes - we can quit now
	.PUSHJ	@[TASCIZ]
	.PUSHJ	@[TCRLF]	; and finish the line
	JMP	HLPLP		; keep typing until we run out of strings
HLPDN:	CXF	0		; and return to command interpreter
	.POPJ

	.TITLE Clock/Calendar Support
	.PAGE

CCCM=6140
CCSF=6141
CCWD=6142
CCRD=6143

; INITCC: check for a clock/calendar chip, initialize it if found

INITCC:	JMS	CCRMW		; clear write protect
	 CNOWP

	JMS     CCRMW		; write test value
	 CCTEST
	TAD	@[CCTEST+0]	; get the register
	CCCM			; issue command
	CCSF			; and wait for FPGA to process it
	 JMP .-1
	CCRD			; get the data
	CIA
	TAD	@[CCTEST+2]	; compare to the written value
	SZA CLA			; did it match?
	 .POPJ			 ; no, return 0

	JMS	@[CCOK]		; start and WP

	ISZ	CKINIT		; set flag to 1 = "present"
	NL0001			; return 1
	.POPJ

; DISPCC: display the date and time, then CR, LF

DSPCC:	CLA
	TAD     [CTDTB-1]
	DCA	AX1
	JMP	TIMLP
TPRF:	.PUSHJ	COUT
TIMLP:	TAD	@AX1
	CCCM
	CCSF			; wait for ready
	 JMP .-1
	CCRD
	.PUSHJ	TBCD2
	TAD	@AX1
	SZA
	 JMP	 TPRF
	.POPJ

TBCD2:	.PUSH
	RTR
	RTR
	.PUSHJ	COUTD
	.POP
COUTD:	AND	[17]
	TAD	["0"]
COUT:	JMS	PJ0F3
POUTC1:	 0
	.POPJ

CCRMW:	0
	NLM1			; correction for auto-incr
	TAD	@CCRMW		; get arg ptr
	DCA	AX1		; and put in auto-incr
	ISZ	CCRMW		; skip arg on return

	TAD	@AX1		; get the register
	.PUSH			; save a copy
	CCCM			; issue command
	CCSF			; and wait for FPGA to process it
	 JMP .-1
	CCRD			; get the data
	AND	@AX1		; mask ..
	TAD	@AX1		; .. and set
	CCWD			; put it in output register
	.POP			; get command back
	AND	[0376]		; change to a write
	CCCM			; issue it
	CCSF			; and wait for FPGA to process it
	 JMP .-1

	CLA
	JMP	@CCRMW

; PRSBCD - parse the sequence {digit}[{digit}]{terminator} from input
PRSBCD:	0
	CIA
	DCA	X2		; save -terminator
	JMS	NEXT		; get first digit (must be digit)
	JMS	DIGIT
	MQL			; save it in MQ
	JMS	NEXT		; get terminator or next digit
	.PUSH
	TAD	X2		; compare to terminator
	SNA			; matched?
	 JMP	 TERM		 ; yes - return one digit in 1's position
	ACL			; put 1st digit into 10's position
	CLL RTL
	RTL
	MQL
	.POP			; recover current character
	JMS	DIGIT		; and convert to binary
	MQA			; combine with 10's
	MQL			; save it for a moment
	JMS	NEXT		; get what should be the terminator
	TAD	X2		; compare to expected terminator
	SZA			; matched?
	 JMP	 DIGERR		 ; no - error
	SKP
TERM:	.POP
	ACL			; get back the value
	CLL			; no error
	JMP	@PRSBCD

NEXT:	0
	JMS	PJ0F3
PGET:	0			; get next character from input
	JMP	@NEXT

DIGIT:	0
	TAD	[-"0"]		; change to binary
	SPA			; was it before "0"?
	 JMP	 DIGERR		 ; yes, error
	.PUSH			; save it temporarily
	TAD	[-10.]		; was it above "9"?
	SNA
	 JMP	DIGERR		 ; yes, error
	.POP			; restore binary value
	JMP	@DIGIT

DIGERR:	CLA
	TAD	[DIGMSG-1]
	.PUSHJ	@[TASCIZ]
	.PUSHJ	@[TCRLF]
	STL			; error
	JMP	@PRSBCD

	.PAGE
	.TITLE	Add IOB6120 Monitor Functions to BTS6120


;   This routine will add the IOB6120 specific monitor calls to the regular
; BTS6120 ROM monitor call function table...
;
MCHOOKS:
	TAD	PFUNTBL		; get the address of BTS6120's FUNTBL
	TAD	[13]		; the first slot reserved for IOB6120 is 13
	DCA	PFUNTBL		; ...
	TAD	[GETCFS]	; function 13 -> Get CompactFlash Size
	.PUSHJ	ADDMCALL	;  ... patch it into BTS6120
	TAD	[RTODS]		; function 14 -> Read Time of Day clock
	.PUSHJ	ADDMCALL	;  ...
	TAD	[STODS]		; function 15 -> Set Time of Day clock
	.PUSHJ	ADDMCALL	; ...
	.POPJ			; and that's all
	.TITLE	Add Monitor Call Hook


;   BTS6120 requires all monitor calls to be in field 1, so this routine
; will generate a three word "stub" in the field 1 patch area which calls
; a field 3 routine.
;
;CALL:
;	AC/ address of field 3 function to be called
;	PFUNTBL/ pointer to BTS6120 FUNTBL in field 1.
;	         [pointer] will be set to the address of the stub
;	F1PATCH/ address -1 of field 1 patch space
;       PFUNTBL will be incremented by 1 on return
;	F1PATCH will be incremented by three
;
ADDMCALL:
	.PUSH			; save the field 3 MCALL address

; Store a pointer to the patch space in the monitor function table...
	CDF	1		; FUNTBL and F1PATCH are both in field 1
	NL0001			; get the address of the patch space
	TAD	F1PATCH		; ...
	DCA	@PFUNTBL	; store it in the FUNTBL
	ISZ	PFUNTBL		; move PFUNTBL to the next MCALL slot

; Now construct a CXF/JMP @.+1/ADDRESS sequence in the field 1 patch space.
	TAD	[CXF_HERE]	; stub starts with CXF 3
	DCA	@F1PATCH	; store and increment F1PATCH
	NL0002			; F1PATCH still points to the CXF instruction
	TAD	F1PATCH		;  ... so compute that address +2
	AND	[177]		; make it into an indirect jump
	TAD	[5600]		; ...
	DCA	@F1PATCH	; and add to stub
	.POP			; get back the field 3 MCALL address
	DCA	@F1PATCH	; put that in the last word
	CDF_HERE		; back to our local field
	.POPJ			; and finally we're all done
	.TITLE	Fetch PR0 Arguments


;   This routine fetches an argument for PR0 from the main memory program.
; Since arguments are always stored in line after the PR0, the next argument
; is in the instruction field and pointed to by the last main memory PC.
; After the argument is fetched the main memory PC is always incremented so
; that we'll skip over the argument when we return - you have to be careful
; about this, since it means this routine can only be called ONCE to fetch
; any given argument!  The PR0 argument is returned in the AC.
GETARG:	CLA
	CDF_BTS0		; BEWARE - UFLAGS and UPC are both in field 0!
	TAD	@PUPC		; get the user's PC from field 0
	DCA	X0		; save it in field 1 for a moment
	ISZ	@PUPC		; and increment it to skip over the argument
	 NOP			;  this really shouldn't ever happen!
	TAD	@PUFLAGS	; get the last known user (main memory) flags
	AND	[70]		; then get the IF at the time of the trap
	TAD	[CDF 0]		; make a CDF instruction
	DCA	.+1		; change to the correct field
	 NOP			; ... gets overwritten with a CDF ...
	CPD			; always fetch from main memory
	TAD	@X0		; get the next word from user program space
	SPD			; back to panel memory
	CDF_HERE		; and back to our field
	.POPJ			; return the PR0 argument in the AC
	.TITLE	Get IDE Disk Size ROM Call


;   The get IDE disk size call will return the size of the attached IDE/ATA
; disk, in megabytes.  This call never fails - if no disk is attached it
; simply returns zero...
;
;CALL:
;	PR0		/ call SBC6120 ROM firmware
;	 13		/ subfunction for get CompactFlash size
;	<return here with CF size, in megabytes, in AC.
;	 The "magic number" offset for the first CF partition, in the MQ.>
;
GETCFS:	CLA CLL			; ignore anything in the AC
	TAD	CFSIZE		; and return the disk size
	CXF_BTS1		; return to the MCALL processor in field 1
	.POPJ			; that's all there is to it!

	.PAGE
	.TITLE	Read Time of Day Clock


;   The RTODC (read Time of Day clock) will read the DS1302 clock/calendar
; and store the current date and time in the caller's buffer.  Note that
; although the DS1302 returns all values in BCD, this routine will convert
; them to pure binary before storing them in the buffer.
;
;CALL:
;	PR0		/ call SBC6120 ROM firmware
;	 14		/ subfunction for read Time of Day clock
;	 CDF buffer	/ point to the buffer field
;	 buffer		/ and the address of the buffer
;	<return with the LINK clear if no errors>
;
;buffer/ ....		/ receives the current year (e.g. 2003)
;	 ....		/ receives the current month, 1..12
;	 ....		/ receives the current day of the month, 1..31
;	 ....		/ receives the current hour, 0..23
;	 ....		/ receives the current minute, 0..59
;	 ....		/ receives the current second, 0..59
;
;   Note that BTS6120 will return with the LINK set and the AC cleared
; for this function if the IOB6120 is not installed, and this routine
; will return with the LINK set and the AC = -1 if the TOD is not installed.
; In either case, the LINK set indicates an error but an interested caller
; can differentiate these two possibilities.
;
RTODS:	.PUSHJ	@[GETARG]	; get the caller's first argument
	AND	[0070]		; and make sure it's really a CDF
	TAD	[CDF 0]		;  ... instruction!
	DCA	RTSCDF		; save that for storing return values
	.PUSHJ	@[GETARG]	; get the buffer address
	TAD	[-1]		; correct for pre-incrementing AI registers
	DCA	AX1		; and store that
	TAD	CKINIT		; get the clock status flag
	SZA CLA			; is a clock chip installed at all?
	 JMP	 RTODS1		; yes - go read it
	CLA CLL CMA CML		; no - return with the link set and AC = -1
	JMP	RTOD99		; and return now

; Read and return the current clock registers...
RTODS1:	JMS	RDCLKR		; first read the year
	 DS_YEAR		; ... DS1302 register for the year

;  Now fix up the year to be pseudo-Y2K compliant.  Basically, if the year
; is less than 60 we assume that the century is 2000, and if the year is
; after 60 it's 1900.  I can't help but wonder if the SBC6120 will survive
; until 2061 for someone to curse my memory for this, but I certainly won't
; be around to be held accountable for it!
	TAD	[-60.]		; is the year less than 60?
	SPA			; skip if yes
	 TAD	 [100.]		; no - assume 2000
	TAD	[1960.]		; yes - assume 1900 and restore the original
	JMS	RTSTOR		; store it in the buffer

; The remaining fields are easier...
	JMS	RDCLKR		; next the month
	 DS_MON
	JMS	RTSTOR		; ...
	JMS	RDCLKR		; the day of the month
	 DS_MDAY
	JMS	RTSTOR		; ...
	JMS	RDCLKR		; hour
	 DS_HOUR
	JMS	RTSTOR		; ...
	JMS	RDCLKR		; minute
	 DS_MIN
	JMS	RTSTOR		; ...
	JMS	RDCLKR		; and, lastly, seconds
	 DS_SEC
	JMS	RTSTOR		; ...
	CLA CLL			; give the success return

; All done...
RTOD99:	CXF_BTS1		; return to the MCALL processor in field 1
	.POPJ			; that's all there is to it!

; This little routine will store a word in the caller's buffer...
RTSTOR:	0
RTSCDF:	CDF	0		; gets overwritten by a "CDF buffer"
	CPD			; address main memory
	DCA	@AX1		; store the word
	CDF_HERE		; back to our field
	SPD			; and address panel memory
	JMP	@RTSTOR		; and return to the caller
	.TITLE	Read a TOD Clock Register (in Binary!)


;   This routine will read a DS1302 clock register and convert the resulting
; value from BCD into pure binary...
;
;CALL:
;	JMS	RDCLKR		; read it
;	 <register>
;	<return here with 8 bit value in binary!>
;
RDCLKR:	0
	TAD	@RDCLKR		; get the register to read
	ISZ	RDCLKR		; and skip over it when we return
	CCCM			; send the address to the clock
	CCSF			; and then wait for it to be ready
	 JMP	 .-1		; ....
	CCRD			; then read the register value
	DCA	CCDIG1		; save the result for a minute
	TAD	CCDIG1		; get it back again
	CLL RTR			; position the upper BCD digit
	CLL RTR			; ....
	AND	[17]		; trim it to just that
	DCA	CCDIG2		; save that digit for a minute
	TAD	CCDIG2		; multiply by ten
	CLL RTL			; by computing 10x = 2*(4*X + X)
	TAD	CCDIG2		; ...
	RAL			; ...
	DCA	CCDIG2		; save that for a minute
	TAD	CCDIG1		; get the low order digit
	AND	[17]		; trim it
	TAD	CCDIG2		; and put them together
	JMP	@RDCLKR		; all done
	

; Temporary storage for RDCLKR...
CCDIG1:	.BLOCK	1			; first (low) BCD digit
CCDIG2:	.BLOCK	1		; second (high) BCD digit
	.TITLE	Write a TOD Clock Register (in Binary!)


;   This routine will write a DS1302 clock register after first converting
; the value from binary into BCD...  It automatically range checks the value
; as part of converting it to BCD (e.g. 0..23 for hours, 1..31 for the month,
; etc) if if the user's value is illegal it will take the skip return.
;
;CALL:
;	TAD	[<desired register value, in binary>]
;	JMS	WRCLKR		; write a register
;	 <register number>
;	 <maximum value>
; 	 <return here if illegal BCD value>
;	<normal return here>
;
WRCLKR:	0
	DCA	CCDIG1		; save the value for a moment
	TAD	@WRCLKR		; get the max value
	ISZ	WRCLKR		; (skip it when we return)
	CLL CMA			; make it negative and add one
	TAD	CCDIG1		; and compare to the caller's value
	SMA CLA			; ???
	 JMP	 WRCL99		; no - take the non-skip return

; Crudely divide the value by ten to get the MSD...
	DCA	CCDIG2		; keep count here
WRCLK1:	TAD	CCDIG1		; get the value again
	TAD	[-10.]		; and subtract ten
	SPA			; did it fit?
	 JMP 	 WRCLK2		; no - we're done now
	DCA	CCDIG1		; yes, save the remainder
	ISZ	CCDIG2		; and increment the quotient
	JMP	WRCLK1		; keep doing it 

; Here when we're done dividing...
WRCLK2:	CLA			; ...
	TAD	CCDIG2		; get the high order BCD digit
	CLL RTL			; shift it left four bits
	RTL			; ...
	TAD	CCDIG1		; and add the LSD
	DCA	CCSET+2		; save the value to set
	DCA	CCSET+1		; clear the mask for writing
	TAD	@WRCLKR		; get the register address from the caller
	DCA	CCSET		; and store that too
	JMS	@[CCRMW]	; finally we can go write the clock
	 CCSET			; ...

; Here to return...
	ISZ	WRCLKR		; skip once to skip the register address
WRCL99:	ISZ	WRCLKR		; and again to signify success
	JMP	@WRCLKR		; all done

	.PAGE
	.TITLE	Set Time of Day Clock


;   The STODC (read Time of Day clock) will set the DS1302 clock/calendar
; from a buffer passed by the caller.  This allows (or would allow, if
; somebody wrote the necessary OS?8 software!) the OS/8 DATE command to
; update the hardware clock.  Note that this call is somewhat unique in
; that the AC must contain a special key value - this prevents an errant
; program from accidentally executing this ROM call and unintentionally
; corrupting the TOD clock.
;
;CALL:
;	TAD	(1302	/ special key (MUST BE 1302)
;	PR0		/ call SBC6120 ROM firmware
;	 15		/ subfunction for set Time of Day clock
;	 CDF buffer	/ point to the buffer field
;	 buffer		/ and the address of the buffer
;	<return with the LINK clear if no errors>
;
;buffer/ ....		/ the current year (e.g. 2003)
;	 ....		/ the current month, 1..12
;	 ....		/ the current day of the month, 1..31
;	 ....		/ the current hour, 0..23
;	 ....		/ the current minute, 0..59
;	 ....		/ the current second, 0..59
;
;   Needless to say, the buffer format and contents are identical to the
; RTODS call.
;
;   Note that BTS6120 will return with the LINK set and the AC cleared
; for this function if the IOB6120 is not installed, and this routine
; will return with the LINK set and the AC = -1 if the TOD is not installed,
; OR if the proper key value is not passed in the AC.
;
STODS:	.PUSHJ	@[GETARG]	; get the caller's first argument
	AND	[0070]		; and make sure it's really a CDF
	TAD	[CDF 0]		;  ... instruction!
	DCA	STSCDF		; save that for storing return values
	.PUSHJ	@[GETARG]	; get the buffer address
	TAD	[-1]		; correct for pre-incrementing AI registers
	DCA	AX2		; and store that
	TAD	CKINIT		; get the clock status flag
	SNA CLA			; is a clock chip installed at all?
	 JMP	 STOERR		; no - give the error return right now
	CDF_BTS0		; read the original contents of the user's AC
	TAD	@PUAC		; ...
	CDF_HERE		; ...
	TAD	[-1302]		; is it the correct key value?
	SNA CLA			; skip if not
	 JMP	 STODS1		; yes - go set the clock
STOERR:	CLA CLL CMA CML		; no - return with the link set and AC = -1
	JMP	STOD99		; and return now

; Here to set the clock...
STODS1:	JMS	@[CCRMW]	; unprotect the clock registers
	 CNOWP			;  .... data to send
	JMS	@[CCRMW]	; and stop the clock while we're setting it
	 CSTOP			; ...

; The year takes a little special effort...
	JMS	STREAD		; get the year from the caller
	TAD	[-1960.]	; remove the century
	SPA			; error if .LT. 1960
	 JMP	 STOERR		;  yup
	TAD	[60.-100.]	; years 1960..1999 map to 60..99
	SPA			; and years 2000..2059 map to 00..59
	 TAD	 [100.]		; ...
	JMS	@[WRCLKR]	; write it to the clock
	 99.			;  maximum year allowed
	 DS_YEAR		;  DS1302 year register address
	 JMP	 STOERR		; range error

; Handle the month and day next...
	JMS	STREAD		; now the month
	JMS	@[WRCLKR]	; ...
	 12.			;  maximum month allowed
	 DS_MON			;  DS1302 month register address
	  JMP	 STOERR		;  range error
	JMS	STREAD		; and the day
	JMS	@[WRCLKR]	; ...
	 31.			;  maximum day allowed
	 DS_MDAY		;  DS1302 day register address
	  JMP	 STOERR		;  range error

; Halfway there!
	JMS	STREAD		; hour...
	JMS	@[WRCLKR]	; ...
	 23.			;  maximum hour allowed
	 DS_HOUR			;  DS1302 hour register address
	  JMP	 STOERR		;  range error
	JMS	STREAD		; minute
	JMS	@[WRCLKR]	; ...
	 59.			;  maximum minute allowed
	 DS_MIN			;  DS1302 minute register address
	  JMP	 STOERR		;  range error
	JMS	STREAD		; seconds
	JMS	@[WRCLKR]	; ...
	 59.			;  maximum second allowed
	 DS_SEC			;  DS1302 second register address
	  JMP	 STOERR		;  range error


;   Success!  Note that the clock starts counting automatically after we
; write the seconds register.  All we have to do is to lock it again.
	JMS	@[CCRMW]	; write protect the clock registers
	 CWP			; ...
	CLA CLL			; return with the link cleared
STOD99:	CXF_BTS1		; the MCALL processor is in field 1
	.POPJ			; that's all there is to it!


; This little routine will read the next word from the caller's buffer...
STREAD:	0
STSCDF:	CDF	0		; gets overwritten by a "CDF buffer"
	CPD			; address main memory
	TAD	@AX2		; store the word
	CDF_HERE		; back to our field
	SPD			; and address panel memory
	JMP	@STREAD		; and return to the caller

	.PAGE
	.TITLE Tables, Messages

; PATCHTAB: table of vectors that we want to fetch at startup and patch
; in our code.  Format is (destination-1), vector_number.
; While we are free here to mix field 0 and 1 vector numbers, the actual
; call to the function must use PJ0F3 or PJ1F3 as appropriate.
PATCHTAB:
	; general patches
	.DATA	AX0-1, VSYSIN9
	.DATA	PRESTA-1, VRESTA
	.DATA	POUTCHR-1, VOUTCHR
	.DATA	PCRLF-1, VCRLF
	.DATA	PTDEC-1, VTDECNW
	.DATA	PRESTA-1, VRESTA
	.DATA	PTOCT4-1, VTOCT4
	.DATA	PTOCT4B-1, VTOCT4
	.DATA	PRAMBAS-1, VRAMBAS
	.DATA	PFUNTBL-1, VFUNTBL
	.DATA	PUPC-1, VUPC
	.DATA	PUAC-1, VUAC
	.DATA	PUFLAGS-1, VUFLAGS

	; commands, clock/calendar patches
	.DATA	BTSHELP-1, VCMDTBL
	.DATA	POUTC1-1, VOUTCHR
	.DATA	PSPACMP-1, VSPACMP
	.DATA	PBACKUP-1, VBACKUP
	.DATA	PGET-1, VGET

	; CF patches
	.DATA	PDKSIZE-1, VDKSIZE
	.DATA	PPARMAP-1, VPARMAP
	.DATA	PDKPART-1, VDKPART
	.DATA	PDKRBN-1, VDKRBN
	.DATA	PBUFPTR-1, VBUFPTR
	.DATA	PBUFCDF-1, VBUFCDF
	.DATA	PBUFPNL-1, VBUFPNL
	.DATA	PDISKWR-1, VDISKWR
	.DATA	PDISKRD-1, VDISKRD
	.DATA	PNODISK-1, VNODISK

	.DATA	0

; clock/calendar
CCTEST:	.DATA	    375,   0, 325	; test value 325 to ram 30
CNOWP:	.DATA   DS_CTRL, 177, 0		; clear b7 of write-protect reg
CWP:	.DATA   DS_CTRL, 177, DS_WPROT	; set b7 of write-protect reg
CSTOP:	.DATA	DS_SEC,  177, DS_STOP	; stop clock
CSTRT:	.DATA	DS_SEC,  177, 0		; start clock

; American MM/DD/YY HH:MM:SS
CTDTB:	.DATA   DS_MON, "/", DS_MDAY, "/", DS_YEAR, " "
	.DATA	DS_HOUR, ":", DS_MIN, ":", DS_SEC, 0, 0
; Euro DD-MM-YY HH:MM:SS
;CTDTB:	.DATA   DS_MDAY, "-", DS_MON, "-", DS_YEAR, " "
;	.DATA	DS_HOUR, ":", DS_MIN, ":", DS_SEC, 0, 0
; Asian YY-MM-DD HH:MM:SS
;CTDTB:	.DATA   DS_YEAR, "-", DS_MON, "-", DS_MDAY, " "
;	.DATA	DS_HOUR, ":", DS_MIN, ":", DS_SEC, 0, 0

; Strings
SAMSG:	.ASCIZ	"IOB: ROM V"
S2MSG:	.ASCIZ	", FPGA V"
CCPMSG:	.ASCIZ	"C/C: "
CFCMSG:	.ASCIZ	"CFC: "
CNPMSG:	.ASCIZ	"No CF Card"
CSZMSG:	.ASCIZ	"MB - "
CCNMSG:	.ASCIZ	"Not installed"
TDMSG:	.ASCIZ	"Current date and time is "
DIGMSG:	.ASCIZ	"?Bad date format - enter same as displayed"

HLPLST:	.DATA	HELP0-1, HELP1-1, HELP2-1, 0
HELP0:	.ASCIZ	""
HELP1:	.ASCIZ	"EXTENSION ROM COMMANDS"
HELP2:	.ASCIZ	"DA [MM/DD/YY HH:MM:SS]\t\t-> Display or set date and time"
	.PAGE

	.TITLE Sector Buffer
	; Sector buffer - 512 words
	.PAGE   34
	; Don't move this... the last word has to be at the end of the field
	; so that ISZ detects its end

SECBUF: .BLOCK  128.
	.PAGE
	.BLOCK  128.
	.PAGE
	.BLOCK  128.
	.PAGE
	.BLOCK  128.

	.END

