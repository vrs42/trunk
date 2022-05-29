MDC8-Related Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 19-Mar-1985.

Last edit: 09-Mar-2015 cjl

With a few noted exceptions, all files in this directory pertain to one of the
earlier firmware revisions and/or older SCSI controllers used with the MDC8 before
the final hardware and firmware configuration was produced.

This includes setting the device code of the MDC8 to an older value [30 or perhaps
31] instead of 70.  The earliest configurations used a Shugart SCSI [actually SASI]
controller generally for two 8" diskette drives.  Several newer configurations use
OMTI 20D or 5xxx series SCSI controllers.  Programming for the earlier variant
of these systems supports 512 bytes/sector disks and a command bit to transfer only
the first half of the last sector transferred; this allows OS/8 to be used on these
systems.  This feature is also implemented in the earliest systems as well.

The final hardware/firmware configuration changes the firmware to support 256 byte
sectors on all devices; as such, all transfers are based on 128 12-bit word
transfers; the one half sector transfer bit is not present on these newer systems.

Utilities relating to bootup or accessing the onboard firmware and control RAM of
the 6809 are most likely generic to all releases.  All handlers and utilities were
rewritten for use with the 256 bytes/sector disks.

In general, reference to versions 01x and 02x refer to the two variations that
support the one-half sector transfers on the oldest and newer hardware respectively.
Numbering conventions for the newest configuration that does not support the
one-half sector transfer bit are independent of the conventions established here and
should be determined elsewhere.  [Note: Most of the utilities have the notion of the
basic sector length of either 256 or 512 bytes per sector as a parameter; there are
variant newest configuration systems that use 512 bytes/sector; they are not capable
of supporting OS/8.  These configurations are used by the multi-user OMNI-8 system
which runs on machines up to 512K memory using the MEC8 memory controller from CESI
which is incompatible with all PDP-8 extended memory programming.  [Note: A hardware
compatibility switch is available on the MEC8 to provide a 32K compatible
environment; OS/8 can then be run on other devices such as the RK8E/RK05.  P?S/8
can be made to run on this variant of the MDC8 using a system handler that requires
extended memory [at least 8K]; due to inadequate design, OS/8 cannot be run on this
system; the emulated OS/8 environment[s] supported under OMNI-8 use ersatz handlers
that are trapped by OMNI-8; the one-half sector problem is then resolved using
software simulation.]

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

09-May-2015

02/13/1985  12:00 AM               366 ASSDSK.PAL
02/16/1985  12:00 AM               388 ASSWIN.PAL
02/17/1985  12:00 AM               392 ASSWN1.PAL
02/14/1985  12:00 AM               730 BOOTST.PAL
02/13/1985  12:00 AM               308 DEFLOP.PAL
03/19/1985  06:00 PM            87,891 DMPRST.PAL
01/30/1985  10:00 AM           250,546 DMU.GOOD
02/21/1985  12:00 AM               384 FORDSK.BIN
02/13/1985  12:00 AM               297 FORDSK.PAL
02/21/1985  12:00 AM               488 FORTW1.PAL
02/21/1985  12:00 AM               315 FORWIN.PAL
03/02/1985  12:00 AM               323 FORWN1.PAL
02/17/1985  12:00 AM               325 HANTST.PAL
02/21/1985  12:00 AM               429 INTEST.PAL
02/17/1985  12:00 AM               384 MDCBUT.BIN
02/16/1985  12:00 AM               280 MDCBUT.PAL
02/17/1985  12:00 AM               384 MDFLNS.BIN
02/17/1985  03:00 AM             5,082 MDFLNS.PAL
02/17/1985  12:00 AM               384 MDFLSY.BIN
02/17/1985  03:00 AM             7,530 MDFLSY.PAL
02/17/1985  12:00 AM               768 MDWNNS.BIN
02/17/1985  03:00 AM             9,439 MDWNNS.PAL
02/17/1985  12:00 AM               384 MDWNSY.BIN
02/17/1985  03:00 AM             8,049 MDWNSY.PAL
02/16/1985  12:00 AM               307 READID.PAL
03/11/1985  04:00 PM            10,299 ROMPRT.PAL
03/04/1985  12:00 AM               307 SEEK.BAK
03/11/1985  04:00 PM             8,419 SOPH.PAL
02/13/1985  12:00 AM               311 TEST.PAL
02/21/1985  12:00 AM               920 TIMTST.PAL
12/20/1982  11:00 AM             7,721 V800.PAL
12/30/1984  09:00 PM           149,065 V800DG.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

ASSDSK.PAL	Source file for a quick and dirty program to define disk parameters
		to the MDC8 SCSI controller.

ASSWIN.PAL	Source file for a quick and dirty program to assign disk parameters
		for the Winchester [HD] disk zero.

ASSWN1.PAL	Source file for a quick and dirty program to assign disk parameters
		for the Winchester [HD] disk one.

BOOTST.PAL	As part of a then-current MDC8 firmware upgrade, a simplified
		bootstrap-oriented command was added to allow a very short bootup
		operation suitable for manual entry or to be placed into an MI8E
		diode loader [or the somewhat larger PDP-8/A equivalent].  This is
		the source file for a quick and dirty test of the operation which is
		implemented as part of diagnostic operations of the controller; the
		program deliberately does not overlay as the operating is being
		repeatedly tested for reliability.

DEFLOP.PAL	Source file for a quick and dirty program to define the diskette
		drive particulars on the MDC8 and SCSI controller.

DMPRST.PAL	Source file of a standalone backup and restore facility for an MDC8
		system customized in terms of the specific size of Winchester disk
		and certain conventions with the assumption of a specific
		configuration of OS/8.  The user interface does not acknowledge any
		OS/8 presence; instead, the disk is presented as a series of data
		areas meaningful to an operator trained on a very minimal level.

		The code is written in a manner that could eliminate the simplfied
		interface to be replaced with a more intuitive structure, but the
		client wanted extreme simplification to allow novices to be able to
		understand what to do [for daily operations].  [Note: By nature,
		certain operations can only be performed by more qualified
		personnel, such as formatting diskette drives.]  The program only
		runs on the later versions of MDC8 firmware where there is no
		support for the half-sector bit and all sectors are 256 words.

DMU   .GOOD	Source code file of a later release of the Disk Maintenance
		Utilities [DMU] for the MDC8 [Version 02E].

		This is apparently a well-developed version of the utility program
		for the earlier firmware that supports the one-half sector bit.  As
		such, this is not the Version 2 software as described in V800DG, but
		rather a preliminary program using a different configuration from
		the V800DG version with far more complete support for the Winchester
		[HD] drives.  The controller is the same as the later configuraion
		thus there is support for HD 5.25" diskette drives.  [Note: File
		name should be DMU.PAL.]

