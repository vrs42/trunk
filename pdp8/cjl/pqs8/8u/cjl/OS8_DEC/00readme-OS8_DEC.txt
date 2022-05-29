DEC OS/8 Family Source Files.

Note: Some of the files in this directory were recovered from OS/8 format MDC8 [FLP]
diskettes created on 30-Jan-1989.

Last edit: 01-Jun-2018 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with [possibly MS-DOS and] OS/8 limitations before usage.

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

01-Jun-2018

01/01/1980  12:00 AM            19,468 DIRECT.PAL
12/26/1985  12:00 AM             6,979 LPTR.PAL
01/15/1986  02:00 AM            14,088 RX50SYCJL.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

DIRECT.PAL      Source file for OS/8 Version 3D DIRECT command.

LPTR  .PAL	Source file for an obscure release of the serial LPT: handler for
		OS/78 V4 and/or OS/278 V1/V2 Version A0.  The source code is
		different from the official file known to exist for OS/78 V4 
		[LPTSER.PAL], yet the file internally indicates this is a release
		for OS/78.  The release version has the typical convention for
		OS/278 [which differs from OS/8 release version conventions; the
		version and revision are reversed].  [Note: This file may have been
		recovered from a DEC release of a diagnostic disk such as the System
		Test Diskette for the DECmate II; these disks occasionally have
		source code on them.  For the most part, they are based on OS/278
		V1, a system that was never released; it was abandoned in favor of
		OS/278 V2 which does have noticeably less bugs and higher release
		revisions.]  [Note: The file date is likely the date of discovery,
		not the original file date; often the file is undated and file
		recovery will use the current system date.]

RX50SYCJL.PAL	Source file of the OS/278 RX50 system device handler disassembled by
		Charles Lasner from the corresponding sectors of a bootable RX50
		system diskette.

		There are interesting differences between this and the official
		version including greater accuracy of the source code.  Both
		versions were derived from the earlier handler for the RX01/RX02
		equivalent; as a result, many of the symbols are identical.
		However, there are notable issues:

		1) There is a clear downturn in programming quality in the DEC
		   release; it is known that at the time of development of OS/278
		   Version 1, numerous bugs were introduced into this descendant of
		   OS/8 by incompetent newbie personnel; Version 2 of OS/278 is
		   similar; however most of the differences are corrections to
		   mistakes made in Version 1.

		2) There are some blatant sloppy areas of the source code that show
		   a lack of proper understanding of the PDP-8 instruction set.  The
		   following is a typical example:

		   When a list pointer address is needed for use with an auto-index
		   register, the address minus one should be used.  In the DEC
		   source code, there is a superfluous constant left over from
		   removed coding related to RX02 support present in the previous
		   file.  Not only was it not removed, the address of this constant
		   was used as the value for the auto-indexed operation.  That this
		   functions correctly is only a fortunate coincidence: the list in
		   question just happens to follow the otherwise unreferenced
		   constant; no attempt is made to ensure this positional
		   relationship and there are no other references to the superflous
		   constant in the entire source code.

		3) No explanation is given for a sequence of eight words of zeroes
		   in a particular place other than a sparse comment about the ID
		   area.  Standard coding practice is to ensure any area that is
		   highly positional is to at least comment on the fact that these
		   words must be placed exactly where they are [as is used in other
		   portions of the code carried through from the RX02 version].
		   Better practice is to include conditional assembly to
		   deliberately cause assembly errors if the address should move.

		It is important to note that OS/8 BUILD was dropped during the
		development of this system and replaced by a SET HANDLER command
		that never fully worked; instead of fixing this problem, they merely
		documented that any attempt to change the handler blocks in the
		diskette version of OS/278 would lead to a non-bootable system.

		It was later discovered the reason for this failure was a problem
		that was never remedied:

		When the DECmate II [and follow-on machines] boot to a diskette,
		there is a validation process performed in 8-bit mode; bits that
		are inaccessible from this handler determine the bootability.
		Clearly, OS/278 was created by a kludge; the programming used was
		never released and is likely some private patching facility
		[perhaps on a different computer] that must be used to make the
		diskette bootable.  None of this was explained to the programming
		staff.

		When the DECmate II ROM code was disassembled, it was determined
		these bytes must form a pattern that passes a checksum validation
		test performed in 8-bit byte mode.  Arbitrary bit patterns were
		chosen with no regard as to whether the 12-bit mode handler could
		reproduce these patterns.  [Note: It is believed these patterns were
		created by arbitrary decisions of DEC personnel with little care
		about implementation difficulties caused by their choices; it was
		merely assumed this didn't matter.]

		Subsequently, Charles Lasner determined there are alternate data
		patterns that can be written in 12-bit mode that are acceptable to
		the ROM-based code for proper validation.  A test version of OS/278
		with these particular values was proven capable of being rewritten
		in 12-bit mode while maintaining validity.  Such a handler
		modification would allow BUILD to be supportable; no special kludges
		would be required to create OS/278.

[End-of-file]
