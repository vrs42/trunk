P?S/8-related Files from the Version 8Z MDC8 Diskette [FLP]

All files in this directory were recovered from the P?S/8 Version 8Z MDC8 Diskette
[FLP].  [Note: All files considered to be P?S/8 release components are stored
elsewhere.]

Note: As additional diskettes are recovered, some files currently within this
directory will be moved to more appropriate recovery directories.

Source and Binary Files from the Version 8Z MDC8 Diskette [FLP]

Last edit: 15-Jun-2015 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with MS-DOS and OS/8 limitations before usage.  In certain specific
instances, the final conversion yields a string of TFS files with arbitrary related
file names.  It is recommended the TFS names follow the original file names in ways
familiar to the user.  Where relevant, existing TFS file names will be indicated.

Time/Date stamps on certain files indicate the intentions of release dates of files
where applicable.  For undocumented files, time/date information represents the
latest values that might apply to the file based on where the file was recovered, as
specific media are known to have been created on the date and time used.  Actual
time/date information may be somewhat earlier and will be revised if more accurate
information becomes available.

OS/8-derived file date information is subject to an anomaly of multiples of eight
years due to poor internal design.  Information as to refining the date accuracy was
obtained from reliable sources unless otherwise indicated.  Where applicable, date
and time information obtained from authoritative comments within the file will be
used.

Certain files are known to be older than 01-Jan-1980.  Due to the limitations of
MS-DOS/Windows, the time/date stamp on these files has been set to 1 msec after the
start of the above date, the lowest supported in these environments; this is done to
prevent quirks of Windows directory routines that will report no date if the time is
1 msec earlier.  When moved to a file system capable of better date stamp
information such as the P?S/8 SHELL, more accurate information will be applied.
[Note: The P?S/8 SHELL environment supports dates from 1-Jan-1900 through
31-Dec-2411.]

Directory Listing:

____________________________________________________________________________________

15-Jun-2015

02/25/1988  11:00 PM                23 A.BCI
02/08/1987  04:00 PM               416 COPTST.BCI
02/25/1988  11:00 PM               916 COPYME.BAT
02/25/1988  11:00 PM                29 D.BAT
02/25/1988  11:00 PM               273 DAVE.BCI
12/08/1985  08:00 AM             1,567 FILCMP.PAL
02/25/1988  11:00 PM               289 FLPCPY.BCI
02/25/1988  11:00 PM               308 FMAT.PAL
01/01/1980  12:00 AM             1,544 HAMURABI.FOC
02/25/1988  11:00 PM               796 LNCMUL.PAL
03/23/1986  01:00 PM            19,008 NCON.PAL
11/03/1985  10:00 AM             8,519 NPATCH.PAL
10/08/1987  04:00 AM             3,123 PARITY.PAL
02/25/1988  11:00 PM               364 SUM.PAL
02/25/1988  11:00 PM               215 TAPMOV.PAL
05/05/1984  06:00 PM             2,517 TERSET.PAL
02/25/1988  11:00 PM               375 TEST.PAL
07/23/1987  11:00 AM            33,643 TPATCH.OLD
02/25/1988  11:00 PM               353 VTEST.PAL
02/25/1988  11:00 PM               227 VTEST2.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

A.BCI	     is a trivial command line input file to P?S/8 BLKCPY.  It was likely
	     used for program testing at an early stage of development of BLKCPY.

	     Original TFS file name: A.

COPTST.BCI   is an example of a command line input file to P?S?8 BLKCPY.  The
	     various command line variations and embellishments are illustrated.

	     Notes: Future releases of P?S/8 will expand the block arguments to
	     non-system handlers to generally include double-precision arguments to
	     handle virtually any size device.  As such, BLKCPY will require
	     modification to handle eight digit block parameters.

	     The exact roles of the NUL and SYS device may require a conceptual
	     redesign in light of the other changes proposed.

	     Original TFS file name: COPTST.

