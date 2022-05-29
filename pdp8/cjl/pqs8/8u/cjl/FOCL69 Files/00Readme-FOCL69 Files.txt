FOCAL, 1969 Files.

The original source files for FOCAL, 1969 and material related to modifying FOCAL,
1969 and some details of using FOCAL with P?S/8.

Some files in this directory were recovered from OS/8 format MDC8 (FLP) diskettes
created on or about 25-Feb-1988.

Note: The source code files for FOCAL, 1969 are historically accurate, other than the
few minor issues as follows:

There is a reference to Charles Lasner in each of the two source files regarding
minor cosmetic editing of the files.  All relevant changes were made only to effect
better conformance with professional PDP-8 source code standards, which were largely,
but not consistently, followed in the original files.  These minor tabulation and
pagination changes improve readability; the contents of any other aspect of the
source code was not otherwise changed, including the specifics of the original
comments by Rick Merrill.

Although the original source files were technically never located; the actual source
file starting point was a slightly marked up copy created by an inexperienced DEC
employee during the early stages of the process of producing another version that may
not have ever been released.  It is highly likely this employee was removed from the
project.  Fortunately, not many changes were made and none of them were particularly
"structural" in any sense.  Thus, much of the actual recovery effort performed was
removing those superfluous changes. (Note: It is theorized the changes present in the
file were the first steps in modifying FOCAL, 1969 into FOCAL-8 and all of the
detremental effects that followed.  It appears the person making the edits was just
attempting to mark off major sections either understood or not understood to be used
as an personal guideline for further study; little actual code change was made.  As a
result, it was fairly easy to restore full source code accuracy.

The resulting files were compared to DEC handouts of the original files distributed
in slightly miniaturized form with poor readability due to not only the reduction but
poor copy practices (as is the case with many DEC documents from that time).  There
is little doubt that nothing other than the minor points documented above differ
with the true originals.  Additionally, assembly of these files has been confirmed to
be binary identical with the paper-tape release of FOCAL, 1969.  As such, these files
have been declared as "officially restored".

Experts who have studied these files have mastered most, but not all, of the arcane
references used by the original author; perhaps this is an example of a "window" into
the mind of Rick Merrill.  It is known that there were intentions to interface
FOCAL with many other software projects, including translating the source code for
other computer architectures; specifically, a version for the PDP-9 is known to have
existed which was an expedient edit of these files.

Last edit: 11-Sep-2017 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with (possibly MS-DOS and) OS/8 limitations before usage.

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
(Note: The P?S/8 SHELL environment supports dates from 1-Jan-1900 through
31-Dec-2411.)

Directory Listing:
____________________________________________________________________________________

11-Sep-2017

01/16/2016  07:05 PM         5,008,242 DEC-08-AJAD-D.pdf
02/10/2015  01:26 AM         1,261,369 DECUS-FOCAL8-17.pdf
04/08/1987  11:00 PM            25,232 FLOAT.ZZM
04/08/1987  11:00 PM            45,894 FOCAL.ZZM
03/01/2016  12:00 AM           112,111 FOCAL69 Initial Dialogue.pdf
03/01/2016  12:00 AM           189,359 FOCAL69.pdf
02/04/1987  08:00 PM            36,448 FOCPQS.HELP

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

DEC-08-AJAD-D.pdf

		This is the official manual for FOCAL, 1969. It replaces the manual
		for FOCAL, 8/68, the previous release.

		There is confusion regarding this manual because it is supposedly for
		"FOCAL-8" which is the official name of another somewhat defective
		product released in 1971.  That release is in most ways unacceptable
		and a step backwards from FOCAL, 1969.  A small fix is included that
		was retained in FOCAL-8 from the previous project, which was not
		FOCAL, 1969 as would be expected, but apparently from a version never
		released that was drastically modified to become FOCAL-12 for the
		PDP-12 DIAL-MS system.  This small improvement wass added to the code
		base internally, and then the updated code base was used to create
		FOCAL-8.

		More importantly, this fix was improved and added to the P?S/8 FOCAL
		overlay while maintaining binary compatibility (at the expense of
		being able to be run on the PDP-5 and PDP-8/S).  If there is a demand
		for this improvement in a form more suitable to update the original
		FOCAL, 1969 independently of P?S/8, it may be made available by
		Charles Lasner, the author of P?S/8 FOCAL based on his earlier work
		which was FOCAL for the R-L Monitor System (aka MS/8 which was
		submitted to DECUS under that name).
		

DECUS-FOCAL8-17.pdf

		This is the unofficial "handbook" for much of what goes on within
		FOCAL, 1969 for the benefit of advanced users desiring to make
		custom changes to FOCAL, 1969.  A thorough understanding of this
		document is but one of several requirements to successfully modify
		P?S/8 FOCAL, which includes specific implementation of certain of
		the issues discussed here.

FLOAT.ZZM	Source file for FOCAL, 1969 floating point arithmetic, etc.  Meant
		to be assembled with FOCAL.ZZM.  (Note: In OS/8, use the file name
		FLOATZ.ZM.)

FOCAL.ZZM	Source file for FOCAL, 1969.  Meant to be assembled with FLOAT.ZZM.
		(Note: In OS/8, use the file name FOCALZ.ZM.)  (Note: Does not
		include the optional INIT section usually distributed as an
		independent binary section on the same physical BIN format
		paper-tape.)

		The creation of the P?S/8 system program named FOCAL starts with the
		binary output of the assembly of FOCAL.ZZM and FLOAT.ZZM.  Additional
		binary files are then loaded over memory to create the P?S/8 system
		program image; this requires extended memory to load the entire image
		at one time.  (Note: At the present time, this is accomplished in
		OS/8 as .SV core image file; numerous other P?S/8 system programs are
		processed in a similar manner.  A bootable P?S/8 starter system uses
		P?S/8 DUMP with script files to transfer the images to the starter
		system to create a full P?S/8 release.  Future system releases will
		be achieved by other means.

		The creation process of P?S/8 FOCAL includes creating overlays from
		the additional code loaded in extended memory.  Once this is
		completely installed as a P?S/8 system program, FOCAL executes in
		4K; overlays are brought in as necessary, such as at the completion
		of reading the contents of all input files which can include FOCAL
		commands and data.

		Once this overlay is loaded, FOCAL then accepts input from the
		console as would the stand-alone version (subject to the presence of
		the P?S/8 Logical Console Overlay which may already be in effect
		before FOCAL is invoked).

		Before FOCAL starts up, P?S/8-oriented additional once-only
		initialize code makes certain internal changes, some of which are
		dependent on passed command-line option switches.  Any initial P?S/8
		SLURP format binary files are processed for the purpose of loading
		patches to FOCAL.  This is accomplished by an imbedded SLURP loader
		that is device-independent but is not virtualized.  Binary files must
		be created with intimate understanding of the internal workings of
		FOCAL as well as P?S/8 internal operations; extended memory can be
		freely loaded (as required by the custom patch being added).  By
		following the internal rules of FOCAL, multiple packages can be
		loaded by following the proper relocation requirements.

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
			the nominal speed that would match the speed of a machine
			with a crystal clock.  This is because the PDP-8/I memory
			often must be slowed down due to reliability issues; this is
			also why eventually the PDP-8/L and the PDP-12 were
			officially slowed down slightly.  Thus, the timeout is too
			critical to be reliably used.  However, the method is
			totally worthless when any form of console change is made.
			There are perfectly legitimate alternatives on these
			machines that increase the baud rate such as using the
			LA-30P interface which is actually a parallel device with
			quite different (and faster) timing, or various terminals
			such as the VT05 and LA36 which are 100% compatible at the
			speed of at least up to 300 baud.  (Note: The VT05 is not
			100% compatible at speeds of 600 baud or faster; this is why
			the KL8-JA Omnibus interface was released several years
			later.  It includes an option to correct the problem by
			brute-force hardware methods that function up to 1200 baud
			in countries that use 50 Hz power mains, and 2400 baud in
			countries that use 60 Hz power mains.  However, this does
			not effect the reckoning of PDP-8/I versus PDP-8/L.)

			This problem can be corrected by executing the group III
			OPR instruction 7601.  On all models from the PDP-8 up, this
			instruction clears the AC with the lone exception of the
			PDP-8/L because the design of the PDP-8/L is such that all
			group III OPR instructions are inhibited; on all other
			models, group III OPR instructions execute as harmless NOP
			instructions unless EAE is implemented.  But the 7601
			instruction always works on the rest of the product line
			(not including the PDP-5 and PDP-8/S which are already ruled
			out in the internal INIT code earlier than this decision
			point).

		     2)	INIT is ignorant of all computers newer than the PDP-12
			(which is correctly identified by explicit CPU check).  As
			such, it just reports the CPU as PDP-8 which is confusing
			since that is also the correct notation for the original
			PDP-8, which has already been correctly identified by the
			fact that instructions that work on the PDP-8/I, PDP-8/L and
			PDP-12 do not function.

			As such, INIT will falsely identify any model of Omnibus CPU
			(KK8F as used in PDP-8/E, PDP-8/F, PDP-8/M, PDP-8/A 6xx or
			KK8A as used in one-slot CPU PDP-8/A models, the VT78 or
			any other machine based on the 6100 (the Intercept I,
			PCM-12/12A), all DECmates or any other machines based on the
			6120 (CPU-8 Omnibus CPU from CESI, SBC6120) or DCC models
			112 and 112H which use a slightly different CPU design that
			can be detected by another OPR instruction).

			Note: FOCAL-8, a derivative of FOCAL, 1969 includes code to
			detect the DCC machines; however, if the CPU matches one of
			these models, FOCAL-8 cleverly self-destructs internally so
			as to suggest the hardware is flaky.  (Note: Similar
			sabotage code was once added to a short-lived release of
			OS/8 and later removed; DEC management forgot that this had
			been added to FOCAL-8 which was never withdrawn.)

		If there is sufficient interest, a P?S/8-specific INIT can be
		created to roughly follow the program flow of the original INIT only
		with these problems corrected.  However, one particular portion of
		such an INIT program patch cannot be implemented:

		     a)	The original INIT asks the user certain questions regarding
			the possible retention of some of the trigonometric
			functions; however, only certain questions are asked
			creating the minor problem that not all cases are covered.

		     b)	P?S/8 FOCAL corrects this situation by using passed option
			switches to allow all combinations of retention (which
			amounts to four possible combinations; the original INIT
			only allows three of the possibilities).  If required, P?S/8
			FOCAL relocates one package over the address space of the
			other package, thus not only allowing this case, but
			recovering the storage space as intended.

		Thus, such an INIT package can only report which functions were/were
		not retained; this dynamic self-configuration has already been
		performed before any such a binary patch can be applied.

		Note: The extension used on FOCAL, 1969 is apparently derived from
		the author's personal preference to not embrace the .PAL extension
		and instead called the first implementation of FOCAL by the .ZZZ
		notation for both FOCAL and FLOAT.  (Indeed, that there are actually
		two files is a personal preference.  Nothing is gained by the
		separation; assembler features exist to force sectional titles
		within an assembly listing if this was the intended reason.)
		Apparently, with each major development effort, the extension was
		"decremented" thus, FOCAL, 1969 as released, is known as FOCAL.ZZM
		and FLOAT.ZZM.  Presumably there is an INIT.ZZM as well (but this
		collection only includes source code recreated by Charles Lasner by
		disassembly techniques and proper comparison to the binary paper-tape
		version which is widely available).

FOCAL69 Initial Dialogue.pdf

		Assembly listing of the recreated FOCAL, 1969 INIT program overlay
		based in part on recollections of Charles Lasner.  The source code
		has been verified to create the correct binary file.  It is hoped
		someone can provide a more authentic source or listing file which
		will then obsolete this specific file; however, it is more than
		adequate to show what the initial dialogue consists of.  Intimate
		knowledge of FOCAL, 1969 is required to understand certain portions
		of this program section.  Note: The quality of commentary in this
		version of the original may exceed that of the original file.
		Should this be the case, it may be useful to augment this file to be
		more like the original file.

FOCAL69.pdf	Listing file of the complete FOCAL, 1969 created by assembling
		FOCAL.ZZM and FLOAT.ZZM together.

FOCPQS.HELP	This is a source fragment of the overlay to FOCAL, 1969 that is used
		to create the P?S/8 FOCAL system program.  While only a stopgap
		measure in terms of documentation, it does provide all of the
		implemented command-line option switches and their meanings.  A few
		examples are provided to illustrate certain advanced techniques used
		with P?S/8 FOCAL to extend the utility of FOCAL, 1969.

[End-of-file]
