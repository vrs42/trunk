PQS8 FOCAL-related Files.

Most files in this directory were recovered from OS/8 format MDC8 [FLP] diskettes
created on 30-Jan-1989 or 31-Dec-1989.  Additional files were recovered from an
MDC8 [FLP] bootable copy of P?S/8 Version 8Z; in some cases, the files were
recovered from multiple sources as documented below.

Last edit: 16-Jun-2015 cjl

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

16-Jun-2015

04/15/1988  06:00 PM            29,439 DPATCH.OLD
01/01/1980  12:00 AM             1,544 HAMURABI.FOC
06/03/1988  11:00 PM               664 HDSPLT.FOC
06/02/1988  11:00 PM            20,621 HPATCH.PAL
12/03/1985  11:00 AM             1,505 PLOTS.FOC
02/17/1989  06:00 PM             5,287 TPARAM.FOC
02/05/1989  02:00 AM             5,119 TPARAM.OLD
07/23/1987  11:00 AM            33,643 TPATCH.OLD
02/04/1989  09:00 PM            61,489 TPATCH.PAL
02/16/1989  11:00 AM             4,376 TPTASK.FOC
02/05/1989  12:00 AM             4,046 TPTASK.OLD
02/17/1989  08:00 PM            17,874 TRAIN.FOC
02/05/1989  02:00 AM            11,978 TRAIN.OLD
01/28/1988  11:00 AM             7,475 XPATCH.PAL

¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Program Information

DPATCH.OLD	Source file for an output display patch to P?S/8 FOCAL.

		Despite the designation as an old source file, this file is actually
		newer than the original DPATCH.PAL file that is considered part of
		the 1989 release of P?S/8 [created 01-Apr-1987 18:00:00].

		The main difference [other than some minor code cleanup] is the
		addition of a virtual buffer option that can create far more display
		points than the general documentation indicates.  Clearly, this
		feature was added on expediently; it is not known if newer versions
		of this file were upgraded to provide consistent documentation with
		this new feature.

		The storage of the largest possible P?S/8 logical unit [.5 MWords]
		can be used to store up to 256K X, Y data pairs as part of some
		virtual technique that would involve a storage scope or more likely
		an independent application to be practical.  [Smaller sizes can be
		accommodated as necessary.]

		Due to the recovery of this file along with other similar student
		project files, perhaps there was an editing session where this file,
		despite being an original source file for the purpose, was saved as
		an "old" file before being abandoned in favor of other programs.
		The exact agenda of the project is not clearly known, and likely
		was modified during its lifetime.  It is conceivable this was
		acceptable for data obtained from FOCAL programming, but the project
		turned to other data sources.

		Further investigation is needed as to the best disposition of this
		file; perhaps some of the lesser differences between this file and
		the standard DPATCH.PAL file may prove useful.  Alternatively, a
		careful scrutinization of what exactly was done may prove useful for
		a virtual variant [complete with corrected documentation].  It is
		possible additional versions of the DPATCH.PAL file may be recovered
		in the future.

HAMURABI.FOC	FOCAL source file of the original King of Sumeria [Hamurabi]
		management game written in 1968 by Doug Dyment.  This program was
		originally known as The Sumer Game and written as a demonstration
		program for a prior release of PDP-8 FOCAL [which is fully
		compatible with FOCAL, 1969 including the P?S/8 FOCAL variant].

		Unlike various revisionist programs, this is the original version
		published in various editions of DEC's Introduction to Programming
		manuals for the PDP-8.

		Note: The game player is addressed as HAMURABI; variant spellings
		are known to exist in other contexts.

		Note: The Tiny File System [TFS] file HAMURA was converted into
		HAMURABI.FOC.

HDSPLT.FOC	P?S/8 FOCAL source file for a display demonstration program written
		for use with P?S/8 FOCAL and the HPATCH program.  Various
		capabilities of the Human Designed Systems HDS-3200-30 terminal are
		exploited including annotating graphics display with characters.		output.

HPATCH.PAL	Source file for a custom patch to P?S/8 FOCAL to implement special
		functions specific to the Human Designed Systems HDS-3200-30
		terminal display and keyboard.
 
