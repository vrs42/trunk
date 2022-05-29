P?S/8 Help Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 19-Nov-1989.

Last edit: 16-Feb-2015 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with [possibly MS-DOS and] OS/8 limitations before usage.

Given the current state of P?S/8 development, most P?S/8 source files are meant to
be assembled with PAL8 for the express purpose of creating pragmatic core image
files later used from P?S/8 to transfer the image of particular system programs
needed after the initial [starter] P?S/8 bootable system is created.

These help files were created during this assembly process [or equivalent] and then
truncated to only include internal documentation of the program which generally
precedes other assembly details [sometimes erring on the side of excessive length].
[In some cases code tables are given to minimally explain the implemented commands.]

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

04/08/1987  12:00 AM               613 4PATCH.HELP
04/08/1987  12:00 AM               563 8PATCH.HELP
07/23/1986  12:00 AM             4,849 ALLCAT.HELP
07/23/1986  12:00 AM            21,117 ASCODE.HELP
10/06/1987  12:00 AM            95,143 ASMBLR.HELP
12/21/1986  12:00 AM            47,537 BIN.HELP
04/08/1987  01:00 AM            46,204 BLKCPY.HELP
07/23/1986  12:00 AM             4,998 BLKODT.HELP
07/23/1986  12:00 AM             2,814 BPATCH.HELP
07/23/1986  12:00 AM             5,487 BSAVE.HELP
04/08/1987  12:00 AM            25,653 CONSOL.HELP
07/23/1986  12:00 AM            10,912 CORE.HELP
10/20/1987  12:00 AM            22,400 DIRECT.HELP
04/08/1987  12:00 AM             6,244 DPATCH.HELP
10/20/1987  12:00 AM            60,128 FILMAN.HELP
02/04/1987  08:00 PM            36,448 FOCPQS.HELP
04/08/1987  12:00 AM            14,132 KL8.HELP
04/08/1987  11:00 PM            18,995 KL8PCH.HELP
07/23/1986  12:00 AM            12,681 L6DCON.HELP
07/23/1986  12:00 AM            12,653 LTBODT.HELP
07/23/1986  12:00 AM            12,614 MAP.HELP
07/23/1986  12:00 AM             2,208 NPATCH.HELP
07/23/1986  12:00 AM            12,495 ODT.HELP
04/08/1987  12:00 AM             8,002 OPATCH.HELP
07/23/1986  12:00 AM            12,226 OS8CON.HELP
04/08/1987  12:00 AM             5,874 PQSDSU.HELP
04/08/1987  12:00 AM            12,627 PQSDTA.HELP
04/08/1987  12:00 AM            12,954 PQSLTA.HELP
12/12/1986  12:00 AM            19,108 PQSMON.HELP
04/08/1987  12:00 AM             7,306 PQSRKA.HELP
12/10/1986  12:00 AM            44,688 PQSRXA.HELP
07/03/1987  12:00 AM             5,790 PRINT.HELP
12/27/1986  12:00 AM             1,916 RT11.HELP
04/08/1987  12:00 AM             4,635 RXAHND.HELP
07/23/1986  12:00 AM            25,189 SET.HELP
02/04/1987  12:00 AM             5,498 SYSTAT.HELP
04/08/1987  12:00 AM             6,497 VT8E.HELP
04/08/1987  12:00 AM             7,700 VT8PCH.HELP

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

4PATCH.HELP	Help file describing the four word floating point binary patch to
		P?S/8 FOCAL known as 4PATCH.

8PATCH.HELP	Help file describing the 8K binary patch to P?S/8 FOCAL known as
		8PATCH.

ALLCAT.HELP	Help file for the P?S/8 ALLCAT program.

ASCODE.HELP	Help file for the code comparison chart file [ASCODE].

ASMBLR.HELP	Help file for the P?S/8 PAL program including option switches and
		defined symbols.

BIN.HELP	Help file for the P?S/8 BIN program.

BLKCPY.HELP	Help file for the P?S/8 BLKCPY program.

BLKODT.HELP	Help file for the P?S/8 BLKODT program.

BPATCH.HELP	Help file describing the functions implemented by the binary patch
		to P?S/8 FOCAL known as BPATCH.

BSAVE.HELP	Help file for the P?S/8 BSAVE program.

CONSOL.HELP	Help file for the P?S/8 Logical CONSOLe Overlay management utility.

CORE.HELP	Help file for the P?S/8 CORE program.

DIRECT.HELP	Help file for the P?S/8 DIRECTory program.

DPATCH.HELP	Help file describing the functions implemented by the binary patch
		to P?S/8 FOCAL known as DPATCH.

FILMAN.HELP	Help file for the P?S/8 FILMAN program [file and directory
		maintenance utility].

FOCPQS.HELP	Help file for the P?S/8 FOCAL program.

KL8.HELP	Help file describing the Logical Console Overlay patch file for the
		KL8 family of interfaces [and related printers].

KL8PCH.HELP	Help file for the source file used to customize the KL8 family of
		Logical Console Overlay files [KL8].

L6DCON.HELP	Help file for the P?S/8 L6DCON program.

LTBODT.HELP	Help file for the P?S/8 LTBODT program.

MAP.HELP	Help file for the P?S/8 MAP program.

NPATCH.HELP	Help file describing variou aspects of the patch to P?S/8 FOCAL to
		interface to the Nicolet 1070 Data Averager and implement buffering
		functions.

ODT.HELP	Help file for the P?S/8 ODT program.

OPATCH.HELP	Help file describing various aspects of the generic input/output
		redirection patch to P?S/8 FOCAL.

OS8CON.HELP	Help file the P?S/8 OS8CON bidirectional text file conversion
		program.

PQSDSU.HELP	Help file describing various aspects of the P?S/8 system device
		handler for the DSD-240-8/Western Dynex disk drive including
		various bootstrap procedures.

PQSDTA.HELP	Help file describing various aspects of the P?S/8 system device
		handler for the TC01/TC08 DECtape including various bootstrap
		procedures.

PQSLTA.HELP	Help file describing various aspects of the P?S/8 system device
		handler for the PDP-12 TC12 LINCtape controller and 1-8 TU55 or
		TU56 LINCtape drives including various bootstrap procedures.

PQSMON.HELP	Help file describing various aspects of the P?S/8 operating system
		block layout, keyboard monitor commands, keyboard monitor special
		characters, the FIND and CHANGE editing commands.  [Note: FIND and
		CHANGE are assembled with the main operating system code.]

PQSRKA.HELP	Help file describing various aspects of the P?S/8 system device
		handler for the RK8E/RK05 and related devices including various
		bootstrap procedures.

PQSRXA.HELP	Help file describing various aspects of the P?S/8 system device
		handler for the RX01 and related devices including various bootstrap
		procedures.

PRINT.HELP	Help file describing the command-line options and printout details
		of the P/S/8 text file PRINT utility.

RT11.HELP	Help file describing the programming of the RT11 DECtape -> P?S/8
		text file convertor program.

RXAHND.HELP	Help file describing various aspects of the P?S/8 non-system device
		handler for the RX01 and related devices.

SET.HELP	Help file describing the many options of the P?S/8 SET command.

SYSTAT.HELP	Help file describing the command-line options and printout details
		of the P?S/8 SYSTAT program.

VT8E.HELP	Help file describing the Logical Console Overlay patch file for the
		VT8E.

VT8PCH.HELP	Help file describing the binary patch to P?S/8 FOCAL for the VT8E
		graphics and character display device known as VT8PCH.

[End-of-file]
