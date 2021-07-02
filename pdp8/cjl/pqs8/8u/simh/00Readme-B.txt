P?S/8 1988 "B" Source Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 25-Feb-1988.

Last edit: 27-Jun-2015 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with [possibly MS-DOS and] OS/8 limitations before usage.

Given the current state of P?S/8 development, most P?S/8 source files are meant to
be assembled with PAL8 for the express purpose of creating pragmatic core image
files later used from P?S/8 to transfer the image of particular system programs
needed after the initial [starter] P?S/8 bootable system is created.  The selected
target media must be compatible with a designated logical unit of the P?S/8 starter
system to effect the required block transfers.  This is generally accomplished using
command files designed for the purpose of the transfers; P?S/8 DUMP is used for this
purpose as it is created during the initial system generation.  [Note: The binary
output of all assemblies used to create the starter system can be assembled with
PAL8 under OS/8 or using another P?S/8 system if available, or even from BIN format
binary paper-tapes as the initial creation process is system-independent and avoids
conflict with all known restrictions of all relevant operating systems.  As defined
in the current source files, OS/8 BATCH is used to create the initial P?S/8 system
as well as the core images used later to continue the system generation process.
Future releases of P?S/8 wil likely use alternate methods to create a working system
from the source files.]

By nature, certain specific files must be converted to a string of P?S/8 TFS files
[or individual extended directory files] before use.  This is generally done to
create P?S/8 TFS binary output files needed for specific purposes using P?S/8 PAL.
For certain operations used to continue system generation, specific command files
must be copied to P?S/8 for one-time usage.  P?S/8 DUMP [and perhaps BLKCPY] can be
used as required; for P?S/8 systems where some of the converted source files are
available, a hybrid method can be designed as appropriate.  [Note:  All of these
methods are stopgap measures until a unified approach designed to create all P?S/8
structures and add system components is implemented.  The files used to create the
system are only correct for the current configurations; certain files will be
updated as requirements change.]

In certain specific instances, the final conversion yields a string of TFS files
with arbitrary related file names.  It is recommended the TFS names follow the
original file names in ways familiar to the user.  Where relevant, existing TFS
file names taken from P?S/8 systems will be indicated.

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

27-Jun-2015

12/28/1986  03:00 AM             6,321 4PATCH.PAL
12/28/1986  03:00 AM             8,632 8PATCH.PAL
10/07/1985  08:00 AM             9,001 ALLCAT.PAL
04/21/1986  11:00 PM                68 BLK400.PAL
04/08/1987  01:00 AM           104,943 BLKCPY.PAL
05/15/1986  06:00 PM            17,578 BPATCH.PAL
01/05/1986  10:00 AM            20,321 BSAVE.PAL
02/16/1988  11:00 PM             5,382 COMGEN.DUMP
12/17/1986  11:00 PM            73,973 CONSOL.PAL
09/25/1985  03:00 PM            12,691 CORE.PAL
04/08/1987  01:00 AM            21,719 DATE.PAL
09/03/1987  04:00 PM            86,732 DIRECT.PAL
11/12/1983  02:00 PM            13,211 DL8HND.PAL
01/01/1980  12:00 AM            33,929 DOL8.PAL
04/01/1987  06:00 PM            18,632 DPATCH.PAL
02/23/1988  08:00 PM             1,452 DSUGEN.DUMP
04/22/1986  09:00 AM             6,435 DSUHND.PAL
12/17/1986  11:00 PM             5,294 DT4PCH.PAL
10/06/1987  09:00 AM             1,422 DTAGEN.DUMP
04/05/1986  05:00 AM             2,714 DTAGEN.PAL
03/12/1986  06:00 PM             6,323 DTAHND.PAL
04/23/1986  06:00 PM               801 DTCPCH.PAL
01/12/1987  08:00 AM            27,485 DUMP.PAL
10/06/1987  11:00 PM           110,765 FILMAN.PAL
01/01/1980  12:00 AM             9,897 FIXUP.PAL
02/23/1988  03:00 PM             5,130 FLPHND.PAL
02/04/1987  08:00 PM            63,199 FOCPQS.PAL
07/06/1980  12:00 AM             1,223 IPBGEN.PAL
01/01/1980  12:00 AM             1,464 IPBOOT.PAL
04/08/1987  11:00 PM            50,439 KL8.PAL
04/08/1987  11:00 PM            16,825 KL8PCH.PAL
11/12/1983  06:00 AM             5,203 L8MHND.PAL
04/17/1986  10:00 AM             7,066 LINHND.PAL
04/17/1986  10:00 AM             7,215 LTAHND.PAL
11/03/1985  10:00 AM             8,519 NPATCH.PAL
01/05/1986  10:00 AM            53,277 ODT.PAL
04/08/1987  11:00 PM            30,114 OPATCH.PAL
07/03/1987  02:00 AM            44,929 PRINT.PAL
10/06/1987  09:00 AM             1,799 RKAGEN.DUMP
04/01/1986  05:00 AM            13,430 RKAHND.PAL
01/15/1983  12:00 PM             1,085 RKLPCH.PAL
07/19/1982  11:00 AM             1,703 RX4MAT.PAL
10/06/1987  09:00 AM             1,182 RXAGEN.DUMP
12/17/1986  11:00 PM            18,165 RXAHND.PAL
01/01/1980  12:00 AM             2,926 RXBOOT.PAL
01/01/1980  12:00 AM             1,076 RXBUT0.PAL
01/01/1980  12:00 AM             1,060 RXBUT1.PAL
01/01/1980  12:00 AM             4,608 RXINIT.PAL
03/24/1986  05:00 AM               538 RXUTIL.PAL
01/05/1986  10:00 AM            52,711 SET.PAL
09/15/1980  06:00 AM             6,919 SUP4K.PAL
09/15/1980  05:00 AM            10,497 SUP8K.PAL
04/21/1986  08:00 PM             2,974 SYSHND.PAL
12/28/1986  03:00 AM            33,886 SYSTAT.PAL
12/17/1986  11:00 PM            57,489 VT8E.PAL
04/08/1987  11:00 PM            63,075 VT8PCH.PAL
01/01/1980  12:00 AM               507 XEQUA.TEC
04/08/1987  11:00 PM               562 Z12K.PAL
04/08/1987  11:00 PM               293 Z4K.PAL
04/08/1987  11:00 PM               431 Z8K.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

4PATCH.PAL	Source file for the standard patch to P?S/8 FOCAL to increate
		floating point accuracy at the expense of storage and speed.  The
		standard floating point package within FOCAL is compatible with the
		usual 36-bit package which is commonly used.  By applying 4PATCH,
		FOCAL used 48-bit storage and calculations throughout.  Note: If
		the 8K FOCAL overlay is also used, the FOCAL header associated with
		listing output will be upgraded correctly only if the 8K patch is
		applied first.  [Other than cosmetics, FOCAL will function correctly
		regardless of patch order between the two otherwise unrelated
		patches.]

8PATCH.PAL	Source file for the standard patch to P?S/8 FOCAL to store the
		FOCAL statement text in field 1 thus increasing the field 0 storage
		space used for variables and pushdown stack.  [Note: 8PATCH must be
		applied before all other patches to FOCAL because of the extensive
		internal changes made; interaction between 4PATCH and 8PATCH is such
		that the most accurate FOCAL header listing output is obtained when
		4PATCH immediately follows 8PATCH which will then cause the accurate
		reflection of the use of both packages.]

