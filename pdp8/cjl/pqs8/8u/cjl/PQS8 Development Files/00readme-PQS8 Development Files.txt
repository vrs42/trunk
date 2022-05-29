P?S/8 Development Files.

Note: Some of the files in this directory were recovered from OS/8 format MDC8 [FLP]
diskettes created on 30-Jan-1989.

Last edit: 25-May-2015 cjl

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

25-May-2015

08/20/1986  06:00 PM             3,160 RXDOO.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

RXDOO .PAL	Source file for a P?S/8-based test program to exercise the RX01
		system device handler by performing repetitive timing tests on the
		highest tracks of the diskette.  This was used primarily during the
		development phase of the handler in conjunction with an equivalent
		program for use with the corresponding OS/8 system device handler.

		The earliest versions of the P?S/8 system device handler
		incorporated the compact repetitive subtraction method of division
		for mapped track and sector calculation widely used [which can
		exhibit poor performance].  By concentrating on system calls that
		map to the highest diskette tracks, actual performance is easily
		evaluated.  On a PDP-8/E-based RX01 system, problems only present on
		the highest tracks; there is no point in testing access to the lower
		tracks as the repetitive subtraction method is adequate for those
		cases.  [Note: Users of OS/8 generally do not notice the loss of
		performance on PDP-8/E-based RX01 systems, as only the very highest
		tracks are affected; however, the OS/8 equivalent timing test
		program confirms the loss of performance.  When the OS/8 handlers
		were originally written, slower computers based on the RX01, such as
		the VT78, had not been contemplated.]

		As the coding of the handler progressed, higher-performance routines
		were written that eliminated the overhead of the original divide
		algorithm.  This includes a divide simulator using bit shifting
		[such as is used in typical EAE implementations], and a
		predictor-corrector method that uses the previous track and sector
		parameters to rapidly calculate the latest values.  Tests on a VT78
		[the slowest model known to use an RX01 controller] show no loss
		of performance.  [Note:  By failing to maintain the required 2:1
		interleave, the OS/8 equivalent handler generally runs thirteen
		times as slow on the VT78 and Intercept I, an equivalent system from
		Intersil also based on the 6100 chip.]

[End-of-file]
