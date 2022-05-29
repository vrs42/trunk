Kermit-12 Release Files.

Last edit: 09-Sep-2016 cjl

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
[Note: The P?S/8 SHELL environment supports dates from 01-Jan-1900 through
31-Dec-2411.]

Directory Listing:
____________________________________________________________________________________

09-Sep-2016

08/30/1990  09:00 AM               548 K12CLR.PAL
10/01/1991  03:00 PM             6,013 K12CRF.BOO
08/30/1990  09:00 AM             8,077 K12CRF.ENC
10/22/1991  12:00 PM            22,529 K12DEB.PAL
07/08/1992  10:00 PM            34,609 K12DEC.PAL
10/01/1991  03:00 PM            23,437 K12ENB.PAL
08/31/1990  12:00 PM            12,269 K12ENC.DOC
07/08/1992  10:00 PM            35,725 K12ENC.PAL
10/08/1991  12:00 PM             8,465 K12FL0.IPL
10/08/1991  12:00 PM             8,464 K12FL1.IPL
10/01/1991  03:00 PM             1,887 K12GLB.BOO
09/05/1990  12:00 PM             2,595 K12GLB.ENC
10/06/1991  05:00 AM             1,834 K12IP0.ODT
10/06/1991  05:00 AM             1,827 K12IP1.ODT
10/08/1991  12:00 PM            11,159 K12IPG.PAL
10/06/1991  05:00 AM             4,016 K12IPL.DOC
10/06/1991  05:00 AM             9,274 K12IPL.PAL
07/11/1992  03:00 PM            24,357 K12MIT.ANN
10/01/1991  03:00 PM             9,099 K12MIT.BOO
05/01/1992  05:00 PM            37,556 K12MIT.BWR
09/06/1990  11:00 AM            68,393 K12MIT.DOC
07/11/1992  03:00 PM            26,131 K12MIT.DSK
09/06/1990  11:00 AM            11,701 K12MIT.ENC
09/06/1990  11:00 AM            14,983 K12MIT.LST
11/10/1997  09:43 PM           232,215 K12MIT.NEW
07/11/1992  03:00 PM            28,256 K12MIT.NOT
09/06/1990  11:00 AM           231,403 K12MIT.PAL
07/11/1992  03:00 PM             1,061 K12MIT.UPD
09/06/1990  11:00 AM            25,090 K12PCH.PAL
10/01/1991  03:00 PM             9,047 K12PL8.BOO
08/30/1990  09:00 AM            11,784 K12PL8.ENC
09/06/1990  11:00 AM             1,281 K12PRM.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

K12CLR.PAL	Source file of a simple memory-clearing program.  The resulting binary
		file [K12CLR.BN] is used when loading the binary file of the main
		assembly of Kermit-12 [K12MIT.BN] to preclear memory.  This causes the
		resulting core image file [K12MIT.SV or KERMIT.SV] to be "cleaner"
		which allows for improved file compression when the core image file is
		encoded by DECODE [K12ENC] or ENBOO [K12ENB].

K12CRF.BOO	This is the standard OS/278 V2 release of the OS/8 cross-reference
		program [CREF.SV] taken from the DECUS release of OS/278 V2 as DM-101.
		The file has been encoded in .BOO format to prevent corruption.  This
		is the preferred version [B0] of CREF.SV for general use because it
		fixes several long-standing bugs of CREF and also supports
		128K-capable listings produced by later versions of PAL8; this
		release is the designated companion to PAL8 Version B0.  It has been
		determined that no hardware extensions beyond the original "Family of
		8" are required, although quite obscure minor interaction with the
		KL8E handler may result due to concessions made because of the DECmate
		console hardware incompatibility.  [Few users will ever notice this
 		incidental problem which is not serious and only presents in specific
		contrived circumstances.]

		This release should be considered as the only constructive version of
		OS/8 CREF past Version 3.  It is provided as a convenience to
		Kermit-12 users to help with any program development issues.

