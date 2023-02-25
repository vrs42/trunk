<?php
  $title = "RX08 Controller";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <P>I have done some work on a Posibus interface to the RX01/RX02
floppy drives.
    <P>Here are a couple of pictures of it:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/rx08/rx08-1.jpg">
    <IMG src="/pdp8/rx08/rx08-1.jpg" width=320>
    <BR>The board assembled.
  </A></TD>
  <TD>
    <A href="/pdp8/rx08/rx08-2.jpg">
    <IMG src="/pdp8/rx08/rx08-2.jpg" width=320>
    <BR>...and trying to debug it.
  </A></TD>
</TABLE>
    <P>I don't really know how extensive the problem here is.  It didn't 
work when I tried it, and the problem seems to be with the set-up times going
into some of the status latches.  It could definitely use more debug work.
    <P>My hope is to someday get it to work and to use it with one of the PDP-8/L,
to allow the 8/L to exchange files more easily with the other systems.

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