ALLCAT.PAL	Source file for the ALL CATalogs in memory overlay to the P?S/8
		keyboard monitor.  The contents of the TFS directory [CATalog] of
		all available logical units is cached in memory.  This allows
		numerous operations on TFS files carried out manually to be
		accomplished rapidly; no actual writing of the modified catalogs
		occurs.  Commands that might disturb the keyboard monitor are
		temporarily inhibited.  Exiting the keyboard monitor will write out
		all updated TFS directories to their respective logical units.  This
		utility is especially useful on slow system devices such as DECtapes
		and LINCtapes.  [Note: Requires 8K memory.]

BLK400.PAL	Source file used to customize assembly of various LINCtape-oriented
		utilities that must be used to access standard LINCtapes [256 12-bit
		words/block] instead of PDP-8-oriented LINCtapes [128 12-bit
		words/block].  All of the various utilities default to 128 word
		support using conditional assembly.  The BLK400 file allows the
		variant assembly without modifying the source files.

BLKCPY.PAL	Source file for the P?S/8 Block Copy/Compare utility program.  This
		is the only basic P?S/8 utility that uses non-system handlers.  In
		many ways it represents a stop-gap measure as it makes certain
		operations possible when working with dissimilar devices on the
		same machine; data from one device can be transferred to another
		that could be accessible as a logical device unit of the system
		device handler, etc. Ranges of blocks can be copied or compared with
		full verification of all transfers.  Various recovery techniques are
		provided to work with common device problems.

		BLKCPY can be run in an automated manner by passing command files
		that can initiate any supported function; automatic exit back to
		P?S/8 is available as an additional command beyond the command set
		available from the keyboard.  All command lines within files can be
		commented; comments are suppressed during the session operation.

BPATCH.PAL	Source file for a patch to P?S/8 FOCAL to implement the ability to
		read and write words on a designated P?S/8 storage device.  The
		source code allows selection of a logical unit, memory buffer field,
		and other parameters.  Data words can be reckoned as either single
		or double-word integers.  The data can be specified to storage
		blocks and relative data words in a block.  An additional function
		is available to perform an optional logical .AND. function on two
		arguments to aid analysis of data with imbedded function bits.

BSAVE .PAL	Source file for the P?S/8 BSAVE utility.  Areas of contiguous memory
		or individual memory locations can be saved into binary output files
		which can be loaded later with any of the BIN utility loader options
		[or punched to paper-tape binary in either BIN or RIM format].

		The BSAVE command line conforms to both the left-to-right and the
		right-to-left conventions of later P?S/8 command formation.  Output
		files must be present and cannot be either the "%" or "$" file due
		to the nature of P?S/8 memory image saving conventions.

		The program will give a summary of how many binary output files were
		actually used; an error message will be given if insufficient output
		files were passed to accomplish the command.

		As a rule of thumb, each binary output file contains about 3/7 of a
		memory field of binary content.  Up to 17 binary files can be
		specified which allows up to 28K of memory to be saved with a single
		BSAVE command.  Since P?S/8 does not modify the contents of user
		memory [unless certain known programs are run, such as P?S/8 PAL
		which always attempts to allocate as much memory as is available],
		multiple commands can be issued to handle even the most extreme case
		possible.  [Note: P?S/8 BIN can load as many as 17 binary files on a
		single command line; thus, binary loading limitations are consistent
		with the BSAVE command constraints.  Few PDP-8 programming projects
		are as long as this one command line limitation, etc.]

COMGEN.DUMP	Command file for use with the P?S/8 system program DUMP.  It is
	    	used to update the P?S/8 starter system after creation from the
		initial memory load which is written out creating a bootable system.
		Only the fundamental system programs are available at that point
		including DUMP.

		DUMP allows command input files such as COMGEN [generally in the
		form of TFS files named CMGEN1 and CMGEN2] to transfer groups of
		contiguous blocks from a designated OS/8 non-system device
		compatible with the P?S/8 system device handler and defined as unit
		1 in P?S/8 terms such as DECtape unit 1 relative to a P?S/8 system
		created for the TC01/TC08 DECtape controller.

		The P?S/8 system is booted as drive 0 and the OS/8 non-system device
		[which contains saved images of additional P?S/8 binary programs in
		designated records] is accessed as drive unit 1.  [The contents of
		the non-system device was created in OS/8 using OS/8 BATCH control
		files to enforce specific binary image placement; DUMP usage depends
		on the accuracy of the file placement on the device.  The
		particulars of the COMGEN file are determined for each P?S/8 release
		in a generic manner for any variant system device associated with
		any particular release.

		Pragmatic DUMP commands transfer the images section by section and
		P?S/8 blocks are updated with the intended contents.  Additionally,
		various structures are updated by ZApping the P?S?8 system directory
		to reflect the addition of the entries for the added programs.  The
		non-system handler table is also updated to reflect images of
		non-system handlers also transferred from the OS/8 unit 1 device and
		saved in designated records.

		Once the DUMP operation has finished, the P?S/8 system is complete
		to the extent of all common system programs; additional system
		programs considered relevant to the particular system device must be
		updated by additional DUMP command files or other means.  Once all
		system programs are present, the TFS and user directory structures
		will be updated.  Additional files associated with a complete
		release can then be added to the completed system [which can be
		deleted by the user if desired].

CONSOL.PAL	Source file for the Logical Console Overlay utility.  The Overlay
		can be maintained using various command-line option switches in
		conjunction with special-format binary files used to modify the
		specific hardware configuration.

CORE  .PAL	Source file for the P?S/8 CORE utility.  All aspects of the logical
		and reported physical memory size are managed by this program.

DATE  .PAL	Source file for the P?S/8 DATE utility.  The current date can be
		printed out along with an optional message of the day.  The date can
		be set to any valid day in the supported time continuum.  [Note: The
		internal date format is being modified; as such, certain changes
		will be required within this program.]

DIRECT.PAL	Source file for the P?S/8 DIRECT utility.  Various formatting and
		search options allow for a variety of filtered reports.  The system
		program directory can be printed if desired.

DL8HND.PAL	Source file for the non-system device handler for DECtape on the
		modified LINC-8 LINCtape controller and LINCtape drives.  This
		handler conforms with the description of P?S/8 non-system device
		handlers as defined for P?S/8 Version 8Z.  Certain issues have come
		up since the writing of this program that will be important to
		future releases; this is discussed in some detail in the description
		of the non-system handler for the TC01/TC08 DECtape controller and
		TU55/TU56 DECtape drives.

		This handler currently fits in three pages.  Future releases may
		require an additional page to implement new features.

DOL8.PAL	Source file for an early utility used to transfer files between
		DECtapes and LINCtapes on the modified LINC-8.  The program is
		compatible with P?S/8 and uses P?S/8 command-line option switches to
		modify the configuration to take advantage of available memory.  The
		additional memory allows larger read/write buffers to increase
		throughput on more capable configurations.

		An earlier utility called SYSCPY was used as the basis for the user
		interface to specify copying parameters; SYSCPY used the P?S/8
		system device handler for all data transfers.  SYSCPY was replaced
		by BLKCPY which is a more comprehensive program that uses P?S/8
		non-system device handlers and supports additional features.

		The DECtape on Linc-8 [DOL8] utility represents a transitional phase
		during progression of the SYSCPY program into BLKCPY; internal
		device-handling subroutines are used for both LINCtape and DECtape
		functions with no reliance on the P?S/8 system device handler.  This
		allowed the program to run from a modified LINC-8 running P?S/8 on a
		different device such as the IPB system freeing both tape drives for
		use with the utility program instead of directly supporting P?S/8.

		[Note: At the time of writing DOL8, P?S/8 had not been developed to
		the point of supporting fully relocatable [both page and field]
		non-system device handlers; the only level of compatibility with
		future P?S/8 releases was the notion of the indirect argument list
		passed via an inline pointer to the list.  As of this writing, this
		specification is changing to support double-precision block numbers
		allowing much larger devices and device-specific special functions
		as appropriate.]

		The internal handlers are the basis for the later P?S/8 non-system
		device handlers for LINCtape on the modifed LINC-8 and DECtape on
		the modified LINC-8; some of the command syntax is uses as a
		precursor to BLKCPY.

		Arguably, much of the program is obsolete given the availability of
		the BLKCPY program and the L8MHND and DL8HND non-system device
		handlers; however, the DECtape routines support features
		incompatible with the P?S/8 non-system device handler: a) the
		block size can be adjusted to support 384 12-bit words/block
		DECtapes such as are used in the TOPS10 [and other DEC systems]
		DECtape format, b) the transfers can be accomplished in either the
		forwards or reverse [as defined for DECtapes] direction which is
		also required for compatibility with certain other programs or
		operating systems.  [Note: these additional features can be useful
		for some future utility such as PIP10 for the modified LINC-8.]

		Future releases of the DL8HND device handler could incorporate these
		addtional features based on the new specifications for non-system
		device handlers for P?S/8 releases beyond Version 8Z.  This would
		involve special calls to non-existent logical blocks as defined in
		the context of 24-bit block arguments; at such a time, the DOL8
		program can be completely retired.  For the present, DOL8 is being
		retained until a more comprehensive DL8HND is supported.

