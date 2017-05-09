<?php
  $title = "DEC Pulse Transformers";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>
In 2004, I obtained a data sheet with 
<A href="T2037.pdf">manufacturing instructions for the T2037</A>
pulse transformer.  Pulse transformers are used in a variety of 
Gxxx modules, for instance to form the pulses to read/write core 
memory.
<P>
There are several alternate part numbers for the ferrite toroid there, 
but the "modern" equivalent is the FT-37-77.  The "37" refers to the 
0.37" outside diameter of the toroid.  The "77" refers to the material
formulation of the ferrite (material "72" has the same magnetic properties).
(As of this writing, FT-37-77 toroids can be affordably obtained
<A href="http://www.amidoncorp.com/ft-37-77/">here</A>.)
<P>
Essentially, 16 turn and 7 turn windings of color coded #33 wire are equally
spaced on the toroid, and the result is soldered to the posts of the carrier.
The carrier is a round cup with a 9/16" outside diameter and a height of 5/16",
which is then filled with (black) potting compound.
<P>
Recently (April 2017) I had an opportunity to look into the T2052 pulse 
transformer.  Like the T2037, it is used in core memory circuitry, 
and like the T2037, it appears to be constructed on an FT-37-77 equivalent 
toroid. <A href=T-2052.mht>Here</A> is an email I sent to Josh, detailing 
my findings.
<P>
The main difference is that it appears to be wound 1:1, with each coil 
having 25 turns.  It isn't clear what wire was used.  Cosmetically, 
the T2052 has an orange potting compound instead of the black, making it 
easy to keep them straight.
<P>
Particularly in older PDP-8 models, instead of a proper carrier, the coil 
was placed with leads extending through a small circular PCB, and the
result was apparently dipped in a brick-colored potting compound.
This process results in a "gumdrop" appearance of the result, which 
is then stenciled with the last two digits of the transformer's type 
("52", etc.).  Unfortunately, the leads are not strong enough not 
to flex when the cards are vibrated, which sometimes leads to metal 
fatigue, and they can become disconnected (or even fall off the 
boards entirely). 
<P>
Here are some photos:
<TABLE>
<TR>
<TD><A href=pulse37-52.jpg><IMG src=pulse37-52.jpg width=320></A>
<P>Newer style of pulse transformers.
<TD><A href=T2052josh.jpg><IMG src=T2052josh.jpg width=320></A>
<P>Partially disassembled "gumdrop" T2052.
</TD>
<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