COPYME.BAT   is a P?S/8 BATCH command file used to format an MDC8 diskette [FLP] on
	     drive 1 and then copy the entire contents of drive 0 onto drive 1
	     using P?S/8 BLKCPY and the FLPCPY command line file described elsewhere
	     in this document.

	     Original TFS file name: COPYME.

D.BAT        is a trivial P?S/8 BATCH command file designed for a pragmatic purpose.
	     Some external OS/8 system contains a file located in the default
	     OS/8 directory slot on some system where P?S/8 BLKCPY or equivalent has
	     the ability to read this file which has been copied to two 3300 block
	     extended length DECtapes.

	     This BATCH file runs BLKCPY for the explicit purpose of transferring
	     the entire file to the default position on an OS/8-oriented RK05
	     cartridge.  In P?S/8 terms this would be the area usually referred to
	     within OS/8 as RKB0:.  Since two DECtapes are used, it is clear the
	     intended purpose is to transfer as much as 1735 OS/8 records to this
	     device.  [Note:  The OS/8 limitation for such a system is 3241 OS/8
	     records; however, the combined capacity of two extended length DECtapes
	     is 1735 OS/8 records, which is considerable for a single file.]

	     The next [and final] BATCH step is to load and start a binary file
	     named SOPH.  [Note: As of this writing, the source of this program is
	     not available and may require disassembly for further investigation.
	     However, the placement of the data copied by two DECtapes clearly
	     meant to transfer a larger amount of data to the default position where
	     OS/8 would store a file is not likely a coincidence, but rather a
	     requirement of the overall process.]

	     When this program is likely to have run, the hardware configuration
	     was P?S/8 running on the MDC8 FLP diskette the program was recovered
	     from, TC08 DECtape with a dual TU56 drive set to drive units 6 and 7,
	     and a bootable RK8E/RK05 cartridge pack.

	     There is a small possibility the machine was manually restarted between
	     the two BATCH command steps; P?S/8 BATCH is capable of continuing an
	     interrupted BATCH session after rebooting the P?S/8 system device,
	     likely the FLP system since the hardware must be other than TC08
	     DECtape or RK8E/RK05.

	     Original TFS file name: D.

DAVE.BCI     is a command line input file to P?S/8 BLKCPY.  The entire contents of
	     two extended length [3300 block] DECtapes [mounted on DTA6: and DTA7:]
	     is copied to the primary data area of presumably an OS/8 RK8E/RK05
	     system.  [Note: The copy operation starts at P?S/8 block 16, which
	     corresponds to OS/8 record 0007; this is where the first file is
	     located on any OS/8 device.  In this case, that would be RKB0: in OS/8
	     terms; in the then-current P?S/8 terms, this is known as RKA2: where
	     RKA0: through RKA3: are on RK05 pack 0 and RKA4: through RKA7: are
	     located on RK05 pack 1.  Future releases of P?S/8 are not likely to
	     support this specific set of conventions.]

	     BLKCPY /O is invoked to suppress BLKCPY confirmation messsages; this
	     allows the copy operation to run unattended.

	     Original TFS file name: DAVE.