K12CRF.ENC	This is the standard OS/278 V2 release of the OS/8 cross-reference
		program [CREF.SV] taken from the DECUS release of OS/278 V2 as DM-101.
		The file has been encoded in .ENC format to prevent corruption.  This
		is the preferred version [B0] of CREF.SV for general use because it
		fixes several long-standing bugs of CREF and also supports
		128K-capable listings produced by later versions of PAL8; this
		release is the designated companion to PAL8 Version B0.  It has been
		determined that no hardware extensions beyond the original "Family of
		8" are required, although quite obscure minor interaction with the
		KL8E handler may result due to concessions made because of the DECmate
		console hardware incompatibility.  [Few users will ever notice this
		incidental problem which is not serious and only presents in specific
		contrived circumstances.]

		This release should be considered as the only constructive version of
		OS/8 CREF past Version 3.  It is provided as a convenience to
		Kermit-12 users to help with any program development issues.

K12DEB.PAL	Source file of a utility program to decode .BOO format files back into
		the original [binary] form.  Length correction bytes are supported to
		ensure proper file decoding.  [Note: .BOO format length correction was
		invented by Charles Lasner to prevent the tendency for .BOO format
		files to have an inherent uncertainty of precise length should the
		file pass through intermediate systems that could easily add one or
		two null bytes to the end of the file; this could be due to local
		alignment considerations as well as an inherent limitation of .BOO
		format.  All later implementations of .BOO format utilities should
		implement this feature to avoid file size creep.  Earlier utilities
		which are prone to the problem cannot be improved; however, the
		enhanced format is fully compatible with these earlier utilities
		notwithstanding the inherent limitations.  To earlier implementations
		of .BOO format utilities, correction bytes are interpreted as
		compression fields of length zero; in newer utilities such as the
		MS-DOS and OS/8 implementation of .BOO utilities, each correction byte
		indicates the file requires the last byte of the file to be logically
		removed before final decoding.  As necessary, one or two correction
		byte fields are added to preserve the original file length.]

		Any file encoded with the K12ENB utility [ENBOO.SV] will perfectly
		decode into the original form as long as the file's contents are
		intact [other than white-space and other insignificant "cosmetic"
		considerations].

		Files encoded in .BOO format [but not originating from the ENBOO
		utility or equivalent], will generally not decode into exact multiples
		of 384 bytes as will all OS/8 files. [All OS/8 files are multiples of
		256 12-bit words which in .BOO terms is 384 8-bit bytes.]  As such,
		these files will be padded with null bytes to fill the rest of the
		last OS/8 record; should these files later be recoded into .BOO
		format, these null bytes will be added to the resulting file.  [OS/8
		does not support a mechanism to flag the original logical end of
		file.]

K12DEC.PAL	Source file of a utility program [DECODE.SV] to decode encoded binary
		files created by the K12ENC [ENCODE.SV] program into the original
		form.  Files can be recreated with any arbitrary name to override the
		original file name if desired.  [Note: In general, the original file
		name is embedded within the file along with additional information
		about the file [such as the OS/8 date of creation as well as the OS/8
		date of the original file]; however, all of this information is
		considered optionsl and may not be present.  Additionally, as is the
		case with all OS/8 date considerations, the dates within the file are
		subject to anomaly by exact multiples of eight years.]

		The output can be directed to any file-structured device on the
		current system.  The ENCODE format also supports entire device images
		in either a single file form or split into two roughly equal "halves"
		to allow an entire device image to be recreated on comparable hardware
		without requiring larger devices [assuming two drives are available].
		Assembly instructions and usage examples can be found within the
		source file.

		Unlike the source code of Kermit-12 itself, this source file is
		deliberately devoid of "frill" features found in later PAL8 releases.
		As such, it should be possible to create DECODE.SV on any version of
		PS/8, PS/12, OS/8, OS/12, OS/78 or OS/278 etc.

		The Kermit-12 distribution includes the last known release of PAL8
		and CREF taken from OS/278 Version 2; these are provided as K12PL8.ENC
		and K12CRF.ENC.  Once DECODE.SV is used to recover the original files,
		PAL8.SV and CREF.SV respectively, all other source files in the
		Kermit-12 package can be successfully assembled as required.

		A technical discussion of the specifics of ENCODE format
		implementation and certain design considerations and tradeoffs can be
		found in the K12ENC.DOC file described elsewhere in this document.

