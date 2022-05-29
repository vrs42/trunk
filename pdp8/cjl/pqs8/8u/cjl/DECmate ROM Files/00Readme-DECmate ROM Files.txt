DECmate ROM Files.

Certain files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 30-Jan-1989 and 19-Nov-1989 and other sources.

Last edit: 26-Jun-2018 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with [possibly MS-DOS and] OS/8 limitations before usage.

General disclaimer:

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

Note: Currently, all files in this directory are specific to the DECmate II.  Future
releases may include analogous files for the DECmate III and DECmate III+.  However,
all three models operate in a similar manner to within their respective
configurations, etc.

Directory Listing:
____________________________________________________________________________________

26-Jun-2018

12/02/1991  03:00 AM           124,904 358360.PAL
06/26/2018  12:42 AM           191,551 358360.pdf


¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

358360.PAL	Source file for the contents of the final release of the DECmate II
		ROMs.  Organization into the three 2716 ROMs known as E113, E114 and
		E115 is documented within this file.  Corresponding part numbers
		often found on actual ROM labels are 358, 359 and 360 respectively.

		This file was created by Charles Lasner by intensely studying the
		ROM contents in conjunction with certain hardware manuals that
		describe certain sub-components of the DECmate II, etc.

358360.pdf	Documentation of the ROM contents organized into the actual working
		12-bit words that are loaded into Control Panel memory when needed.

		Extensive knowledge of PDP-8 assembly language and additional
		specific knowledge of the Control Panel memory extension of the 6120
		chip is required, as well as an understanding of certain input and
		output instructions as implemented by DEC in the DECmate II, etc.

		This file was created using advanced features of the P?S Enhanced
		PDP-8 Simulator [PEPS] for Windows in conjunction with certain
		commonly available Windows-based utilities.

[End-of-file]
