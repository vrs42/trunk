P?S/8 1988 "A" Source Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 25-Feb-1988.

Last edit: 16-Feb-2015 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with [possibly MS-DOS and] OS/8 limitations before usage.

Given the current state of P?S/8 development, most P?S/8 source files are meant to
be assembled with PAL8 for the express purpose of creating pragmatic core image
files later used from P?S/8 to transfer the image of particular system programs
needed after the initial [starter] P?S/8 bootable system is created.  The selected
target media must be compatible with a designated logical unit of the P?S/8 starter
system to effect the required block transfers.  This is generally accomplished using
command files designed for the purpose of the transfers; P?S/8 DUMP is used for this
purpose as it is created during the initial system generation.  [Note: The binary
output of all assemblies used to create the starter system can be assembled with
PAL8 under OS/8 or using another P?S/8 system if available, or even from BIN format
binary paper-tapes as the initial creation process is system-independent and avoids
conflict with all known restrictions of all relevant operating systems.  As defined
in the current source files, OS/8 BATCH is used to create the initial P?S/8 system
as well as the core images used later to continue the system generation process.
Future releases of P?S/8 wil likely use alternate methods to create a working system
from the source files.]

By nature, certain specific files must be converted to a string of P?S/8 TFS files
[or individual extended directory files] before use.  This is generally done to
create P?S/8 TFS binary output files needed for specific purposes using P?S/8 PAL.
For certain operations used to continue system generation, specific command files
must be copied to P?S/8 for one-time usage.  P?S/8 DUMP [and perhaps BLKCPY] can be
used as required; for P?S/8 systems where some of the converted source files are
available, a hybrid method can be designed as appropriate.  [Note:  All of these
methods are stopgap measures until a unified approach designed to create all P?S/8
structures and add system components is implemented.  The files used to create the
system are only correct for the current configurations; certain files will be
updated as requirements change.]

In certain specific instances, the final conversion yields a string of TFS files
with arbitrary related file names.  It is recommended the TFS names follow the
original file names in ways familiar to the user.  Where relevant, existing TFS
file names taken from P?S/8 systems will be indicated.

Time/date stamps on certain files indicate the intentions of release dates of files
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
MS-DOS/Windows, the time/date stamp on these files has been set to 2 seconds after
the start of the above date, the lowest supported in these environments; this is
done to prevent quirks of Windows directory routines that will report no date if the
time is 2 seconds earlier.  When moved to a file system capable of better date stamp
information such as the P?S/8 SHELL, more accurate information will be applied.
[Note: The P?S/8 SHELL environment supports dates from 1-Jan-1900 through
31-Dec-2411.]

Directory Listing:
____________________________________________________________________________________

16-Feb-2015

04/15/1986  09:00 AM            12,069 ASCODE.PAL
10/06/1987  07:00 PM           218,927 ASMBLR.PAL
12/17/1986  11:00 PM            77,972 BIN.PAL
04/16/1986  09:00 AM            31,947 BLKODT.PAL
02/23/1988  08:00 PM             1,123 CMPARA.BI
02/16/1988  11:00 PM             1,857 CMPARB.BI
02/16/1988  11:00 PM             1,502 COMGEN.BI
01/01/1980  12:00 AM             8,772 CPSCON.PAL
01/01/1980  12:00 AM            18,998 DTCOPY.PAL
01/01/1980  12:00 AM            42,306 DTFRMT.PAL
04/08/1987  11:00 PM            25,232 FLOAT.ZZM
04/08/1987  11:00 PM            45,894 FOCAL.ZZM
04/17/1986  10:00 AM            60,020 L6DCON.PAL
01/01/1980  12:00 AM            15,202 LAP6W.PAL
03/22/1983  07:00 PM             7,056 LSPTCH.PAL
04/17/1986  10:00 AM            47,085 LTBODT.PAL
01/12/1987  08:00 AM            42,475 LTDUMP.PAL
02/09/1986  03:00 PM            43,172 MAP.PAL
04/08/1986  05:00 AM            31,067 MARK12.PAL
02/23/1988  08:00 PM               736 MOVEMA.BI
02/16/1988  11:00 PM             1,035 MOVEMB.BI
04/15/1986  11:00 AM            46,029 OS8CON.PAL
01/01/1980  12:00 AM            17,868 PHOCAL.PAL
02/16/1988  11:00 PM             1,963 PQSASM.BI
11/21/1986  06:00 AM            15,672 PQSDSU.PAL
11/21/1986  06:00 AM            28,777 PQSDTA.PAL
02/23/1988  06:00 PM            15,343 PQSFLP.PAL
12/17/1986  11:00 PM            33,478 PQSLTA.PAL
12/12/1986  06:00 PM           125,157 PQSMON.PAL
11/21/1986  06:00 AM            29,015 PQSRKA.PAL
02/23/1988  08:00 PM            83,585 PQSRXA.PAL
01/01/1980  12:00 AM            49,382 RKLFMT.PAL
01/01/1980  12:00 AM             6,794 RT11.PAL
04/10/1986  09:00 AM            34,484 TC12F.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