K12ENB.PAL	Source file of a utility program [ENBOO.SV] to encode any OS/8 file
		into .BOO format for distribution via any method that doesn't corrupt
		the file contents in any material way.  While not as robust as the
		newer ENCODE format, .BOO format encoding generally produces smaller
		encoded files.

		This implementation inserts length correction bytes into the encoded
		output file as necessary to prevent file length creep [as long as
		compatible de-BOO-ing programs such as DEBOO.SV are used to recover
		the original file].

		For more information about .BOO format and other considerations, see
		the description of the K12DEB.PAL file elsewhere in this document.

K12ENC.DOC	ENCODE format was designed by Charles Lasner and Frank da Cruz, the
		lead designer of the Kermit project.  The intention was to produce a
		series of utility programs for all supported architectures that would
		produce files less prone to corruption than the more prevalent
		encoders [at the time] for uuencode and .BOO formats.  Had more
		support been forthcoming from the Kermit community, additional design
		features would have been added to allow even more universal encoding
		utilities for all supported architectures.

		Unfortunately, there was little support for this project, as most
		people just put up with the occasional failure and "band-aid"
		approaches needed to get past specific failures.  As such, the format
		was made PDP-8-centric leading to the ENCODE and DECODE programs as
		described elsewhere in this document.

		This file is a technical description of the ENCODE format and several
		of the design considerations in play at the time.  Certain extensions
		and alternate implementations are discussed, mostly for the benefit of
		other architectures.  All internal aspects of the ENCODE format [as
		used in the present utilities] are accurately discussed including some
		specific implementation issues.

		While this file is printable ASCII text, it is suggested some file
		cleanup be performed before using for any serious purposes; the file
		was never "word-processed" in any sense [as the term became known
		later].  Descendants of this file may be reworked into a more modern
		format for easier reading and further discussion.

K12ENC.PAL	Source file of a utility program [ENCODE.SV] to convert any OS/8 file
		to a "printable" ASCII text format suitable for transmission through
		virtually any medium.  The only requirement is maintaining the correct
		character codes for the safe transmission of the characters "0"
		through "9" and "A" through "Z".  [Note: Case conversion is harmless
		to the integrity of the file.  Any modification of "white-space"
		characters within the file is also harmless, as the only reason such
		characters are present is to increase the "readability" of the file to
		a casual [human] reader and to create reasonable line breaks; most of
		the file is just coded groups of the supported characters meaningful
		only to proper decoding programs.]

		This utility is provided in the Kermit-12 package to allow any file to
		be encoded in a format that Kermit-12 presently supports.  [Kermit-12
		does not support binary file transmission; this allows a workaround
		accomplished indirectly by using ENCODE and the DECODE program
		described elsewhere in this document.]

		A technical discussion of the specifics of ENCODE format
		implementation and certain design considerations and tradeoffs can be
		found in the K12ENC.DOC file described elsewhere in this document.

K12FL0.IPL	This is the field zero data of the Kermit-12 program [K12MIT.SV]
		encoded into .IPL format.  It is meant to be received by the
		appropriate loader [K12IPL.PAL assembled for field zero data and
		usually named IPL0.SV].  Multiple data fields can be combined into a
		single binary executable [K12MIT.SV] by using OS/8 ABSLDR with certain
		command-line options as documented within K12IPL.PAL as described
		elsewhere in this document.

K12FL1.IPL	This is the field one data of the Kermit-12 program [K12MIT.SV]
		encoded into .IPL format.  It is meant to be received by the
		appropriate loader [K12IPL.PAL assembled for field one data and
		usually named IPL1.SV].  Multiple data fields can be combined into a
		single binary executable [K12MIT.SV] by using OS/8 ABSLDR with certain
		command-line options as documented within K12IPL.PAL as described
		elsewhere in this document.

