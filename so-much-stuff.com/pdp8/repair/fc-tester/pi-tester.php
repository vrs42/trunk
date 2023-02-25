<?php
    $title = "RasPi 0W Tester";
    include $_SERVER['DOCUMENT_ROOT'] . '/pdp8/header.php';
?>
This page describes the changes made to <A>Warren's tester</A>
to interface it to the Raspberry Pi 0W.  (I chose the 0W for 
it's low cost, fast access to the GPIO pins, and built in 
wireless.)
<P>
This discussion assumes you've assembled the 
<A href=assembly.php>DOS tester</A> as a starting 
point (with the exception that there is no point 
in assembling the LPT: port header and cable, nor installing
the power connector).
<TABLE>
<TR>
  <TD>
    <A href="20181130_154030.jpg">
    <IMG src="20181130_154030.jpg" width=320>
    <BR>Assembled Pi Tester
  </A></TD>
  <TD>
    <A href="IMG_20191216_163800413.jpg">
    <IMG src="IMG_20191216_163800413.jpg" width=320>
    <BR>IC6 Jumpering
  </A></TD>
</TR>
</TABLE>
<P>I have prepared 
<A href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/Stearns%20Tester/raspi.pdf>this document</A>
to help document the changes described here.
<P>
First thing, remove IC6 and install jumpers in it's place,
as shown above.
<P>
Acquire some 
<A href=https://www.adafruit.com/product/3144>shrouds</A>, 
<A href=https://www.adafruit.com/product/1951>a cable</A>,
the resistors and capacitor, 2x13 and 2x26 right angle 
headers, and a <A href=https://www.adafruit.com/product/3410>
Raspi 0W basic starter with power supply and cables</A>.  
(I used adafruit.com, as they seem to cater nicely to this
sort of thing.)  You want to buy a Pi <I>without</I> a
pre-installed header, if you intend to fit the result in 
the box!
<P>
First, remove all the 1x1 shrouds from the cable.  This is 
tedious, but nearly as bad as trying to make the result with 
wires and a crimper!  You will need to deflect the plastic 
tab that holds the pin socket in, then pull out the pin 
socket.
<P>
Next, install the pin sockets as described in the above 
document.  You'll need to insert each pin in the correct 
location and with the correct orientation in the shroud 
until the plastic tab clicks to lock it in place.
<P>
The result should resemble the one pictured here:
<TABLE>
<TR>
  <TD>
    <A href="20180920_110459.jpg">
    <IMG src="20180920_110459.jpg" width=320>
    <BR>Pi Adapter Cable
  </A></TD>
</TR>
</TABLE>
<P>
Install the 2x20 right angle header in the Pi 0W, with 
the pins facing off the board.  (This is why you wanted 
a Pi without a pre-installed header.)
<TABLE>
<TR>
  <TD>
    <A href="IMG_20191216_163905887.jpg">
    <IMG src="IMG_20191216_163905887.jpg" width=320>
    <BR>Trimmed IC6 pins
  </A></TD>
  <TD>
    <A href="IMG_20191216_164412475.jpg">
    <IMG src="IMG_20191216_164412475.jpg" width=320>
    <BR>Tester Cable Connection
  </A></TD>
</TR>
</TABLE>
<P>
Click on the "Trimmed IC6 Pins" photo above, and flush-trim
the pins of the side of the IC6 socket nearest the header
position, as shown.
<P>
Fit the cable's 2x13 shroud over the 2x13 right angle 
header, then install the header in the tester, facing 
<I>downward</I> and <I>inward</I>.  The result should 
be angled slightly, as shown in the close-up at the 
right above.  This is why you didn't want to bother
installing the header when you assembled the tester
board!
<TABLE>
<TR>
  <TD>
    <A href="IMG_20191216_163905887.jpg">
    <IMG src="IMG_20191216_163905887.jpg" width=320>
    <BR>Inrush Limiter
  </A></TD>
  <TD>
    <A href="IMG_20191216_163840396.jpg">
    <IMG src="IMG_20191216_163840396.jpg" width=320>
    <BR>Inrush Limiter
  </A></TD>
</TR>
</TABLE>
<P>
Next, install the resistors and capacitor needed to 
run the tester safely off of the RasPi's supply brick.
(These form an inrush limiter, keeping the flip chip 
from sucking down all the available +5V when you turn 
it on.)  The components attach to the tester PCB using 
their leads, which can be trimmed after installation.
<P>
You'll need to install a bootable SD card in the Pi 0W.
I have images for that, but they are quite large.  Let 
me know if you need them, or you can craft your own.
<TABLE>
<TR>
  <TD>
    <A href="IMG_20191216_164007906.jpg">
    <IMG src="IMG_20191216_164007906.jpg" width=320>
    <BR>Pi 0W in the box
  </A></TD>
  <TD>
    <A href="IMG_20191216_164044000.jpg">
    <IMG src="IMG_20191216_164044000.jpg" width=320>
    <BR>Pi 0W in the box
  </A></TD>
</TR>
</TABLE>
<P>
Install the Pi 0W into the box using #4 3/8" self 
tapping screws or equivalent.  Be sure the ports 
face out the slot in the side of the box!
Attach the cable you made to the Pi.  Double check 
that pin 1 lines up with where it should, on the 
Pi side and also on the tester side.
<P>
There will be limited range of movement of the tester
PCB, but you should be able to attach it to the box
using #6 3/8" self tapping screws or the equivalent.
<P>
If you are using your own fresh install image for the 
Pi, use the cables which came with your starter kit
to install the software, set up SSH access, etc. 
You will also probably want to use apt-get or
equivalent to install "subversion", and set up user
"tester" as having access to GPIO and network setup
groups.  The file
<A href=http://svn.so-much-stuff.com/svn/trunk/pdp8/warren/RasPi/Pi-Setup.txt>Pi-Setup.txt</A>
has tips for this.
<P>
Even if you are using my images, you will likely need
to set up the wireless SSID and password using the 
starter kit's cables.
<P>
Using the cables as above or using SSH, log in as 
"tester" (or "pi", if you couldn't be bothered).
My images use password "tester123".  Anyway, 
issue one of these commands:
<UL style="list-style-type:none">
<LI>
svn co http://svn.so-much-stuff.com/svn/trunk/pdp8/warren/RasPi/
<LI>
<P>
<LI>
svn update .
</UL>
depending on whether directory "src" exists. 
(You may also get away with using the 
<A href=http://svn.so-much-stuff.com/svn/trunk/pdp8/warren/RasPi/tarball.gz>tarball</A>
to create these files.)
<P>
Now do "cd src", "make", and "./tester" to get the 
tester software running.  The tests themselves live 
in ~/TESTS.
<P>

<?php include $_SERVER['DOCUMENT_ROOT'] . '/pdp8/footer.php'; ?>