DPATCH.PAL	Source file for the output display patch to P?S/8 FOCAL.  X,Y pairs
		are outputted to a buffer and FOCAL displays all points as a
		background task.  Various display devices are supported for a
		variety of machines with display hardware.  The program requires
		8K as field 1 is uses as a display buffer.  Optionally, field 2 can
		also be used to double the number of points displayed.  An optional
		delay factor can be used to slow down the effective rate of the
		display for display hardware that cannot handle the data rate due to
		inadequate or non-existent display rate hardware.  An additional
		function is implemented to allow the program to input or output
		individual characters while the display is processed.

		Note: Extended memory management is incompatible with more recent
		P?S/8 memory models.  By proper modification, the number of points
		displayed can be consistent with actual system limitations.

DSUGEN.DUMP	Command file for use with the P?S/8 system program DUMP.  It is used
		to update the P?S/8 starter system after all common system programs
		have already been added.  System programs are added deemed useful
		for P?S/8 systems based on the DSD-240/Western Dynex disk system
		with removable cartridge [DS Upper] or fixed disk [DS Lower] or the
		MDC8 HD diskette system [FLP].

		Once the DUMP operation has finished, the P?S/8 system is complete
		and ready for release.  The TFS directory has been updated to
		reflect available user file space consistent with available storage
		on the system device.  Additional TFS files associated with a
		complete release should be added [which the user can delete if
		desired].

DSUHND.PAL	Source file for the non-system device handler for the DSD-240-8
		disk controller with the Western Dynex fixed/removable cartridge
		disk drive.  This handler conforms with the description of P?S/8
		non-system device handlers as defined for P?S/8 Version 8Z.  Certain
		issues have come up since the writing of this program that will be
		important to future releases; this is discussed in some detail in
		the description of the non-system handler for the TC01/TC08 DECtape
		controller and TU55/TU56 DECtape drives.

		This handler currently fits in a single page.  Future releases may
		require an additional page to implement new features.

DT4PCH.PAL	Source file for the patch to the DEC TOG8 formatting program for
		TC01/TC08 DECtape.  The ability to define custom length DECtapes is
		added using P?S/8 command line switches.  A custom interrupt kill
		list is included to prevent common stray flag problems.  If the
		system supports CAF, this is executed to eliminate all stray flags.
		[Note: Execution of the CAF instruction cannot be allowed as this
		will make the CPU hang in specific earlier models.

DTAGEN.DUMP	Command file for use with the P?S/8 system program DUMP.  It is used
		to update the P?S/8 starter system after all common system programs
		have already been added.  System programs are added deemed useful
		for P?S/8 systems based on the TC01/TC08 DECtape controller and
		TU55/TU56 drives.

		Once the DUMP operation has finished, the P?S/8 system is complete
		and ready for release.  The TFS directory has been updated to
		reflect available user file space consistent with available storage
		on the system device.  Additional TFS files associated with a
		complete release should be added [which the user can delete if
		desired].

DTAGEN.PAL	Source file for the TC01/TC08 system device handler loader to be
		used when generating so-called "alien" P?S/8 systems.

		P?S/8 is generally created on a system that includes the intended
		target hardware for the system device; however, in some
		circumstances this is not feasible.  There are several steps used
		to create a functioning system:

		     1) The binary files for the initial P?S/8 starter system
			intended for the target system are loaded under an existent
			P?S/8 system which then makes the current system device
			handler available to create an image of the target system on
			media compatible with the present P?S/8 system.  This is
			generally convenient when the TC01/TC08 DECtape system is
			used as the host system device.  The system generation
			routines use a special setting of the front panel switches
			to indicate the use of the resident P?S/8 system device
			handler to write out the image of the entire new system
			instead of attempting to use the intended target system
			device handler [which is not available].

		     2) Subsequently, external means is eventually used to transfer
			the image created on the TC01/TC08 DECtape to the intended
			target hardware.  For example, if creating a TC12 LINCtape
			system for the PDP-12, the DECtape image can be brought to
			the target system where the TC12F utility is available to
			convert the DECtape to LINCtape.

		The particulars vary according to the specific circumstances; the
		main issue is to run under an existing P?S/8 system that can write
		on media for the current system to create the image of the system
		intended for the "alien" system device.

		In some circumstances, the binary for system generation is not
		loaded into memory by an appropriate operating system, yet the
		TC01/TC08 hardware is available.  By using this short additional
		program, the system device handler of the TC01/TC08 system can be
		loaded into 07600-07777 before starting the system generation [with
		the special switch register setting used to prevent attempting to
		use the target system device handler].

		This program requires a 16K machine instead of the normal 12K used
		to create a starter system when the target hardware is available.

		Future development of the system generation routines should include
		the ability to load in a designated P?S/8 non-system handler to
		write out the image of the target system on a different device if
		this situation applies, in which case this program will be obsolete.