FILCMP.PAL   is a P?S/8-specific pragmatic program to compare two TFS files by
	     direct binary compare.  If the two files are identical "M" [match] is
	     printed on the Logical Console; if not then "B" [bad] is printed.

	     The program does not distinguish or check for output versus input
	     files.  The contents of the first two file handles in the passed file
	     area are used without regard for validity.  Field 1 is presumed to be
	     available as a data buffer for the two files.  Logical Console output
	     support is presumed available without checking first; no attempt at
	     reverse protocol control is made [due to the sparse output; this
	     generally functions, but is not fully compliant with P?S/8 console
	     specifications.  Certain Logical Console Overlay implementations will
	     handle output calls without reverse protocol considerations [such as
	     the VT8E configuration and most configurations for very limited output
	     as is the case here].  However, this should not be presumed to always
	     work; a well-developed program should include complete console
	     compliance.

	     Since no other P?S/8 kernel parameter considerations exist, this
	     program can be executed with the START command.  [It could be
	     incorporated as a P?S/8 system program, but clearly was created in an
	     expedient manner.]

	     PAL conventions are fairly well followed; common definitions are not
	     used due to the pragmatic nature of the program.  Commentary is
	     considered adequate to good.  [Note: Requires literal support be
	     enabled using the /Q option.]

	     Original TFS file name: FILCMP.

FLPCPY.BCI   is a command line input file to P?S/8 BLKCPY.  The entire contents of
	     an MDC8 HD diskette on drive 0 is copied to drive 1 on the same
	     controller.

	     THe P?S/8 FLP8 non-system device handler used at the time this utility
	     was used only covered the first 4096 [0000-4095] blocks of the device
	     in the primary handlers [FLP0: and FLP1:].  To include the additional
	     data that might be present, handlers for FLP2: and FLP3: were created
	     that can only access the 64 blocks starting at block 4096.  [Note:
	     Newer releases of P?S/8 non-system handlers will allow double-precision
	     block numbers.  As such, this problem will be eliminated in future
	     releases; this includes upgrading BLKCPY to handle 8-digit block
	     arguments, etc.]

	     Original TFS file name: FLPCPY.

FMAT.PAL     is a quick-and-dirty program to format a diskette on the MDC8 drive 1.
	     The intended usage is to immediately follow with a copy of every block
	     on drive 0 to drive 1 using the complete verify mode of BLKCPY to
	     certify the media as error free.  See COPYME.BAT for more information.

	     Original TFS file name: FMAT.

LNCMUL.PAL   is a short LINC-8 program to exercise the LINC instruction MUL which
	     performs a multiply operation using the LINC Z register and LINC AC.
	     The program starts in PDP-8 mode with a short LINC initialization
	     routine which starts the LINC CPU to run a short program using the
	     console switches to supply operands to the instruction.

	     This program illustrates the dual-mode assembly support of P?S/8 PAL
	     which is the only fully-featured PDP-8 assembler that completely
	     supports LINC mode assembly while also supporting all standard PDP-8
	     assembly features such as literals [which the program also uses].

	     PAL conventions are fairly well followed.  Commentary is considered
	     adequate to good.  [Note: Requires literal support be enabled using the
	     /Q option.]  [Note: Requires LINC mode assembly be enabled using the
	     /8 option.]  OS/8 PAL8 cannot assemble this program; an obscure user
	     variant of PAL8 known as PAL12 might be capable of assembling this
	     program which is based on an early version of PAL8 known to be highly
	     flawed and missing many language features.  [PAL8 was significantly
	     modified several times after the user program was created from the
	     then-current PAL8; as such, it is deficient in many ways, etc.]

	     Original TFS file name: LNCMUL.

NCON.PAL     is an application written as a P?S/8 system program that generally
	     requires placement in the system program directory to allow access to
	     various option switches used in the process of handling data and
	     console messages issued during program execution.  [Note: By carefully
	     avoiding certain specific options, the program might be able to run
	     under the START command depending on P?S/8 overall release specifics.]

	     The purpose if this program is to process data left in memory from
	     prior execution of a custom package applied to P?S/8 FOCAL to implement
	     control functions to allow operation of a Nicolet 1070 hardware data
	     averager from a FOCAL-based program that can be customized by the
	     researchers who require the data, but have only limited programming
	     skills, etc.

	     The program processes P?S/8 passed P?S/8 TFS directory output files
	     including the ability to accurately report the amount of passed files
	     actually used, as well as the ability to issue error messages if
	     insufficient output files were passed allowing a retry with additional
	     passed files, etc.  The created files are 100% consistent with text
	     files created with the P?S/8 Keyboard Monitor and Integrated Editor and
	     can be further edited in that environment if desired, etc.

	     Criticisms.  The program was written during the time P?S/8 was
	     undergoing design changes leading to support of DECmates in terms of
	     console handling and related issues.  The abort and console
	     initialization conventions that eventually apply to P?S/8 somewhat
	     after the last edit of this program differ from the specific
	     implementation but were adequate for the system configuration the
	     program was actually used on:

	     1) In the final implementation of dynamic console handling
		initialization code, the device 03 handling is only changed when the
		CPU is determined to be the 6120 processor; in this program, instead
		the decision is irrelevantly determined by checking for an artifact
		of implementation generally associated with the TC01/TC08 version of
		the system device handler.  [Note: Future implementations of the
		P?S/8 initialization code might be redefined to include other
		aspects of hardware unique to DECmates if possible.  The worst case
		is there is a slight degradation of program performance should the
		CPU actually be the CESI CPU-8 Omnibus 6120 module or such as the
		Gizmo implementation, neither of which are actually
		DECmate-specific.  This is under research, and perhaps could simply
		be a matter of proving the nature of flag skipping, such as
		attempting to set the device 04 output flag, waiting for it, then
		noticing that it fails to skip again.  This perhaps represents a
		more realistic CPU test than is currently implemented in all
		conforming P?S/8 programs as well as the Kermit-12 implementation
		for OS/8 by Charles Lasner that essentially performs the same
		logical test with the same negative results when run on the
		exceptional systems, etc.  This was not a consideration at the time
		since the only systems available at the time were DECmates.]

	     2) Control-C and Control-B handling should be performed by the standard
		method of using KRS and KSF if running on PDP-8-compatible systems
		and only self-modify to logical abort handling for both situations
		if the hardware is actually a DECmate system [or at least a 6120
		CPU as mentioned above].  The actual implementation is to
		specifically check for control-C only and if detected, set the
		control-C logical abort bit.  However, the control-B abort is never
		tested nor set if present.  Instead, if the latest character is
		either control-A or control-B the program exits to 07600 without
		setting any abort status whatsoever.  [Note:  The implementation of
		the control-B abort status may have also been in transition.]

	     PAL conventions are fairly well followed.  Commentary is considered
	     adequate to good.  [Note: Requires literal support be enabled using the
	     /Q option.]  [Note: Requires automatic half-word zero-fill support be
	     disabled with the /J option; this is equivalent to the /F option in
	     PAL8 which is capable of assembling the source code.]

	     NCON1, NCON2, NCON3, NCON4, NCON5 and NCON6 were taken from the P?S/8
	     Version 8Z MDC8 diskette [FLP] image and combined into NCON.PAL.

