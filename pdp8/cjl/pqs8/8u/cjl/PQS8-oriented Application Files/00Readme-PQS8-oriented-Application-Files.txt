P?S/8-oriented Application Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 30-Jan-1989 and 19-Nov-1989.

Last edit: 13-Jun-2015 cjl

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

13-Jun-2015

07/22/1988  08:00 PM             7,719 24GOTHIC.FON
07/22/1988  08:00 PM               455 CONVERT.TEC
01/21/1981  08:00 PM            41,282 DATA.OLD
04/21/1988  11:00 AM            46,426 DATA.PAL
04/26/1988  01:00 PM            23,586 DSFILE.PAL
08/15/1988  02:00 PM            16,501 DSPROC.PAL
07/29/1988  08:00 PM            20,562 FONCON.PAL
06/27/1988  12:00 AM             6,380 GOTHIC24.FON
02/15/1989  03:09 PM            48,547 HDSPLOT.PAL
04/15/1988  12:00 AM            14,324 PRPLOT.PAL
03/18/1988  12:00 AM           119,209 REGPLT.PAL
04/06/1988  11:00 AM            79,351 SPANAL.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

24GOTHIC.FON	Fancy-Font file converted to text format by using CONVERT.TEC or
		equivalent.

		Note: This file was recovered from diskettes created on 30-Jan-1989
		and 19-Nov-1989.

CONVERT.TEC	TECO macro to convert Fancy-Font files to text files in preparation
		for processing with the FONCON program in P?S/8.  Fancy-Font files
		are usually obtained from MS-DOS systems using Kermit-12 or an
		equivalent process.  Once converted to printable text, the files
		can be converted to P?S/8 text files using the P?S/8 OS8CON program.
		The resultant files are then processed by FONCON.

		Note: This file was recovered on diskettes created on 30-Jan-1989
		and 19-Nov-1989.

DATA.OLD	Source file for a complex real-time data acquisition program for the
		LAB-8/E or PDP-12 used to collect data at regular intervals and
		write the data on DECtape [or LINCtape if PDP-12] for a considerable
		time period; the tape write operations must not interfere with the
		data rate despite the overlap of laboratory data transfers in
		real-time with the periodic DMA transfers to the storage device;
		certain novel techniques are used to prevent interaction and
		consequential data synchronization errors.  [Note: The program was
		debugged with an oscilloscope to determine sources of data time-sync
		jitter; instruction times in certain key program sections were
		carefully compensated for to eliminate potential time-keeping
		errors.]

		This program was developed and then refined for over a decade to
		deal with specific neurological data and the study of eye movements
		with a high degree of sample timing accuracy.  Because it uses a
		pair of dismountable tape drives, experimental data collection can
		be extended arbitrarily by the use of multiple pairs of storage
		tapes used alternately.  Follow-up data analysis is then carried out
		on larger hard disk storage devices by making image copies of the
		collected data with P?S/8 BLKCPY.  [Note: Data acquisition is not
		possible on the hard disks directly due to the much faster DMA rate
		on these faster devices; this would prevent the real-time routines
		from having sufficient CPU cycles to keep up with the data rate.]

		Note: The data format is independent of any operating system
		conventions; data storage must be provided free of directory or
		other restrictions.  While standard PDP-8 operating system loading
		and exit conventions are obeyed, program operation is incompatible
		with OS/8 unless additional memory is available beyond the overall
		operating system requirement, which could be as large as 8K or 12K].
 		P?S/8 allows the program to run in as little as 8K of memory
		depending on the specific configuration.  The actual LAB-8/E and
		PDP-12 computers that ran this program had inadequate memory to
		consider OS/8; P?S/8 was always the operating system of choice; most
		of the analysis programs for this data are specific to P?S/8.]
		[OS/8 is unsuitable for this program because of the general
		restriction on the use of entire extended memory fields; assuming
		OS/8 requires 8K or 12K, the program would require 12K or 16K
		minimum.  Using P?S/8, an 8K machine can run the program adequately
		as defined; source code parameters exist to redefine the memory
		field for the real-time buffering if desired.]  [Note: This file is
		a prior release of the DATA.PAL program.]

