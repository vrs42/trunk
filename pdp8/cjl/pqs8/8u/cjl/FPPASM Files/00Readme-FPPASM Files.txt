FPPASM Files.

Source files of the Floating Point and PAL assembler for LAP6-DIAL/DIAL-MS and
various support packages.

The original source files of the assembler could only be assembled on a working copy
of this assembler under DIAL; it has been modified to be compatible with P?S/8 PAL
and OS/8 PAL8 to allow development of a version compatible with P?S/8 [which was
never completed as of the time of the creation of the variant source file].  Due to
the superficial nature of the changes made, it is a trivial matter to convert the
file back to the original.  Due to the limitations of the DIAL environment, it is
not possible to assemble the entire source from a single file; as is the case with
the regular PDP-8/LINC dual assembler for DIAL, the CHAIN directive is used to
allow multiple files to be assembled as a project [with attendant overhead].  The
chained parts 2 and 3 files are included without change.  Note:  Binary
compatibility with the original DIAL binary file was confirmed at the time of the
creation of the original OS/8 source file.  [The source files actually stem from
some time in 1971.]

Note: All of the files were created with an unwanted artifact likely created by a
defective conversion program produced by the DEC PDP-8 programming group [without
any form of support].  This was performed prior to the availability of a
DIAL <-> P?S/8 text file converter program [that would not have added the artifact].

This quirk consists of a *20 statement, which is the default origin in the usual PAL
language; this language element doesn't exist in the FPPASM dialect which instead
uses ORG [as well as many other alternate constructs that are not compatible, but
are functionally equivalent to standard PAL language elements].

Due to the similarity between the DIAL internal text format and the standard basic
P?S/8 text format, the continued development of the project may be taken up in the
future.

It is worthy to note that there are other assemblers for the FPP-12 and compatible
hardware or emulators, but the PDP-8 language support is quite inferior to that of
this assembler, which even supports literals and other features [which the DIAL
dual-mode PDP-8 and LINC assembler does not].

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 19-Mar-1985.

Last edit: 09-May-2015 cjl

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

09-May-2015

10/31/1984  12:00 AM            22,831 FPASM2.FASM
10/31/1984  12:00 AM            17,593 FPASM3.FASM
10/31/1984  12:00 AM            13,652 FPLB1S.FASM
10/31/1984  12:00 AM            32,335 FPLB2S.FASM
10/31/1984  12:00 AM            19,573 FPLIBS.FASM
11/05/1984  05:00 PM            67,657 FPPASM.PAL
10/31/1984  12:00 AM            14,681 FPPLB1.FASM
10/31/1984  12:00 AM             6,857 FPPLIB.FASM

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

FPASM2.FASM	Source code file for the FLoating Point and PAL assembler for
		LAP6-DIAL/DIAL MS; this is part 2 of 3.  [Note: Dial cannot handle
		files longer than the DIAL workspace; assembly must be completed by
		the CHAIN directive within the file [which is only compatible with
		assembly by a working copy of this assembler under DIAL.]  [Note: It
		is believed the *20 at the beginning of this file is an artifact of
		translation caused by the use of a DEC-written conversion program
		for transfer between DIAL and OS/8; it is necessary to remove or
		comment this out as it is incompatible with the intent of the source
		code.  The Floating Point and PAL assembler does not use * for
		origin setting as do most assemblers.]

FPASM3.FASM	Source code file for the FLoating Point and PAL assembler for
		LAP6-DIAL/DIAL MS; this is part 3 of 3. [Note: Dial cannot handle
		files longer than the DIAL workspace; assembly must be completed by
		the CHAIN directive within the file [which is only compatible with
		assembly by a working copy of this assembler under DIAL.]  [Note: It
		is believed the *20 at the beginning of this file is an artifact of
		translation caused by the use of a DEC-written conversion program
		for transfer between DIAL and OS/8; it is necessary to remove or
		comment this out as it is incompatible with the intent of the source
		code.  The Floating Point and PAL assembler does not use * for
		origin setting as do most assemblers.]

FPLB1S.FASM	Second source code file of the FPP user suport package that was
		released with the Floating Point and PAL assembler for
		LAP6-DIAL/DIAL MS.  [Note: It is believed the *20 at the beginning
		of this file is an artifact of translation caused by the use of a
		DEC-written conversion program for transfer between DIAL and OS/8;
		it is necessary to remove or comment this out as it is incompatible
		with the intent of the source code.  The Floating Point and PAL
		assembler does not use * for origin setting as do most assemblers.]

FPLB2S.FASM	Third source code file of the FPP user suport package that was
		released with the Floating Point and PAL assembler for
		LAP6-DIAL/DIAL MS.  [Note: It is believed the *20 at the beginning
		of this file is an artifact of translation caused by the use of a
		DEC-written conversion program for transfer between DIAL and OS/8;
		it is necessary to remove or comment this out as it is incompatible
		with the intent of the source code.  The Floating Point and PAL
		assembler does not use * for origin setting as do most assemblers.]

FPLIBS.FASM	First source code file of the FPP user suport package that was
		released with the Floating Point and PAL assembler for
		LAP6-DIAL/DIAL MS.  [Note: It is believed the *20 at the beginning
		of this file is an artifact of translation caused by the use of a
		DEC-written conversion program for transfer between DIAL and OS/8;
		it is necessary to remove or comment this out as it is incompatible
		with the intent of the source code.  The Floating Point and PAL
		assembler does not use * for origin setting as do most assemblers.]

FPPASM.PAL	Full source code file of the Floating Point and PAL assembler for
		LAP6-DIAL/DIAL MS.  The source code was modified by Charles Lasner
		to be compatible with P?S/8 PAL and OS/8 PAL8 for the purposes of
		development of an alternate version for P?S/8.  This is the complete
		source code; DIAL chaining and minor incompatibilies are commented
		out and replaced with standard PAL equivalents where required.  This
		version is 100% binary-compatible with the original when assembled
		by P?S/8 or PAL8 with certain option switches set.  [Note: The
		original file had automatically generated *20 statements at the
		beginning of every section which were incompatible and were
		commented out.  It is believed the *20 statements are an artifact of
		translation caused by the use of a DEC-written conversion program
		for transfer between DIAL and OS/8.]

FPPLB1.FASM	Source code file of the additional FPP suport library coding that
		was released with the Floating Point and PAL assembler for
		LAP6-DIAL/DIAL MS.  [Note: It is believed the *20 at the beginning
		of this file is an artifact of translation caused by the use of a
		DEC-written conversion program for transfer between DIAL and OS/8;
		it is necessary to remove or comment this out as it is incompatible
		with the intent of the source code.  The Floating Point and PAL
		assembler does not use * for origin setting as do most assemblers.]

FPPLIB.FASM	Main source code file of the FPP suport library that was released
		with the Floating Point and PAL assembler for LAP6-DIAL/DIAL MS.
		[Note: It is believed the *20 at the beginning of this file is an
		artifact of translation caused by the use of a DEC-written
		conversion program for transfer between DIAL and OS/8; it is
		necessary to remove or comment this out as it is incompatible with
		the intent of the source code.  The Floating Point and PAL assembler
		does not use * for origin setting as do most assemblers.]

[End-of-file]
