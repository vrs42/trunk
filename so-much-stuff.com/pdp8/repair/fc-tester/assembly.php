<?php
    $title = "Flip Chip Tester Assembly";
    include $_SERVER{'DOCUMENT_ROOT'} . '/pdp8/header.php';
?>
If you have received a flip-chip tester kit, you should have 
receieved these pictured items:
<TABLE>
<TR>
  <TD>
    <A href="p1070367.jpg">
    <IMG src="p1070367.jpg" width=320>
    <BR>A board Side
  </A></TD>
  <TD>
    <A href="p1070368.jpg">
    <IMG src="p1070368.jpg" width=320>
    <BR>Chips and Sockets
  </A></TD>
  <TD>
    <A href="p1070369.jpg">
    <IMG src="p1070369.jpg" width=320>
    <BR>Bag of Discretes
  </A></TD>
</TR><TR>
  <TD>
    <A href="p1070370.jpg">
    <IMG src="p1070370.jpg" width=320>
    <BR>Flip Chip Sockets
  </A></TD>
  <TD>
    <A href="p1070372.jpg">
    <IMG src="p1070372.jpg" width=320>
    <BR>Bill of Materials
  </A></TD>
</TR>
</TABLE>
<P>
In addition, to connect to an old-style PC parallel port, you will need
<TABLE>
<TR>
  <TD>
    <A href="p1070371.jpg">
    <IMG src="p1070371.jpg" width=320>
    <BR>A Male DB-25 Connector.
  </A></TD>