ASCODE.PAL	P?S/8, OS/8, DIAL-MS ASCII Code Chart.  Assemblable source file.

ASMBLR.PAL	Source file for the P?S/8 PAL assembler.  Internal edit: 392.

BIN.PAL		Source file for the P?S/8 BIN utility program.  Internal version 8Z.
		Note: The SLURP loader and the /I system device handler reload
		routines are not contained in this file; system generation as
		currently defined resolves all loading considerations; the working
		image of the BIN system program requires the SLURP loader be placed
		into a designated area within BIN and certain entry points be
		resolved within the once-only initialization code, etc.  As such,
		these components are generally combined with the corresponding
		system device handler source files for each supported device.
		[Note: Throughout P?S/8, the internal version number is handled in a
		way that is difficult to get beyond version 9Z in the usual
		numerical sense.  A design goal for the future will be to create a
		unified method of determining program versions including the ability
		to detect non-conforming programs used as system programs such as
		the TC01/TC08 DECtape formatting program.  The default contents of
		certain loaded words will be used by a method yet to be devised.

		Due to the large number of option switches supported by BIN with
		complex interactions, the creation of an internal option switch
		default modification method must be carefully chosen.  Future
		versions of P?S/8 should manage these three-word areas carefully.
		[The corresponding bits for the passed option switches are modified
		by an .XOR. operation with these internal words; however, there are
		no standards for implementation of this feature in general; it is
		suggested this feature be resolved at the same time as proper
		version control; not all programs will bother to implement this,
		etc.]

		Future system generation methods may change the way the BIN system
		program is created for a more flexible method of system creation or
		update when combining system components, etc.

BLKODT.PAL	Source file for the P?S/8 BLKODT program.  BLKODT uses the general
		command syntax of P?S/8 ODT [other than execution and breakpoint
		commands] to examine a series of blocks on any logical unit of the
		system device.

		Note: BLKODT was formerly known as SYSODT to be more consistent with
		the way other operating systems approach this type of utility.
		Internally, the handler call is formed in the manner used by P?S/8
		non-system device handlers of this release; however, the program was
		never developed to support non-system handlers.  The exact nature of
		the calling conventions for non-system handlers is undergoing
		modification; certain additional features may be added useful to an
		enhanced BLKODT once the new calling sequence is finalized.  [Note:
		In essence, the only change that would generally affect such a
		program is the need to support double-precision block numbers.
		However, certain "non-standard" devices may be available which do
		not translate into this convention readily, such as special-purpose
		devices LTDHND, a device that only supports 256 words/block standard
		LINCtapes.  [And why there exists the program LTBODT to handle this
		specific case.]

		Future considerations of non-system handlers will dictate the
		direction of BLKODT; the present implementation may require
		supporting an option switch to run in "SYSODT" mode, which is the
		only operation currently supported.

		As a stopgap method, P?S/8 BLKCPY can be used to copy an image of a
		series of blocks on a non-system device to a corresponding area on
		any available logical unit of the system device handler; BLKODT can
		then be used on the transferred blocks, etc.

CMPARA.BI	OS/8 BATCH input file to compare all P?S/8 "A" files from a logical
		source device [FROM:] to a logical destination device [TO:].  This
		allows the collection of "A" files on multiple media to be
		aggregated to another device for development.  [Note: Historically,
		P?S/8 has been copied from removable media, such as multiple
		DECtapes, to a larger disk device such as RK8E/RK05.]

CMPARB.BI	OS/8 BATCH input file to compare all P?S/8 "B" files from a logical
		source device [FROM:] to a logical destination device [TO:].  This
		allows the collection of "B" files on multiple media to be
		aggregated to another device for development.  [Note: Historically,
		P?S/8 has been copied from removable media, such as multiple
		DECtapes, to a larger disk device such as RK8E/RK05.]

COMGEN.BI	OS/8 BATCH input file to create a scratch directory [SCR:]
		containing specific P?S/8 binary core images in a pragmatic order
		needed by the P?S/8 starter system to update to additional system
		programs.  The update is carried out by P?S/8 DUMP [which is
		available on the starter system] driven by various DUMP command
		files tailored to work with the scratch file collection.  It is
		necessary to use appropriate logical units for this to work.  [Note:
		Future P?S/8 system generation methods will use alternatives
		eliminating this tenuous step in the creation of a working P?S/8
		release.]

CPSCON.PAL	Source file for the CPSCON -> P?S/8 text conversion program.  Files
		from CPS-4K LINCtapes can be converted to P?S/8 TFS files.  This is
		another quick-and-dirty conversion program based on ideas embodied
		in the CONVRT program that can be upgraded in a like manner to the
		way L6DCON was upgraded from OS8CON.  Additional issues include the
		presumption of the then-current P?S/8 system device handler for the
		modified LINC-8: Temporary modifications are made to the handler to
		allow reading the CPS-4K LINCtapes which are created with
		incompatible checksums; the handler is then restored to normal.
		[Note: By the time this was noticed, the authors were no longer
		updating this system; every system program includes a copy of a
		LINCtape subroutine capable of reading or writing compatible or
		incompatible LINCtapes; to access files on the system device the
		incompatible version must be used.]

		Future releases of CPSCON should include an internal handler for the
		incompatible LINCtape input as well as a dynamic determination if
		proper hardware is present.  [Note: It is conceivable it is possible
		to write a PDP-12 handler for these incompatible tapes using the
		TC12 maintenance mode; if this is achievable, the program should
		include an additional dynamic internal device choice.]

		P?S/8 SHELL considerations might include interactions with
		non-system device handlers capable of supporting odd sundry
		functions such as a universal non-system handler for LINCtape that
		returns an error if the function is not supportable.  Private
		functions could include the ability to read/write DECtapes or
		read/write incompatible checksum tapes or perhaps read/write
		standard LINCtapes of 256 words/block.  Handler organization will be
		discussed at a future time when limits on available handlers in any
		one system are a current design point.  [Note: In the case of the
		LINC-8, it is a reasonable expectation to create a one page
		non-system device handler capable of reading 128 words/block
		LINCtapes on the LINC-8 without dependencies on the hardware
		modifications also capable of handling the CPS-4K alternate
		checksum problem.  Presumably this would be implemented using
		special calls devised as attempts to access "impossible" blocks such
		as 77777770 or so having special meaning to the handler such as
		setup the next handler call for special checksum handling which is
		self-cancelling after the completion of the next call to the handler
		for an actual physical block.  Additional functions could
		temporarily enable 256 words/block transfers using similar
		mechanisms.]  [Note: Proper file date would be during 1976.]

DTCOPY.PAL	Source file for the stand-alone DECtape Copy Program [Version 10]
		from Digital Equipment Corporation.  [Note: Proper file date would
		be during 1975.]

DTFRMT.PAL	Source file for the stand-alone TC01/TC08 DECtape Formatter Program
		[Version 4] from Digital Equipment Corporation.  [Note: This version
		is slightly defective as it needlessly includes non-standard exit
		that is not recommended and only passable from OS/8; in addition,
		the same section of code has bad programming technique that will
		hang if the CPU is the original PDP-8.  These changes were
		apparently made by someone unfamiliar with the rules and conventions
		of proper support for programs designed to be as flexibly supported
		as possible.]  [Note: Proper file date would be during 1975.]

FLOAT.ZZM	Source file for FOCAL, 1969 floating point arithmetic, etc.  Meant
		to be assembled with FOCAL.ZZM.  [Note: In OS/8, use the file name
		FLOATZ.ZM.]

FOCAL.ZZM	Source file for FOCAL, 1969.  Meant to be assembled with FLOAT.ZZM.
		[Note: In OS/8, use the file name FOCALZ.ZM.] [Note: Does not
		include the optional INIT section usually distributed as an
		independent binary section on the same physical BIN format
		paper-tape.]

		The creation of P?S/8 FOCAL starts with the binary output of the
		assembly of FOCAL.ZZM and FLOAT.ZZM.  An additional binary file is
		then overlaid over this to create the P?S/8 system program image;
		this requires extended memory to load the entire image at one time.
		The creation process of P?S/8 FOCAL includes creating overlays from
		the additional code loaded in extended memory.  Once this is
		completely installed as a P?S/8 system program, FOCAL executes in
		4K; overlays are brought in as necessary, such as at the completion
		of reading the contents of all input files which can include FOCAL
		commands and data.

		Once this overlay is loaded, FOCAL then accepts input from the
		console as would the stand-alone version [subject to the presence of
		the P?S/8 Logical Console Overlay which may already be in effect
		before FOCAL is invoked.]

		Before FOCAL starts up, P?S/8-oriented additional once-only
		initialize code makes certain internal changes, some of which are
		dependent on passed option switches.  Any initial P?S/8 SLURP format
		binary files are processed for the purpose of loading patches to
		FOCAL.  This is accomplished by an imbedded SLURP loader that is
		device-independent but is non-virtualized; binary files must be
		created with intimate understanding of the internal workings of
		FOCAL as well as P?S/8 internal operations; extended memory can be
		loaded freely as required by the custom patch being loaded.  By
		following the internal rules of FOCAL, multiple packages can be
		loaded by following the proper rules of relocation.

		Note: The original FOCAL INIT section is not used.  In addition, it
		is flawed in several ways:

		     1)	It does not properly detect the PDP-8/L.  A defective method
			is used that cannot work on many actual PDP-8/I systems.  As
			a result, it is often true that PDP-8/I systems are
			incorrectly identified as PDP-8/L due to improper technique.

			The reason for this is that an awful and undependable kludge
			is used to tell the PDP-8/I from the PDP-8/L: The two are
			assumed to be identical except for speed based on the
			presumption that a) the console speed can be assumed to be
			110 baud, b) that it is always true that a PDP-8/I is faster
			than the timeout calculation used presumably to claim slower
			machines must be PDP-8/L.

			In point of fact, many PDP-8/I systems are slowed down from
			the nominal speed that would match the
			crystal-clock-controlled PDP-8.  This is because the PDP-8/I
			memory often must be slowed down due to reliability issues;
			this is also why eventually the PDP-8/L and the PDP-12 were
			officially slowed down slightly; thus, the timeout is too
			critical to be reliably used.  However, the method is
			totally worthless when any form of console change is made;
			there are perfectly legitimate alternatives on these
			machines that increase the baud rate such as using the
			LA-30P interface which is actually a parallel device with
			quite different [and faster] timing, or various terminals
			such as the VT05 and LA36 which are 100% compatible at the
			speed of at least up to 300 baud.  [Note: The VT05 is not
			100% compatible at speeds of 600 baud or faster; this is why
			the KL8-JA Omnibus interface was released several years
			later; it includes an option to correct the problem by
			brute-force hardware methods that function up to 1200 baud
			in countries that use 50 Hz power mains, and 2400 baud in
			countries that use 60 Hz power mains.  However, this does
			not effect the reckoning of PDP-8/I versus PDP-8/L.]

			This problem can be corrected by executing the group III
			OPR instruction 7601.  On all models from the PDP-8 up, this
			instruction clears the AC with the lone exception of the
			PDP-8/L because the design of the PDP-8/L is such that all
			group III OPR instructions are inhibited; on all other
			models, group III OPR instructions execute as harmless NOP
			instructions unless EAE is implemented.  But the 7601
			instruction always works on the rest of the product line
			[not including the PDP-5 and PDP-8/S which are already ruled
			out in the internal INIT code earlier than this decision
			point].

		     2)	INIT is ignorant of all computers newer than the PDP-12
			[which is correctly identified by explicit CPU check].  As
			such, it just reports the CPU as PDP-8 which is confusing
			since that is also the correct notation for the original
			PDP-8, which has already been correctly identified by the
			fact that instructions that work on the PDP-8/I, PDP-8/L and
			PDP-12 do not function.

			As such, INIT will falsely identify any model of Omnibus CPU
			[KK8F as used in PDP-8/E, PDP-8/F, PDP-8/M, PDP-8/A 6xx or
			KK8A as used in one-slot CPU PDP-8/A models], the VT78 or
			any other machine based on the 6100 [Intercept I,
			PCM-12/12A], all DECmates or any other machines based on the
			6120 [CPU-8 Omnibus CPU from CESI, SBC6120] or DCC models
			112 and 112H which use a slightly different CPU design that
			can be detected by another OPR instruction.

			Note: FOCAL-8, a derivative of FOCAL, 1969 includes code to
			detect the DCC machines; however, if the CPU matches one of
			these models, FOCAL-8 cleverly self-destructs internally so
			as to suggest the hardware is flakey.  [Note: Similar
			sabotege code was once added to a short-lived release of
			OS/8 and later removed; DEC management forgot that this had
			been added to FOCAL-8 which was never withdrawn.]

		If there is sufficient interest, a P?S/8-specific INIT can be
		created to roughly follow the program flow of the original INIT only
		with these problems corrected.  However, one particular portion of
		such an INIT program patch cannot be implemented:

		     1)	The original INIT asks the user certain questions regarding
			the possible retention of some of the trigonometric
			functions; however, only certain questions are asked
			creating the minor problem that not all cases are covered.

		     2)	P?S/8 FOCAL corrects this situation by using passed option
			switches to allow all combinations of retention [which
			amounts to four possible combinations; the original INIT
			only allows three of the possibilities].  If required, P?S/8
			FOCAL relocates one package over the address space of the
			other package, thus not only allowing this case, but
			recovering the storage space as intended.

		Thus, such an INIT package can only report which functions were/were
		not retained; this dynamic self-configuration has already been
		performed before any such a binary patch can be applied.

		Note: The extension used on FOCAL, 1969 apparently is derived from
		the author's personal preference to not embrace the .PAL extension
		and instead called the first implementation of FOCAL by the .ZZZ
		notation for both FOCAL and FLOAT.  [Indeed, that there are actually
		two files is a personal preference.  Nothing is gained by the
		separation; assembler features exist to force sectional titles
		within an assembly listing if this was the intended reason.]
		Apparently, with each major development effort, the extension was
		"decremented" thus, FOCAL, 1969 as released is known as FOCAL.ZZM.