DTAHND.PAL	Source file for the non-system device handler for the TC01/TC08
		DECtape controller and TU55/TU56 DECtape drives.  This handler
		conforms with the description of P?S/8 non-system device handlers as
		defined for P?S/8 Version 8Z.  Certain issues have come up since the
		writing of this program that will be important to future releases.
		[Some of the issues raised here apply to most if not all non-system
		handlers.]

		     1) The block argument to non-system handlers was defined as a
			single-precision value; thus, valid arguments were limited
			to the range of 0000-7777 only.  While this is more than
			adequate for devices such as DECtapes, LINCtapes and
			RX-series diskettes, larger devices cannot be accommodated
			such as RK8E/RK05 dismountable disk cartridges, the
			DSD-240/Western Dynex fixed/removable cartridge disk system,
			the MDC8 SCSI host adapter, controller and hard disks, etc.

			As such, the next release of P?S/8 will change the block
			argument to a double-precision value in the form of a two
			word sequence passed low-order first; this will have the
			least impact on existing code where the 12-bit block
			argument is passed as the last parameter.

		     2) Certain "impossible" block number arguments will be created
			for special functions to be defined later.  They will all be
			in the form of 7777 [low-order], xxxx [high-order] where
			certain xxxx values will be defined; all other values will
			be considered illegal.  [Note: The largest allowed value of
			a logical block will be limited to 77777700 or so.  This
			will limit the size of the largest allowed single logical
			unit accessible with any handler to over 16 million blocks
			of 128 words/block; by comparison, the largest storage
			allowed in OS/8 for any one device is 2048 times as small.
			The entire range of a complete non-system device handler is
			eight times this or approximately 32 GB [where one byte is
			six bits].

			For example, a DECtape handler can be queried as to the
			size of the current DECtape mounted [if available].  Values
			are determined by the expected error return on calls for
			normally impossible block arguments that are used for this
			purpose.  The value returned in the AC on the error return
			[the successful return is impossible] will be the size of
			the currently mounted DECtape.  Rational values include:
			a) 2702 [standard DECtape], b) 3300 [extended length
			DECtape, c) 0000 [drive not ready].  This can be useful to a
			P?S/8 SHELL program to be able to adjust the number of
			empty blocks in the directory on the current DECtape.  Not
			every device will support every special call; a standard
			value of 7777 will be used to return a value for any special
			call not supported within this handler.

			Handler particulars such as current status, loading
			information, version and revision can be defined in future
			releases to allow particular programs to more properly
			communicate with handlers as necessary.  Handlers capable of
			certain protected operations may require special calls to
			enable certain features ordinarily inhibited [such as calls
			to write on block 0 without data validation].

		     3) The search algorithm used in this handler is limited to
			locating blocks less than block 4000; while this is adequate
			for any physical DECtape media, the SIMH simulator has been
			modified to accommodate "phantom" DECtapes up to as many as
			4096 blocks.  Alternate algorithms can handle blocks up to
			at least block 7775.  [Note: The modified SIMH simulator
			allows up to block 7777; however, limitations of the
			search algorithm may make it impossible to access blocks
			7776-7777 due to the need to support the two-block
			undershoot factor associated with all DECtapes searching in
			reverse.]  As such, the alternate algorithm will likely be
			used on future releases to support the complete simulation.

			[Note: The slurp loader for TC01/TC08 DECtape also uses the
			same search algorithm.  As such, the virtual loader should
			be used if attempting to load a file located above block
			3776.  The P?S/8 system device handler for TC01/TC08 uses
			the extended algorithm capable of accessing block 7775.]

		     4) The handler needs to check initial drive status to avoid
			hanging in an infinite loop.  Additionally, no check is made
			for impossible block numbers; the tape will loop endlessly
			searching one end of the tape to the other then reversing
			direction, etc.

			By adding in an initial status check, an error return can be
			made if the drive is off-line; by including a call to
			enable simulated larger block numbers, the full capability
			of the SIMH simulator can be implemented while otherwise
			protecting against applications attempting to ask for
			blocks slightly too high compared to the physical end of the
			tape.

DTCPCH.PAL	Source file for the patch to the DEC DTCOPY program for P?S/8.  A
		few weaknesses in the released program are eliminated.

DUMP.PAL	Source file for the P?S/8 DUMP utility.  DUMP can be used to dump
		out the contents of blocks on the system device, make patches to any
		block or transfer a limited number of blocks at a time between
		logical units.  All DUMP operations can be controlled by the
		contents of control files passed to DUMP to create an automated
		sequence of events if desired.  Part of the present method of
		creating P?S/8 systems requires the use of P?S/8 DUMP driven by
		certain command files to enhance the starter system into a more
		fully implemented release.  [Note: P?S/8 DUMP is created during the
		initial system generation process; this is required to allow the
		enhancement process later.]

FILMAN.PAL	Source file for the P?S/8 FILe MANager utility.  TFS files can be
		copied or deleted; the directory can be emptied of all files on any
		logical device unit.  Various command options are provided to
		perform common functions easily.  [Note: Wild-card options are
		available as well as a myriad of command-line options in various
		forms beyond the basic P?S/8 command-line option switches.]

FIXUP .PAL	Source file for the destructive one-way text file conversion program
		for R-L Monitor System DECtapes.  [Note: This program runs under
		any P?S/8 system based on DECtape storage media; if the R-L Monitor
		System DECtape is imaged to another device such as LINCtape, the
		program will run under any P?S/8 system based on LINCtape, etc.]

		The purpose of this program is to convert R-L Monitor text files to
		the format used in the basic P?S/8 system; converted text files are
		then compatible with P?S/8 text files.  The user must embellish the
		files to take advantage of the character set of the P?S/8 editor
		which supports the horizontal tab <HT> character which is
		unavailable in the R-L Monitor System.

		Once converted in place, the resulting DECtape is not quite directly
		useful for all purposes P?S/8 files are generally used for.  The
		files must be copied to a P?S/8 system device unit to allow the
		files to be passed to P?S/8 system programs.  This can be
		accomplished using the keyboard monitor's ability to load and save
		individual files or by using the P?S/8 File Manager [FILMAN]
		program for a more automated approach.  [Note: If only a single
		DECtape drive is available, the keyboard monitor approach must be
		used including manual changing of the DECtapes; this was the only
		approach available under the R-L Monitor System due to being
		designed for a single DECtape drive only.  Under P?S/8, up to eight
		logical drive units may be accessed at a time.  [Note: The All
		Catalogs [ALLCAT] program may be used to speed up the manual
		operations; the program requires 8K memory and caches the entirety
		of all directories on all possible drives at once.]

		R-L Monitor System binary files are compatible with P?S/8 as a
		subset [no extended memory support within the files] and can be
		used once copied to a P?S/8 system logical drive unit.  For all
		other files, the user must have an understanding of the exact file
		format as P?S/8 does not support undocumented file formats from the
		R-L Monitor System [such as might be devised by users].  Note:
		Programs written expressly to work with R-L Monitor-specific
		DECtape subroutines are recommended to be rewritten to P?S/8
		specifications to take advantage of the resident nature of the
		P?S/8 system device handler.  [Note: Binary programs written for the
		R-L Monitor System must include their own read/write subroutines for
		TC01/TC08 only; P?S/8 eliminates this overhead entirely; however,
		the user program must conform to P?S/8 standards regarding reserved
		system areas which are quite different from the original R-L
		equivalents.  As such, it is recommended that only source files be
		given any serious consideration.]

		Note: Proper file date would be during 1975.

FLPHND.PAL	Source file for the non-system device handler for the MDC8 HD
		diskette system [FLP].  This handler conforms with the description
		of P?S/8 non-system device handlers as defined for P?S/8 Version 8Z.
		Certain issues have come up since the writing of this program that
		will be important to future releases; this is discussed in some
		detail in the description of the non-system handler for the
		TC01/TC08 DECtape controller and TU55/TU56 DECtape drives.

		Note: This handler contains vestigial logical units to address a
		small storage area at the largest diskette address.  A future
		release of this program will eliminate the need for this minor
		nuisance.

FOCPQS.PAL	Source file for the P?S/8 modifications overlay to FOCAL, 1969.
		Many command-line and configuration options are provided.  The
		program requires customization to support a variety of peripherals
		used for various inputs, outputs and displays.  An internal table is
		provided to help eliminate sources of superfluous interrupts from
		common devices.  Special support framework is included to support
		the VT8E in both text and graphics mode; various additional patch
		files are needed to support these additional devices.  With few
		exceptions, a properly formed patch file can configure FOCAL for
		any supported hardware.  A variety of additional patch files exist
		for various common variations.

IPBGEN.PAL	Source file for the InterProcessor Buffer [IPB] system device
		handler loader to be used when generating so-called "alien" P?S/8
		systems.

		P?S/8 is generally created on a system that includes the intended
		target hardware for the system device; however, in some
		circumstances this is not feasible.  There are several steps used
		to create a functioning system:

		     1) The binary files for the initial P?S/8 starter system
			intended for the target system are loaded under an existent
			P?S/8 system which then makes the current system device
			handler available to create an image of the target system on
			media compatible with the present P?S/8 system.  This is
			generally convenient when the IPB system is used as the host
			system device.  The system generation routines use a special
			setting of the front panel switches to indicate the use of
			the resident P?S/8 system device handler to write out the
			image of the entire new system instead of attempting to use
			the intended target system device handler [which is not
			available].

		     2) Subsequently, external means is eventually used to transfer
			the image created on the IPB system to the intended target
			hardware.  For example, if creating a TC12 LINCtape system
			for the PDP-12 and the IPB system is running on LINC-8
			LINCtapes on the server side, the TC12 LINCtape can be
			created directly to be brought to the target PDP-12 system.

		The particulars vary according to the specific circumstances; the
		main issue is to run under an existing P?S/8 system that can write
		on media for the current system to create the image of the system
		intended for the "alien" system device.

		In some circumstances, the binary for system generation is not
		loaded into memory by an appropriate operating system, yet the
		IPB system hardware is available.  By using this short additional
		program, the system device handler of the IPB system can be loaded
		into 07600-07777 before starting the system generation [with the
		special switch register setting used to prevent attempting to use
		the target system device handler].

		This program requires a 16K machine instead of the normal 12K used
		to create a starter system when the target hardware is available.

		Future development of the system generation routines should include
		the ability to load in a designated P?S/8 non-system handler to
		write out the image of the target system on a different device if
		this situation applies, in which case this program will be obsolete.

