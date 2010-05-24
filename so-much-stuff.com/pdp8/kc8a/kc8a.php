<?php
  $title = "KC8A Programmer's Panel";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P>A colleague of mine bought a PDP-8/A, and didn't have a programmer's panel 
for it.  The front panel on the 8/A comes in two parts.  All of them have a 
"Limited Function" panel, which has a couple of switches for power and bootstrap.
The "Programmer's Panel" adds a keypad and an 7-segment LED octal display.
Programmer's panels appear from time to time on eBay, but rather than wait for 
one to appear, we decided to build one.
    <P>Working from DEC's drawings, he and I drew up a pair of PCB's in Eagle 
to mimic the originals from DEC.  As always, issues of authenticity will come 
up, and since nothing like the original keypads seemed to be available, we 
used a bunch of fairly ordinary tactile switches and their optional keycaps.
    <P>Here are some photos of the boards as they came back from the fab:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/kc8a/bareuncut.jpg">
    <IMG src="/pdp8/kc8a/bareuncut.jpg" width=320>
    <BR>KC8A boards as they came from the fab.
  </A></TD>
  <TD>
    <A href="/pdp8/kc8a/barecut.jpg">
    <IMG src="/pdp8/kc8a/barecut.jpg" width=320>
    <BR>KC8A boards after a trip through the bandsaw to seperate them.
  </A></TD>
</TABLE>
    <P>The original panels are constructed on a pair of PCB's, mounted with 
spacers, and their solder sides facing each other.  Our replacement follows 
the original as closely as we could, and here are some pictures of the 
assembled sandwich:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/kc8a/sandwich.jpg">
    <IMG src="/pdp8/kc8a/sandwich.jpg" width=320>
    <BR>The boards mount back to back.
  </A></TD>
  <TD>
    <A href="/pdp8/kc8a/board1.jpg">
    <IMG src="/pdp8/kc8a/board1.jpg" width=320>
    <BR>Here's the side that faces out.
  </A></TD>
  <TD>
    <A href="/pdp8/kc8a/board2.jpg">
    <IMG src="/pdp8/kc8a/board2.jpg" width=320>
    <BR>Here's the side that faces inward, toward the backplane.
  </A></TD>
</TABLE>
    <P>That's as far as I took mine, since I have an original programmer's 
panel, but the other prototype did get debugged.  There were some blue wires 
needed.  The original DEC drawings have nomenclature differences between the 
drawings for the two boards!  As a consequence, a few signals got connected 
wrong in the PCB.  Also, the PCB has a totally inadequate ground plane (as 
does the original DEC design).  So his prototype also has some extra ground 
wires running around the board in a grid design.  If I were to make more of 
these, I'd do a polygon fill for the ground plane, and fix up those blue 
wire problems in the etch.
    <P>There was also a panel design using FrontPanel Express' software, and 
a bunch of time and effort was spent being as sure as possible that the PCB's 
parts placement would line up with the front panel artwork, and actually fit 
in the PDP-8/A properly.  Here are some pictures of my fiddling with mock-ups:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/kc8a/mockup.jpg">
    <IMG src="/pdp8/kc8a/mockup.jpg" width=320>
    <BR>An exterior view of the mockup.
  </A></TD>
</TABLE>
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/kc8a/interiorfit.jpg">
    <IMG src="/pdp8/kc8a/interiorfit.jpg" width=320>
    <BR>Here's the inside, with the "boards" attached.
  </A></TD>
  <TD>
    <A href="/pdp8/kc8a/fitright.jpg">
    <IMG src="/pdp8/kc8a/fitright.jpg" width=320>
    <BR>Checking the fit on the right.
  </A></TD>
  <TD>
    <A href="/pdp8/kc8a/fitleft.jpg">
    <IMG src="/pdp8/kc8a/fitleft.jpg" width=320>
    <BR>Checking the fit on the left.
  </A></TD>
</TABLE>
</TD>
</TR>
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
