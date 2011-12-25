<?php
  $title = "EDU25 Basic";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <P>If you've been following along the story from the <A href=sbc6120.php>SBC6120</A>
 and <A href=iob6120.php>IOB6120</A> pages, we've got a really impressive PDP-8 system:
<BL>
<LI>32Kword PDP-8/E compatible CPU (less timeshare option).
<LI>Separate 32Kword firmware with debugger.
<LI>PDP-8/E style front panel switches and lights.
<LI>Parallel IDE interface for hard disk, CF, whatever.
<LI>Console terminal interface.
<LI>CF Interface, for even more disk storage.
<LI>2MB RAM-disk with battery backup.
<LI>VT52 emulation using PS2 keyboard and VGA display.
<LI>3 additional RS-232 terminal interfaces.
<LI>Parallel printer port.
<LI>Crystal controlled RTC and Time-of-day clock.
<LI>Expandable I/O bus, etc.
</BL>
    <P>The trick is to make it do something interesting, showing the capabilities of 
the system in the process.
    <P>One unfortunate fact that has always disappointed me is that the H6120 chip 
used in the Decmates and in the SBC6120 does memory management, but does not include 
the timesharing option.  So it isn't immediately clear how to get all five of those 
terminals (VT52, original console, plus 3 more) to do something.
    <P>I want to credit Ethan Dicks with the idea of using EDU25 BASIC to show off 
the SBC6120 and IOB6120.  In February of 2010, Ethan Dicks and Mike Roach had a 
conversation about using EDU25 BASIC this way in the Spare Time Gizmos
<A href=http://groups.yahoo.com/group/sparetimegizmos/>Yahoo discussion group</A>.
Mike pointed out that the known copies of EDU25 BASIC were corrupted.
    <P>In late May of 2011, Ethan was looking in the 
<A href=http://www.classiccmp.org/cctalk.html>classic computer mailing list</A>
for a valid copy of EDU25, and Dave Gesswein mentioned that the EDU20 binaries work.  That got 
me thinking about using the EDU20 binary to reconstruct EDU25.  In principle, if EDU20 and 
EDU25 are sufficiently similar, one need only locate the analogous code in EDU20, dis-assemble
it, and use that to reconstruct the EDU25 code.
    <P>A bit of background: Among DEC's timesharing systems, the Edusystems were nice
multi-user BASIC systems, at a variety of price points.  One of these, EDU25 BASIC, is the
largest time-sharing (as opposed to batch processing) BASIC that does not require the hardware 
timesharing assist.  Conveniently, EDU25 BASIC supports 5 users.
(The manual mentions 8 users -- was there ever a patch for that?).
    <P>The problem: EDU25 BASIC has been lost for decades.  At least sort of.
Someone long ago archived the 
<A href=http://www.dbit.com/pub/pdp8/nickel/langs/edu25basic/ascii/edu25.pa>source code</A>
for EDU25 basic, which was great, but somehow along the line, one disk block of the file 
containing the source code was over-written with zero bytes.  This resulted in a file which 
decidedly did <em>not</em> compile.
    <P>Trying to move code from EDU20 BASIC didn't work out all that well, as I wasn't 
able to figure out a lot of information about EDU20 (available only in binary form) that I 
could use in EDU25.  However, I did do a bunch of searching around, and found many pieces 
of source code around with similarities to the EDU25 code.
    <P>The missing code in EDU25 is mostly part of the floating point output routine.
Floating point output routines are common in many larger PDP-8 software projects, and 
many of them follow similar logic.  The remainder of the missing code are: a lookup table
for the 'modify' command, part of the linked list of commands pertaining to 'stop', the 
floating point constant 10, and about half of a helper routine used by the corrupted floating 
point output routine.
    <P>In early June 2011, I was able to publish a "restored" EDU25 BASIC, which I called 
'edu25r'.  It is unlikely that my 'restored' version is identical to the original EDU25.
There just isn't enough information available to verify it.  Moreover, my version outputs 
all six digits, even for small integer values, where the original almost surely printed 
something without all the zeroes after the decimal point.
    <P>EDU25 is quite flexible about the terminal arrangement, allowing one to specify the 
type of terminal controller and the I/O addresses of the terminals.  In addition, there is 
a dialog which allows you to assign variable amounts of memory to particular users (but that 
is only useful on machines without enough memory to give everyone a whole 4K memory field).
The thing that isn't very flexible is that EDU25 is designed to run stand-alone, and uses 
it's own TC08 driver to save and load the users' BASIC programs.  Moreover, the system 
runs with interrupts enabled, so disabling interrupts to call the OS/8 drivers is not
really an option.
    <P>What I did about this (after some study), was to replace the Dectape driver, 
starting at DTAPE, with a simple driver for the ram-disk, which has the same block size
(128 words) as the Dectape.  I also patched some locations to contain the correct default 
values for the addresses of the SBC6120/IOB6120 serial ports.
This patched version I called 'edu25s'.
    <P>The correct sequence of answers to the initial dialog questions is illustrated here:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/sbc6120/edu25s-1.jpg">
    <IMG src="/pdp8/sbc6120/edu25s-1.jpg" width=320>
    <BR>Started up, waiting for answers.
  </A></TD>
  <TD>
    <A href="/pdp8/sbc6120/edu25s-2.jpg">
    <IMG src="/pdp8/sbc6120/edu25s-2.jpg" width=320>
    <BR>Answers for 5 users.
  </A></TD>
</TABLE>
    <P>You still get the warning about the "ILLEGAL OS/8 DEVICE" because I 
haven't bothered to write any code to reboot OS/8 (just press reset).  You 
should get the "READY" prompt on each active terminal.
    <P>To create programs in the system catalog, create text files (the ^Z is important!) 
on VMA0: with the extension ".E8".  Extensions ".E0" to ".E4" can also be used to create 
or retrieve files in the individual (to each terminal) catalogs.
    <P>I also spent some time later in June 2011 porting many of the "101
Computer Games".
    <P>All this material can be downloaded here:
<TABLE>
<TR><TD><A href=/pdp8/Basic/Edu25.zip>EDU25 BASIC for the SBC6120</A>
<TD>Source code, listing file, and BIN format.  You'll want to LOAD and 
"SAVE SYS:EDU25S;20200=1000" to create an executable.
<TR><TD><TR><TD><A href=/pdp8/Basic/EduSystemHandbookJan73.pdf>EduSystem Handbook</A>
<TD>Describes the dialects of BASIC and features of the various Edusystems.
<TR><TD><TR><TD><A href=/pdp8/Basic/games.zip>BASIC Games</A>
<TD>The games that seem to run in EDU25 BASIC.
<TR><TD><TR><TD><A href=/pdp8/Basic/sbcrw.zip>SBC6120 Ramdisk patch</A>
<TD>The source code for the Ramdisk routine that overlays the original Dectape routine.
<TR><TD><TR><TD><A href=/pdp8/Basic/TODO.zip>Unported BASIC Games</A>
<TD>The games that were not feasible to port.  Most are too large to fit and run in 
a single 4K field of memory, but a few use language features not found (nor easily emulated) 
in EDU25 BASIC.
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