NPATCH.PAL   is an application program written as a significant binary patch to
	     P?S/8 FOCAL.  A Nicolet 1070 Data Averager is controlled by FOCAL
	     programming that can be modified by researchers with limited
	     programming skills.  Successful data sweeps can be displayed in various
	     ways by incorporating other packages also written for P?S/8 FOCAL that
	     implement a display capability that is nearly generic yet can run on
	     a varity of display devices; used together, this device can be used by
	     researchers on various PDP-8/PDP-12 configurations, etc.  Sweeps that
	     are considered useful can be saved in PDP-8 memory as part of this
	     package or written to various storage blocks for analysis later.

	     The memory contents left behind after program exit can also be
	     converted into text files with well-formatted numerical text for later
	     analysis by additional FOCAL-based programming.  This is accomplished
	     using the NCON program described elsewhere.

	     Criticism: Virtually everything about this program represents a very
	     good example of just how powerful the P?S/8 environment is to allow
	     researchers will little programming or other computer-related skills to
	     be very successful achieving their goals of a customized data
	     collection and easy to use smooth operation to accomplish all they
	     require.  As a PAL assembly language file, it is very well documented
	     especially when it comes to dealing with the nuanced details of the
	     process of interfacing add-on functions to FOCAL as well as taking
	     advantage of the rich superset of FOCAL that P?S/8 provides to make
	     such operations easily and flexibly accomplished.  Such programming
	     itself is not for PDP-8 novices requiring a lot of skills of both
	     general PDP-8 programming but also the intricacies of both the original
	     FOCAL, 1969 but also the various P?S?8 features and extensions that are
	     exploited to make this project a success, etc.

	     However, there is one criticism of the design that may eventually prove
	     to either be an early pioneering work for an obscure parameter, or
	     prove to be totally incorrect depending on how the problem is solved:

	     Within certain implementations of P?S/8, it is possible to determine
	     the system device logical unit the program is actually booted to.  The
	     program uses a convention found within many P?S/8 system programs that
	     is not 100% certain, namely the ability to define the "partner" logical
	     unit within the pair defined by the system device logical unit and said
	     value .xor. 1.

	     The problem is that the configurations this program was run on just
	     happen to present the logical unit in a predictable place within those
	     particular system device implementations.  This is not a hard and fast
	     convention throughout all P?S/8 system device handlers.  In fact, at
	     the present time, there is no such parameter universally available.

	     As such, should the convention be extended as depended upon here, then
	     this program will be an early adopter of the convention; however, if it
	     is dependent on some newly created alternative, the logic associated
	     with this calculation will require rework; as such, to the extent that
	     this important parameter is subject to change, this program should not
	     be considered as a complete example of how to take advantage of such
	     features within P?S/8 in general.

	     This very feature is under investigation for its role in the future
	     implementation of the P?S/8 SHELL which will also require proper unit
	     identification; not all P?S?8 implementations boot on logical unit 0.

	     NPAT1, NPAT2 and NPAT3 were taken from the P?S/8 Version 8Z MDC8
	     diskette [FLP] image and combined into NPATCH.PAL.

