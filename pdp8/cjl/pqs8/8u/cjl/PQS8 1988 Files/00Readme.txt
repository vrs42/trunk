P?S/8 Source Files from the circa 1988 Original Distribution

Last edit: 20-Nov-2014 cjl

All files in this directory are components of P?S/8 as of the last major release
sometime in 1988 or perhaps early 1989.  These are the latest files available and
will be used as the basis for further development of P?S/8 in 2014 etc.  Any newer
files recovered will replace the files stored here; the earlier files will be
retained for comparison with the newer files and will be indicated as prior files
accordingly.

Certain files must be converted to a series of P?S/8 TFS files with arbitrary names
generally reminiscent of the file names as used here to be used as intended.

Certain files must be assembled in an OS/8 environment to produce binary files that
correspond to a P?S/8 logical unit in order to be used.

Specific files are used to create the starter P?S/8 system based solely on the
contents of memory;a complete image of the starter system will be written out on the
target media producing a bootable system containing only a limited number of system
programs.  [Note: In certain cases, the system created is not directly bootable and
requires image transfer to other devices by external means.  The P?S/8 BLKCPY or
other external programs may be required to transmit the image to the intended
hardware; see specific documentation for cases of system generation with unusual
problems.]

This is generally carried out in OS/8; however, in theory, P?S/8 itself can be used
as well [the binary output files of the starter system generation process are
operating system independent.  In theory, BIN format binary paper-tapes can be used
to create the P?S/8 starter system.  [Note: Future system creation/update routines
will simplify the overall process as well as eliminating any dependency on OS/8.
Creation of TFS binary files from P?S/8 source files must be carried out according
to the capabilities of the P?S/8 system in terms of extended directory capability or
equivalent which is extremely release-dependent; this aspect of P?S/8 is essentially
provisional and subject to significant change.  Specific circumstances vary and in
some instances there is an element of risk of accidental corruption of certain
unrelated system components [potentially including OS/8-conforming media used during
a portion of the generation process.]

The P?S/8 starter system is used with certain TFS files as described elsewhere in
this document to finalize the release.  The binary image collection of the major
source code programs must be accomplished in OS/8 to create the proper binary images
to be transferred to enhance the starter system in several stages that eventually
becomes a proper release file; certain TFS files are generally added at that point
to enhance the specific release as necessary.

Where needed, the OS8CON utility is used to convert text files from OS/8 format to
TFS files.  The files in this directory can be used with the SIMH PDP-8 simulator to
carry out the entire system generation process; a thorough understanding of SIMH
configuration as well as a sufficient understanding of both OS/8 and P?S/8 internal
operations is required before attempting to create a P?S/8 system; there is no
margin for error and data corruption will undoubtedly happen if anything is setup
incorrectly!  Always consult with Charles Lasner for any relevant details; it is
likely the subtleties will bite you if you lack the proper level of understanding of
this admittedly kludgey method.

[Note: a prerequisite is a pre-existing copy of P?S/8 with sufficient compatibility
to run the OS8CON utility to attempt any of the necessary conversions to create the
needed TFS files.  It is highly advisable to start with an image of P?S/8 already
containing the files to avoid complications with order-of-creation issues,etc.]

Towards that end, an image of a P?S/8 Version 8Z system is available.  Total image
conversion may be required, as this system is intended to boot on the MDC8 SCSI
system with HD diskette support [FLP] only.  However, the starter system will be
bootable to the device it was configured for.  Thus, this image can be used on
another logical unit to access the files for copy to the starter system in the
process of being finalized, etc.

As more systems are created, other images will be made available for release or
additional system creation as required.

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with MS-DOS and OS/8 limitations before usage.  In certain specific
instances, the final conversion yields a string of TFS files with arbitrary related
file names.  It is recommended the TFS names follow the original file names in ways
familiar to the user.  Where relevant, existing TFS file names and specific origin
of particular P?S/8 systems will be indicated.

Directory Listing:

____________________________________________________________________________________

20-Nov-2014

02/16/1988  11:00 PM             5,382 COMGEN.DUMP
02/23/1988  08:00 PM             1,452 DSUGEN.DUMP
10/06/1987  09:00 AM             1,422 DTAGEN.DUMP
04/08/1987  11:00 PM            16,825 KL8PCH.PAL
10/06/1987  09:00 AM             1,799 RKAGEN.DUMP
10/06/1987  09:00 AM             1,182 RXAGEN.DUMP

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

COMGEN.DUMP is a command file for use with the P?S/8 system program DUMP.  It is
	    used to update the P?S/8 starter system after creation from the initial
	    memory load which is written out creating a bootable system.  Only the
	    fundamental system programs are available at that point including DUMP.

	    DUMP allows command input files such as COMGEN [generally in the form of
	    TFS files named CMGEN1 and CMGEN2] to transfer groups of contiguous
	    blocks from a designated OS/8 non-system device compatible with the
	    P?S/8 system device handler and defined as unit 1 in P?S/8 terms such as
	    DECtape unit 1 relative to a P?S/8 system created for the TC01/TC08
	    DECtape controller.

	    The P?S/8 system is booted as drive 0 and the OS/8 non-system device
	    [which contains saved images of additional P?S/8 binary programs in
	    designated records] is accessed as drive unit 1.  [The contents of the
	    non-system device was created in OS/8 using OS/8 BATCH control files to
	    enforce specific binary image placement; DUMP usage depends on the
	    accuracy of the file placement on the device.  The particulars of the
	    COMGEN file are determined for each P?S/8 release in a generic manner
	    for any variant system device associated with any particular release.

	    Pragmatic DUMP commands transfer the images section by section and P?S/8
	    blocks are updated with the intended contents.  Additionally, various
	    structures are updated by ZApping the P?S?8 system directory to reflect
	    the addition of the entries for the added programs.  The non-system
	    handler table is also updated to reflect images of non-system handlers
	    also transferred from the OS/8 unit 1 device and saved in designated
	    records.

	    Once the DUMP operation has finished, the P?S/8 system is complete to
	    the extent of all common system programs; additional system programs
	    considered relevant to the particular system device must be updated by
	    additional DUMP command files or other means.  Once all system programs
	    are present, the TFS and user directory structures will be updated.
	    additional files associated with a complete release can then be added to
	    the completed system [which can be deleted by the user if desired].

	    CMGEN1 AND CMGEN1 were taken from the P?S/8 Version 8Z MDC8 diskette
	    [FLP] image and combined into COMGEN.DUMP.

DSUGEN.DUMP is a command file for use with the P?S/8 system program DUMP.  It is
	    used to update the P?S/8 starter system after all common system programs
	    have already been added.  System programs are added deemed useful for
	    P?S/8 systems based on the DSD-240/Western Dynex disk system with
	    removable cartridge [DS Upper] or fixed disk [DS Lower] or the MDC8 HD
	    Diskette system [FLP].

	    Once the DUMP operation has finished, the P?S/8 system is complete and
	    ready for release.  The TFS directory has been updated to reflect
	    available user file space consistent with available storage on the
	    system device.  Additional TFS files associated with a complete release
	    should be added [which the user can delete if desired].

	    DSUGEN was taken from the P?S/8 Version 8Z MDC8 diskette [FLP] image and
	    renamed to DSUGEN.DUMP as part of the source file collection.

DTAGEN.DUMP is a command file for use with the P?S/8 system program DUMP.  It is
	    used to update the P?S/8 starter system after all common system programs
	    have already been added.  System programs are added deemed useful for
	    P?S/8 systems based on the TC01/TC08 DECtape controller and TU55/TU56
	    drives.

	    Once the DUMP operation has finished, the P?S/8 system is complete and
	    ready for release.  The TFS directory has been updated to reflect
	    available user file space consistent with available storage on the
	    system device.  Additional TFS files associated with a complete release
	    should be added [which the user can delete if desired].

	    DTAGEN was taken from the P?S/8 Version 8Z MDC8 diskette [FLP] image and
	    renamed to DTAGEN.DUMP as part of the source file collection.

KL8PCH.PAL  is the source file for customization of the KL8 patch file for the
	    Logical Console Overlay.  The Overlay allows update with standard TFS
	    slurp binary files; KL8 is the standard overlay for device 03/04 console
	    with the standard device 66 lineprinter.  If applied with no further
	    customization, the Logical Console Overlay is returned to its initial
	    generation state; the KL8 file contains all of the same default values,
	    etc.

	    KL8PCH can be used as an additional overlay to create custom variants
	    for special configurations known to exist such as device 66 lineprinter
	    sharing interrupts with the device 43 VT8E keyboard, device 03/04
	    console with device 40/41 serial printer, device 40/41 console with
	    device 66 lineprinter, etc.  Other devices such as using the VT8E as an
	    emulated terminal require other Overlay files entirely; customization
	    files for those configuration variants may or may not exist as well,
	    such as VT8E terminal with device 66 lineprinter or VT8E terminal with
	    device 40/41 serial printer, etc.  In general, the main file can be
	    customized, perhaps through the use of conditional assembly parameters
	    within the file [which is recommended]; however, when the changes are
	    relatively small and can be well-organized, the approach taken in the
	    KL8PCH.PAL file may be well-suited to proper maintenance of the overall
	    set of configurational possibilities.

	    The Logical Console Overlay should be upgraded to include a custom
	    configuration program to allow the user to more readily configure the
	    Overlay including a status report of the current configuration and a
	    patching facility to effect minor changes as needed.  The underlying
	    data for this purpose is partially implemented in practical overlay
	    files such as KL8PCH which is compatible with a suggested internal
	    binary configuration convention that needs to be more rigorously
	    defined, etc.  A structure reminiscent of OS/8 BUILD would be
	    appropriate to allow easier customization by the user.

	    [Note: An additional feature needs to be created within the basic P?S/8
	    system with respect to the Overlay: There needs to be some support for
	    the ability to prevent the Overlay from loading should the hardware not
	    match the intended configuration; this would apply in situaitons where
	    dismountable system media such as DECtapes were set to automatically
	    load the intended overlay, but on another machine the hardware may not
	    be present.  As such, there needs to be some fool-proof mechanism, such
	    as DECmate and PDP-8 device 03 handling of some internal Overlay abort
	    character apart from all other mechanisms, such as the control-A
	    character that could load in a generic routine used to cancel existing
	    mechanisms.  this could also be combined into a more general mechanism
	    to interrupt the SHELL from being loaded as well.]

	    KLPCH1, KLPCH2, KLPCH3, KLPCH4, KLPCH5 and KLPCH6 were taken from the
	    P?S/8 Version 8Z MDC8 diskette [FLP] image and combined into KL8PCH.PAL.

RKAGEN.DUMP is a command file for use with the P?S/8 system program DUMP.  It is
	    used to update the P?S/8 starter system after all common system programs
	    have already been added.  System programs are added deemed useful for
	    P?S/8 systems based on the RK8E/RK05 disk system or the PDP-12 TC12
	    LINCtape controller with TU55/TU56 drives.

	    Once the DUMP operation has finished, the P?S/8 system is complete and
	    ready for release.  The TFS directory has been updated to reflect
	    available user file space consistent with available storage on the
	    system device.  Additional TFS files associated with a complete release
	    should be added [which the user can delete if desired].

	    RKAGEN was taken from the P?S/8 Version 8Z MDC8 diskette [FLP] image and
	    renamed to RKAGEN.DUMP as part of the source file collection.

RXAGEN.DUMP is a command file for use with the P?S/8 system program DUMP.  It is
	    used to update the P?S/8 starter system after all common system programs
	    have already been added.  System programs are added deemed useful for
	    P?S/8 systems based on the RX01/DSD-210/RX02 in single density mode.

	    Once the DUMP operation has finished, the P?S/8 system is complete and
	    ready for release.  The TFS directory has been updated to reflect
	    available user file space consistent with available storage on the
	    system device.  Additional TFS files associated with a complete release
	    should be added [which the user can delete if desired].

	    RXAGEN was taken from the P?S/8 Version 8Z MDC8 diskette [FLP] image and
	    renamed to RXAGEN.DUMP as part of the source file collection.

[End-of-file]
