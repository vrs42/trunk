Very Old P?S/8 Source Files.

All files in this directory were recovered from a TOPS-10 format DECtape.  File dates
range from 12-Dec-1972 through 07-Aug-1973.

Last edit: 17-May-2019 cjl

Note: File naming conventions are compatible with the intentions of the P?S/8 SHELL
overlay directory.  In some cases, conversion requires truncation of the names to
conform with (possibly MS-DOS and) OS/8 limitations before usage.

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

Note: The P?S/8 SHELL environment supports dates from 1-Jan-1900 through
31-Dec-2411.

Directory Listing:
____________________________________________________________________________________

17-May-2019

01/01/1980  12:00 AM            18,239 SYSIO.PAL
01/01/1980  12:00 AM           124,975 MON119.PA
01/01/1980  12:00 AM            13,586 MONHIS.DOC
01/01/1980  12:00 AM             1,183 XLIST.PAL
01/01/1980  12:00 AM                11 RALLOD.PAL
01/01/1980  12:00 AM            57,723 MON078.PAL
01/01/1980  12:00 AM            53,706 MON077.PAL
01/01/1980  12:00 AM            57,928 MON079.PAL
01/01/1980  12:00 AM            40,251 BIP061.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
File Information

SYSIO.PAL    Source file of an early version of the P?S/8 system device handler
             component of the system to be assembled for use with the original
             pragmatic system generation routine.  Conditional assembly allowed
             the creation of a system for the TC01/TC08 DECtape controller, the
             DF32, PDP-12 TC12 LINCtape or an unspecified generic floppy disk
             design.

             While not all kernel features were yet defined (and some would
             eventually be modestly relocated, creating a system with this device
             handler could be modestly useful.

             Future releases would separate all device handlers into individual
             modular files for all supported devices.  When more than a small
             handful of devices are supported, the method employed here becomes
             highly impractical.

             It is especially noteworthy that the basic calling sequence to the
             device handler was in transition; certain aspects of the implementation
             resemble those of the R-L Monitor System.  That said, the system was at
             a sufficient level of implementation to support device independence as
             an embedded call to the device handler is present; this allowed the
             fundamental concept that system programs no longer required their own
             internal subroutines to access files or other system blocks.

             Note: The R-L Monitor System can only run on TC01/TC08 DECtape; each
             system program includes an internal (generally redundant) copy of a
             DECtape read/write subroutine (similar to the R-L system device handler
             which is only available to the system keyboard monitor).  Even this
             early release of P?S/8 overcomes this serious limitation while being
             able to execute programs generically on a basic 4K machine.

MON119.PA    Source file of the P?S/8 keyboard monitor Version 5 (associated with
             the SYSIO.PAL file as discu ssed above).  This file sets the global
             conditional parameter that determines what specific system device will
             be used.

             Additional components include:

             1) The initial image of the System Programs directory including certain
                programs that were never implemented.

             2) The system generation routines which call the system device handler
                (relocated to the operational addressess 07600-07777).

                Note: The original image is written to block 0000 in unmodified
                form.

             3) The RU{n} command overlay which is read in to lookup system programs
                when necessary.

             Note: Since this file name conforms to OS/8 conventions, it is likely
             the file was (somewhat) worked on in OS/8; however, most P?S/8
             development in this time frame was performed on a TOPS-10 system.

MONHIS.DOC   Early documentation file created at the time of earlier files also
             located on this DECtape.  The writing style is a bit jovial and does
             include a lot of in-side references and jokes known only to members of
             the Poly Question Society (P?S).

             Note: The file content indicate the initial file date would be somewhat
             earlier (October, 1972); however, the file date is likely correct for
             the last file edit.  Various documents based on this file have been
             created over the years, largely from the recollections of Charles
             Lasner (who was largely responsible for this early version).

XLIST.PAL    Source file of a temporary system program generator utility explicity
             for the purpose of writing out the "BIN" system program to the proper
             blocks from other memory locations (also loaded at the same time).
             The absolute starting block is determined from the front panel switch
             register.

             The binary was generally (apparently) loaded from an early release of
             an OS/8 forerunner (PS/8); comments indicate the need to protect
             against known quirks of that host environment.  The TC01/TC08 DECtape
             device is indicated by a global parameter consistent with the same
             value as used in the system device handler when generating the main
             system files.

             Instead of being loaded with the P?S/8 system device, this code reads
             in the P?S/8 system device handler before writing components of the
             "BIN" system program.

             Note: Despite the file name being redundant to a feature of the PAL
             assembly language, this is likely merely a coincidence and was chosen
             merely to distinguish the file from others.

RALLOD.PAL   Assembly termination file.  Contains "<HT>$".  This is needed for
             certain complex assemblies when used with PDP-8 assemblers that insist
             on a trailing "$" line.

             Note: Most PDP-8 assemblers will allow end-of-file to terminate the
             assembly; however, early development of P?S/8 was performed on certain
             assemblers that require the termination.  Leaving out the termination
             file might prematurely end the assembly with a "PHASE ERROR" or
             equivalent.  In all modern PDP-8 assemblers, this error only applies to
             unmatched conditional assembly sections; as such, the termination file
             may be required to debug improper conditional usage.

             Despite the reference to adventure games, P?S/8 development is based on
             PDP-8 assembly language; regardless, the name is "DOLLAR" spelled
             backwards.

MON078.PAL   Source file of P?S/8 keyboard monitor and related system components
             Version 2.  Many notions were started (but not completed).  Few, if
             any, were eventually retained.

MON077.PAL   Source file of P?S/8 keyboard monitor and related system components
             Version 2.  Immediate predecessor edit to MON078.PAL (apparently
             created later the same day).  Changes mainly center on some printer
             support (later removed in favor or a more general system program to
             accomplish similar results).

MON079.PAL   Source file of P?S/8 keyboard monitor and related system components
             Version 2.  The immediate predecessor edit of this file is MON078.PAL
             as described above.  Changes have minimal effect on the printing
             support code described above.

BIP061.PAL   Source file of early binary utility program known as of this writing as
             "BIN".  At some point in the development of P?S/8, the program was to
             be named "BIP" emphasizing the various auxiliary functions that were
             added beyond Slurp binary file loading.  (General-purpose utility
             programs are often named "PIP"; however, since this is a binary-only
             utility, the tentative name reflected this important difference.

             Future releases of P?S/8 will revisit this nomenclature issue as the
             scope of future releases changes.  (A likely utility name might be
             "LOAD".)

             Note: Certain early P?S/8 concepts were already transitioning away from
             the R-L Monitor System.  While not identified yet as "%", the correct
             blocks 0020-0037 were considered the default binary file, yet still
             identified as "THE BIN" as is the case in the R-L Monitor System.  AS
             such, "$" was used to identify blocks 0020-0037 with the restriction
             that this only applied to the first passed input file.

             This release predates the optimization of the virtual Slurp loader to
             use four-page buffers; as such, two pages are used for each system
             device handler call.  Various cases were timed with a stop-watch; the
             four-page buffer generally produced the fastest results of all cases
             tested.

[End-of-file]
