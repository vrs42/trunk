<?php
  $title = "32K Memory + Bootstraps for Omnibus";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>
<TABLE>
<P>This page describes a replacement for core memory, which also provides
bootstrap support for a
<A href=https://github.com/Roland-Huisman/M847-extended-version-V1.1/blob/master/M847%20programs.docx?raw=true>variety of devices</A>.
The memory provided is 32K, switchable to enable or disable each 4K
memory bank, allowing you also use any vintage memory you might have.
<P>The memory implementation is based on a design by
<A href=http://tronola.com/>Stephen</A> 
<A href=http://www.tronola.com/html/ram_for_pdp-8e.html>Lafferty</A>.
<P>The bootstrap implementation is based on the work of
<A href=http://www.technischmuseum.nl/>Roland</A> 
<A href=https://github.com/Roland-Huisman>Huisman</A>.
<P>While supplies last, you can obtain a kit by clicking
<A href=http://tinyurl.com/stuffmail>here</A>,
and letting me know of your interest.
I'm asking $95 plus shipping (which is typically another $15 within the USA).
<P>The older 32K Memory card, without bootstrap circuitry, is described
<A HREF=32KOmnibus-.php>here</A>.
<P>Some of you have asked, so
<A HREF=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/32k-Omnibus/>here</A>
is a shortcut to the CAD drawings.
Of these, the "Roland+mem1" drawings are the board as sent off for
fabrication.
<DL>
<DT><A href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/32k-Omnibus/Roland+mem1.brd>Roland+mem1.brd</A>
<DD>is the Eagle board drawing.
<DT><A href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/32k-Omnibus/Roland+mem1.sch>Roland+mem1.sch</A>
<DD>is the Eagle schematic.  (The action is on sheets 2 and 3.)
<DT><A href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/32k-Omnibus/Roland+mem1BRD.pdf>Roland+mem1BRD.pdf</A>
<DD>is the board drawing, as a PDF.
<DT><A href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/32k-Omnibus/Roland+mem1SCH.pdf>Roland+mem1SCH.pdf</A>
<DD>is the schematic the board, as a PDF (you want pages 2 and 3).
</DL>
</TABLE>
<P>Here are some assembly hints for the Omnibus memory.
<TABLE>
<TR>
<P><TR>
<OL>
  <LI>
    <A href="/pdp8/32KOmnibus/boot+mem/boot+mem.jpg">
    <IMG src="/pdp8/32KOmnibus/boot+mem/boot+mem.jpg" width=100%></A>
    <P>Here is a photo of an assembled board, for reference below.  (You can click on the photo 
to get a bigger version.)
    <P>You should receive a 
snack size ziploc with discretes, one anti-static bag with chips and
sockets, and a board, for each kit you have ordered.
You should also get a printed sheet with the Bill of Materials itemizing 
the parts, and possibly release notes if there are issues discovered
before your board was shipped.
    <P>I use eutectic (63/37) no-clean rosin core solder in the 
0.031 inch (0.8mm) thickness, and a fairly hot iron (325 degrees), 
for an easier soldering experience.  The boards come in a tin-lead 
finish, so soldering this is about as easy as soldering gets.
    <P>The front side is the one with the components marked, and
also is the side from which the components are inserted.
</LI><LI>
    <P>Start out by inserting the IC sockets.  Pin one goes 
