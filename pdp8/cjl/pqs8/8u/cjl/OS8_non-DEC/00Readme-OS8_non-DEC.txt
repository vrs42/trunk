OS/8-related Files [from non-DEC sources].

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 19-Mar-1985.

Last edit: 11-Jun-2015 cjl

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

11-Jun-2015

12/07/1984  05:00 PM            20,656 CMPR30.PAL
11/07/1988  02:00 AM            27,930 COMMAND.PAL
10/27/1988  10:00 AM            12,140 COMSPEC.PAL
02/21/1985  12:00 AM            11,136 RUNOFF.BIN

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

CMPR30.PAL	Source code file of an absolute binary compare program for any two
		OS/8 files Version 30 originally written by Mark E. Kendrat then
		debugged by Charles Lasner [this program is one of the first MEK
		ever wrote].  The program will output ALL word differences
		throughout a file with no ability to limit the output.  Considered a
		useful utility when comparing two files already likely to be
		[nearly] identical.  Note: The program will take advantage of the
		availability of 12K memory to speed up the verification.

COMMAND.PAL	Source file of the partially-completed replacement command processor
		for use with Kermit-12.

COMSPEC.PAL	Source file for a preliminary specification for a replacement
		command processor for use with Kermit-12 [or other utility program].
		The commands are structured similarly to TOPS-10 Kermit and other
		programs created for use with TOPS-10 with various extensions as
		often used in TOPS-20 command situations as part of the DEC Command
		Language [DCL].

		Notable features include context-sensitve help and the ability to
		embed guide words into the command [which will be ignored].

		Note: While there is no PDP-8 programming per se in this file, it is
		meant to be assembled with any of the prevailing fully-compatible
		PDP-8 assemblers.

RUNOFF.BIN	Binary file of a user-written version of RUNOFF Version 06B for
		OS/8.

[End-of-file]