PARITY.PAL   is a parity generator/checking subroutine.  By setting various
	     parameters, both even and odd parity can be processed.

	     PAL conventions are fairly well followed.  Commentary is considered
	     adequate to good.  [Note: Requires literal support be enabled using the
	     /Q option.]

	     Original TFS file name: PARITY.

SUM.PAL      is a trivial program aimed at PDP-8 novices.  It merely adds two
	     numbers together and halts, displaying the sum in the accumulator.  It
	     is also suitable to illustrate what P?S/8 ODT can do with regard to
	     program breakpoints, etc.

	     PAL conventions are fairly well followed.  Commentary is considered
	     adequate to good.

	     Original TFS file name: SUM.

TAPMOV.PAL   is a trivial program to move DECtape drive unit 1 endlessly.  The
	     DECtape is moved forward until the forward end zone is detected; the
	     DECtape is then moved in reverse until the reverse end zone is detected
	     and the entire process is repeated indefinitely.

	     PAL conventions are fairly well followed.  Commentary is considered
	     adequate to good.

	     Original TFS file name: TAPMOV.

TERSET.PAL   is an expedient utility used to setup tab stops on the DS-120, a
	     third-party speedup replacement controller board for the DEC LA36.
	     The board was designed by a DEC engineer who was a part of the original
	     LA-36 hardware development project who felt the product could have been
	     greatly improved before release, but DEC management ignored him.  As
	     such, a "test socket" was included in the design that served no
	     apparent purpose [to DEC] but was crucial for the replacement board.

	     The original LA36 only runs at 300 baud thus limiting printing to an
	     effective maximum speed of 30 characters per second [cps].  The
	     printing unit is capable of far better performance, but only shows this
	     to be true when the relatively slow <CR> and similar operations are
	     carried out causing the unit to be falling behind the prevailing input
	     from a host system.  This triggers a temporary speedup to prevent net
	     falling behind the worst-case 30 cps which the unit does with ease; as
	     such, the easy task of maintaining 30 cps is always achieved; the LA-36
	     does not support any particular protocols as none are needed.  However,
	     the design is short-changed since the mechanical mechanism is capable
	     of much higher performance if handled by a "smarter" controller.

	     The DS-120 replaces the standard controller on the rear panel of the
	     terminal.  Two cables are attached to the power-oriented board, one for
	     the same signals as the obsoleted controller board does, and the other
	     plugs into the "test" socket to allow the controller to monitor the
	     dynamics of the print process.  [Power is applied from the same
	     internal power connector as used in the obsoleted controller board.]

	     The resultant device is a proper superset of the original LA-36 unit,
	     includes at no extra charge the APL character set option that was more
	     expensive than the DS-120 during the product's economic lifetime.  The
	     conversion kit also includes a small heatsink to be attached to the
	     printhead to prevent overheating, something that later DEC terminals
	     that eventually were produced also needed.  Net throughput is
	     dramatically improved and includes speedup techniques such as printing
             in reverse to avoid wasted time moving the printhead to the left
	     margin, etc.

	     While a speed of 60 cps might be sustainable without using reverse
	     control protocol, it might not completely work.  More importantly, by
	     using a 1200 baud or higher serial connection [4800 or higher is
	     recommended; 9600 baud is considered optimal], average speeds approach
	     the equivalent of just under four times the speed of the original
	     LA-36 while being 100% backward compatible.  [Note:  This means that if
	     the application is for a 300 baud connection with APL character support
	     as the contrived goal, the DS-120 is the cheaper solution.]

	     To speed the throughput still further, the terminal supports
	     programmable tab stops; setting up the standard DEC definition of <HT>
	     equivalent to aligning to the next tab stop of multiples of eight
	     spaces must be programmed into the terminal.  Afterwards, any program
	     capable of supporting the control-S/control-Q reverse protocol can be
	     used to print any reasonable content with no other special handling for
	     <VT> or <FF> etc.

	     To use TERSET, turn the terminal on, connect to the appropriate serial
	     interface, then run the program.  The paper should be positioned to
	     the proper top-of-form position.  As long as the terminal is not
	     powered down, all printing properties will be maintained.

	     Once initialized, the terminal can be used with any configuration of
	     the P?S?8 Logical Console Overlay which is configured for the serial
	     printer defined for the proper hardware interface.  The OS/8 KL8E
	     handler can be appropriately hacked up to support the same device.

	     Criticisms:  Doesn't attempt to use the Logical Console Overlay
	     protocol to initialize the terminal.  This does allow use in all P?S/8
	     conforming programs for the device 03/04 console including support for
	     <HT> without any filler characters as well as <FF>.  P?S/8 needs to
	     provide terminal capabilities support to completely make use of this as
	     many programs expect printing consoles to require tear-off lines
	     instead of supporting actual <FF> characters; this will be addressed in
	     future releases of P?S/8.  When used as a serial printer, this isn't an
	     issue.

	     PAL conventions are fairly well followed.  Commentary is considered
	     adequate to good.  [Note: Requires literal support be enabled using the
	     /Q option.] [Note: By avoiding P?S/8 conformance, the program can also
	     run either stand-alone or under OS/8 in anticipation of being used with
	     the modified KL8E handler as indicated above.]

	     Suggested improvements include a proper check for P?S/8 Console Overlay
	     Conventions to allow conformance with P?S/8 requirements.  Option
	     switches would allow various dynamic considerations such as which
	     interface is the designated target, baud rate considerations for
	     certain models where this is software-programmable, etc.  An OS/8
	     version can still be achieved by judicious use of conditional assembly
	     without giving up major features.  An announcement message expressing
	     the program's purpose would also be recommended.  [Note: If feasible,
	     it would be helpful to determine if the proper hardware is present.]

	     Original TFS file name: TERSET.

TEST.PAL     is the source code file of a series of tests of certain assembly
	     language features known to be troublesome to certain releases of P?S/8
	     PAL and/or OS/8 PAL8.  To properly pass the tests, certain statements
	     must create the intended binary output; certain other statements ought
	     to generate specific error messages, yet may fail to be detected as
	     flawed syntax.  [Note: The circa 1976 release of P?S/8 PAL fails this
	     battery of tests as predicted; the relevant code was not rewritten for
	     several years after that release, etc.]

	     Original TFS file name: TEST.

VTEST.PAL    is a short VT8E-oriented test program apparently written to test some
	     nuance of the VT8E hardware while the VT8E configuration of the Logical
	     Console Overlay is running.

	     Original TFS file name: VTEST.

VTEST2.PAL   is a variant short VT8E-oriented test program apparently written to
	     test some nuance of the VT8E hardware while the VT8E configuration of
	     the Logical Console Overlay is running.

	     Original TFS file name: VTEST2.

[End-of-file]