K12GLB.BOO	Certain key symbols from K12MIT.PAL must be properly maintained to ensure
		identical values within K12PCH.PAL; this allows binary-compatible patches
		to be created without reassembling the main source file.  [Note: Due to
		the large size of the Kermit-12 main source file, development must be
		performed on systems with 12K or more as well as sufficient storage to
		support larger file editing.  The K12PCH.PAL file can be assembled on
		smaller systems with 8K memory.]

		The ability to maintain symbol values in one file from the symbol table
		printout of the other was developed for P?S/8 in the 1970s to allow
		development of overlay files to the P?S/8 keyboard monitor.  This was
		accomplished by a TECO macro known as XEQUA.TEC.

		An adaptation of the TECO macro is included in the Kermit-12 package and
		is known as K12GLB.TEC [or GLOBAL.TEC].  Kermit-12 developers need to
		understand how to use GLOBAL.TEC should the source code change
		sufficiently to require an update to the affected symbol definitions.
		The process is documented within K12PCH.PAL.

		To ensure there is no corruption to the GLOBAL.TEC macro file, it is
		encoded in .BOO format as part of the Kermit-12 package [K12GLB.BOO].
		The K12DEB.PAL [assembled into DEBOO.SV] can be used to recover the
		original K12GLB.TE file.

K12GLB.ENC	Certain key symbols from K12MIT.PAL must be properly maintained to ensure
		identical values within K12PCH.PAL; this allows binary-compatible patches
		to be created without reassembling the main source file.  [Note: Due to
		the large size of the Kermit-12 main source file, development must be
		performed on systems with 12K or more as well as sufficient storage to
		support larger file editing.  The K12PCH.PAL file can be assembled on
		smaller systems with 8K memory.]

		The ability to maintain symbol values in one file from the symbol table
		printout of the other was developed for P?S/8 in the 1970s to allow
		development of overlay files to the P?S/8 keyboard monitor.  This was
		accomplished by a TECO macro known as XEQUA.TEC.

		An adaptation of the TECO macro is included in the Kermit-12 package and
		is known as K12GLB.TEC [or GLOBAL.TEC].  Kermit-12 developers need to
		understand how to use GLOBAL.TEC should the source code change
		sufficiently to require an update to the affected symbol definitions.
		The process is documented within K12PCH.PAL.

		To ensure there is no corruption to the GLOBAL.TEC macro file, it is
		encoded in ENCODE format as part of the Kermit-12 package [K12GLB.ENC].
		The K12DEC.PAL [assembled into DECODE.SV] can be used to recover the
		original K12GLB.TE file.

K12IP0.ODT	This file contains a sample OS/8 ODT session used to create IPL0.SV by
		manual entry.  Additional information is available within the K12IPL.PAL
		file described elsewhere in this document.

K12IP1.ODT	This file contains a sample OS/8 ODT session used to create IPL1.SV by
		manual entry.  Additional information is available within the K12IPL.PAL
		file described elsewhere in this document.

K12IPG.PAL	Source file of a utility program used to generate the .IPL format files
		K12FL0.IPL and K12FL1.IPL.  Kermit-12 developers must be familiar with
		this utility in order to create updated .IPL format release files.  The
		present release of Kermit-12 requires 8K.  As such, K12IPG requires 12K
		as the utility must be loaded into a higher memory field than all fields
		occupied by K12MIT.SV [or KERMIT.SV or KERM12.SV].  Future development of
		Kermit-12 could increase this memory requirement if K12MIT.SV requires
		12K [or more] of memory.  [In general, to generate .IPL files will
		require a system with at least 4K more than Kermit-12 loads into.]