on the end with a notch, so point the notch TOWARD the edge connectors! 
(Yes, this is the opposite of the previous memory board.)
Flip the board over and tack-solder diagonally opposite sides 
of the socket.  Then pick up the board, and while pressing down gently on 
the socket, reheat the solder so that it is tacked as far into the board 
as it wants to go. (Don't burn your fingers!)  Then finish soldering the 
socket into place.
    <P>You should receive wide sockets for the memory chips, and a narrow 
socket for the ATMEL processor, and possibly another for the I/O expander
as well.
    <P>Your sockets may have the chips in them.  If you leave them there, 
you can skip the "insert chips into sockets" step later.
    <P>One note about these sockets.  They are machine pin sockets, but 
the contacts aren't gold -- they are tin/lead.  I think they are fine, 
but if you really wanted the gold ones, you'll have to provide them 
yourself (they are about twice the price of these).
</LI><LI>
    <P>Sockets are not provided for the inexpensive components or
those unlikely to be removed from the board.  In the unlikely event 
those need repair, the safest thing is to chop them out, clean the holes
one at a time, and solder in a new part.  On the other hand, that does 
mean you have to get pin one aimed at the gold edge connectors, and all
the pins in their holes, before soldering them!
    <P>Work your way through the other chips, being sure you have the 
right part with the right orientation.  Tack opposite corners, then 
press and reheat, as you did for the sockets.
</LI><LI>
    <P>Solder in the pushbutton switch, SW2.  The orientation is important!
If you squint, you can make numerals etched into the metal.  These
markings should match the orientation of the silk-screen "SW2".  (It is
acceptable to install it rotated 180 degrees, as I have done, but NOT to 
rotate it 90 degrees!)  If you are in doubt, make sure that the left and 
right sides are shorted only when the button is pressed.
</LI><LI>
    <P>Solder in the DIP switches.  The orientation shown will correctly 
make the "disabled" position to the left of the larger one.
    <P>The smaller DIP switch is perhaps arguably installed 180 degrees 
from the optimal orientation in my photo.  The configuration shown should be
read as choosing the bootstrap numbered "16" in octal.  Either way, "ON"
will represent a "1" in the binary bootstrap number, and the MSB is
furthest from the edge connectors.
</LI><LI>
    <P>Solder in the electrolytic.  This is a polarized component, so be 
sure that the "-" end is to the left, and the ridged end is to the right,
as shown.  Bend the long leads slightly after inserting, 
so that the part doesn't fall back out.  Trim the leads after soldering.
(You will want to use a similar technique to hold in the remaining discretes
while you install them.)
</LI>
  <LI>
    <P>The Schottky diodes are also polarized components.  Solder them
near the memory chip sockets, with the black side (cathode) matching the
silk-screen stripe, as shown.
  <LI>
    <P>The non-Schottky diode is also polarized.  Solder it near the 
ATMEL processor
</LI><LI>
    <P>The 10K SIP resistor pack must also be installed with the correct 
orientation.  Pin 1 has a dot on the left if you are reading the markings,
and as with the chips, pin 1 goes closest to the edge connectors.
</LI><LI>
    <P>At this point I went ahead and soldered in the non-polarized 
capacitors, paying attention to which value goes in which spot.  I like 
to orient the markings on the components to match the markings on the 
silkscreen.
</LI><LI>
    <P>Proceed with the discrete resistors, being sure to get the right 
values in the right spots.
</LI><LI>
    <P>The battery holder goes as shown.
Be sure to get it flat to the board, and yes, the "+" lead hole is oversized.
You might also need a little more heating time to make sure these don't end
up with cold solder joints.  Be sure to trim the "+" lead flush when
you are done.
</LI><LI>
    <P>It wasn't really necessary to delay putting in the transistors, 
but let's do them now.  Install the 2N3904 at Q3 to match the silkscreen.
Bend the center lead back gently to get it into the hole, and be sure the 
flat side lines up with the silkscreen.
    <P>Q1 and Q2 must NOT be installed unless the rest of the boot loader
part is populated.  (Your PDP-8 will be stuck in RESET if you do.)  The 
silkscreen doesn't match the package quite as well, but bend the 
center lead out toward the round side, away from the flat side, to 
form a "V" shape.  Then insert the leads in the holes provided.
</LI><LI>
    <P>The one wonky bit is the crystal.  I had originally planned a larger 
crystal, resting on it's side.  We've got low profile crystals, but there is 
an interference fit with R18.  Just mount the crystal on it's side, as if
it were bigger.
</LI><LI>
    <P>That's basically it for the soldering.
    <P>Insert the socketed chips, unless you left them in their sockets 
wile soldering.  Be sure to get pin one pointing toward
the edge connectors.  The chips are a little static sensitive (it shortens 
the life of the chips), so don't work in an environment where 
static electricity can build up, and try to minimize handling.
    <P>To get the chips in, place the chip on it's side on the 
board, and rock it slightly, bending all the pins at once until 
they point more or less straight down from the chip body.  Place 
the chip in it's socket (pin 1 toward the edge connectors!), 
and make sure then thin part of each pin is started in the socket
hole before applying pressure.  When everything is looking good, 
press firmly on the chip body to press the pins into the grippers 
inside the holes.  You should be able to tell when it is seated.
</LI><LI>
    <P>Insert the battery from the left, writing side up, 
and press down until the plastic tab on the left clicks over the 
top of the battery.
</LI><LI>
    <P>Lastly, you may wish to cover the exposed "+" battery
wiring at the battery terminals and at the diodes with a couple
of layers of non-conductive tape.  This limits the likelyhood
of shorting the battery when setting the board down.  If you
want to be completely paranoid about it, cover pin 28 of IC3
and IC4, too.  (Sorry, no handles come with your kit.)
    <P>You've done it!
</LI>
</TR>
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