IPBOOT.PAL	Source file for InterProcessor Buffer [IPB] bootstrap program.

		Note: Proper file date would be during 1977.

KL8   .PAL	Source file for the KL8-type serial interfaces and related devices
		for the Logical Console Overlay.  Various parameters are available
		to allow quickly changing the configuration that will be applied.
		As with all Overlay updates, a custom binary file must be created
		which is then applied as an update by running the CONSOL utility.

KL8PCH.PAL	Source file for customizing the KL8 file to likely standard types.
		Minor customization is possible; the main purpose is to minimize the
		errort to customize the KL8-oriented Logical Console OVerlay binary
		update file to be applied to the Overlay for a specific hardware
		configuration.  [Note: The configuration can be set for the normal
		hardware configuration of device 03/04 console and device 66
		lineprinter; since updates to the Overlay are permanent, this
		configuration will return to overlay to its original release state.]

L8MHND.PAL	Source file for the non-system device handler for the modified
		LINC-8 LINCtape controller and LINCtape drives.  This handler
		conforms with the description of P?S/8 non-system device handlers as
		defined for P?S/8 Version 8Z.  Certain issues have come up since the
		writing of this program that will be important to future releases;
		this is discussed in some detail in the description of the
		non-system handler for the TC01/TC08 DECtape controller and
		TU55/TU56 DECtape drives.

		This handler currently fits in a single page.  Future releases may
		require an additional page to implement new features.

		Note: LINC-8 LINCtape handlers cannot accommodate LINCtapes of
		differing lengths.  The tape controller cannot inform the handler
		the final data word has been detected.  The tape blocksize must be
		consistent; as such, the handler only reads or writes the standard
		length tape.  [Note: PDP-12 handlers can support an optional extra
		word per block because the transfer is performed via automatic DMA;
		the endangered word is saved before the transfer and restored
		afterwards.]

LINHND.PAL	Source file for the non-system device handler for the [unmodified]
		LINC-8 LINCtape controller and LINCtape drives.  This handler
		conforms with the description of P?S/8 non-system device handlers as
		defined for P?S/8 Version 8Z.  Certain issues have come up since the
		writing of this program that will be important to future releases;
		this is discussed in some detail in the description of the
		non-system handler for the TC01/TC08 DECtape controller and
		TU55/TU56 DECtape drives.

		Note: This handler was written to fit into a single page; as such,
		certain compromises were made that will be overcome in a future
		release as additional features are added:

		     1) Lack of proper retries.  [A two-page handler need not be
			compromised as this will be required to implement the
			additional features required in future releases.  On
			balance, a two-page handler that is more robust is a better
			compromise.]

		     2) Latest searched block is ignorant of drive unit change.
			This can easily be corrected using the method found in other
			handlers with similar requirements.

		Note: LINC-8 LINCtape handlers cannot accommodate LINCtapes of
		differing lengths.  The tape controller cannot inform the handler
		the final data word has been detected.  The tape blocksize must be
		consistent; as such, the handler only reads or writes the standard
		length tape.  [Note: PDP-12 handlers can support an optional extra
		word per block because the transfer is performed via automatic DMA;
		the endangered word is saved before the transfer and restored
		afterwards.]

LTAHND.PAL	Source file for the non-system device handler for the TC12 LINCtape
		controller and TU55/TU56 LINCtape drives.  This handler conforms
		with the description of P?S/8 non-system device handlers as defined
		for P?S/8 Version 8Z.  Certain issues have come up since the writing
		of this program that will be important to future releases; this is
		discussed in some detail in the description of the non-system
		handler for the TC01/TC08 DECtape controller and TU55/TU56 DECtape
		drives.

		Note: This handler cannot overcome the automatic reverse direction
		initial search of the TC12 controller; as such, no record-keeping is
		performed with respect to the last transferred block.  Future
		releases of this handler may be able to overcome this limitation.

NPATCH.PAL	Source file for an application program written as a significant
		binary patch to P?S/8 FOCAL.  A Nicolet 1070 Data Averager is
		controlled by FOCAL programming that can be modified by researchers
		with limited programming skills.  Successful data sweeps can be
		displayed in various ways by incorporating other packages also
		written for P?S/8 FOCAL that implement a display capability that is
		nearly generic yet can run on a varity of display devices; used
		together, this device can be used by researchers on various
		PDP-8/PDP-12 configurations, etc.  Sweeps that are considered useful
		can be saved in PDP-8 memory as part of this package or written to
		various storage blocks for analysis later.

		The memory contents left behind after program exit can also be
		converted into text files with well-formatted numerical text for
		later analysis by additional FOCAL-based programming.  This is
		accomplished using the NCON program described elsewhere.

		Criticism: Virtually everything about this program represents a very
		good example of just how powerful the P?S/8 environment is to allow
		researchers will little programming or other computer-related skills
		to be very successful achieving their goals of a customized data
		collection and easy to use smooth operation to accomplish all they
		require.  As a PAL assembly language file, it is very well
		documented especially when it comes to dealing with the nuanced
		details of the process of interfacing add-on functions to FOCAL as
		well as taking advantage of the rich superset of FOCAL that P?S/8
		provides to make such operations easily and flexibly accomplished.
		Such programming itself is not for PDP-8 novices requiring a lot of
		skills of both general PDP-8 programming but also the intricacies of
		both the original FOCAL, 1969 but also the various P?S?8 features
		and extensions that are exploited to make this project a success,
		etc.

		However, there is one criticism of the design that may eventually
		prove to either be an early pioneering work for an obscure parameter,
		or prove to be totally incorrect depending on how the problem is
		solved:

		     1)	Within certain implementations of P?S/8, it is possible to
			determine the system device logical unit the program is
			actually booted to.  The program uses a convention found
			within many P?S/8 system programs that is not 100% certain,
			namely the ability to define the "partner" logical unit
			within the pair defined by the system device logical unit
			and said value .xor. 1.

			The problem is that the configurations this program was run
			on just happen to present the logical unit in a predictable
			place within those particular system device implementations.
			This is not a hard and fast convention throughout all P?S/8
			system device handlers.  In fact, at the present time, there
			is no such parameter universally available.

			As such, should the convention be extended as depended upon
			here, then this program will be an early adopter of the
			convention; however, if it is dependent on some newly
			created alternative, the logic associated with this
			calculation will require rework; as such, to the extent that
			this important parameter is subject to change, this program
			should not be considered as a complete example of how to
			take advantage of such features within P?S/8 in general.

		     2)	This very feature is under investigation for its role in the
			future implementation of the P?S/8 SHELL which will also
			require proper unit identification; not all P?S?8
			implementations boot on logical unit 0.