K12IPL.DOC	Documentation file for the .IPL format designed by Charles Lasner as a
		"printable" direct memory loading method between two serially
		connected systems.  [Those familiar with the paper-tape binary RIM
		format will notice certain design similarities.]

		When transferring binary information by a direct serial connection, it
		is preferable the data be "printable" for a variety of reasons,
		including the ability for the user to recognize the overall data
		format [including proper starting and ending points] by a cursory
		inspection at the sending end of the transfer.  The decoding program
		used is small enough to be entered into OS/8 ODT manually to create an
		adequate solution to transferring binary files to systems presently
		lacking Kermit-12 or any other communications utilities.

		.IPL format transfers are only capable of loading a single memory
		field [from 0000-7577] in any one session; small changes need to be
		made to the loading program to transfer more data, such as the present
		8K binary of Kermit-12.  [By nature, at least 8K is required to
		implement an unrestricted .IPL loading program.]  The various
		.IPL-oriented utilities in this package [and described elsewhere in
		this document] provide a complete solution to the problem of acquiring
		Kermit-12 when the only transmission method available is via direct
		connection to another system [such as a PC].

		.IPL format is currently used in certain PDP-8-centric Internet
		archives for the purpose of downloading absolute binary files as
		described in this document.  When used between systems for direct
		loading purposes, corruption of binary data is more likely avoided as
		compared to attempting to use RIM [or BIN] format data for similar
		purposes.

		Users having the proper capabilities should use ENCODE format
		transfers whenever possible due to the inclusion of checksumming and
		other enhancements promoting reliability.  However, programs to
		receive ENCODE format are far more complex; .IPL format was designed
		to use a minimal loading program that can easily be manually entered.

K12IPL.PAL	Source file of the .IPL format loading programs such as IPL0.SV and
		IPL1.SV.  Each variant executable file is used to load the
		corresponding memory field data provided from a remote system.  Full
		documentation of the entire process is described within the file.

		The binary versions of this program are small enough to allow direct
		manual entry from OS/8 utilities such as ODT; this is the designated
		method when using .IPL transfers on systems currently lacking
		Kermit-12 or any other communications program [to acquire this source
		file].  Sample OS/8 ODT sessions are provided within the files
		K12IP0.ODT and K12IP1.ODT described elsewhere in this document.

K12MIT.ANN	This is a printable cumulative announcement file for Kermit-12 for
		all releases supported by the Columbia University Center for Computing
		Activities [CUCCA].  CUCCA announcement files were distributed on a
		mailing list and were not intended for detailed information, but
		merely as an overview for the many people expressing a general
		interest in the Kermit project.  Kermit-12 announcements were combined
		with announcements for other Kermit implementations in the form of
		either an update file or a [roughly] semi-annual newsletter.

		The development of the Kermit-12 project from the earliest functional
		releases through 1992 is chronicled here in a generic fashion.  More
		detailed information can be obtained by observing the edit history
		within K12MIT.PAL, the main Kermit-12 source code file as described
		elsewhere in this document.  Note: The annoucement file does include
		certain information regarding other files within the overall Kermit-12
		package as they were released or updated; references are made to
		specific files where additional information is available for each
		specific component indicated.

K12MIT.BOO	This is the standard assembly of K12MIT.PAL [K12MIT.SV] encoded into .BOO
		format for inclusion into the Kermit-12 package [which does not include
		binary files].  To encourage file compression, the binary of K12CLR.PAL
		is used to preload memory; all areas of memory not loaded by K12MIT.SV
		will be set to 0000, ensuring the maximum effectiveness of repeat
		compression.

		Due to limitations of .BOO format, certain methods of obtaining Kermit-12
		using .BOO format will not succeed.  As required, it is recommended that
		K12MIT.ENC be used as ENCODE format is virtually impervious to file
		corruption.  [Note: ENCODE format generally creates longer files than
		.BOO format unless the binary contains large areas of repeated non-zero
		values.  This can be contrived by creating a copy of K12MIT.SV with
		memory preloaded with 7402, which is the PDP-8 HLT instruction, and
		arguably more useful than preloading with 0000.  ENCODE format repeat
		compression applies to any 12-bit value while .BOO format can only
		compress 000 values viewing the file as a series of 8-bit bytes.]