DATA.PAL	Source file for a complex real-time data acquisition program for the
		LAB-8/E or PDP-12 used to collect data at regular intervals and
		write the data on DECtape [or LINCtape if PDP-12] for a considerable
		time period; the tape write operations must not interfere with the
		data rate despite the overlap of laboratory data transfers in
		real-time with the periodic DMA transfers to the storage device;
		certain novel techniques are used to prevent interaction and
		consequential data synchronization errors.  [Note: The program was
		debugged with an oscilloscope to determine sources of data time-sync
		jitter; instruction times in certain key program sections were
		carefully compensated for to eliminate potential time-keeping
		errors.]

		This program was developed and then refined for over a decade to
		deal with specific neurological data and the study of eye movements
		with a high degree of sample timing accuracy.  Because it uses a
		pair of dismountable tape drives, experimental data collection can
		be extended arbitrarily by the use of multiple pairs of storage
		tapes used alternately.  Follow-up data analysis is then carried out
		on larger hard disk storage devices by making image copies of the
		collected data with P?S/8 BLKCPY.  [Note: Data acquisition is not
		possible on the hard disks directly due to the much faster DMA rate
		on these faster devices; this would prevent the real-time routines
		from having sufficient CPU cycles to keep up with the data rate.]

		Note: The data format is independent of any operating system
		conventions; data storage must be provided free of directory or
		other restrictions.  While standard PDP-8 operating system loading
		and exit conventions are obeyed, program operation is incompatible
		with OS/8 unless additional memory is available beyond the overall
		operating system requirement, which could be as large as 8K or 12K].
 		P?S/8 allows the program to run in as little as 8K of memory
		depending on the specific configuration.  The actual LAB-8/E and
		PDP-12 computers that ran this program had inadequate memory to
		consider OS/8; P?S/8 was always the operating system of choice; most
		of the analysis programs for this data are specific to P?S/8.]
		[OS/8 is unsuitable for this program because of the general
		restriction on the use of entire extended memory fields; assuming
		OS/8 requires 8K or 12K, the program would require 12K or 16K
		minimum.  Using P?S/8, an 8K machine can run the program adequately
		as defined; source code parameters exist to redefine the memory
		field for the real-time buffering if desired.]

DSFILE.PAL	Source file for a P?S/8-specific application program to write TFS
		output files from the contents of memory created by the use of P?S/8
		FOCAL with the DPATCH Display program or equivalent.  Data is
		formatted as a series of display point X, Y pairs in 12-bit unsigned
		decimal format for further processing by other utility programs.

DSPROC.PAL	Source file for a virtualized extra-large x, y graphics utility
		specific to P?S/8.  This program was written by Charles Lasner and
		is a partial basis for the student project mentioned elsewhere.

FONCON.PAL	Source file for a Fancy-Font -> P?S/8 text file converter program.
		Seven-bit font files are converted to six-bit P?S/8 text format
		without line numbers intended to be an extended-length file in the
		extended file directory.  The output file is oriented towards DEC
		sixel format.  This allows trivial output programming in a variety
		of languages to output custom font text messages to label plots
		printed on a variety of DEC printers that support plotting data
		points and also sixel graphics that can be used to form characters.
		The converted files are then passed to the printing/plotting program
		along with data points created elsewhere.  Any standard Fancy-Font
		font file can be used as input after proper conversion by
		CONVERT.TEC orequivalent.

		Note: This file was recovered from diskettes created on 30-Jan-1989
		and 19-Nov-1989.

GOTHIC24.FON	Fancy-Font file converted to text format by using CONVERT.TEC or
		equivalent.

		Note: This file was recovered from diskettes created on 30-Jan-1989
		and 19-Nov-1989.

HDSPLOT.PAL	Source file for a plotting utility for the HDS3200 graphics terminal
		operating under P?S/8.

PRPLOT.PAL	Source file for a graphics program related to the student project
		that requires P?S/8 mentioned elsewhere.  This particular utility
		uses memory-based data [likely left in memory by the use of P/S/8
		FOCAL with a variant of DPATCH] to create hard-copy output on a DEC
		LA34 printer.  [This program is likely a precursor to at least one
		other student project file;it was written by the instructor, who was
		an associate of Charles Lasner at the time.  Virtually all PDP-8
		programs created in this university setting were expressly written
		for use with P?S/8.]

		It is likely the date of the recovered file is accurate and is
		consistent with other student project files.  As such, the internal
		date will be ignored.  [While the teacher had good skills regarding
		file versions and internally documentation including time/date
		stamps, this cannot be expected from the students; the actual last
		edit is likely some time within a few weeks of the recovery date.]

REGPLT.PAL	Source file for a student project to implement a module of a large
		project to display ReGIS graphics output.  The input data is taken
		from X, Y display pairs located in a designated memory buffer
		[likely generated by P?S/8 FOCAL used with a suitable display device
		patch program].  The output is to a designated logical unit on a
		P?S/8 device such as an RK8E/RK05.  [The overall project is
		P?S/8-specific although certain aspects of the source code were
		developed on other systems.]  Another portion of the project reads
		the disk-based data and outputs to specific devices.  [Note: It is
		not known if this project was ever completed; some portions of the
		source code were provided by Charles Lasner to encourage students to
		use P?S/8.]

SPANAL.PAL	Source file for a display-oriented real-time data analysis program
		that operates under P?S/8.  Can be assembled to display on either
		the LAB-8/E or a home-brew 12-bit D-A converter board patterned
		after the DEC AA01A.  Real-time data is read from either TC01/TC08
		DECtape or MDC8 HD Diskette [FLP] media in the format defined in the
		DATA program described elsewhere.  Various one-character keyboard
		commands control what data is displayed.  The entire program can be
		run unattended through the use of P?S/8 text files instead of the
		console input.  Requires a minimum of 20K memory depending on
		features assembled into a working binary version.

[End-of-file]