L6DCON.PAL	Source file for LAP6-DIAL <-> P?S/8 File Converter program.  FIles
		from LAP6-DIAL/DIAL-MS LINCtapes can be converted from/to P?S/8
		TFS or extended directory files depending on option switches.  The
		program includes internal 12-bit 256 words/block handlers for the
		PDP-12 and LINC-8 LINCtapes; the appropriate hardware is determined
		dynamically; appropriate error messages are issued if the machine is
		neither model.

LAP6W.PAL	Source file for the LAP6W -> P?S/8 text conversion program.  Files
		from LAP6W LINCtapes can be converted to P?S/8 TFS files.  The
		earlier P?S/8 CONVRT program was uses as the template for a series
		of quick-and-dirty conversion programs, only some of which [such as
		L6DCON] were upgraded by rewriting portions of the base conversion
                program.  [Note: CONVRT only created P?S/8 TFS files; BIGCON was a
		companion program that only created extended length files.  OS8CON
		replaced both programs by implementing option switches that support
		both output modes.  OS8CON is the template for L6DCON.  As such, the
		same options apply in both programs.]  [Note: The source of LAP6W
		still contains artifacts of converting P?S/8/ -> OS/8 text file
		format.]  Additional issues include the presumption of the
		then-current P?S/8 system device handler for the modified LINC-8.
		Modifications are made to the handler to allow reading 256
		words/block LINCtapes [which are then restored to the proper values
		to allow operations such as writing out P?S/8 text file blocks].

		Future releases of LAP6W should include internal 256 words/block
		LINCtape handlers for the LINC-8 [without modifications] and the
		PDP-12 which are dynamically discovered as is the case in L6DCON and
		other standard LINCtape-centric utilities.  This would allow the
		program additional flexibility to access P?S/8 files on any system
		device which is compatible with either the LINC-8 or the PDP-12.

		Once the P?S/8 SHELL is available, a new approach should be taken
		with all such programs; a universal FILEX [FILE EXchange] utility
		can be devised to allow all such special-purpose conversions to be
		accessible from one program.  [Note:  Because of the need for 256
		word LINCtape support, a compromise approach may be more appropriate
		suitable to L6DCON, LAP6W etc. specifically.  The common element in
		all such programs would be the need to support 256 words/block
		LINCtapes as a "foreign" file structure, etc.]  [Note: Proper file
		date would be during 1976.]