K12MIT.BWR	Standard releases of Kermit-12 supported by the Columbia University
		Center for Computing Activities [CUCCA] include a list of known problems
		associated with the release known as K12MIT.BWR.  Most issues are of
		little importance to others, but certain PDP-8 and DECmate users should
		read the file for information on program bugs and limitations of OS/8
		which are actually not well known.  [While Kermit-12 development ought to
		be a straightforward process within OS/8, certain bugs were not widely
		known before Kermit-12 was developed; unfortunately, these bugs are
		known to exist in all releases of OS/8 and related operating systems.]

		When Version 10g of Kermit-12 was released, testing on certain DECmate I
		configurations was undergoing independent testing and debugging.  A
		patch is included that updates Kermit-12 to Version 10h to allow proper
		operation on this system.

		The K12MIT.BWR file chronicles all of these problems as they were
		discovered; workarounds are provided where possible.  [Note: With the
		exception of the DECmate I problem, there are no other patches to the
		Kermit-12 release to fix bugs in Kermit-12; most of the issues relate to
		other subjects including the release of the ENCODE format programs to
		overcome the limitations of .BOO format encoding.]

K12MIT.DOC	As of this writing, there is no actual formal documentation file for the
		Kermit-12 packag; as a stopgap measure, the first few pages of the
		K12MIT.PAL file is included as K12MIT.DOC.  A lot of detailed information
		is available to assist in configuring the software [and in some cases the
		supported hardware] which is invaluable to most users.

		Users of systems based on smaller storage devices such as RX01 can more
		readily use K12MIT.DOC than the far larger K12mit.PAL; such users rarely
		require the full source code file for most purposes.

K12MIT.DSK	All Kermit-12 files created prior to 12-Jul-1992 were also available on
		two RT-11 format RX02 diskettes by private arrangement with Charles
		Lasner directly.  The K12MIT.DSK file is a directory listing of these
		diskettes with further documentation of all files included in the
		diskette-based release.

		Note: Future releases of Kermit-12 may continue the use of these
		diskettes since RT-11, unlike OS/8, supports proper dates until 2099.  As
		documented elsewhere, OS/8 date format can only be indicated to within
		an 8-year anomaly factor [which means the year is only reckoned to an
		offset of zero through seven years, while the base year can only be
		guessed at as either 1970, 1978, 1986 or 1994].  By any reckoning, OS/8
		dates have run out; current usage of OS/8 requires contriving correction
		of date years manually unless files are transferred to more capable
		systems such as MS-DOS/Windows.

		As of this writing, the P?S/8 SHELL is being developed.  When completed,
		this optional system component and file structure will support file dates
		from 01-Jan-1900 through 31-Dec-2471.  All files in the Kermit-12 package
		can be expressed as intended in this file structure without reduction of
		the file name and extension.  [OS/8 supports file names in 6.2 format
		while the P?S/8 SHELL supports file names in 12.4 format.  In general,
		files in the Kermit-12 package conform to the PDP-10 TOPS-10 format with
		certain exceptions requiring eight character names and three character
		extensions.  Many PDP-8 programs require proper file dates prior to 1980
		which conflicts with MS-DOS/Windows limitations.  The proper date for
		the XEQUA.TEC file, which GLOBAL.TEC is based on, cannot be expressed in
		MS-DOS/Windows.]

K12MIT.ENC	This is the standard assembly of K12MIT.PAL [K12MIT.SV] encoded into
		ENCODE format for inclusion into the Kermit-12 package [which does not
		include binary files].  To encourage file compression, the binary of
		K12CLR.PAL is used to preload memory; all areas of memory not loaded by
		K12MIT.SV will be set to 0000, ensuring the maximum effectiveness of
		repeat compression.

K12MIT.LST	This is a symbols-only listing file obtained from PAL8 using designated
		command-line options to suppress the normal listing output.  This file is
		needed for use with the GLOBAL.TEC macro to update the required symbols
		within K12PCH.PAL whenever the K12MIT.PAL source code changes any of the
		specific definitions.

		The exact command line options and other instructions are documented
		within GLOBAL.TEC in a manner that allows any form of ASCII text program
		to display the the particulars [however, most editors will not properly
		display the TECO macro details which follow].

