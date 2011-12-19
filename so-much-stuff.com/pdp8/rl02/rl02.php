<?php
  $title = "RL02 Disks";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <P>I have two RL02 disk drives:
<TABLE>
<TR>
  <TD>
    <A href="/pdp8/rl02/rl02.jpg">
    <IMG src="/pdp8/rl02/rl02.jpg" width=320>
    <BR>My RL02 drives, cables, a couple of disk packs.
  </A></TD>
</TABLE>
    <P>These theoretically hold about 3.5Mwords per disk pack. In practice, 128 
words were stored per sector, not 170, so the effective capacity on a PDP-8 
(running the usual operating system) was 2 surfaces X 256 cylinders X 40 sectors/track
X 128 words, or 2,621,440 12 bit words.
    <P>They were also about half-again as fast as the RK05.
    <P>I plan to rack these up properly and hang them off one of my PDP-8/A CPUs.
The RL8A controller for them requires a hex backplane slot, which is too large 
for an 8/E (without an expansion backplane, anyway).

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
