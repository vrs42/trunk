<?php
  $title = "DF32 Emulation";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <DIV>I this Posibus DF32 emulator, designed and built by Charles Morris.
    <P>Here's a picture of it:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/df32emul/df32emul.jpg">
    <IMG src="/pdp8/df32emul/df32emul.jpg" width=320>
    <BR>My DF32 emulator.
  </A></TD>
</TABLE>
    <P>It is pictured above one of my PDP-8/L, and below it's expansion chassis.
    <P>A DF32 setup normally consisted of a DF32 controller (Negibus or Posibus), 
and from 1 to 8 DS32 disk drives.  Each of the drives held a whopping 32K (yes, K) 
words, for a maximum configuration of 128K words.  They were fixed head disks, 
however, which made them quite fast (no seek time).
    <P>The large switch is for power, and the smaller switches write protect the 
individual "drives".  This version uses NVRAM (with a 10 year life) to hold the 
data, and TTL to implement the controller.  The whole works is mounted in a nice 
1U enclosure.

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