K12MIT.NEW	Source code file of a provisional copy of Kermit-12 that adds the feature
		of using the PDP-8 console device as the equivalent of the remote system.
		This requires the console device be an "intelligent" system that supports
		Kermit protocol which can switch between terminal emulation mode and
		Kermit protocol mode.								

		Unless this feature is required, it is recommended the standard release
		be used.  Future releases of the Kermit-12 package will include this
		feature in some form; additional changes are planned for a fully
		integrated package which will require certain additional component
		updates.

K12MIT.NOT	This is a separate announcement update file released to the
		PDP8-Lovers mailing list with expanded information geared to OS/8
		users already familiar with the Kermit-12 project.  Only the ENCODE
		and DECODE program updates are included as they were the last programs
		added to the package [other than minor patches to Kermit-12 itself].
		The K12MIT.ANN and K12MIT.UPD files, described elsewhere in this
		document, were released for the general Kermit mailing list which
		never provided any details on any specific program, much less
		anciliary utilities beyond the mere mention of an update.

		This file provides a measure of expanded documentation on how to use
		the programs beyond the more compact version found in the source code
		files.

K12MIT.PAL	Source file of the standard release of the main Kermit-12 program
		[K12MIT.SV or KERMIT.SV or KERM12.SV] Version 10g.  Many parameters can
		be set in this file directly to create a customized version; however,
		most of the variations can be obtained by using a customized parameter
		file and/or a customized patch file.  The process to customize Kermit-12
		is detailed within K12PCH.PAL described elsewhere in this document.
		Proper use of these files will yield a customized version of Kermit-12
		that can be patched back to the standard release or vice-versa.

		This file should only be modified by Kermit-12 developers or advanced
		users familiar with the interaction between this file and several of the
		other package components [most of which will have to be rereleased if
		significant changes are made to various internal routines.

		Various other files in the Kermit-12 file make reference to several of
		the outstanding issues that may lead to changes in the future.  For the
		present, there is a patch required to update this standard release from
		Version 10g to Version 10h which is only required on systems based on the
		DECmate I.

		Once a sufficient number of improvements are made, all affected files
		will be updates simultaneously in the next release.

K12MIT.UPD	Announcement update file in ASCII text format describing the device
		image transfer [optionally in two parts] feature added to the ENCODE
		and DECODE programs.  Note: This is the last update to the Kermit-12
		package as supported by the Columbia University Center for Computing
		Activities [CUCCA].  The update covers the revised ENCODE and DECODE
		programs, the K12MIT.NOT file [which is a separate release note to the
		PDP-Lovers mailing list documenting the various releases of the ENCODE
		and DECODE programs, primarily because the PDP8-Lovers mailing list
		was generally released earlier than the infrequent CUCCA mailing list
		announcements], the K12MIT.DSK directory file and the overall
		announcement file which chronicles all Kermit-12 update releases to
		date.

		As was customary, the latest update was added separately for the
		benefit of those wanting to read about then-recent changes; all such
		updates for the various Kermit implementations were combined into a
		[roughly] monthly digest sent to those on the CUCCA mailing list.
		Several times a year, major release updates were highlighted in a
		sequence-numbered Kermit newsletter [also sent to those on the CUCCA
		mailing list].  Ironically, the first major announcement of a working
 		version of Kermit-12 was made in issue #12.

		Note: In general, there are minor discrepancies between the update
		file and the top-most section of the corresponding announcment file
		[such as K12MIT.ANN as described elsewhere in this document].  This is
		due to program authors having an opportunity to review the update file
		and getting a last-minute chance to edit the tentative announcement
		file before it was released to the CUCCA mailing list in more
		"accurate" form.

 		Very few people read update files as compared to the larger audience
		for announcement files which would tend to show the general "growth"
		of the overall project.  Availability of various forms of funding was
		dependent on the perceived success of Kermit.  It is notable that the
		generic Kermit manual was produced by DEC at no charge to CUCCA for
		mutual benefit; many of the Kermit implementations [including
		Kermit-12] ran on DEC hardware.  Additionally, a provisional working
		Kermit feature was added to the original release of Windows 95 in the
		form of a buried option within a bundled terminal emulator.  While
		Kermit-12 is not considered an advanced Kermit in terms of features
		supported, it is notable that the Windows 95 Kermit actually performs
		notably worse due to poor design; in particular, this is caused by
		using the built-in communications port feature of Windows, which is
		notoriously slow.  [Windows 95 is a hybrid system that is only part
		written as 32-bit code; most of it is actually MS-DOS compatible
		16-bit code.  The section in question actually uses the built-in BIOS
		support instead of an interrupt-driven routine.  The fastest baud rate
		that can be set is 9600 baud, but performance tends to top out at 1200
		baud due to the inherent overhead of using BIOS-based routines.]

K12PCH.PAL	Source file of the offical patch file for Kermit-12.  All parameters
		intended for user modification can be set in this file; the resulting
		binary file [K12PCH.BN] can be loaded over the standard release to
		achieve any customized version equivalent to setting the same parameters
		in the main source file [K12MIT.PAL].  The file includes documentation
		on the entire patching process including the use of a separate parameter
		file [such as K12PRM.PAL or equivalent] which, while partially redundant,
		allows the implementation of certain changes more easily, including the
		creation of a custom header message which is displayed every time
		Kermit-12 is executed.

		Only advanced users should make changes to Kermit-12 using the simplest
		choice of modification file.  Kermit-12 developers must ensure the
		proper synchronization of K12PCH.PAL and the main source file
		[K12MIT.PAL].  The separate parameter file [such as K12PRM.PAL or
		equivalent] has far less dependencies in this sense.  [The few
		dependencies that exist within the parameter file are hardly likely to
		ever change unless radical changes are made to the overall design of
		Kermit-12.]

K12PL8.BOO	This is the standard OS/278 V2 release of the OS/8 PAL8 assembly program
		[PAL8.SV] taken from the DECUS release of OS/278 V2 as DM-101.  The file
		has been encoded in .BOO format to prevent corruption.  This is the
		preferred version [B0] of PAL8.SV for general use because it fixes
		several long-standing bugs of PAL8 and also supports 128K assembly.  It
		has been determined that no hardware extensions beyond the original
		"Family of 8" are required, although quite obscure minor interaction with
		the KL8E handler may result due to concessions made because of the
		DECmate console hardware incompatibility.  [Few users will ever notice
		this incidental problem which is not serious and only presents in
		specific contrived circumstances.]

		This release should be considered as the only constructive version of
		OS/8 PAL8 past Version 10D.  It is provided as a convenience to
		Kermit-12 users to help with any program development issues.

K12PL8.ENC	This is the standard OS/278 V2 release of the OS/8 PAL8 assembly program
		[PAL8.SV] taken from the DECUS release of OS/278 V2 as DM-101.  The file
		has been encoded in .ENC format to prevent corruption.  This is the
		preferred version [B0] of PAL8.SV for general use because it fixes
		several long-standing bugs of PAL8 and also supports 128K assembly.  It
		has been determined that no hardware extensions beyond the original
		"Family of 8" are required, although quite obscure minor interaction with
		the KL8E handler may result due to concessions made because of the
		DECmate console hardware incompatibility.  [Few users will ever notice
		this incidental problem which is not serious and only presents in
		specific contrived circumstances.]

		This release should be considered as the only constructive version of
		OS/8 PAL8 past Version 10D.  It is provided as a convenience to
		Kermit-12 users to help with any program development issues.

K12PRM.PAL	Source file of a custom parameter file to produce a modified version of
		Kermit-12.  This parameter file demonstrates changes specific to the
		VT-78 as well as a custom message for the same configuration.  Users may
		create variant parameter files as required.	

		Parameter files may be used when reassembling the main source file
		[K12MIT.PAL] or the standard patch file [K12PCH.PAL] as necessary.
		The level of expertise needed to modify the patch file is much higher
		than that needed to make meaningful changes in the parameter file, which
		is geared to beginning users.  [Savvy users can implement all of the
		potential changes defined within the parameter file in the patch file.
		However, only advanced users or Kermit-12 developers are equipped with
		the necessary skills to make the additional changes possible in the
		patch file.  Only Kermit-12 developers should make changes in the main
		source file.]

[End-of-file]
