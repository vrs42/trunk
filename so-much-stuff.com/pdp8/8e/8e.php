<?php
  $title = "PDP-8/E Computers";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <DIV>I used to have two PDP-8/E computers, but I traded one of them for 
the BM8L (see <A href=/pdp8/8L/8L.shtml>8L</A>).  I kept all the peripherals 
for it, though.
    <P>Here are a couple of pictures of what that used to look like:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/8e/pdp8e-1.jpg">
    <IMG src="/pdp8/8e/pdp8e-1.jpg" width=320>
    <BR>My first PDP-8/E, purchased off eBay, in the rack with peripherals from the second.
  </A></TD>
  <TD>
    <A href="/pdp8/8e/pdp8e-2.jpg">
    <IMG src="/pdp8/8e/pdp8e-2.jpg" width=320>
    <BR>
  </A></TD>
</TABLE>
    <P>On the left was the TU10, which connects to the 8/E with a TM8E (which doesn't 
seem to work).  A relay rack below that has been removed.
    <P>On the top right were the TU56 DECTape drives, in unknown condition.  (So far, I 
have replaced their aging electrolytic motor run capacitors.)  These connect to the 8/E 
with a TD8E controller card.
    <P>Below that were my DSD410 dual floppy drives, which mostly work, except the internal 
mode DIP switches that set the mode have become intermittent.  That makes the drives do 
random maintenance functions at inopportune moments, so I don't use them much.  (I once 
lost a system disk when the drive decided to do a read-write test on the media.)  They 
connect to the 8/E with a special DSD controller card.
    <P>Next down was my PC04 paper tape reader/punch.  It connects to the 8/E with a PC8E 
card.  It's in unknown condition -- I've never powered it up!
    <P>Next was the 8/E CPU, and below that was an expansion chassis.
    <P>Not shown is my RX8E and RX02 drives, which was racked with the 8/A, but was 
actually being used as a boot device for the 8/E.
    <P>My other 8/E worked, and I was using it to try out my prototype hardware and stuff.
Then I plugged in an experimental Omnibus memory board that I had wire-wrapped up, and 
it quit working.  Hopefully it will turn out to be just a breaker or something simple.
    <P>Here's a couple of pictures of it:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/8e/pdp8e.jpg">
    <IMG src="/pdp8/8e/pdp8e.jpg" width=320>
    <BR>My second (now only) PDP-8/E.
  </A></TD>
</TABLE>
    <P>The peripherals that used to be on the other 8/E are now split between this 8/E,
the 8/A, and the 8/i.

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