LSPTCH.PAL	Source file for an early interface to paper-tape LISP [presumed
		to be LISP Version 1.5; according to the source file, the paper-tape
		version is known as "LISP16"].  This version of LISP apparently
		requires 20K to load normally.

		The modifications consist of patching the original binary file to
		redirect console output to P?S/8.  However, the console overlay is
		presumed to be enabled.  [Note: The actual implementation is of the
		earlier VT8E-only version; the two releases are largely compatible
		for a program interface this minimal.

		The binary that pertains must be located; specific internal
		locations are defined and are part of the custom changes.

		Future versions should be brought in line with more typical P?S/8
		console awareness which should include DECmate-awareness.

LTBODT.PAL   	Source file for a special adaptation of P?S/8 BLKODT [SYSODT] for
	     	standard LINCtapes [256 12-bit word blocks only on certain operating
	     	systems for the LINC, LINC-8 and PDP-12; most PDP-8-oriented
		operating systems use 128 12-bit word blocks].  All features of
		BLKODT are retained or adapted to the 256 word format.  The source
		code includes internal LINCtape routines that function on the LINC-8
		and the PDP-12.  The appropriate software is selected dynamically
		when the program determines what CPU type is present; attempts to
		run LTBODT on inappropriate hardware will result in an error message
		and automatic exit.

LTDUMP.PAL   	Source file for a special adaptation of P?S/8 DUMP for standard
		LINCtapes [256 12-bit word blocks used only on certain operating
		systems for the LINC, LINC-8 and PDP-12; most PDP-8-oriented
		operating systems use 128 12-bit word blocks].  All features of DUMP
		are retained or adapted to the 256 word format.  The source code
		includes internal LINCtape routines that function on the LINC-8 and
		the PDP-12.  The appropriate software is selected dynamically when
		the program determines what CPU type is present; attempts to run
		LTDUMP on inappropriate hardware will result in an error message and
		automatic exit.

MAP.PAL      	Source file for the P?S/8 MAP utility that creates bitmap output of
		the memory locations loaded by a passed set of binary input files.
		Various options exist to exclude specific fields if desired; the
		default is to account for all loading in all memory fields 0-7.

		MAP may be chained to by the P?S/8 PAL assembler as a
		post-processing output utility [the bitmap output is appended on the
		assembler output using the conventions of P?S/8 PAL as dynamically
		determined by the invocation of P?S/8 PAL using the "/M" option
		switch to chain to MAP].

		MAP may also be used to optionally chain to the BIN utility to
		further process the passed binary files.

		Both chaining processes might apply allowing assembly, map, and go
		operations from a single command.

		Note: P?S/8 PAL attempts to support 256K of memory.  [Note: The
		upper limit of the KT8A is 128K; CESI systems theoretically support
		up to 512K of memory.  However, P?S/8 cannot run on machines with
		the CESI memory controller present unless set to compatible mode
		which limits memory to 32K.  As such, this may be lowered to 128K
		depending on design considerations; only the KT8A is capable of
		extended loading while also maintaining full compatibility with the
		conventional 32K extended memory requirements.  The use of CESI
		memory extensions beyond 32K is within the province of
		specially-designed application systems such as OMNI-8 which was
		designed expressly for this hardware.  However, there is no need to
		directly support beyond 32K of loadable code; the rest of the memory
		is used for the application itself, not any loadable code that need
		be assembled for extended loading.]

		Once the conventions of memory loading beyond 32K are established,
		MAP can be extended to support the additional loading, etc.

MARK12.PAL	Source file for the modified MARK12 program used to format LINCtapes
		on the PDP-12.  Several changes have been made from the original
		MARK12 as implemented on LAP6-DIAL/DIAL-MS:

		     1)	The source code has been overhauled sufficiently to be
			compatible with P?S/8 PAL and the user-written PAL12
			assembly program for OS/8.  [Note: PAL12 is derived from an
			early implementation of PAL8 which is known to be deficient
			in many ways.  Several compromises were made in the source
			code to allow PAL12-compatibility; future releases of the
			source code may drop compatibility with PAL12 or include
			conditional assembly to allow compatibility in the binary
			sense only.  By taking fuller advantage of P?S/8 PAL, the
			program source code will be more cohesive and readable.]

			The changes made are sufficiently incompatible with the
			DIAL assembler that backward compatibility is no longer
			possible.  [Note:  The DIAL assembler does not support
			literals.]

		     2)	Program execution can be attempted on machines other than
			the PDP-12; appropriate error messages will be issued and
			the program will exit gracefully.

		     3)	The program checks for the presence of the P?S/8 Logical
			Console Overlay as defined in 1986.  Future releases may
			change this support slightly to conform with newer versions
			of the Overlay.

		     4)	The program supports 3300 octal block LINCtapes of 128 words
			per block; this is more useful on tapes meant to be used
			with either P?S/8 or OS/8 on either the PDP-12 or the LINC-8
			as required.  [Note: Both P?S/8 and OS/8 support ignoring
			129th data words on LINCtapes used on the PDP-12.  On the
			LINC-8, only 128 word tapes can be supported; thus, the
			presence of the 129th word only complicates support issues.
			The 129th word adds no value by its presence; this only
			causes tape transfers to take longer and limits the maximum
			block count in a pointless attempt at pseudo-compatibility
			with DECtape that only applies to a theoretical application
			for unrelated operating systems such as the DECtape version
			of the Disk Monitor System.

		The DIAL standard of 1600 octal blocks of 256 words per block is
		also supported as in the original version.  [Note: Future versions
		of P?S/8 MARK12 will optionally support longer [premium-length]
		LINCtapes as are used in the LINC-8; this would include 2000 octal
		block 256 words/block and 4000 octal block 128 words/block tapes.

		The release date of this file is correct within this directory; OS/8
		releases of the file may have this wrong, which can be corrected.

		For use with OS/8 PAL12, the program should be renamed to have a .12
		extension to be compatible with PAL12 defaults.  [This is to be
		avoided when used with dual-mode assemblers such as P?S/8 PAL.]

MOVEMA.BI	OS/8 BATCH input file to copy all P?S/8 "A" files from a logical
		source device [FROM:] to a logical destination device [TO:].  This
		allows the collection of "A" files on multiple media to be
		aggregated to another device for development.  [Note: Historically,
		P?S/8 has been copied from removable media, such as multiple
		DECtapes, to a larger disk device such as RK8E/RK05.]

MOVEMB.BI	OS/8 BATCH input file to copy all P?S/8 "B" files from a logical
		source device [FROM:] to a logical destination device [TO:].  This
		allows the collection of "B" files on multiple media to be
		aggregated to another device for development.  [Note: Historically,
		P?S/8 has been copied from removable media, such as multiple
		DECtapes, to a larger disk device such as RK8E/RK05.]]

OS8CON.PAL   	Source file for the P?S/8 <-> OS/8 bidirectional text conversion
		program [formerly known as CONVRT and BIGCON, now combined into a
		single utility with option switches for all operating modes].
		OS8CON can also be used to reapportion and standardize the contents
		of a string of TFS files to overcome logistic problems associated
		with very localized editing, etc.

PHOCAL.PAL	A very early work-in-progress file that eventually lead to the P?S/8
		version of FOCAL, 1969.  It is used merely as an inspiration when
		performing additional development to FOCAL and includes a few inside
		jokes generally only known to a small group of people who have
		actually worked on FOCAL while studying the original source code.
		[Note: Much of the work of converting the earlier R-L Monitor FOCAL
		into P?S/8 FOCAL was obtained independent of this file; thus, the
 		stated last edit date can be confusing.]

		[Note: Proper file date would be during 1977.]

PQSASM.BI	OS/8 BATCH input file to assemble all of the sub-components of
		P?S/8.  Logical devce TMP: is the target for all binary files.
		Logical devices A: and B: are derived from the "A" files directory
		and the "B" files directory [such as RKA1: and RKB1: respectively].
		[Note: Several files require the user program PAL12.SV to assemble
		into suitable binary format for OS/8 loading.  PAL12 is based on a
		very early version of PAL8 with many limitations, etc.  The source
		code was converted from LAP6-DIAL files using P?S/8 L6DCON then
		converted to OS/8 using P?S/8 OS8CON.  To distinguish these files
		from other PAL language files, the affected files use the .12
		extension which is the default input type to the PAL12 program.  In
		the P?S/8 environment, there is no requirement for special handling
		as P?S/8 PAL supports both PDP-8 and LINC assembly as a superset of
		both PAL8 and the LAP6-DIAL assembler [which does not support
		literals.]

PQSDSU.PAL	Source file for the DSD-240/Western Dynex components of the P?S/8
		operating system.  This includes the system device handler, slurp
		loader, slurp loader reload routine, rewind/unload routines, logical
		Console Overlay intercept routines, etc.  The binary output of this
		assembly should be loaded along with the binary created by
		assembling the main P?S/8 operating system files to create a starter
		system for the DSD-240/Western Dynex fixed/removable cartridge disk.

PQSDTA.PAL	Source file for the TC01/TC08 components of the P?S/8 operating
		system.  This includes the system device handler, slurp loader,
		slurp loader reload routine, rewind/unload routines, logical Console
		Overlay intercept routines, etc.  The binary output of this assembly
		should be loaded along with the binary created by assembling the
		main P?S/8 operating system files to create a starter system for the
		TC01/TC08 DECtape.

PQSFLP.PAL	Source file for the MDC8 Diskette [FLP] components of the P?S/8
 		operating system.  This includes the system device handler, slurp
		loader, slurp loader reload routine, rewind/unload routines, logical
 		Console Overlay intercept routines, etc.  The binary output of this
		assembly should be loaded along with the binary created by
		assembling the main P?S/8 operating system files to create a starter
		system for the MDC8 Diskette [FLP] drive [and various compatible
		systems].

PQSLTA.PAL	Source file for the TC12 LINCtape components of the P?S/8 operating
		system.  This includes the system device handler, slurp loader,
		slurp loader reload routine, rewind/unload routines, logical Console
		Overlay intercept routines, etc.  The binary output of this assembly
		should be loaded along with the binary created by assembling the
		main P?S/8 operating system files to create a starter system for the
		PDP-12 TC12 LINCtape.

PQSMON.PAL	Source file of the P?S/8 operating system.  Release Version 8Z.
		Does not include system device handler or other device-specific
		coding.

		The present method of system generation must be carried out on a 12K
		or larger machine.  System generation routines are found within this
		main operating system source file.  Combining the binaries of the
		main operating system, system device handler and related
		device-specific components, the image of the BIN system program and
 		the image of the DUMP system program and starting at the system
		generation address, a complete bootable P?S/8 starter system will be
		built.  Additional operations are needed to create a more complete
		system [such as running DUMP with command files to carry out the
		additional component generation].

		Future system generation programs may change the organization of the
		main operating system file as well as incorporate new internal
		features making system generation/update easier.  For the present,
		only experts should attempt to load the binary version of this
		program.

PQSRKA.PAL	Source file for the RK8E/RK05 components of the P?S/8 operating
		system.  This includes the system device handler, slurp loader,
		slurp loader reload routine, rewind/unload routines, logical Console
		Overlay intercept routines, etc.  The binary output of this assembly
		should be loaded along with the binary created by assembling the
		main P?S/8 operating system files to create a starter system for the
		RK8E/RK05 disk drive [and various compatible systems].

PQSRXA.PAL	Source file for the RX8E/RX01 components of the P?S/8 operating
		system.  This includes the system device handler, slurp loader,
		slurp loader reload routine, rewind/unload routines, logical Console
		Overlay intercept routines, etc.  The binary output of this assembly
		should be loaded along with the binary created by assembling the
		main P?S/8 operating system files to create a starter system for the
		RX8E/RX01 diskette drive [and various compatible systems].

RKLFMT.PAL	Source file for the stand-alone RK8E RK05 Formatter program
		[apparently internal version 8] from Digital Equipment Corporation.
		[Note: This version is slightly defective as it incorporate
		instructions that can only be used on Omnibus processors.  There
		are several sections of bad coding technique that will prevent the
		program from running properly on any machine prior to the PDP-8/E
		for a variety of reasons:

		     1)	Lack of an MQ register.  This applies to the PDP-8/L despite
			the existence of systems based on the RK8F [RK8E modified to
			work in the DW8E] and the original PDP-8 unless the optional
			EAE is implemented.  It would appear an inexperienced
			programmer modifed the code without determining the
			inapplicability of the changes.  [Note: The MQ register is
			not actually required for this program.  Proper coding can
			determine if the MQ is available to be used as a status
			display and modify the program accordingly.  If the hardware
			lacks the MQ register, the program can self-modify
 			accordingly, etc.]

		     2)	The use of PDP-8/E interrupt-oriented instructions instead
			of the fully compatible instructions.  [Note:  The newer
			instructions were added to speed the handling of interrupts;
			the basic design of this program doesn't require this.]  It
			appears an inexperienced programmer was just confirming
			ignorance when these instructions were needlessly added to
			the program.

		     3)	The use of CAF which will hang on the original PDP-8.

		The source code claims the program was modified for use with OS/8
		Version 3D.  In point of fact, no such modification need exist; the
		program already conforms to the general requirement of all properly
		written application programs, namely the avoidance of memory
		locations 07600-07777.  Since the program does not load into
		extended memory, it is already compatible with all relevant PDP-8
		operating systems.

		The only *constructive* change to the program appears to be
		activating an existent internal feature to allow the use of the
		program on systems lacking front panel switches; there are several
		such diagnostic programs with the same feature.  This merely
		involves creating the equivalent of the proper switch register bits
		in the designated memory locations and enabling the feature already
		present in the program.

		The title of the program implies it is also for an RK8L which is
		apparently the name of an in-house prototype of an Omnibus-based
		redesign of the RK8E to occupy less slots in a hex-wide PDP-8/A box.
		While the RK8L was never marketed, the program is intended for use
		with the RKS8E which is a superset of the RK8E.  As long as only the
		first four drives are addressed, the program will run on this device
		as well.

		Considering the tentative existence of the RK8L and the actual
		existence of the RK8E, RK8F and RKS8E, the program title seems to be
	     	somewhat misguided.

		[Note: Proper file date would be during 1975.]

RT11  .PAL	Source file for an extremely quick-and-dirty RT11 DECtape -> P?S/8
		text conversion program.  This was apparently written during a quite
		early stage of development of the CONVRT program which was used as a
		template for much of the design.  The program is only capable of
		being run on a P?S/8 system from the same time frame; the system
		device must be an early release of the TC01/TC08 DECtape handler as
		specific patches are made to enable reading 384 12-bit words/block
		DECtapes as used in RT11 [which are then removed sufficiently to
		allow P?S/8 files to be written out].  [Note: Restoration of the
		system device handler will not occur until the system is rebooted.]

		Future releases of this program should include independent internal
		384 words/block DECtape routines to allow universal access to P?S/8
		files on the current system device including extended files as is
		the case in the OS8CON program.

		[Note: Additional internal handlers could include TD8E Simple
		DECtape, TC12F, and modified LINC-8 using the appropriate handler as
		determined dynamically.]

		[Note: Proper file date would be during 1975.]

TC12F.PAL	Source file for the modified TC12F program used to transfer DECtape
		contents to LINCtapes and vice-versa.  Several changes have been
		made from the original TC12F as implemented on LAP6-DIAL/DIAL-MS:

		     1)	The source code has been overhauled sufficiently to be
			compatible with P?S/8 PAL and the user-written PAL12
			assembly program for OS/8.  [Note: PAL12 is derived from an
			early implementation of PAL8 which is known to be deficient
			in many ways.  Several compromises were made in the source
			code to allow PAL12-compatibility; future releases of the
			source code may drop compatibility with PAL12 or include
			conditional assembly to allow compatibility in the binary
			sense only.  By taking fuller advantage of P?S/8 PAL, the
			program source code will be more cohesive and readable.]

			The changes made are sufficiently incompatible with the DIAL
			assembler that backward compatibility is no longer possible.
			[Note: The DIAL assembler does not support literals.]

		     2)	The program can be attempted on machines other than the
			PDP-12.  Appropriate error messages will be issued and the
			program will exit gracefully.

		     3)	The program checks for the P?S/8 Logical Console Overlay
			presence as defined in 1986.  Future releases may change
			this support slightly to conform with newer versions of the
			Overlay.

		     4)	The program attempts to support Control-C abort as was
			practiced by P?S/8 in 1986; however, due to expedient
			design, attempts at program abort will likely fail.

			The program needs to be reorganized so as to not conflict
			with the P?S/8 resident kernel, which is destroyed as part
			of the program startup; DIAL system conventions are such
			that the normal PDP-8 resident kernel may not be preserved.
			DIAL is a very primitive system that can be restarted by
			LINC-mode LINCtape instructions in the tradition of the
			LINC.  PDP-8 systems require a standardized system resident
			kernel; this allows flexible system configuration.

		The memory layout of the program requires major overhaul to properly
		reserve the resident area as defined in all relevant PDP-8 operating
		systems.

		For use with OS/8 PAL12, the program should be renamed to have a .12
		extension to be compatible with PAL12 defaults.  [This is to be
		avoided when used with dual-mode assemblers such as P?S/8 PAL.]

		Note: The TC12F program will be largely obsoleted by the next major
		release of the BLKCPY program.

[End-of-file]