PLOTS.FOC	P?S/8 FOCAL source file for a display demonstration program written
		for use with P?S/8 FOCAL and various display-oriented patch programs
		such as DPATCH.

		The program is easily modified to support various display devices
		such as VT8E graphics display, AX08, VC12 [PDP-12], AA01A or
		VC8E/LAB-8/E display with an external oscilloscope.

		As is the case in many other well-documented P?S/8 FOCAL files,
		comments are included in the text file without contributing to the
		general overhead of the FOCAL environment where resources may be
		especially scarce.

		Note: The Tiny File System [TFS] file PLOTS was converted into
		PLOTS.FOC.

TPARAM.FOC	P?S/8 FOCAL source file for passing program parameter values to the
		PDP-12-based animal training program.

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 31-Dec-1989.

TPARAM.OLD	Source file for a prior release of the TPARAM program described
		above.

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 30-Jan-1989.

TPATCH.OLD	Source file for a prior release of the TPATCH program described
		below.

		Note: Tiny File System [TFS] files TP1, TP2, TP3, TP4, TP5, TP6,
		TP7, TP8, TP9, TP10 and TP11 were taken from the P?S/8 Version 8Z
		MDC8 diskette [FLP] image and combined into TPATCH.OLD.

TPATCH.PAL	Source file for a special patch to P?S/8 FOCAL to add three
		functions to control a PDP-12-based animal training program.

		The FGO(MEMDATA) function starts the training operation.  If the
		value of MEMDATA) is 0, clear all accumulated data from previous
		training runs; if MEMDATA is non-zero, retain the previous data to
		allow cumulative statistics to be calculated later.  [Generally, the
		MEMDATA parameter is set to 0 for starting a training operation on a
		different animal.]

		The FIO(DIRECTION) function performs two different functions after
		the value of DIRECTION is converted to a 12-bit integer:

		a) If DIRECTION is negative, FOCAL will wait for an input character
		   on the system console terminal; the value returned is the
		   seven-bit ASCII character code.

		b) If DIRECTION is positive, FOCAL will print the passed value on
		   the system console terminal; the value of DIRECTION is reduced to
		   an 8-bit printable code.

		The FWRD(ADR) function [where ADR is in the range of 0-2047] returns
		the contents of memory location ADR in a memory buffer defined in
		the program for parameter passing.  Returned values are signed
		24-bit integers.

		The FWRD(ADR,NEWVALUE) function [where ADR is in the range of
		0-2047] writes the new value NEWVALUE into memory location ADR.
		Valid values of NEWVALUE are signed 24-bit integers.

		Most of the package is a real-time experimental control program for
		the purpose of training Rhesus monkeys to perform simple tasks which
		are made progressively more difficult as the animal becomes familiar
		with the training routine.

		The Rhesus monkeys are attracted to a projection screen upon which
		various light patterns are created using mirrors mounted on
		miniature galvonometers.  [Note: The mirror galvonometer is the
		underlying principle used in various large-screen projection
		displays.  In this experimental work, the galvonometers are
		electromechanical instead of being constructed from semiconductor
		material; however, since only a single light source is used [driven
		by an external generator], adequate patterns are obtained to pique
		the curiousity of the monkeys using this limited equipment.  If this
		experiment were being designed in more recent years, an actual
		large-screen monitor would be used.]  Once the monkeys are trained
		to understand the task/reward functions, they can be subjected to
		more complex tasks while monitoring functions such as their eye
		position, etc.

		In the typical training exercise, the monkeys are given various
		switches they can press that are sensed by the computer to see how
		they respond to the lights on the screen.  Monkeys that master the
		operation are given a "reward" of a small food pellet while those
		that fail to follow the programmed pattern are denied the "reward"
		as "punishment" for failing to master the routine.

		The program is initially setup to first allow nearly any response to
		the visual stimulus; as the animal gets to understand the "game"
		better, the skill level can be raised by the experimenter by making
		small changes to the FOCAL programming.  The monkeys can generally
		be trained to perform fairly sophisticated tasks.

		The program only runs on a PDP-12 [as written] because it requires
		access to the External LEvel inputs on the PDP-12 backplane as well
		as the front-panel relay contact connectors to control the reward
		system as well as overall control of the display brightness and
		other related conditions.  [Note: With some rework, the program
		could be made to work on the LINC-8; with a lot of added-on
		instrumentation, the program could also be made to work on the
		LAB-8/E peripheral option package.]

		[Note: The animals are not harmed in any way by their use in the
		training exercises; on the contrary, they seem to enjoy the games
		and are eager to get their food treats this way.  The research
		institution where this program was used is known for its excellent
		treatment of laboratory animals.  The ultimate goal of the program
		is to use human toddlers as subjects with an entirely different
		reward scenario.]

		Note: This file was recovered from OS/8 format MDC8 [FLP] diskettes
		created on 30-Jan-1989 and 31-Dec-1989.

