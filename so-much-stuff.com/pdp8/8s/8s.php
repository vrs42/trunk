<?php
  $title = "PDP-8/L Computers";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <P>Here are some pictures of the first PDP-8/S:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/8s/8s-front.jpg">
    <IMG src="/pdp8/8s/8s-front.jpg" width=320>
    <BR>The PDP-8/S, front view.
  </A></TD>
  <TD>
    <A href="/pdp8/8s/8s-back.jpg">
    <IMG src="/pdp8/8s/8s-back.jpg" width=320>
    <BR>The PDP-8/S, back view.
  </A></TD>
<TR>
  <TD>
    <A href="/pdp8/8s/8s-left.jpg">
    <IMG src="/pdp8/8s/8s-left.jpg" width=320>
    <BR>The PDP-8/S, left side.
  </A></TD>
  <TD>
    <A href="/pdp8/8s/8s-right.jpg">
    <IMG src="/pdp8/8s/8s-right.jpg" width=320>
    <BR>The PDP-8/S, right side.
  </A></TD>
</TABLE>
    <P>Like much of the stuff described on this site, this isn't working.
    <P>When I got it, one of the flip-chips had been removed, and was suspected 
of not working:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/8s/bad-fc.jpg">
    <IMG src="/pdp8/8s/bad-fc.jpg" width=320>
    <BR>Bad flip-chip.
  </A></TD>
</TABLE>
    <P>Indeed, inspection revealed a problem:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/8s/badsolder.jpg">
    <IMG src="/pdp8/8s/badsolder.jpg" width=320>
    <BR>A bad solder joint.
  </A></TD>
  <TD>
    <A href="/pdp8/8s/goodsolder.jpg">
    <IMG src="/pdp8/8s/goodsolder.jpg" width=320>
    <BR>Better solder joint.
  </A></TD>
</TABLE>
    <P>After fixing that, I did some checkout of the power supply, reforming 
the capacitors and determining that it was safe to power the machine.
    <P>With the machine powered up, it didn't take long to discover that the 
bad card wasn't the only problem.  Pressing LA and such doesn't accurately 
copy the contents of the switch register to MA.
    <P>The 8/S is a serial machine, so it actually takes many clocks of the 
shift registers even for such a simple operation.  My next step will be to 
check the power supply for ripple, then check the internal clocking to see 
why it isn't reliable.
    <P>It came with a PT08 terminal controller and various extra flip-chips,
shown here piled on and around the machine:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/8s/pt08side.jpg">
    <IMG src="/pdp8/8s/pt08side.jpg" width=320>
    <BR>The PT08, side view.
  </A></TD>
  <TD>
    <A href="/pdp8/8s/pt08back.jpg">
    <IMG src="/pdp8/8s/pt08back.jpg" width=320>
    <BR>The PT08, rear view.
  </A></TD>
</TABLE>
    <P>The PT08 is necessary because it was not possible at the time to get 
both the terminal controller and the CPU to fit into the nice desktop box.
Each PT08 controls a single serial terminal, usually an ASR33 with reader-run 
control and interfaced with current loops.

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