FORDSK.BIN	Binary file of a quick and dirty program to format an entire logical
		diskette or winchester [HD] drive.  All information is lost.  The
		command can take a long time to finish on large drives.  For
		Winchester [HD] drives, it is necessary to run the Disk Maintenance
		Utilities [DMU] to establish the bad block tables and certify the
		disk as error-free after locating bad blocks.  [It is also necessary
		to enter known bad blocks from the manufacturer's bad block label on
		the drive.]

FORDSK.PAL	Source file for a quick and dirty program to format an entire
		logical diskette or winchester [HD] drive.  All information is lost.
		The command can take a long time to finish on large drives.  For
		Winchester [HD] drives, it is necessary to run the Disk Maintenance
		Utilities [DMU] to establish the bad block tables and certify the
		disk as error-free after locating bad blocks.  [It is also necessary
		to enter known bad blocks from the manufacturer's bad block label on
		the drive.]

FORTW1.PAL	Source file for a quick and dirty program to format Winchester [HD]
		drive one.  [Note: This is an earlier and more diagnostic version
		of the similar source code within the later file FORWN1.PA.]  All
		information is lost.  The command can take a long time to finish on
		large drives.  For Winchester [HD] drives, it is necessary to run
		the Disk Maintenance Utilities [DMU] to establish the bad block
		tables and certify the disk as error-free after locating bad blocks.
		[It is also necessary to enter known bad blocks from the
		manufacturer's bad block label on the drive.]

FORWIN.PAL	Source file for a quick and dirty program to format Winchester [HD]
		drive zero.  All information is lost.  The command can take a long
		time to finish on large drives.  For Winchester [HD] drives, it is
		necessary to run the Disk Maintenance Utilities [DMU] to establish
		the bad block tables and certify the disk as error-free after
		locating bad blocks.  [It is also necessary to enter known bad
		blocks from the manufacturer's bad block label on the drive.]

FORWN1.PAL	Source file for a quick and dirty program to format Winchester [HD]
		drive one.  All information is lost.  The command can take a long
		time to finish on large drives.  For Winchester [HD] drives, it is
		necessary to run the Disk Maintenance Utilities [DMU] to establish
		the bad block tables and certify the disk as error-free after
		locating bad blocks.  [It is also necessary to enter known bad
		blocks from the manufacturer's bad block label on the drive.]

HANTST.PAL	Source file for a quick and dirty handler pattern data test meant to
		be loaded over some undetermined other work in progress to exercise
		the controller presumably to confirm a source of instability in the
		firmware of the MDC8 or SCSI controller was remedied.  At the time,
		this was the most expedient way to confirm the problem had been
		fixed; it was created virtually on-the-spot when the firmware fix
		was presented while another program [which included internal
		handlers] was being developed which is referenced pragmatically.
		The file was clearly created during the firmware development cycle
		for the version that supports the one half sector transfer bit.

		[Note: OS/8 was being used at the time for the development, but not
		yet running on MDC8 devices as the firmware was in transition.
		Preliminary programs were under development and the project was not
		yet considered trustworthy for all devices at the time.

INTEST.PAL	Source file for a quick and dirty program to call the then-current
		MDC8 OS/8 system device handler while interrupts are on.  Only MDC8
		interrupts should be occurring while there should also be no OS/8
		handler error return.  The entire OS/8 system area is checked.
		[Note: The MDC8 allows the largest possible OS/8 handlers.]

MDCBUT.BIN	Binary file of a short practical bootstrap for the MDC8 to any drive
		unit depending on a two-bit field loaded along with other bits to
		signify a particular bootup operation.  Includes a test program to
		set the bits from the front panel switch register.  Note:  While
		this program essentially defines the MDC8 bootstrap developed during
		the time the earlier firmware was in effect [that supports the one
		half sector transfer bit and the 256 words/sector disk format], it
		is believed that the bootstrap convention carries through to the
		later firmware as well.  This will be confirmed when newer MDC8
		firmware-dependent files are recovered.

MDCBUT.PAL	Source file for a short practical bootstrap for the MDC8 to any
		drive unit depending on a two-bit field loaded along with other bits
		to signify a particular bootup operation.  Includes a test program
		to set the bits from the front panel switch register.  Note:  While
		this program essentially defines the MDC8 bootstrap developed during
		the time the earlier firmware was in effect [that supports the one
		half sector transfer bit and the 256 words/sector disk format], it
		is believed that the bootstrap convention carries through to the
		later firmware as well.  This will be confirmed when newer MDC8
		firmware-dependent files are recovered.

MDFLNS.BIN	Binary file for the first MDC8 diskette OS/8 non-system device
		handler for use with 256 byte sectors without support for
		half-sector transfers.

MDFLNS.PAL	Source file for the first MDC8 diskette OS/8 non-system device
		handler for use with 256 byte sectors without support for
		half-sector transfers.

MDFLSY.BIN	Binary file for the first MDC8 diskette OS/8 system device handler
		for use with 256 byte sectors without support for half-sector
		transfers.

MDFLSY.PAL	Source file for the first MDC8 diskette OS/8 system device handler
		for use with 256 byte sectors without support for half-sector
		transfers.

MDWNNS.BIN	Binary file for the first MDC8 Winchester OS/8 non-system device
		handler for use with 256 byte sectors without support for
		half-sector transfers.  Only supports disks up to 20 MB without
		the optional MENU-8 offset.

MDWNNS.PAL	Source file for the first MDC8 Winchester OS/8 non-system device
		handler for use with 256 byte sectors without support for
		half-sector transfers.  Only supports disks up to 20 MB without
		the optional MENU-8 offset.

MDWNSY.BIN	Binary file for the first MDC8 Winchester OS/8 system device handler
		for use with 256 byte sectors without support for half-sector
		transfers.  Supports coresident entry points with region one and two
		on the drive booted up [0 or 1] in an analogous manner to how the
		DEC RK8E system handler has a coresident entry point for RKBx: where
		x is 0, 1, 2, or 3 depending on which physical drive was booted.
		[Note: this includes the same anomaly potential as most systems are
		created for drive 0.  The named device seems to be the same device
		but if the storage device is moved, the underlying storage also
		changed.  This problem is especially pronounced on RK05 media which
		is more readily mounted to one of the other bootable drives;
		however, the MDC8 drives require much more effort to reconfigure the
		drive tables, etc.  As such, an MDC8 configuration is more likely to
		stay as originally configured.  Users should always be aware of the
		dangers of undocumented anomaly.]

MDWNSY.PAL	Source file for the first MDC8 Winchester OS/8 system device handler
		for use with 256 byte sectors without support for half-sector
		transfers.  Supports coresident entry points with region one and two
		on the drive booted up [0 or 1] in an analogous manner to how the
		DEC RK8E system handler has a coresident entry point for RKBx: where
		x is 0, 1, 2, or 3 depending on which physical drive was booted.
		[Note: this includes the same anomaly potential as most systems are
		created for drive 0.  The named device seems to be the same device
		but if the storage device is moved, the underlying storage also
		changed.  This problem is especially pronounced on RK05 media which
		is more readily mounted to one of the other bootable drives;
		however, the MDC8 drives require much more effort to reconfigure the
		drive tables, etc.  As such, an MDC8 configuration is more likely to
		stay as originally configured.  Users should always be aware of the
		dangers of undocumented anomaly.]

READID.PAL	Source file for a quick and dirty program to perform a diagnostic
		READID function on the MDC8 and SCSI controller.

ROMPRT.PAL	Stand-alone utility to print out the contents of memory to be
		formatted as required by ROM blasting equipment from PDP-8 binary
		code loaded in a specified format.  [The various ROM images in this
		collection of files are compatible with the ROMPRT program.]  The
		ultimate printout is in hexadecimal format for both ROM chips which
		are to be burned independently.  The output could be customized for
		processing on another machine with a ROM blaster attached, but was
		used with a standalone ROM blaster; line printer output of the
		program was made as useful as is possible for the manual entry of
		the hexadecimal values.  [If the LPT: output were captured on
		another system, it would be trival to convert the printout into an
		input file such as is used by a variety of computer-interfaced ROM
		blasters.]

SEEK.BAK	Source file for a quick and dirty program to perform seek tests on
		MDC8-controlled diskette drives.  [Note: File name should be
		SEEK.PAL.]

SOPH  .PAL	Source file for an MDC8 bootstrap and minimal diagnostic program to
		be burned into the PDP-8/A bootstrap ROM.  This is compatible with
		the later versions of the MDC8; OS/8 and P?S/8 [and MENU-8] can boot
		from this version.  [Note: 256 word sectors are required.  If the
		MDC8 system is configured for 512 byte sectors, only OMNI-8 and a
		version of P?S/8 requiring 8K or more memory can be booted; OS/8
		cannot run on this hardware due to internal design limitations.
		OMNI-8 supports emulated devices within virtual versions of OS/8
		that circumvent the OS/8 problems by emulation software.  P?S/8 can
		also run under OMNI-8 if a compatible handler is written.]

TEST  .PAL	Source file for a quick and dirty diagnostic program to test the
		controller RAM.  The only difference between this program and many
		others is the specific SCSI command given..

TIMTST.PAL	Source file for a quick and dirty program to do pattern checks in
		memory while some independent MDC8 operation is in effect.

V800  .PAL	Source file for the earliest MDC8 bootstrap and minimal diagnostic
		program to be burned into the PDP-8/A bootstrap ROM.  This is for
		the earliest version of the MDC8 using the original firmware that
		had not yet been developed for Winchester [HD] drives and supported
		two Shugart 8" drives on a Shugart controller.  [Note: The PDP-8
		device code for this version differs from all newer versions.]  This
		version of the MDC8 firmware supports 512 byte diskette sectors and
		the one half sector transfer bit to allow OS/8 to run on this
		configuration.  [Note: P?S/8 can also be made to run on this
		configuration.  It would require extended memory [8K minimum]
		instead of 4K; OS/8 can run in 8K on this configuration [instead of
		requiring 12K].  The handler strategy is essentially based on the
		RK8E design which allows OS/8 to read the first half of a 256-word
		record to prevent OS/8 system corruption.  P?S/8 supports logical
		blocks of 128 words which addresses the diskette storage to the
		nearest one half sector.]

V800DG.PAL	Source code file of an earlier generation release of the Disk
		Maintenance Utilities [DMU] for the MDC8 [Version 01E].

		This release has only vestigial support for the Winchester [HD]
		drives and is diskette-centric because the most common configuration
		was a pair of 8" MFM drives connected to a SHUGART controller for
		diskettes only.  The most important difference is that the firmware
		for the MDC8 supports the one-half sector transfer bit required by
		OS/8.  [The diskette sectors are 512 bytes; without this support it
		is impossible to run OS/8 which requires shortening read operations
		to one page under certain common circumstances; the records are
		inherently two pages.]  All later releases use 256 byte sectors
		without the one-half sector support.  [Note: OMNI-8 runs on 512 byte
		sector hard disks and emulates OS/8 in software that also supports
		the MEC8 incompatible memory controller that can use up to 512K
		memory.  OS/8 cannot run on these systems; however, with the memory
		compatibility switch thrown, OS/8 was generally used to develop
		OMNI-8 from another disk system such as an RK8E/RK05.  P?S/8 can run
		on this system as long as available memory is 8K or more [which is
		not a problem as all such systems are limited to 32K unless the MEC8
		memory mode is enabled.]

		All Version 2 software supports the 256 byte firmware; the source
		code can be modified to support the 512 byte version by making
		appropriate changes to certain parameters [to restore the former 512
		byte support as used in the original firmware].  [Note: The
		diagnostic program does not require the use of the one-half sector
		read or any similar operation; however, the operating system that
		loads the DMU program may require some mechanism to load the DMU
		program assuming the MDC8 is the basis for the system device; in
		this case, P?S/8 must be used; OS/8 cannot run on this hardware
		configuration due to internal limitations of OS/8 that was never
		designed to handle situations such as this; P?S/8 already supports
		analogous configurations on the RK8E/RK05 hardware where the logical
		block support is to the nearest one-half physical sector; unlike
		OS/8, both halves of the physical record must be properly retained,
		etc.]

[End-of-file]
