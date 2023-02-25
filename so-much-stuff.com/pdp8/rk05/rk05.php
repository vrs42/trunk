<?php
  $title = "RK05 Disks";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <P>Here are a couple of my RK05 drives, an RK05J and an RK05F:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/rk05/rk05.jpg">
    <IMG src="/pdp8/rk05/rk05.jpg" width=320>
    <BR>My RK05 drives, rack mounted.
  </A></TD>
</TABLE>
    <P>I actually have another drive in rougher shape (parts drive), not pictured.
    <P>The RK05F drive has twice the capacity, but the media is not removable.  Hence
the "0/1" designation in the picture.  (Sometime I should probably get around to changing 
drive "3" to be drive "2".)
    <P>Each RK05 unit number corresponds to 1.6Mwords of storage, organized as 203 
tracks, 2 surfaces, 16 sectors/track, and a sector size of 256 12-bit words.  The 
transfer rate is about 20% faster than a floppy disk, at 102Kwords per second, and each unit
holds roughly 41% more than a typical PC diskette.  The average access time was about 
11 percent faster than a floppy.
    <P>For it's time, it was hot stuff -- the equipment 
pictured sold new for about $13,000 (plus installation).
    <P>My hope is to interface these through my RK8F controller and DW8E to my large 
PDP-8/i system.

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
