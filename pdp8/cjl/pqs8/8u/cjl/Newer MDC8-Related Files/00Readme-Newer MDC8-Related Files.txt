MDC8-Related Files.

All files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 30-Jan-1989 or 11-Nov-1989 or 20-Nov-1989.

Last edit: 19-Jun-2015 cjl

All files in this directory are designed to run with the final version of the MDC8
hardware and firmware configuration produced.

The final hardware/firmware configuration changes the firmware to support 256 byte
sectors on all devices; as such, all transfers are based on 128 12-bit word
transfers; the one half sector transfer bit is not present on these newer systems.

Utilities relating to bootup or accessing the onboard firmware and control RAM of
the 6809 are most likely generic to all releases.  These programs are located in
other directories focused on the earlier development of the MDC8 project.

[Note: Most of the utilities have the notion of the basic sector length of either
256 or 512 bytes per sector as a parameter; there are variant newest configuration
systems that use 512 bytes/sector; they are not capable of supporting OS/8.  These
configurations are used by the multi-user OMNI-8 system which runs on machines up to
512K memory using the MEC8 memory controller from CESI which is incompatible with
all PDP-8 extended memory programming.  [Note: A hardware compatibility switch is
available on the MEC8 to provide a 32K compatible environment; OS/8 can then be run
on other devices such as the RK8E/RK05.  P?S/8 can be made to run on this variant of
the MDC8 using a system handler that requires extended memory [at least 8K]; due to
inadequate design, OS/8 cannot be run on this system; the emulated OS/8
environment[s] supported under OMNI-8 use ersatz handlers that are trapped by
OMNI-8; the one-half sector problem is then resolved using software simulation.]

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

19-Jun-2015

10/29/1989  12:00 AM           306,473 DMU.PAL
02/16/1988  10:00 PM             5,326 FDSKNS.PAL
02/16/1988  10:00 PM             8,210 FDSKSY.PAL
02/09/1988  12:00 AM               306 FMAT.PAL
02/17/1989  12:00 AM               768 RD1.BIN
02/17/1989  12:00 AM            13,896 RD1.PAL
08/28/1988  01:00 PM            13,525 WDSKNS.OLD
08/28/1988  11:00 PM            15,107 WDSKSY.OLD
10/03/1988  10:00 PM            15,485 WDSKSY.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

DMU.PAL		Source file of the apparently final release of the Disk Maintenance
		Utilities [DMU] for the MDC8 [Version 02H].

		There are certain issues with this release:

		1) The source code will require analysis to determine if the bad
		   block management routines are truly complete.  The author has a
		   recollection that some aspect of the process was performed by a
		   separate diagnostic utility for some aspect of bad block
		   management; at some point, this routine would require integration
		   into the main DMU utility [which is menu-driven].  If this is the
		   case, this release may merely allow for the detection of flaws on
		   the disk media by running a battery of tests where the actual
		   management of discovered and/or initially known flaws is not
		   carried out by this utility.  [Note: It is likely this separate
		   utility will be recovered at some other time; once both source
		   files are available, this situation can be properly assesed.]
		   Due to the more technical nature of the entry of bad block
		   information, the client for the DMU program may have decided the
		   facility to set initial bad block information should not be
		   placed in the hands of less qualified personnel capable of
		   running the main body of utilities; the DMU program was designed
		   for ease of use by minimally trained users.  A tentative solution
		   would be to implement advanced authorization to access the
		   affected portions of the program; however, this level of
		   additional design was never authorized nor implemented.

		2) The file time/date stamp used in the recovery directory file
		   DMU.PAL [29-Oct-1989 12:00 AM] is derived from the OS/8 media the
		   file was recovered from, not the time and date stated within the
		   source file.

		   While generally such information should be considered as either
		   authoritative or perhaps slightly out of date [due to possible
		   anomaly caused by editing cycles where the information is updated
		   infrequently], in this case it is likely the actual final edit
		   was performed on or about 29-Oct-1989.  A possible reason for
		   this discrepancy is the file edit was relatively minor and was
		   not considered important enough to change the official release
		   particulars within the source file.

FDSKNS.PAL	Source file for the OS/8 non-system device handler for 5.25"
		diskettes connected to the OMTI 20D or 5000 series [5200, 5400] SCSI
		controller attached to the CESI MDC8 [firmware revision 02]
		configured for 256 bytes/sector.  This is Version F of the handler
		[and is apparently the final release].

