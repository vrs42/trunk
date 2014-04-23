<?php
  $title = "32K Memory for Omnibus";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <P>Here are some assembly hints for the Omnibus memory:
    <P>
<TABLE>
<P><TR>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040579.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040579.jpg" width=320>
    <P>I use eutectic (63/37) no-clean rosin core solder in the 
0.031 inch (0.8mm) thickness, and a fairly hot iron (325 degrees), 
for an easier soldering experience.  The boards come in a tin-lead 
finish, so soldering this is about as easy as soldering gets.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040561.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040561.jpg" width=320>
    <P>Here are the parts kits, all sitting in a box.  You should 
get one snack-size ziploc with the discretes, one anti-static bag 
with chips and sockets, and a board, for each kit you have ordered.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040562.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040562.jpg" width=320>
    <P>Here are the boards in their shrink-wrap, as received 
from the board shop.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040566.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040566.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040564.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040564.jpg" width=320>
    <P>The front and back sides of the boards.  The front side 
is the one with the components marked, and also is the side from 
which the components are inserted.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040569.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040569.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040570.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040570.jpg" width=320>
    <P>These are pictures of a defect in the keyways of the boards, 
which will hopefully be corrected before you receive them.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040575.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040575.jpg" width=320>
    <P>Start out by inserting the largest IC sockets.  Pin one goes 
on the end with a notch, so point the notch away from the edge connectors, 
as shown.  Flip the board over and tack-solder diagonally opposite sides 
of the socket.  Then pick up the board, and while pressing down gently on 
the socket, reheat the solder so that it is tacked as far into the board 
as it wants to go. (Don't burn your fingers!)  Then finish soldering the 
socket into place.
    <P>One note about these sockets.  They are machine pin sockets, but 
the contacts aren't gold -- they are tin/lead.  I think they are fine, 
but if you really wanted the gold ones, you'll have to provide them 
yourself (they are about twice the price of these).
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040576.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040576.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040577.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040577.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040578.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040578.jpg" width=320>
    <P>Work your way through the successively smaller IC sockets.
Working from large to small ensures you don't solder (for instance) 
a 14 pin socket into a place where the 16 pin socket should be.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040580.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040580.jpg" width=320>
    <P>Solder in the DIP switch.  The orientation shown should correctly 
number the banks of memory, so that switch one controls the first bank 
(00000-07777), etc.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040583.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040583.jpg" width=320>
    <P>Solder in electrolytic.  This is a polarized component, so be 
sure that the "-" end is away from the edge connector, and the ridged 
end is toward them, as shown.  Bend the long leads slightly after inserting, 
so that the part doesn't fall back out.  Trim the leads after soldering.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040584.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040584.jpg" width=320>
    <P>The Schottky diodes are also polarized components.  Solder 
them with the black side (cathode) to the left, as shown.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040585.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040585.jpg" width=320>
    <P>At this point I went ahead and soldered in the non-polarized 
capacitors, paying attention to which value goes in which spot.  I like 
to orient the markings on the components to match the markings on the 
silkscreen.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040586.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040586.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040587.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040587.jpg" width=320>
    <P>The 10K (orange stripe) resistors go on the left, and the 100K 
(yellow stripe) resistors go on the right.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040588.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040588.jpg" width=320>
    <P>The battery holder goes as shown.  Be sure to get it 
flat to the board, and yes, the "+" lead hole is oversized.
Since you'll need to use more solder, you might also need 
a little more heating time to make sure it doesn't end up a 
cold solder joint.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040589.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040589.jpg" width=320>
    <P>It wasn't really necessary to delay putting in the transistor, 
but I wanted to double check it's orientation.  It looks like the way 
it is drawn in the silkscreen is correct for the transistor provided.
Bend the center lead back gently to get it into the hole.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040590.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040590.jpg" width=320>
    <P>That's basically it for the soldering.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040591.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040591.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040592.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040592.jpg" width=320>
    <P>Insert the various chips.  Be sure to get the right chips 
into the right sockets, with pin one pointing away from the edge 
connectors.  The chips are a little static sensitive (it shortens 
the life of the chips), so don't work in an environment where 
static electricity can build up, and try to minimize handling.
    <P>To get the chips in, place the chip on it's side on the 
board, and rock it slightly, bending all the pins at once until 
they point more or less straight down from the chip body.  Place 
the chip in it's socket (pin 1 away from the edge connectors!), 
and make sure then thin part of each pin is started in the socket
hole before applying pressure.  When everything is looking good, 
press firmly on the chip body to press the pins into the grippers 
inside the holes.  You should be able to tell when it is seated.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040593.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040593.jpg" width=320>
    <P>Lastly, insert the battery from the left, writing side up, 
and press down until the plastic tab on the left clicks over the 
top of the battery.
  </A></TD>
</TABLE><P><TABLE>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040594.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040594.jpg" width=320>
    <P>You've done it!
  </A></TD>
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
