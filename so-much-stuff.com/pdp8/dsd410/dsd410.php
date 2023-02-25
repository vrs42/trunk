<?php
  $title = "DSD410 Floppy";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <DIV>I have a DSD410 dual 8" floppy drive and the Omnibus I/O controller for it.
    <P>Here's a picture:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/dsd410/dsd410.jpg">
    <IMG src="/pdp8/dsd410/dsd410.jpg" width=320>
    <BR>My DSD410 floppy drives.
  </A></TD>
</TABLE>
    <P>I plan to hook this to my large 8/i system by using a DW8E to connect the Omnibus 
controller to the Posibus on the 8/i.
    <P>The DSD410 mostly works, but the internal mode DIP switches that set the mode have 
become intermittent. That makes the drives do random maintenance functions at inopportune 
moments, so I don't use them much. (I once lost a system disk when the drive decided to 
do a read-write test on the media.)

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
