<?php
  $title = "DEC Part Substitution";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>
I have added copies of these documents, which cross reference DEC part numbers
to vendor information, because I can no longer find them elsewhere online:
<TABLE>
<TD><A href="Spare%20Parts%20List%20Volume%20I.pdf">Spare Parts List Volume I.pdf</A>
<TR>
<TD><A href="Spare%20Parts%20List%20Volume%20II.pdf">Spare Parts List Volume II.pdf</A>
<TR>
</TABLE>
(Volume II is generally the more useful one.)
<P>
DEC sometimes provides part substitution information in a little table at the 
bottom of their schematics.  The following table rolls up this information
from a number of module schematics.  I haven't made any effort to correct what 
seems to be misinformation, preferring here to echo the information as DEC
provided it, even if it is possibly in error.  For instance, I suspect "D660" 
is a typo for "D668" on the W509 schematic.  The inconsistencies in the 
use of "NONE" vs leaving the EIA part number field blank are also preserved.
(I do not know if "NONE" was meant to mean something stronger than leaving 
the field blank, or not.)
<P>
The note "Pair" means that the SDAn part number refers to a matched pair 
of transistors in a single package.
<P>
With a few exceptions DECxxxx transistors map to 2Nxxxx, but for instance, 
the DEC2904 is sometimes 2N2904, but other times is 2N1132, 2N2118, or has 
no substitute at all, presumably depending on how it is used in the module.
<P>
<IFRAME WIDTH="100%" HEIGHT="60%" SRC="DECSubst.html" FRAMEBORDER=0 scrolling=yes color=#00ff00>
<GREEN>
DEC Parts Substitution List
</IFRAME>
<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
