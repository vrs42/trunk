<?php
    $title = "Flip Chip Tester(s)";
    include $_SERVER{'DOCUMENT_ROOT'} . '/pdp8/header.php';
?>
Over the years, there has been an ongoing interest in a way 
to test the flip-chip modules from which various DEC gear, 
including several models of PDP-8, are made.  Here's a sort 
of reverse timeline of related projects that I have worked 
on:
<DL>
<DT>RasPi 0W Variant of Stearn's Tester
<DD>
I did some additional work to connect Warren's tester to a 
Raspberry Pi 0W, which fits in a nice box and connects via 
a wired interface or SSH to the user's console.  The page 
describing the changes is <A href=fc-tester/pi-tester.php>here</A>.
<P>
<DT>Windows Variant of Stearn's Tester
<DD>
Michael Thompson of 
<A href="http://www.ricomputermuseum.org/Home/equipment/pdp-8-i/dec-pdp-8i-restoration-blog">RICM</A> 
has done some nice work towards getting 
Warren's tester to work connected directly to a modern 
Windows desktop.  His solution uses an FTDi USB to SPI 
cable, and his source, etc. can be found
<A href=http://svn.so-much-stuff.com/svn/trunk/pdp8/michaelt/Warrens_Flipchip_Tester/>here</A>.
<P>
<DT>Warren Stearn's Tester
<DD>
Some years later (2012?), Warren Stearns developed a flip-chip
module tester, and began travelling the United States, testing
and repairing modules as part of restoration projects, notably 
for
<A href="http://www.ricomputermuseum.org/Home/equipment/pdp-8-i/dec-pdp-8i-restoration-blog">RICM</A> and most recently 
<A href="http://umdpdp12.blogspot.com/">UMD</A>.
I made an effort in 2014 to capture Warren's design, and 
here are photos of his prototype from that time:
<TABLE>
<TR>
  <TD>
    <A href="fc-tester/Warren's_FlipChip_Tester_Top.jpg">
    <IMG src="fc-tester/Warren's_FlipChip_Tester_Top.jpg" width=320>
    <BR>Component Side
  </A></TD>
  <TD>
    <A href="fc-tester/Warren's_FlipChip_Tester_Bottom.jpg">
    <IMG src="fc-tester/Warren's_FlipChip_Tester_Bottom.jpg" width=320>
    <BR>Wiring Side
  </A></TD>
</TR>
</TABLE>
<P>Unfortunately, Warren passed away suddenly in 2017.  His loss was 
deeply felt, and there is also a strong feeling in the community that 
it is important to continue his efforts.
<P>
In early 2018 Doug Ingraham made available the software (and module 
test vectors!) that Warren had used to run his tester.  I decided to
produce a PCB of my attempt to capture the hardware of the design. 
Along with the software from Doug, it was hoped that we could commemorate
Warren's work and make testers available for those who need them.
<P>
Warren had added headers for various supply voltages to his prototype
over the years, and my drawings differ in the orientation of some
components, a couple of blue wires, but this effort has been largely
successful.  Working testers have been created!
<P>
Tester board designs can be found 
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/Stearns%20Tester/">here</A>,
and software 
<A href="http://svn.so-much-stuff.com/svn/trunk/pdp8/warren/">here</A>.
<P>
Blue wire information and important assembly tips and hints for the kits
are available <A href="fc-tester/assembly.php">here</A>.
<DT>6809 Based Tester
<DD>
In 2006, Henk Gooijen and I collaborated on a tester, which 
is beautifully documented on
<A href="http://www.pdp-11.nl/">Henk's site</A>
<A href="http://www.pdp-11.nl/homebrew/flipchip/flipchipstartpage.html">here</A>.
<P>
This tester, like most efforts so far, focuses on positive 
logic modules, and lacks capabilities for testing negative 
logic or analog features when they occur in flip-chip modules.
<P>
Unfortunately, the project languished for many years, lacking 
for software to conveniently run it, and test vectors for 
complex modules.
</DL>

<?php include $_SERVER{'DOCUMENT_ROOT'} . '/pdp8/footer.php'; ?>