FDSKSY.PAL	Source file for the OS/8 system device handler for 5.25" diskettes
		connected to the OMTI 20D or 5000 series [5200, 5400] SCSI
		controller attached to the CESI MDC8 [firmware revision 02]
		configured for 256 bytes/sector.  This is Version F of the handler
		[and is apparently the final release].

FMAT.PAL	Source file for a quick and dirty program to format diskette drive
		one.  All information is lost.  [Note: This program is quite similar
		to other programs to format drives on the MDC8; the final release of
		the MDC8 firmware doesn't change this functionality from the earlier
		release].

RD1.BIN		Binary file for the OS/8 non-system device handler for fixed or
		removable Winchester [hard] disks connected to the OMTI 20-C, 20D or
		5000 series [5100, 5200, 5300, 5400] SCSI controller attached to the
		CESI MDC8 [firmware revision 02] configured for 256 bytes/sector.
		This release supports SyQuest 555 removable drives with embedded
		controller.

		This is Version I of the handler [and is apparently the final
		release].  [Note: Thus release is compatible with the MENU-8
		bootstrap monitor if the "OFFSET" parameter is set to one [which is
		the default].  Various features of the later releases of the Disk
		Maintenance Utilities [DMU] program check for the presence of the
		bootstrap monitor to access stored disk parameters particular to the
		drive.]

		Note: This file is a small modification to the standard version; it
		has a call to the handler added for the purpose of testing SyQuest
		555 drives as part of an extended session of work performed in
		support of these drives.  By performing a minimal file edit [to
		remove the subroutine call], the original WDSKNS.PAL can be fully
		restored.

RD1.PAL		Source file for the OS/8 non-system device handler for fixed or
		removable Winchester [hard] disks connected to the OMTI 20-C, 20D or
		5000 series [5100, 5200, 5300, 5400] SCSI controller attached to the
		CESI MDC8 [firmware revision 02] configured for 256 bytes/sector.
		This release supports SyQuest 555 removable drives with embedded
		controller.

		This is Version I of the handler [and is apparently the final
		release].  [Note: Thus release is compatible with the MENU-8
		bootstrap monitor if the "OFFSET" parameter is set to one [which is
		the default].  Various features of the later releases of the Disk
		Maintenance Utilities [DMU] program check for the presence of the
		bootstrap monitor to access stored disk parameters particular to the
		drive.]

		Note: This file is a small modification to the standard version; it
		has a call to the handler added for the purpose of testing SyQuest
		555 drives as part of an extended session of work performed in
		support of these drives.  By performing a minimal file edit [to
		remove the subroutine call], the original WDSKNS.PAL can be fully
		restored.

WDSKNS.OLD	Source file for a prior release of the OS/8 non-system device
		handler for fixed or removable Winchester [hard] disks connected to
		the OMTI 20-C, 20D or 5000 series [5100, 5200, 5300, 5400] SCSI
		controller attached to the CESI MDC8 [firmware revision 02]
		configured for 256 bytes/sector as described elsewhere.  This is
		Version H of the handler and does not support the SyQuest 555
		removable drives.

WDSKSY.OLD	Source file for a prior release of the OS/8 system device handler
		for fixed or removable Winchester [hard] disks connected to the OMTI
		20-C, 20D or 5000 series [5100, 5200, 5300, 5400] SCSI controller
		attached to the CESI MDC8 [firmware revision 02] configured for 256
		bytes/sector as described below.  This is Version H of the handler
		and does not support the SyQuest 555 removable drives.

WDSKSY.PAL	Source file for the OS/8 system device handler for fixed or
		removable Winchester [hard] disks connected to the OMTI 20-C, 20D or
		5000 series [5100, 5200, 5300, 5400] SCSI controller attached to the
		CESI MDC8 [firmware revision 02] configured for 256 bytes/sector.
		This release supports SyQuest 555 removable drives with embedded
		controller.

		This is Version I of the handler [and is apparently the final
		release].  [Note: This release is compatible with the MENU-8
		bootstrap monitor if the "OFFSET" parameter is set to one [which is
		the default].  Various features of the later releases of the Disk
		Maintenance Utilities [DMU] program check for the presence of the
		bootstrap monitor to access stored disk parameters particular to the
		drive.]

[End-of-file]