ODT   .PAL	Source file for the P?S/8 ODT debugging utility.  ODT is a superset
		of all known ODT implementations and includes the ability to
		manage multiple breakpoints.  Various means of dumping out memory
		are available including representation in various formats as found
		in text packing schemes for a variety of file and memory formats.

OPATCH.PA	Source file for the overlay to P?S/8 FOCAL to implement output and
		input redirection to various devices; most of the functionality of
		redirection is derived from the VT8PCH source file with all of the
		VT8E-oriented functions removed.  This allows another display
		device to be used if desired.  The FIO function used in several
		other FOCAL patch files is implemented to allow the FOCAL program to
		process individual input and output characters.  [Note: The FDIS
		function is replaced with FIO.  This allows one of the other
		FOCAL patch files to be used in conjuction with OPATCH.]

PRINT .PAL	Source file for the P?S/8 PRINT utility.  Text files can be printed
		on the system printer or the console with various formatting options
		to accommodate a variety of devices.

RX4MAT.PAL	Source file for the RX8B [DSD-210] formatting program.  Note: This
		program does not work on any DEC [RX01/RX02/RX03] product and has
		not been tested on any other DSD product [but will likely work on
		the DSD-440.]

		Note:  The program is written as quick-and-dirty.  Suggested
		improvements include:

		     1)	Conformance with P?S/8 conventions including the Logical
			Console Overlay. logical abort and DECmate awareness.
			[Note: If the program is menu-driven, the data-only tests
			can be performed on a DECmate II with the RX278 option on
			RX01 or RX02/RX03 drives.]

		     2)	Status messages including an opening message describing the
			process.

		     3) Guided assistance to allow existing media to be removed.

		     4)	Support for additional drives [most DSD-210 systems support
			atleast two drives and up to four drives].

		     5) Data writing and verify passes to certify the media as ready
			for normal reading and writing on all RX-type drives.

		     6)	Single track format option to save time on problematic
			media that may eventually pass reliability tests.

		     7) Choice of 12-bit or byte-mode data passes.

		     8) Choice of data word or byte pattern value; this can be
			implemented using the =xxxx command-line option; if not
			supplied, the default pattern value of 11100101 [x'E5] can
			be used for all non-self-identifying data.  [Note: It is
			recommended that the first data in each sector be the actual
			track/sector or logical sector as part of the data tests.]

		     9) The option of a final data test to write every sector with
			a designated data pattern [followed by a verify pass].

		    10)	Detection of the RX8B to prevent attempts to format media on
			DEC RX01/RX02/RX03 hardware.  The program can still be used
			for data tests on all supported drives.

		    11) Data density detection and change.  [Note: The DSD-210 can
			only format single-density media.]

		    12) Inclusion of the RXUTIL program as a menu option [see the
			description of the RXUTIL program elsewhere].

		    13) Inclusion of the RXINIT program functions [see description
			of the RXINIT program elsewhere].

RKAGEN.DUMP	Command file for use with the P?S/8 system program DUMP.  It is used
		to update the P?S/8 starter system after all common system programs
		have already been added.  System programs are added deemed useful
		for P?S/8 systems based on the RK8E/RK05 disk system or the PDP-12
		TC12 LINCtape controller with TU55/TU56 drives.

		Once the DUMP operation has finished, the P?S/8 system is complete
		and ready for release.  The TFS directory has been updated to
		reflect available user file space consistent with available storage
		on the system device.  Additional TFS files associated with a
		complete release should be added [which the user can delete if
		desired].

RKAHND.PAL	Source file for the non-system device handler for the RK8E disk
		controller with RK05 disk cartridges.  This handler conforms with
		the description of P?S/8 non-system device handlers as defined for
		P?S/8 Version 8Z.  Certain issues have come up since the writing of
		this program that will be important to future releases; this is
		discussed in some detail in the description of the non-system
		handler for the TC01/TC08 DECtape controller and TU55/TU56 DECtape
		drives.

		The internal organization of disk storage will be changed in future
		releases to better take advantage of larger logical disks as used
		within the P?S/8 SHELL environment.

RKLPCH.PA	Source file for the patch to the DEC RKLFMT program to prevent the
		execution of CAF unless the CPU supports the instruction.  [Note:
		The unpatched original program hangs on certain earlier models.] 

RXAGEN.DUMP	Command file for use with the P?S/8 system program DUMP.  It is used
		to update the P?S/8 starter system after all common system programs
		have already been added.  System programs are added deemed useful
		for P?S/8 systems based on the RX01/RX02/RX03/DSD-210/DSD-440 in
		single density mode.

		Once the DUMP operation has finished, the P?S/8 system is complete
		and ready for release.  The TFS directory has been updated to
		reflect available user file space consistent with available storage
		on the system device.  Additional TFS files associated with a
		complete release should be added [which the user can delete if
		desired].

RXAHND.PAL	Source file for the non-system device handler for the RX8E
		controller and RX01 or compatible 8" diskette drives.  This handler
		conforms with the description of P?S/8 non-system device handlers as
		defined for P?S/8 Version 8Z.  Certain issues have come up since the
		writing of this program that will be important to future releases;
 		this is discussed in some detail in the description of the
		non-system handler for the TC01/TC08 DECtape controller and
		TU55/TU56 DECtape drives.

		Future releases of this handler will address RX02 double-density
		media and other issues.

RXBOOT.PAL	Source file for RX8B/DSD-210 bootstrap program capable of a safer
		alternative bootstrap as well as DEC compatibility by changing one
		word.  Due to poor design of both the bootstrap method and OS/8 in
		general, OS/8 will always write out memory during a bootup which is
		inherently risky.  Since the DSD-210 supports write-protect, the
		initial phase of the bootup can be protected; however, OS/8 will
		halt the machine because of the write-protect which will confuse
		most users [pressing continue should work correctly if there were no
		unexpected errors].

		To avoid this situation, an alternate bootstrap method can be used
		that assumes a safe operating system loader has been installed on
		track 0 of the bootable diskette.  DEC never uses track 0 for a
		variety of reasons that are of no concern to the average user.  The
		safe loader is not the subject of this program; it merely assumes
		such a program exists; once in control, the safer program can
		perform a reliable bootup that could start OS/8 without a write
		attempt or at least a graceful startup without a system halt.

		P?S/8 would have to be compatible with this scheme as well, which is
		easily achieved; however, P?S/8 doesn't attempt to write during the
		bootup operation; the standard DEC RX8E bootstrap is sufficient to
		start P?S/8 with write-protect set when used on the DSD-210.  [Note:
		Modifying the DEC RX01 drive to support write-protect still requires
		the use of foil tabs on the diskette media; this is inconvenient as
		controlled writing from user commands would require the mechanical
		opposite tab presence.  The DSD-210 drive supports front-panel
		protect switches for all media allowing safer bootup; flipping the
		protect switch restores normal operation.]

		[Note: Track 0 can always be restored to any properly formatted
		diskette to satisfy perceived need for standard contents.  The
		DSD-210 drive supports diskette formatting without concern for prior
		contents; certain IBM 3740 equipment requires validation of track 0
		to allow reformatting without additional procedures; this was taken
		too literally by DEC and became moot when they instead merely
		advised all users to purchase pre-formatted media.] 

		Note: Proper file date would be during 1977.

