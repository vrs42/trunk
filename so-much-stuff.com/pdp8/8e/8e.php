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
for it, though, and now I have my other 8/E in the double rack where it used 
to be.
    <P>Here's a couple of pictures of the result:
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
    <P>This computer works (though not all the peripherals do)!  I use it to try out my 
prototype hardware and stuff.
    <P>On the left is the TU10, which connects to the 8/E with a TM8E (which doesn't 
seem to work).  The relay rack below that has been removed -- I plan to install a 
couple of RK05 drives (I have an RK05F and an RK05J), which will connect with an RK8E 
(which has a simple problem I think I can fix).
    <P>On the top right are the TU56 DECTape drives, in unknown condition.  (So far, I 
have replaced their aging electrolytic motor run capacitors.)  These connect to the 8/E 
with a TD8E controller card.
    <P>Below that are my DSD410 dual floppy drives, which mostly work, except the internal 
mode DIP switches that set the mode have become intermittent.  That makes the drives do 
random maintenance functions at inopportune moments, so I don't use them much.  (I once 
lost a system disk when the drive decided to do a read-write test on the media.)  They 
connect to the 8/E with a special DSD controller card.
    <P>Next down is my PC04 paper tape reader/punch.  It connects to the 8/E with a PC8E 
card.  It's in unknown condition -- I've never powered it up!
    <P>Next is the 8/E CPU, and below that is an expansion chassis (which has been 
removed since the picture was taken).
    <P>Not shown is my RX8E and RX02 drives, which are racked with the 8/A, but are 
actually being used as a boot device for the 8/E.
</TR>
</TD><TD>
<TODO: Rename pictures of first 8/a>
<TODO: Get pictures of second 8/e>
</TD>
</TR>
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
