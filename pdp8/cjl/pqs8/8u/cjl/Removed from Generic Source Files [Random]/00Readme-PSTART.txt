PSTART DECtape Information

Last edit: 30-Jul-2016 cjl

Type: OS/8 Format DECtape

Purpose: All Files for the KALEID and PSTART Projects a/o 30-Jul-2016

Note:	Some of the date information below has been modified to correct for factual
	errors or design limitations of OS/8.  Authoritative date information has
	been obtained from reliable sources where applicable.  As required,
	discrepancies regarding specific files and additional information about
 	certain files will be provided.

Directory Listing:
____________________________________________________________________________________

 30-JUL-16

PSTART.PA 0007   34 30-JUL-16     PSTART.LS 0051   67 30-JUL-16
PSTART.BN 0154    2 30-JUL-16     KALEID.BN 0156    2 21-JUL-16
KALEID.LS 0160   61 21-JUL-16     KALEID.PA 0255   31 21-JUL-16
<EMPTY>   0314  533               

 533 FREE BLOCKS

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
File Information

KALEID.BN	Binary file obtained by assembling KALEID.PA as described below.
		Since no working copy of PAL12 was available, P?S/8 PAL was used to
		create P?S/8 binary files.  As of the time of this writing, there
		does not exist a functioning binary file conversion program between
		P?S/8 and OS/8.  The binary file was obtained by using P?S/8 BIN to
		punch binary paper-tapes in standard paper-tape BIN format which
		were subsequently read into OS/8 using the PTR: handler for the
		high-speed reader.

		Full file name: KALEID.BIN.

KALEID.LS	Listing file obtained by assembling KALEID.PA as described below.
		Since no working copy of PAL12 was available, P?S/8 PAL was used to
		create the listing and binary files.  The P?S/8 device 66 LPT:
		output was captured and filtered in the P?S Advanced SIMH Package
		[PASP] and converted to a fully-formatted text file which can be
		further processed into a green-bar listing .PDF file or a printed
		listing.

		This file was then placed into the high-speed reader PTR: file. SIMH
		was then booted to OS/8 allowing OS/8 PIP to read the file and save
		it as provided here.

		Note: If a functioning version of PAL12 can be obtained, the PASP
		can also produce an equivalent file assembled entirely within OS/8.
		Note: PAL12, PAL8 and P?S/8 PAL all require artifact removal before
		further processing of listing output.

		Full file name: KALEID.LST.

KALEID.PA	Source file for the recovered PDP-12 demonstration program usually
		known as KALEIDOSCOPE.  This file can only be assembled with the
		P?S/8 PAL assembler or a currently unavailable release of the user
		program known as PAL12.SV.  Note: Various defective releases of
		PAL12 are known to exist that are incapable of proper assembly of
		this and other dual-mode assembly programs originating from the
		LAP6-DIAL/DIAL-MS system for the PDP-12.  Currently, a search is
		on for a proper release of PAL12 pending PDP-12 hardware repairs
		which should allow reading a specific LINCtape that apparently
		contains the correct PAL12 release.

		The file was obtained by Charles Lasner from a copy of the PDP-12
		stand-alone LINCtape-based demo monitor system which was provided
		with every PDP-12 when first installed.  The tape directory is
		compatible with LAP6-DIAL/DIAL-MS directory standards.  The
		contents were greatly altered to be compatible with more recent PAL
		language standards.  Note: The source code derives from classic LINC
		versions that cannot support much in the way of internal
		documentation or any form of formatting beyond the minimum allowing
		assembly.  When assembled by either a proper version of PAL12 or
		P?S/8 PAL. a far more readable listing file is produced.

		Note: Even with modern source code conventions, this program is
		extremely difficult to follow and incorporates various forms of
		obfuscation including non-obvious self-modificatation techniques.

		The only actual original documentation provided was a terse
		description of how the program is used and controlled.  All other
		comments are added by Charles Lasner and includes information
		recollected from more than 40 years ago to provide insight into
		using and understanding the program [to the extent possible].

		Full file name: KALEID.PAL.

PSTART.BN	Binary file obtained by assembling PSTART.PA as described below.
		All assembly and file conversion issues for the KALEID.BN program
		as described above apply to PSTART.BN.

		Full file name: PSTART.BIN.

PSTART.LS	Listing file obtained by assembling PSTART.PA as described below.
		All assembly and file conversion issues for the KALEID.LS file as
		described above apply to PSTART.LS

		Full file name: PSTART.LST.

PSTART.PA	Source file for the PDP-8 operating system startup stub for programs
		such as KALEIDOSCOPE to allow being run from either P?S/8 or OS/8 on
		the PDP-12.  Certain restrictions may apply for use with larger
		programs; this is fully documented within the source code.  This
		program was written by Charles Lasner to allow these programs to be
		used independently of LAP6-DIAL/DIAL-MS LINCtapes.

		All assembly considerations that pertain to the KALEID.PA program as
		described above apply to the PSTART program.  Internal documentation
		for PSTART assumes KALEID as the primary example.  The program is
		easily adapted for use with other DIAL-based programs for similar
		purposes.

		Full file name: PSTART.PAL.

[End-of-file]