RXBUT0.PAL	Source file for the shortest program capable of supporting the safer
		bootstrap on track 0 of drive 0.  By abandoning DEC compatibility
		altogether, this is another advantage.

		Note: Proper file date would be during 1977.

RXBUT1.PAL	Source file for the shortest program capable of booting the 
		DEC-compatible scheme [using track 1 of drive 0].  By eliminating
		support for retrying drive 1, the program is far more suitable for
		manual entry when performing a cold bootstrap.  [Note: May require
		minor changes to boot the more recent P?S/8 and OS/8 system device
		handlers; this program was designed during the era when it was
		assumed a viable handler could be implemented without the need for
		extended memory; since that time, both OS/8 and P?S/8 have abandoned
		a minimal system.  In the case of P?S/8 superior performance and
		error recovery while OS/8 merely gains functionality due to its
		inherently weak design.  [Note: The 8K OS/8 handler has the dubious
		distinction of being the only handler first officially released then
		officially withdrawn due to inherent unreliability and tendancy to
		corrupt data during write operations.]

		Note: Proper file date would be during 1977.

RXINIT.PAL	Source file for the track 0 code that implements the safer bootstrap
		mechanism.  Also includes the program to write this code out and a
		full-length more conventional bootstrap to support it in a manner
		analgous to DEC's over methodology.  [See the RXBUT0 program as an
		example of a much shorter bootstrap.]

		Note: Proper file date would be during 1977.

RXUTIL.PAL	Source file for the preliminary and largely non-functional version
		of the RXUTIL program; newer versions of some of the RXUTIL
		functions are probably available elsewhere.  This program should
		be obsoleted in favor of program options of the RX4MAT program.
		[Note: The final implementation of the composite program for all
		RX-related matters may be named RXUTIL.]

SET.PAL		Source file for the P?S/8 SET utility.  Many options of the keyboard
		monitor and integrated editor can be customized in various ways as
		necessary.