</TR>
</TABLE>
<P>
Regardless, you will additionally need basic tools like a 
soldering iron and (preferably leaded) rosin core solder,
a vice or press for IDC connections, a small screwdriver, 
and a flush cutter or at least a diagonal cutter.  A hobby 
knife and a few inches of thin wire will also be useful for 
the "blue wire" changes.
<P>
The other thing you will need is some ribbon cable, 25 pins 
or more, in a length that makes it convenient to connect the 
tester to your PC or whatever you will be running the software on.
<P>
<DL>
<DT>Caveats and Assembly Instructions:
<DD>
The next step is easier if you make your cable first.
If your ribbon has more than 26 wires, rip it down to 26 wires.
Then crimp on IDC connectors on each end, being sure to line up 
the red stripe with the arrows for pin 1.  If you plan to use a 
PC, use a male DB-25 connector for one end.  Otherwise, use the 26 
pin female IDC headers provided.  Regardless, when pressing on the 
26 pin female header(s), make sure that the cable exits the connector 
to the right, when looking at the socket holes.  Then, install the 
strain relief by folding the cable back to appear to exit from the left.
<P>
The connector "PC1" is swapped from the original on the board.  
The simplest work-around to make this compatible with standard 
ribbon cables is to install the connector header on the solder side. 
You should have received both right-angle and straight-pin 
versions of the 26 pin header to install for PC1.  I prefer the 
right-angle version, which conveniently makes the cable come out 
from under the left side of the tester.
<P>
When installing a right angle header for PC1, I recommend attaching
your ribbon cable before soldering the connector in.  This makes sure
you'll leave enough clearance to be able to insert and remove it later.
<P>
Once PC1 is installed, it is probably helpful to install the nylon 
screws and nuts.  The nuts haved tapered threads, so hold the nut 
against the bottom of the PCB and insert the screw through the board 
into the nut.  If it doesn't start easily, flip the nut over, hold
the other side to the board and try again.  (B>Do not</B> cross-thread 
them, as they are quite soft and can be destroyed fairly easily.
I place a screw in each corner, then the remaining screw in fromt of 
the flip-chip connectors (opposite where the LEDs will go).  This 
provides an inexpensive stand-off arrangement, with adequate support 
for module insertion.  (Later you can add an enclosure if desired.)
<P>
At this point, consult the Bill of Materials to confirm which resistor
values go where, and install the various resistors.  You can also 
install the bypass caps (but not the polarized electrolytic), bending 
the leads quite close to the capacitor bodies to get them to fit.
<P>
You should have a 100K resistor and a 3.3nF capacitor left over 
for later.
<P>
Before moving on to taller components, install the two rectifiers, D1 
and D2.  Note the orientations, which are not the same!
<P>
Working our way up, install the IC sockets.  The notches should point 
toward the side of the board which will get the switch and the LEDs.
<P>
The LEDs can be installed next.  A green LED for PWR, yellow for UUT_PWR, 
and the indicated colors for the others.  Be <B>sure</B> to get the 
flat spots on the side to line up with those on the silk-screen!
<P>
Install the headers.  The 2-row headers that form the jumper farm will 
need to be trimmed to the correct length (2x18).  For the single pins, 
the thing to do is to seperate each pin, and shove it into your IDC 
connector on your ribbon cable.  Use one edge, and fill in every third 
pin.  Now use the cable as an alignment jig to install a set of five pins!
(You may have a pin left over.)
<P>
Once you have the headers in place, you can populate the jumper farm, 
placing jumpers across each pair of pins.  You will likely have eight 
extra jumpers.
<P>
The electrolytic is next.  With the switch's future position to the front
left, the stripe with the "-" sign goes to the right!
<P>
The switch can go in next.  It isn't polarized, but you'll want to tack 
one pin, carefully holding the switch down to the PCB and vertical.  Only 
when you are satisfied with the position should you solder the other two 
posts, then go back to the first and finalize it.
<P>
The power connector, like (some of) the module connectors, has a vertical 
portion that provides keying, preventing you from installing the matching 
connector backwards.  Install the white power connector with it's vertical
tab matching the double line on the silk-screen.  You can leave the matching
connector plugged into it if desired.  (The black power can be discarded, 
unless you have something that would mate with it.)
<P>
The mating power connector is IDC.  You can press in hookup wire or 
other stranded wire from your power supply.  From the rear, there is 
an unused pin, ground, and +5V.  (The remaining pins are also unused.)
<P>
Lastly, the module connector(s).  If you are super lucky, you got the 
double height connector, and you can just solder it in, being <B>sure</B>
that the vertical keying tabs are on the left, as indicated by the silk 
screen.  More likely you got a pair of connectors.  If so, you will need
a double-height module.  Place the connectors onto the edge connectors 
of your double-height module, so that the module sets the spacing and 
orientation of the modules.  Insert the connectors into the PCB with the 
module still attached.  Otherwise, it is possible that they will end up 
skewed so that it won't be possible to insert double-height modules later.
Tack solder a single pin on one end of each connector.  Look at the top 
of the tester, and ensure that the connectors are straight and flush and 
the way you want them, because they will be impossible to move later.
<P>
When you are satisfied, solder the remaining pins of the module connector(s), 
then revisit and polish up the pins you used at first.
<P>
<DT>Modifications:
<DD>
There are at least three modification that will improve the function of
your tester.  (These are problems with my implementation, and do not 
reflect on Warren's original tester.)
<P>
Pin 23 of IC3 is connected to the power supply of the module being tested.
This isn't great, as nominally it is a 3V input, and the current available
at this pin actually drags the tester's supply voltage up noticeably.
<P>
To fix this, locate pin 23 of IC3, and the wider trace that runs from it 
to a nearby via.  Cut this trace, then install a 100K ohm resistor from 
the via to the pin (click photos to enlarge them):
<TABLE>
<TR>
  <TD>
    <A href="p1070373.jpg">
    <IMG src="p1070373.jpg" width=320>
    <BR>Overview
  </A></TD>
  <TD>
    <A href="p1070374.jpg">
    <IMG src="p1070374.jpg" width=320>
    <BR>Close-up
  </A></TD>
  <TD>
    <A href="p1070376.jpg">
    <IMG src="p1070376.jpg" width=320>
    <BR>Repaired
  </A></TD>
</TR>
</TABLE>
<P>
The third picture above also shows the placement of a 3.3nF capacitor 
between RESET-N at pin 18 of IC5 and GND at pin 10.  Install this 
capacitor to fix a problem where tester GND moves relative to RESET-N, 
causing the tester to intermittently reset when used with cables longer 
than a foot or so.
<P>
Third, there are two posts at the front of the tester labeled LOADHI1 
and LOADHI3, which are meant to provide one or three loads pulling high, 
respectively.  The issue is that these loads are not switched with the 
UUT_PWR switch, making it unwise to have them in use when inserting or 
removing a module for testing.  To make them switch properly, make the 
cut and install a blue wire to the via as shown.  The blue wire has been
left overlong to avoid the mounting hole.  It can also be secured with
crazy glue or blue painter's tape to keep it from snagging things if
desired.
<TABLE>
<TR>
  <TD>
    <A href="p1070377.jpg">
    <IMG src="p1070377.jpg" width=320>
    <BR>Repaired
  </A></TD>
</TR>
</TABLE>
</DL>

<?php include $_SERVER{'DOCUMENT_ROOT'} . '/pdp8/footer.php'; ?>
