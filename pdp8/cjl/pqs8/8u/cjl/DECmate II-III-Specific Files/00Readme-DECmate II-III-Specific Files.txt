DECmate II-III-Specific Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 30-Jan-1989 and 19-Nov-1989.

Last edit: 12-Jun-2015 cjl

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

12-Jun-2015

06/15/1982  12:00 AM            46,405 CPODT.PAL
06/24/1982  12:00 AM            57,412 CPXDT.AA
08/03/1988  12:00 AM           200,606 CPXDT.LST
07/14/1982  12:00 AM            67,288 CPXDT.PAL
04/18/1987  12:00 AM             5,362 G.ENC
04/18/1987  11:00 PM             9,991 G.PAL
04/18/1987  12:00 AM             1,547 G.SN
03/06/1984  12:00 AM             9,137 SCREEN.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

CPODT.PAL	Source file for CPODT Version 1.0 released 15-Jun-1982.  This is an
		earlier release of the CPODT program than the one named CPXDT.PA as
		described elsewhere.  Apparently this is a preliminary release of
		CPODT before the program was complete; revisions of the program
		were released relatively quickly for a time.

CPXDT.AA	Source file for CPODT Version 1.3 released 24-Jun-1982.  This is an
		earlier release of the CPODT program than the one named CPXDT.PA as
		described elsewhere.  Apparently this is a preliminary release of
		CPODT before the program was complete; revisions of the program
		were released relatively quickly for a time.

		Note: It is apparently a personal preference of the programming
		staff that worked on this program to use the .AA extension for older
		releases of the program.

CPXDT.LST	OS/8 listing file created from the CPXDT.PA source file.  The
		listing needs to be confirmed as the accurate listing that would
		result using the current CPXDT.PA file; however, this cannot be
		directly accomplished:

		     1)	The listing file was created by PAL8 under the OS/278 V1
			system which was never released.

		     2) There are internal differences within files created by
			OS/278 V1 PAL8 and all other versions of PAL8 for other OS/8
			family members.  While assembling the source file with a
			different assembler may produce similar results, programs
			must be written to reconcile the output format differences
			to be certain the source code is identical.

		Note: The indicated file date is somewhat misleading; it is several
		years after the release of CPODT.  This date could merely be that of
		the transfer of the original file to another OS/8 family system that
		assigned the then-current date to the file.  Unfortunately, this
		cannot be verified because the assembly was performed wihout setting
		the system date.  [Note: Unlike P?S/8, OS/8 family members must have
		the system date set on every bootup; P?S/8 retains the current [last
		explicitly set] date permanently unless commands are given to either
		update or clear the system date setting.  As such, P?S/8 current
		dates as expressed in listing files are inherently quite
		trustworthy.]

		If the contents prove to be essentially identical to that which can
		be produced by assembling the CPXDT.PA file, it is recommended the
		program be assembled with a newer assembler such as P?S/8 PAL as an
		alternate to this file.

		Note: 31-Jan-2015.  The source file CPXDT.PA was assembled with PAL8
		Version B0 from OS/278 V2; the file differences were for the most
		part reconciled by appying editing procedures that produced a
		listing file resembling the output of the PAL8 Version A1 from
		OS/278 V1.  The only differences between the files reveals there are
		bugs in the "/C" [CREF] option of the earlier PAL8 that tends to
		corrupt part of the output processing of generated literals; this
		was apparently fixed in the next complete system release.  Thus, it
		is recommended that CPXDT.LS be ignored in favor of an output
		listing created by an assembler not presenting these flaws.

CPXDT.PAL	Source file for CPODT Version 1.5 released 14-Jul-1982.  This is
		apparently the final release version.

		CPODT [aka CPXDT or CPUODT] is a standalone debugging tool for use
		on the DECmate II/III/III+ only.  It uses specific control-panel
		memory request functions as implemented on these machines
		specifically.  [CPODT apparently does not run on a DECmate I.]

		CPODT is meant to be loaded from an operating system such as OS/278
		V1.  Another bootable system [such as WPS] can be booted with CPODT
		resident to allow debugging of that system.  [Note: Due to lack of
		documentation, it is unclear how transfer of control is accomplished
		for any particular operating system to be debugged; in the case of
		WPS, it is conceivable a rigged version of WPS was required to
		facilitate debugging.]

		CPODT is somewhat more versatile than the operating system debuggers
		such as OS/8 and P?S/8 ODT, which put additional restrictions on the
		program being debugged [such as operating system resident areas and
		the reservation of location 0004 in any field a breakpoint is set
		in].  These system-specific debuggers are designed to work only with
		programs running under them; CPODT can debug the operating system
		itself if certain [minimal] requirements are met.

G.ENC		Binary executable file [G.SV in unencrypted form] of an obscure
		program apparently used to exercise the graphics board option of the
		DECmate II [and likely compatible with the DECmate III series when
		used with the corresponding graphics board].  This file apparently
		originates from a DECmate diagnostic diskette in RX50 format.  [This
		will be verified at a future date.]

		Note: File recovery was not performed directly; the file was encoded
		into G.ENC using the ENCODE program associated with the Kermit-12
		package.  [The image file can be restored on any OS/8 system using
		the corresponding DECODE program.  Two letter file extensions are
		required in OS/8; the designated file name would be G.EN.]

G.PAL		Source file of an obscure program apparently used to exercise the
		graphics board option of the DECmate II [and likely compatible with
		the DECmate III series when used with the corresponding graphics
		board].  This file apparently originates from a DECmate diagnostic
		diskette in RX50 format.  [This will be verifed at a future date.]

		Note: This source code was obtained from an incomplete disassembly
		of the binary file in conjunction with the DCP16 disassembly
		program for OS/8.  Certain comments were added after abandoning the
		automated process of disassembly.

G     .SN	Symbolic control file for the DCP16 disassembler program used with
		G.SV to produce the partially disassembled G.PA program.  While
		there are many used memory locations still essentially in binary
		form in the source file, few of them are actually instructions; most
		are apparently data used by the program to form bar patterns and
		other program elements.

SCREEN.PAL	Source file for a pre-release diagnostic program for the DECmate II
		graphics board option [presumably compatible with the later graphics
		option board for the DECmate III series].  This file apparently
		originates from a DECmate diagnostic diskette in RX50 format.  [This
		will be verified at a future date.]

[End-of-file]
