<?php
  $title = "32K Memory for Omnibus";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>
<P>Here is one possible solution to the interference fit issue 
with the PDP-8/A.
<TABLE>
<TR>
<P><TR>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040714.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040714.jpg" width=320>
    <A href="/pdp8/32KOmnibus/P1040713.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040713.jpg" width=320>
    <P>Rotate the battery holder nearly 180 degrees, and install
it between the rightmost battery holder GND hole and pin 1 of the IC 
prototype area to the left.  The result should look like the lower 
photo.
  </A></TD>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040715.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040715.jpg" width=320>
    <P>Install a blue wire connecting the leftmost pin 1 land to 
the lowest battery holder "+" hole.  The result should look something 
like the photo.
  </A></TD>
</TR><TR>
  <TD>
    <A href="/pdp8/32KOmnibus/P1040720.jpg">
    <IMG src="/pdp8/32KOmnibus/P1040720.jpg" width=320>
    <P>Proceed with board assembly.  Don't forget to tape the "pin 1" 
area, as that is now also carrying battery voltage 24/7.  Your result, 
when installed should now easily clear the card guides as shown in the photo.
  </A></TD>
</TABLE>

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
