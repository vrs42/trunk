SPCWAR w/ENCODE,DECODE DECtape Information

Last edit: 03-Aug-2016 cjl

Type: OS/8 Format DECtape

Purpose: All Files for unknown SPCWAR game including ENCODE and DECODE tools

Note:	Some of the date information below has been modified to correct for factual
	errors or design limitations of OS/8.  Authoritative date information has
	been obtained from reliable sources where applicable.  As required,
	discrepancies regarding specific files and additional information about
 	certain files will be provided.

Directory Listing:
____________________________________________________________________________________

 01-AUG-16

DECODE.SV 0007    5 08-JUL-92     DECODE.BN 0014    5 08-JUL-92
ENCODE.SV 0021    6 08-JUL-92     ENCODE.BN 0027    6 08-JUL-92
SPCWAR.EN 0035   31 01-AUG-16     SPCWAR.SV 0074   19 01-AUG-16
DECODE.PA 0117   91 08-JUL-92     ENCODE.PA 0252   94 08-JUL-92
<EMPTY>   0410  473               

 473 FREE BLOCKS

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
File Information

DECODE.BN	Binary file used to create the executable program DECODE.SV as
		described below.

		Full file name: DECODE.BIN.

		Note: To ensure maximum reliability, DECODE.BN should be derived
		from the source file DECODE.PA as described below.  OS/8 .BN format
		often becomes corrupted on Internet archives that provide it in the
		original form.

DECODE.PA	Source file for the DECODE.SV program as described below.  This
		source file can be assembled into DECODE.BN as described above then
		loaded and saved as DECODE.SV.

		Full file name: DECODE.PAL.

DECODE.SV	OS/8 executable file for the DECODE program written by Charles
		Lasner first released with the Kermit-12 package as K12DEC.PAL.

		This is a very popular archiving format for many 12-bit files since
		the printably-encoded format is quite impervious to the various
		forms of corruption often found on the Internet [including loss of
		<CR>/<LF> convention when stored in unix-based systems].  ENCODE
		format includes a 60-bit checksum and repeat compression for
		reliable file transmission while maintaining minimal file size.

		In this application, SPCWAR.EN was obtained from an archive in
		ENCODE format; it was fully recovered using DECODE.SV to produce
		SPCWAR.SV.  The file format includes internal naming; as such, it is
		not necessary to know the output filename, as it will be recreated.
		If an alternate file name is desired, an explicit output file name
		can be specified to override the default behavior.

		Full file name: DECODE.SAV.

		Note: To ensure maximum reliability, DECODE.SV should be derived
		from DECODE.BN, which in turn should be derived from the source file
		DECODE.PA as OS/8 .SV format is often corrupted on Internet archives
		that provide the file in original form.

ENCODE.BN	Binary file used to create the executable program ENCODE.SV as
		described below.

		Full file name: ENCODE.BIN.

		Note: To ensure maximum reliability, ENCODE.BN should be derived
		from the source file ENCODE.PA as described below.  OS/8 .BN format
		often becomes corrupted on Internet archives that provide it in the
		original form.

ENCODE.PA	Source file for the ENCODE.SV program as described below.  This
		source file can be assembled into ENCODE.BN as described above then
		loaded and saved as ENCODE.SV.

		Full file name: ENCODE.PAL.

ENCODE.SV	OS/8 executable file for the ENCODE program written by Charles
		Lasner first released with the Kermit-12 package as K12ENC.PAL.  Use
		ENCODE.SV to create the .EN files that DECODE.SV restores to the
		original file.

		ENCODE and DECODE can handle entire devices as well as single files.
		There are options to handle several situations including splitting
		the image file of the entire device into two roughly equal parts;
		this allows recreating a device image on media the same size as the
		original image by a two-stage process in case no larger media is
		available.

		Note: All option switches are documented within the source code
		files DECODE.PA and ENCODE.PA as described above.

		Full file name: ENCODE.SAV. 

		Note: To ensure maximum reliability, ENCODE.SV should be derived
		from ENCODE.BN, which in turn should be derived from the source file
		ENCODE.PA as OS/8 .SV format is often corrupted on Internet archives
		that provide the file in original form.

SPCWAR.EN	ENCODE format version of the SPCWAR.SV program as described below.
		This file was obtained from an Internet archive site of primarily
		12-bit programs for the PDP-8 family.  The site offers several
		options for download; the use of ENCODE format is highly recommended
		for maximum reliability and ease of recovery.

		While ENCODE format encourages various forms of internal
		embellishments including the automatic creation of optional fields
		describing the apparent OS/8 file date and the apparent OS/8 file
		creation date, this information was stripped out of the file copy
		obtained on the Internet.  As such, a present-day date was
		arbitrarily assigned to the file.  While this file date is likely
		extremely flawed, assigning any date will limit further date
		degradation caused by using undated files in OS/8 [a well-known
		system flaw].  Fortunately, the internal file name was retained
		allowing partial recovery.

		Full file name: SPCWAR.ENC.

SPCWAR.SV	This file is presumably an executable graphically-oriented game for
		a specific PDP-8 configuration.  As of this writing, all that is
		known about it is that it [indirectly] starts at 00200 as an
		internal accommodation; there is an internal jump to a much higher
		address which suggests a memory layout more typical of PDP-12
		programs derived from LAP6-DIAL/DIAL-MS.  However, lacking a proper
		source file, it may be necessary to disassemble the file to fully
		determine the exact hardware configuration supported.

		Note: If the program was originally designed for use on the PDP-12,
		it may be possible to restore specific functionality on the PDP-12
		by applying a modest patch.  Many programs with memory layouts
		similar to this program were originally written for PDP-8 systems
		with specific laboratory peripherals such as the LAB-8/E which were
		then slightly modified to run on the PDP-12.  Only a full
		disassembly back to meaningful source code will allow determining
		this with certainty [as well as discover the appropriate operating
		controls].

		Full file name: SPCWAR.SAV.

[End-of-file]
