<?php
  $title = "FPGA PDP-8i";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <DIV>I have been working on an FPGA implementation of a PDP-8/i clone.
I have used my 8/i lights and switches boards, to reconstruct an 8/i front panel
(the key-switch isn't authentic to an 8/i, though).  
I have interfaced it to an XESS development board with another board that mounts 
between the lights board and the development board.
    <P>Here are some pictures of the first result:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/FPGA8i/12100001.jpg">
    <IMG src="/pdp8/FPGA8i/12100001.jpg" width=320>
    <BR>A view from the front.
  </A></TD>
  <TD>
    <A href="/pdp8/FPGA8i/12100002.jpg">
    <IMG src="/pdp8/FPGA8i/12100002.jpg" width=320>
    <BR>A view from the back.
  </A></TD>
</TR><TR>
  <TD>
    <A href="/pdp8/FPGA8i/12100003.jpg">
    <IMG src="/pdp8/FPGA8i/12100003.jpg" width=320>
    <BR>Close-up of the back.
  </A></TD>
  <TD>
    <A href="/pdp8/FPGA8i/12100004.jpg">
    <IMG src="/pdp8/FPGA8i/12100004.jpg" width=320>
    <BR>That's a power supply on the right.
  </A></TD>
</TR><TR>
  <TD>
    <A href="/pdp8/FPGA8i/12100005.jpg">
    <IMG src="/pdp8/FPGA8i/12100005.jpg" width=320>
    <BR>It lights up!
  </A></TD>
  <TD>
    <A href="/pdp8/FPGA8i/12100006.jpg">
    <IMG src="/pdp8/FPGA8i/12100006.jpg" width=320>
    <BR>Same loop, different count.
  </A></TD>
</TABLE>
    <P>The pictures are meant to tantalize, but the project doesn't quite 
work properly yet.  There seem to be issues clocking data into the lights, 
and the FPGA code tends to simulate a brick much of the time.  I'm learning 
more and more about how to write code for an FPGA that works, though, so 
there's some hope for whenever I get back to working on this.
    <P>Here's a really dark movie of the thing counting:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/FPGA8i/12100007.avi">
    <IMG src="/pdp8/FPGA8i/12100006.jpg" width=320>
    <BR>Click here for movie.
  </A></TD>
</TABLE>

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