SUP4K.PAL	Source file for the InterProcessor Buffer [IPB] Server program for
		use on 4K systems.  The program runs under P?S/8 as implemented on
		the local system; the system device handler is called to read or
		write blocks as required to honor the request from the other side of
		the IPB.  [Note: Device handlers have been written to support P?S/8
		and OS/8 running on the client side of the IPB; the server cannot
		distinguish what software is requesting the service as it is
		carried out at the lowest level of transfer protocol.]

		Before operating the IPB from the client side, the appropriate
		storage media must be mounted on the server side; in general, this
		will be images of data unrelated to the local system written to
		compatible media; most importantly, the local system bootstrap
		device must be replaced by the appropriate media as required by the
		handler on the client side of the IPB.  The program was designed to
 		run on a 4K LINC-8 system running P?S/8 configured for the modified
		LINC-8 on 128 12-bit words/block LINCtapes mounted on LINCtape drive
		units 0 and 1; the system LINCtape is replaced by a LINCtape
		containing an image of the device as required on the client side of
		the IPB.  Due to the minimal nature of the support system
		configuration, the program does not issue messages of any kind; a
		bare-bones approach is taken to maximize the number of blocks that
		can be read or written at any time to increase overall throughput.
		[Note: On a more capable configuration, an interrupt-driven version
		of the support program could be written; data blocks could be read
		in anticipation of need or other forms of caching can be performed.
		However, due to the minimal nature of LINCtape hardware as
		implemented on the LINC-8, this is not recommended.]

		No specific dependency on LINC-8 hardware exists except for a
		custom frill feature that includes a LINC-8-oriented light chaser
		null job executed while waiting for transfer requests from the
		client program on the other side of the IPB.  [Note: Certain
		instructions will have to be removed/modified if execution of these
		instructions on systems other than the LINC-8 has unexpected effect.
		The only actual requirement is certain IOT instructions not change
		the AC.]

		The program supports all eight logical units as defined by the
		current P?S/8 system device handler; however, on the LINC-8, this
		generally means that all odd logical units are handled as unit 1 and
		all even logical units are handled as 0.  This is a known
		restriction of the implementation of the P?S/8 system device handler
		for the modified LINC-8.  Due to lack of testing facility, no
		attempt was ever made to confirm if there is any reasonable way
		around this problem; the few software systems ever written for an
		extended configuration always accessed extended LINCtape drives
		known to exist; there is apparently a hardware deficiency when
		accessing non-existent additional drives.  It is also known that an
		apparent implementation quirk causes extended LINCtape drives to be
		added out of order.  [While the first two drives are 0 and 1, the
		second dual transport selects as drives 4 and 5.  Since so few
		systems were ever implemented with more than the first two drives,
		this was never corrected; the few software systems that ever
		supported these drives acknowledged them as units 4 and 5; no
		attempt was ever made to access the other four drives as it would
		cause the LINCtape controller to hang.  It is conceivable that more
		sophisticated software might have detected this problem; however,
		the only known software was written in 100% LINC coding.   As such,
		the software depended on the standard LINC-8 trap emulator used with
		such systems [PROGOFOP] which was never fully tested on
		configurations with more than the first dual LINCtape transport.
		Since all IPB and P?S/8 software is written completely in PDP-8
		code [the LINCtape controller is actually a PDP-8 peripheral; tape
		operations of the LINC processor are trapped and emulated], any
		attempt at supporting additional logical units must be researched
		as to how to solve this problem; due to the constraints of tight
		coding, the P?S/8 system device handler for the modified LINC-8 is
		incapable of solving this problem [assuming it is solvable at all].

		A future version of this program could be made to work with a P?S/8
		non-system handler perhaps better able to deal with this
		consideration.  This would allow the IPB protocol to be made more
		robust in terms of asking for data requests outside of the current
		configuration.  The present version of all IBP-related software, as
		used in this specific configuration, assumes limiting the
		configuration to logical units 0 and 1 only.  When operating the IPB
		server program on more capable systems such as TC01/TC08 DECtape, it
		is possible to support all logical units completely.  [Note: When
		the server program is run on the other side of the IPB using some
		other device available on that system, the LINC-8 can run P?S/8 for
		the IBP; in this configuration, the LINC-8 supports all eight
		logical units; the LINCtape drives are available for other functions
		such as non-system LINCtape or DECtape handlers as used in utility
		programs; the P?S/8 non-system LINCtape handler does not require the
		hardware modifications; the DECtape handler requires a special
		handler [or utility program] to read or write DECtapes on the
		modified LINC-8.  These programs can be run without the nuisance of
		having to be run from P?S/8 LINCtapes on the LINC-8; this makes the
		process of tape conversion on the LINC-8 easier from an operational
		standpoint; both drives are freely available to the program.]
		[Note: An unmodifed LINC-8 with IPB can run P?S/8 for the IPB as
		long as the support program is run on the server end.  Non-system
		handlers can be used to read or write LINCtapes.  However, the
		hardware modifications are far easier to accomplish than
		constructing the IPB, which also makes the machine dependent on the
		system on the other side of the IPB for all system-related
		functions.  A more modern approach to such a system would be to
		implement a local storage device connected to the LINC-8 negative
		buss.  The IPB approach is the only one available to the LINC-8 due
		to the inability to support DMA devices coupled with the small
		memory size.  The largest practical LINC-8 is 8K; this allows few
		PDP-8 software options to the LINC-8; OS/8 cannot be run on an 8K
		LINC-8 unless the machine is either modified or a peripheral such as
		the IPB is available.  P?S/8 can run on an 8K unmodified LINC-8
		using an alternate system device handler designed to require an
		extended memory system device extension.]

		For systems with additional devices, the logical units can be mapped
		to other hardware devices such as logical partitions of a larger
		hard disk, etc.  The program is easily modified as necessary to take
		advantage of available hardware.

		For systems with 8K or more, the 8K version of this program [SUP8K]
		is capable of slightly better throughput on calls for a larger
		number of blocks.

SUP8K.PAL	Source file for the InterProcessor Buffer [IPB] Server program for
		use on systems with at least 8K.  All matters unrelated to memory
		size are handled in the same manner as the 4K version.

		This verion of the program includes an internal copy of the
		then-current P?S/8 non-system DECtape handler for the TC01/TC08
		DECtape.  As such, it supports all 8 logical device units on the
		client side of the IPB.

		The program is easily modified to support alternative storage
		devices; a more elaborate version of the server can be created to
		take advantage of a real-time environment such as disk caching, etc.

SYSHND.PAL	Source file for the SYSx: [where x is the logical unit] non-system
		handler to allow programs [such as P?S/8 BLKCPY] access to the
		system device.

		In essence, the SYS handler acts as an intermediary between the
		system device handler of the P?S?8 system and the non-system handler
		environment to allow a program designed to load non-system handlers
		to access the system device handler logical units without any
		special-case handling.  [Note: The calling sequence for the system
		device handler is incompatible with that of the non-system handlers
		as a fundamental design concept.]  Since the system device handler
		can only return to the caller on successful completion of the call,
		it is not possible for a call to the SYS handler to ever fail as
		presently designed.

		Note: This is a stop-gap measure that will radically modified as
		part of a major redesign of P?S/8 non-system handlers for various
		design issues that were not under consideration at the time of the
		original implementation.  [The P?S/8 SHELL overlay is currently
		being designed on various levels.  Interaction between the area of
		a device that is both accessible from the basic P?S/8 system and the
		SHELL overlay will change the notion of a SYS handler; as such, it
		is possible it could cease to exist in the present form.  Many
		issues exist such as exactly how much of the area potentially
		accessible by the SYS handler needs to have access limited for a
		variety of reasons, etc.]

		The file also contains the NULx: [where x is the logical unit]
		non-system handler.  The NUL handler is essentially a read-only
		handler; any attempt to use it returns with the user buffer
		completely filled with 0000 words.  Of special note is this is also
		true of write calls; the user buffer is not merely ignored, it is
		filled with 0000 words.  This is done to allow programs such as
		BLKCPY, which may have complete data verification enabled, to be
		able to complete the device check without any false comparison
		errors.  [Note: The NUL handler behavior is incompatible with any
		theoretical caching schemes as the write function destroys the data.
		Any program depending on the write buffer to be available again for
		reading will not work with the NUL handler as defined.]  As with the
		SYS handler, the NUL handler is also subject to radical change once
		further work on the P?S/8 SHELL is accomplished.

		Note: All P?S/8 non-system handlers are being upgraded to a new
		calling convention involving double-precision block numbers and
		special handler-dependent features.

SYSTAT.PAL	Source file for the P?S/8 SYSTAT utility.  This program prints out
		various and sundry particulars about the system at hand including
		CPU type, memory size and non-system handler tables.  Options are
		available to control formatting and output device.

VT8E  .PAL	Source file for the VT8E interface variant of the Logical Console
		Overlay.  As with all Overlay updates, a custom binary file must be
		created which is then applied as an update for running the CONSOL
		utility.

		Note: A newer version of this file has been recovered.

VT8PCH.PAL	Source file for a comprehensive VT8E-oriented display patch to P?S/8
		FOCAL.  Functionality is available to output to all displayable
		pixels on the screen including the ability to create a reverse
		video graphical display.  Character output is also available in all
		available VT8E-supported attributes.  A variety of O(utput)
		commands are implemented to allow complete customization of the
		output to any supported device including the typical P?S/8
		configuration both with and without the presence of the Logical
		Console Overlay.  Graphical output mixed with character output can
		be displayed [or either alone].

		Note: A newer version of this file has been recovered.

XEQUA.TEC	Source file for a custom TECO macro used to maintain integrity of
		external symbols in various P?S/8 components.  Many P?S/8 source
		files execute in specific memory space to reference components of
		the P?S/8 keyboard monitor and imbedded editor or other structures.
 		It is necessary that specific equated symbols match the definitions
		obtainable from the main monitor source file, etc.

		A specific symbol table file is created as a derivative of the
		assembly of the main source file; this is then used for syncing up
		all dependent programs.  The section of the source file that
		requires reconciliation with the main assembly is delineated by
		special comments that start with "//".  As such, all prior
		commentary in the file must avoid this.  All equate statements
		within the section must be simple octal constant values; all symbols
		must be defined in the designated symbol table file derived from the
		assembly of PQSMON.PAL.  Error messages will be issued if attempts
		are made to define symbols not found in the designated symbol table
		file.

		The macro definitions within this file are likely highly dependent
		on specific implementations of TECO.  Future versions should be
		written in a more generic implementation such as TECOC.  [Note: TECO
		for the P?S/8 SHELL environment will likely conform to TECOC; many
		older TECO implementations such as various versions for OS/8 are
		known to be incompatible for various quirky reasons.  Since the
		P?S/8 SHELL is oriented around larger memory configurations for
		increased performance, TECO for this system will strive for maximum
		compatibility as opposed to the expediency associated with older
		implementations.

		Any development work on this macro should increase the level of
		messages issued during its operation.  It is recommended that there
		be some minimal output after each symbol is located; otherwise, long
		periods of time pass without any apparent progress, etc.

		The current design uses a hard-wired name for the symbol table file.
		This allows future implementations to create alternate sources for
		the definitions; SHELL-conforming programs will tend to require new
		global definitions not currently defined; the main keyboard monitor
		file may be inappropriate to source these values.  Alternately, a
		different macro can be created to handle that analogous situation at
		a future time.

		Note: Proper file date would be during 1979.

Z12K.PAL	Source file used to clear all user memory in field 0 [00000-07577],
		field 1 [10000-17577] and field 2 [20000-27577].  [Note: OS/8 limits
		loading into x7600-x7777 for any field x; generation of P?S/8 must
		honor the loading restrictions of any possible loading environment
		despite the more flexible loading rules of P?S/8 itself which is
		similar to the paper-tape binary loading restrictions.]

		Certain P?S/8 programs require 12K to create the image of the
		program and various overlays [which are loaded into field 0 as
		required during program execution].  All other considerations of the
		Z4K program apply.

Z4K.PAL		Source file used to clear all user memory in field 0 [00000-07577].
		This file is used when creating all P?S/8 core images from OS/8 to
		cause all unused memory locations to be 0000 which can aid in the
		debugging of P?S/8 components.  Additionally, this helps standardize
		core images as used to make the OS/8 non-system device that holds
		all program images as used by P?S/8 DUMP to update the P?S/8 starter
		system to contain additional system programs.

		Note: This file is needed because OS/8 ABSLDR.SV has no memory clear
		options; P?S/8 BIN can set all of user memory to either 0000 or 7402
		with a single command-line option.

Z8K.PAL		Source file used to clear all user memory in field 0 [00000-07577]
		and 1 [10000-17577].  [Note: OS/8 limits loading into x7600-x7777
		for any field x; generation of P?S/8 must honor the loading
		restrictions of any possible loading environment despite the more
		flexible loading rules of P?S/8 itself which is similar to the
		paper-tape binary loading restrictions.]

		Certain P?S/8 programs require 8K to create the image of the
		program and various overlays [which are loaded into field 0 as
		required during program execution].  All other considerations of the
		Z4K program apply.

[End-of-file]