TPTASK.FOC	P?S/8 FOCAL source file for assiging training tasks to the
		PDP-12-based animal training program.

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 31-Dec-1989.

TPTASK.OLD	Source file for a prior release of the TPTASK program described
		above.

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 30-Jan-1989.

TRAIN.FOC	P?S/8 FOCAL source file for a PDP-12-based animal training program.
		This program depends on the TPATCH program to customize P?S/8 FOCAL
		for specific functions required by the program.  Other FOCAL files
		are used to set program parameters and assign training tasks.

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 31-Dec-1989.

TRAIN.OLD	Source file for a prior release of the TRAIN program described
		above.

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 30-Jan-1989.

XPATCH.PAL	Source file for a special patch to P?S/8 FOCAL to add three
		functions oriented towards the contents of absolute blocks on a
		P?S/8 logical storage unit [defined within the program setup
		parameters].

		The FBLK(BLKNUM) function reads 32 blocks starting with block BLKNUM
		into a a 4096 word extended memory field buffer.  [The field is
		defined within the program setup parameters.]  The
		 FBLK(BLKNUM,WRITE) function writes the contents of the memory
		buffer to block BLKNUM [and the 31 blocks following]; writing is
		indicated by the presence of the second parameter.  The second
		parameter is otherwise ignored.

		The FWRD(ADR) function [where ADR is in the range of 0-4095] returns
		the contents of memory location ADR in the extended memory field
		buffer as defined in the FBLK function.

		The FWRD(ADR,NEWVALUE) function [where ADR is in the range of
		0-4095] writes the new value NEWVALUE into memory location ADR.
		[Note: Only the lowest 12-bits of NEWVALUE are used.]  The updated
		contents of memory location ADR [where ADR is defined in the
		FWRD(ADR) function above] are returned to the caller; thus, the new
		contents returned is the value of NEWVALUE modulo 4096.

		There is also additional support for the ADR argument in the range
		of 4096 through 6143.  The form of the function argument[s] is the
		same except for the following:

		a) The memory field referenced is an alternate memory field [also
		   defined within the program setup parameters].

		b) The data is converted to 24-bit integers; thus, only 2048 values
		   are used.  [Note: The 24-bit integer data is unrelated to the
		   12-bit data and cannot access the P?S/8 logical unit.  This is
		   provided as an alternative to routine storage variables as is
		   usually practised in FOCAL.  Most implementations of FOCAL do not
		   support as many as 2048 variables; access to the standard FOCAL
		   variables is significantly slower than this method.]

		The FAND(I,J) function performs a logical operation on the two
		passed arguments converted to integers and returns (I .AND. B) to
		the caller.  [Note: FOCAL does not have a built-in .AND. operator.
		Time-consuming calculations are needed to produce the equivalent
		results using only standard FOCAL features.]

		This custom patch to FOCAL was written to enable certain data
		analysis of real-time data collected separately [using the DATA
		program defined elsewhere].  Certain aspects of the package were
		added to greatly speed up the program to avoid known weaknesses of
		FOCAL.  The ability to define large histograms is provided by the
		extended FWRD function while the basic capability is to provide
		access to the real-time data when used in conjunction with the
		FBLK function.  The experimental data format includes reserved bits
		to allow FOCAL to mark areas of interest in the data; thus, the need
		for a fast .AND. facility.  [Note: This patch was often used with a
		display-oriented FOCAL patch such as DPATCH; the function addresses
		do not conflict with each other; all FOCAL patches are
		self-relocating avoiding patching order issues.]

		Note: This file was recovered from an OS/8 format MDC8 [FLP]
		diskette created on 30-Jan-1989.  An identical copy was recovered
		from an MDC8 [FLP] bootable copy of P?S/8 Version 8Z.  The Tiny File
		System [TFS] files XPAT1, XPAT2 and XPAT3 were combined and
		converted to XPATCH.PA on an OS/8 scratch device using the P?S/8
		OS8CON utility.

[End-of-file]
