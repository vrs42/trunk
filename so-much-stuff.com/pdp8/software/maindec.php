<?php
  $title = "MAINDEC Software Files";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>
<BODY><FONT size=4>
This is an archive of the MAINDEC software diagnostics.
<P>
Since the diagnostics files are organized by DEC part number, a 
word about part numbers is probably in order.  A DEC part number
might look like any of these:
        maindec-812-pb
        maindec-08-d01a-pb
        maindec-08-d01a-b-pb
        ac-6527d-ma
depending on the vintage of the part in question.
<P>
The first of these types of part numbers date from the age of the 
PDP-5, straight-8, 8/S, and the LINC-8.  Not many of those are 
available here, as yet.  The "maindec" identifies the product as 
a diagnostic, the number specified which product, and the "-pb" 
or similar suffix indicates the type of media (BIN paper tape).
<P>
The second of these types of part numbers date from a little later
on.  The main innovations are that there is now a "family" code, 
where "08" means the product works on more than one type of PDP-8,
and other family codes indicate a specific type of PDP-8 that the 
product must be used on.  There is also a version encoded as the 
last letter, so that sometimes later versions of essentially the 
same diagnostic are available.
<P>
The third variation splits out the revision.  It also allows an 
extra character to encode the diagnostic's name, allowing for the 
much larger number of products available by that time.
<P>
The last format is after a grand unification of part numbering across
digital product lines.  The initial "ac" indicates software media
related to a diagnostic.  The next four characters after the hyphen
identify the individual product, followed by the revision.  The last 
two characters identify the terms of the license, where "m" indicates
that no license is required, and the CPU type, where "a" is the PDP-8.
<P>
It also became common during this time to use "md" instead of "maindec" 
when referring to the older part numbers.
<P>
<table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>TTY Punch Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./812-pm>maindec-812-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./812-pm.lbl>maindec-812-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./812-pm.od>maindec-812-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 LT08 Teleprinter Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./828-pb>maindec-828-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./828-pb.lbl>maindec-828-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./828-pb.od>maindec-828-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-J/K Loop Back Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./ac-6527d-ma.pdf>maindec-ac-6527d-ma.pdf</a><td>(PDF write-up)<tr>
</table>
</table>
<FIELDSET><LEGEND>
  <b>maindec-08</b>: Diagnostics suitable for more than one CPU model.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>PDP-8 Instruction Test, part 2A
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01a-pb>maindec-08-d01a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01a-pb.od>maindec-08-d01a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 Instruction Test, part 2A
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01a-b-pb>maindec-08-d01a-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01a-b-pb.lbl>maindec-08-d01a-b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01a-b-pb.od>maindec-08-d01a-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 Instruction Test 1 (same as 8I-D01C)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01c-d.pdf>maindec-08-d01c-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01c-pb>maindec-08-d01c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d01c-pb.od>maindec-08-d01c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 Instruction Test, part 2B
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d02b-d.pdf>maindec-08-d02b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d02b-pb>maindec-08-d02b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d02b-pb.lbl>maindec-08-d02b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d02b-pb.od>maindec-08-d02b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random JMP Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d04b-d.pdf>maindec-08-d04b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d04b-pb>maindec-08-d04b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d04b-pb.lbl>maindec-08-d04b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d04b-pb.od>maindec-08-d04b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random JMP/JMS Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d05b-d.pdf>maindec-08-d05b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d05b-pb>maindec-08-d05b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d05b-pb.lbl>maindec-08-d05b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d05b-pb.od>maindec-08-d05b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random ISZ Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d07b-d.pdf>maindec-08-d07b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d07b-pb>maindec-08-d07b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d07b-pb.lbl>maindec-08-d07b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d07b-pb.od>maindec-08-d07b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 Instruction Test, part 3A (EAE)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d0aa-pb>maindec-08-d0aa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d0aa-pb.lbl>maindec-08-d0aa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d0aa-pb.od>maindec-08-d0aa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test (renamed to 08-D1B0)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-d.pdf>maindec-08-d11a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb1>maindec-08-d11a-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb1.od>maindec-08-d11a-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb2>maindec-08-d11a-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb2.od>maindec-08-d11a-pb2.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test Low (renamed to 08-D1B0)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb1.bin>maindec-08-d11a-pb1.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb1.lst>maindec-08-d11a-pb1.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb1.pal>maindec-08-d11a-pb1.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>Memory Address Test High (renamed to 08-D1B0)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb2.bin>maindec-08-d11a-pb2.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb2.lst>maindec-08-d11a-pb2.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d11a-pb2.pal>maindec-08-d11a-pb2.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>PDP-8 Memory Power On/Off Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ac-d.pdf>maindec-08-d1ac-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ac-pb>maindec-08-d1ac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ac-pb.lbl>maindec-08-d1ac-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ac-pb.od>maindec-08-d1ac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test (replaces 08-D11A)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b0-d.pdf>maindec-08-d1b0-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>Memory Address Test (Low)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b1-pb>maindec-08-d1b1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b1-pb.od>maindec-08-d1b1-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b1-pm>maindec-08-d1b1-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b1-pm.lbl>maindec-08-d1b1-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b1-pm.od>maindec-08-d1b1-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test (High)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b2-pm>maindec-08-d1b2-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b2-pm.lbl>maindec-08-d1b2-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1b2-pm.od>maindec-08-d1b2-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8, 8/I Extended Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1eb-pb>maindec-08-d1eb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1eb-pb.lbl>maindec-08-d1eb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1eb-pb.od>maindec-08-d1eb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8, 8/I Extended Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ec-d.pdf>maindec-08-d1ec-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ec-pb>maindec-08-d1ec-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ec-pb.od>maindec-08-d1ec-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8, 8/I, 8/S Extended Memory Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb-d.doc>maindec-08-d1gb-d.doc</a><td>(Word write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb-d.pdf>maindec-08-d1gb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb-pb>maindec-08-d1gb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb-pb.lbl>maindec-08-d1gb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb-pb.od>maindec-08-d1gb-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb.bin>maindec-08-d1gb.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb.lst>maindec-08-d1gb.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gb.pal>maindec-08-d1gb.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>PDP-8, 8/I, 8/S Extended Memory Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gd-d.pdf>maindec-08-d1gd-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gd-pb>maindec-08-d1gd-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gd-pb.od>maindec-08-d1gd-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gd.bin>maindec-08-d1gd.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gd.lst>maindec-08-d1gd.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1gd.pal>maindec-08-d1gd.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>PDP-8, 8/I Extended Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ha-d.pdf>maindec-08-d1ha-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ha-pb>maindec-08-d1ha-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ha-pb.lbl>maindec-08-d1ha-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ha-pb.od>maindec-08-d1ha-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KP8I/KR01 Power Fail Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1kb-pb>maindec-08-d1kb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1kb-pb.od>maindec-08-d1kb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Basic PDP-8, 8/I Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l0-d.pdf>maindec-08-d1l0-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>Basic PDP-8, 8/I Memory Checkerboard (Low)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l1-pm>maindec-08-d1l1-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l1-pm.lbl>maindec-08-d1l1-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l1-pm.od>maindec-08-d1l1-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>Basic PDP-8, 8/I Memory Checkerboard (High)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l2-pb>maindec-08-d1l2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l2-pb.od>maindec-08-d1l2-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l2-pm>maindec-08-d1l2-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l2-pm.lbl>maindec-08-d1l2-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1l2-pm.od>maindec-08-d1l2-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ma-pb1>maindec-08-d1ma-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ma-pb1.od>maindec-08-d1ma-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ma-pb2>maindec-08-d1ma-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d1ma-pb2.od>maindec-08-d1ma-pb2.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>CR03 Card Reader Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d20h-pb>maindec-08-d20h-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d20h-pb.lbl>maindec-08-d20h-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d20h-pb.od>maindec-08-d20h-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Family of 8 Teletype Tests thru PT08, LT08, or DC02 Interface
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2aa-pb>maindec-08-d2aa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2aa-pb.od>maindec-08-d2aa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Family of 8 ASR 33/35 Teletype Tests, Part 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2pe-d.pdf>maindec-08-d2pe-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2pe-pb>maindec-08-d2pe-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2pe-pb.lbl>maindec-08-d2pe-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2pe-pb.od>maindec-08-d2pe-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Family of 8 ASR 33/35 Teletype Tests, Part 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2qd-d.pdf>maindec-08-d2qd-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2qd-pb>maindec-08-d2qd-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2qd-pb.lbl>maindec-08-d2qd-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d2qd-pb.od>maindec-08-d2qd-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TC01 Basic Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3bc-pb>maindec-08-d3bc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3bc-pb.lbl>maindec-08-d3bc-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3bc-pb.od>maindec-08-d3bc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TC01 Extended Memory Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3eb-d.pdf>maindec-08-d3eb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3eb-pb>maindec-08-d3eb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3eb-pb.lbl>maindec-08-d3eb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3eb-pb.od>maindec-08-d3eb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DECTREX 1 TC01 Random Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3ra-pb>maindec-08-d3ra-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3ra-pb.lbl>maindec-08-d3ra-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d3ra-pb.od>maindec-08-d3ra-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8, 8/I Memory Parity Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d4a0-d.pdf>maindec-08-d4a0-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DF32/DF32D Discless Logic Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5bb-d.pdf>maindec-08-d5bb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5bb-pb>maindec-08-d5bb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5bb-pb.lbl>maindec-08-d5bb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5bb-pb.od>maindec-08-d5bb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32/DF32D Disc Data, Interface, Address, Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cc-pb>maindec-08-d5cc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cc-pb.lbl>maindec-08-d5cc-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cc-pb.od>maindec-08-d5cc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32/DF32D Disc Data Mini Disk, Interface Address, Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cd-pb>maindec-08-d5cd-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cd-pb.lbl>maindec-08-d5cd-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cd-pb.od>maindec-08-d5cd-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32/DF32D Disc Data Mini Disk, Interface Address, Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5ce-d.pdf>maindec-08-d5ce-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5ce-pb>maindec-08-d5ce-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5ce-pb.od>maindec-08-d5ce-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32/DF32D Disk Data Minidisk, Interface Address, Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cg-pb>maindec-08-d5cg-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cg-pb.od>maindec-08-d5cg-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5cg-sv.htm>maindec-08-d5cg-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>DF32 Multi Disc Exerciser for Master and Slave Units
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5da-pb>maindec-08-d5da-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5da-pb.lbl>maindec-08-d5da-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5da-pb.od>maindec-08-d5da-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32 Multi Disk
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5db-d.pdf>maindec-08-d5db-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5db-pb>maindec-08-d5db-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5db-pb.lbl>maindec-08-d5db-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5db-pb.od>maindec-08-d5db-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RF08 Disk Data (256K)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5eb-pb>maindec-08-d5eb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5eb-pb.lbl>maindec-08-d5eb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5eb-pb.od>maindec-08-d5eb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RF08 Multi Disk II (256K)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5fa-pb>maindec-08-d5fa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5fa-pb.lbl>maindec-08-d5fa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5fa-pb.od>maindec-08-d5fa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8 Disk Data Reliability Test (RK01 Version)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5hc-pb>maindec-08-d5hc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5hc-pb.od>maindec-08-d5hc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8 Disk and Control Instruction Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5jb-pb>maindec-08-d5jb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5jb-pb.od>maindec-08-d5jb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK08 Disk Formatter
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5kb-pb>maindec-08-d5kb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d5kb-pb.od>maindec-08-d5kb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 CalComp Plotter Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6cc-d.pdf>maindec-08-d6cc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6cc-pb>maindec-08-d6cc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6cc-pb.od>maindec-08-d6cc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>A/D Calibration Check
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6gc-pb>maindec-08-d6gc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6gc-pb.od>maindec-08-d6gc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VC8I Display Test 34D
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6kb-pb>maindec-08-d6kb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6kb-pb.lbl>maindec-08-d6kb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6kb-pb.od>maindec-08-d6kb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>AA05/AA07 Calibration Tape
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6ta-pb>maindec-08-d6ta-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6ta-pb.od>maindec-08-d6ta-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>AA50 D/A Converter Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6wb-pb>maindec-08-d6wb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d6wb-pb.od>maindec-08-d6wb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>680 DCS Expanded Static Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d71a-d.pdf>maindec-08-d71a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>680 DCS Data and Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d72a-d.pdf>maindec-08-d72a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d72a-pb>maindec-08-d72a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d72a-pb.od>maindec-08-d72a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DK8E Clocks Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8ac-pb>maindec-08-d8ac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8ac-pb.od>maindec-08-d8ac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DM01 Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8sb-pb>maindec-08-d8sb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8sb-pb.lbl>maindec-08-d8sb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8sb-pb.od>maindec-08-d8sb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DM01 Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8sc-d.pdf>maindec-08-d8sc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8sc-pb>maindec-08-d8sc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d8sc-pb.od>maindec-08-d8sc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Family of 8 Multi Break Device Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d9ka-pb>maindec-08-d9ka-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/d9ka-pb.od>maindec-08-d9ka-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Extended Memory Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dgmca-b-pb>maindec-08-dgmca-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dgmca-b-pb.od>maindec-08-dgmca-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT05 Terminal Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dgv5a-b-pb>maindec-08-dgv5a-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dgv5a-b-pb.od>maindec-08-dgv5a-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>AD8E, AM8E A/D Converter and Multiplexer
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhada-a-d.pdf>maindec-08-dhada-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhada-a-pb>maindec-08-dhada-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhada-a-pb.od>maindec-08-dhada-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8E Loader/Builder for Cassettes
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhcaa-a-pb>maindec-08-dhcaa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhcaa-a-pb.od>maindec-08-dhcaa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>CR8E/CR8F Card Reader Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhcra-a-d.pdf>maindec-08-dhcra-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhcra-a-pb>maindec-08-dhcra-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhcra-a-pb.od>maindec-08-dhcra-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DH8E Remote Loader Program
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdhc-bn.htm>maindec-08-dhdhc-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdhc-pb>maindec-08-dhdhc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdhc-pb.od>maindec-08-dhdhc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DH8E Remote Loader Program
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdhc-a-dg.htm>maindec-08-dhdhc-a-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdhc-a-pb>maindec-08-dhdhc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdhc-a-pb.od>maindec-08-dhdhc-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DK8E Clocks Diagnostic (replaces 8E-D8AC)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdka-a-d.pdf>maindec-08-dhdka-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdka-a-pb>maindec-08-dhdka-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdka-a-pb.lbl>maindec-08-dhdka-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdka-a-pb.od>maindec-08-dhdka-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DR8-EA 12 Channel Interface
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdra-a-pb>maindec-08-dhdra-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdra-a-pb.od>maindec-08-dhdra-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdx1-bn.htm>maindec-08-dhdx1-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdx1-pb>maindec-08-dhdx1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhdx1-pb.od>maindec-08-dhdx1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Adder Tests
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkaa-b-pb>maindec-08-dhkaa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkaa-b-pb.lbl>maindec-08-dhkaa-b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkaa-b-pb.od>maindec-08-dhkaa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random AND Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkab-a-pb>maindec-08-dhkab-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkab-a-pb.lbl>maindec-08-dhkab-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkab-a-pb.od>maindec-08-dhkab-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkac-a-pb>maindec-08-dhkac-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkac-a-pb.lbl>maindec-08-dhkac-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkac-a-pb.od>maindec-08-dhkac-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkad-a-pb>maindec-08-dhkad-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkad-a-pb.lbl>maindec-08-dhkad-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkad-a-pb.od>maindec-08-dhkad-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Instruction Test No. 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkaf-a-pb>maindec-08-dhkaf-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkaf-a-pb.lbl>maindec-08-dhkaf-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkaf-a-pb.od>maindec-08-dhkaf-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Random TAD Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkag-a-pb>maindec-08-dhkag-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkag-a-pb.lbl>maindec-08-dhkag-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkag-a-pb.od>maindec-08-dhkag-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KE8E EAE Extended Memory Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-a-d.txt>maindec-08-dhkea-a-d.txt</a><td>(Text write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-a-pb>maindec-08-dhkea-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-a-pb.lbl>maindec-08-dhkea-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-a-pb.od>maindec-08-dhkea-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KE8E EAE Extended Memory Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-b-pb>maindec-08-dhkea-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-b-pb.od>maindec-08-dhkea-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-b-sv.htm>maindec-08-dhkea-b-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>KE8E EAE Extended Memory Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-e-pb>maindec-08-dhkea-e-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-e-pb.od>maindec-08-dhkea-e-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkea-e-sv.htm>maindec-08-dhkea-e-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>KG8-EA Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkga-b-pb>maindec-08-dhkga-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkga-b-pb.lbl>maindec-08-dhkga-b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkga-b-pb.od>maindec-08-dhkga-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-M Modem Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkla-a-pb>maindec-08-dhkla-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkla-a-pb.od>maindec-08-dhkla-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-M/E/F DC08-H On-Line Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklb-a-pb>maindec-08-dhklb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklb-a-pb.od>maindec-08-dhklb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-F Async Interface
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklc-b-d.pdf>maindec-08-dhklc-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklc-b-pb>maindec-08-dhklc-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklc-b-pb.od>maindec-08-dhklc-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-F Async Interface
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklc-d-dg.htm>maindec-08-dhklc-d-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklc-d-pb>maindec-08-dhklc-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhklc-d-pb.od>maindec-08-dhklc-d-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Async Data Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkld-pb>maindec-08-dhkld-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkld-pb.od>maindec-08-dhkld-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkld-sv.htm>maindec-08-dhkld-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>PDP-8/E Async Data Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkld-a-d.pdf>maindec-08-dhkld-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkld-a-pb>maindec-08-dhkld-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkld-a-pb.od>maindec-08-dhkld-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Data
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-a-pb>maindec-08-dhkma-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-a-pb.od>maindec-08-dhkma-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Data
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-b-pb>maindec-08-dhkma-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-b-pb.od>maindec-08-dhkma-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-b-sv>maindec-08-dhkma-b-sv</a><td>(OS/8 save image)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Data
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-c-d.pdf>maindec-08-dhkma-c-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-c-pb>maindec-08-dhkma-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-c-pb.od>maindec-08-dhkma-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Data
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-d-d.pdf>maindec-08-dhkma-d-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-d-pb>maindec-08-dhkma-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-d-pb.lbl>maindec-08-dhkma-d-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkma-d-pb.od>maindec-08-dhkma-d-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkmc-b-d.pdf>maindec-08-dhkmc-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkmc-b-pb>maindec-08-dhkmc-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkmc-b-pb.od>maindec-08-dhkmc-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkmc-c-pb>maindec-08-dhkmc-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkmc-c-pb.lbl>maindec-08-dhkmc-c-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkmc-c-pb.od>maindec-08-dhkmc-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KP8E Power Fail/Auto Restart
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkpa-b-d.pdf>maindec-08-dhkpa-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkpa-b-pb>maindec-08-dhkpa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkpa-b-pb.lbl>maindec-08-dhkpa-b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkpa-b-pb.od>maindec-08-dhkpa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E/8L Data Reliability
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkrc-h-pb>maindec-08-dhkrc-h-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkrc-h-pb.lbl>maindec-08-dhkrc-h-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhkrc-h-pb.od>maindec-08-dhkrc-h-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LA30 Decwriter Control Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlaa-b-pb>maindec-08-dhlaa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlaa-b-pb.od>maindec-08-dhlaa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LQP8 Printer Diagnostics
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlqa-b-d.pdf>maindec-08-dhlqa-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlqa-b-dg.htm>maindec-08-dhlqa-b-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlqa-b-pb>maindec-08-dhlqa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlqa-b-pb.od>maindec-08-dhlqa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LS8E Line Printer Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhlsa-a-d.pdf>maindec-08-dhlsa-a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>PDP-8/E Memory Extension and Timeshare Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-a-pb>maindec-08-dhmca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-a-pb.lbl>maindec-08-dhmca-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-a-pb.od>maindec-08-dhmca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Memory Extension and Timeshare Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-a1-d.pdf>maindec-08-dhmca-a1-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>PDP-8/E Memory Extension and Timeshare Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-b-pb>maindec-08-dhmca-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-b-pb.od>maindec-08-dhmca-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmca-b-sv.htm>maindec-08-dhmca-b-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>PDP-8/E Extended Memory Parity Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhmpa-a-d.pdf>maindec-08-dhmpa-a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>PC8-E High Speed Reader/Punch Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-a-d.pdf>maindec-08-dhpca-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-a-pb>maindec-08-dhpca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-a-pb.od>maindec-08-dhpca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PC8-E High Speed Reader/Punch Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-b-bn.htm>maindec-08-dhpca-b-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-b-pb>maindec-08-dhpca-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-b-pb.od>maindec-08-dhpca-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-b.bin>maindec-08-dhpca-b.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-b.lst>maindec-08-dhpca-b.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhpca-b.pal>maindec-08-dhpca-b.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>RK8E Diskless Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-a-pb>maindec-08-dhrka-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-a-pb.lbl>maindec-08-dhrka-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-a-pb.od>maindec-08-dhrka-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Diskless Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-b-d.pdf>maindec-08-dhrka-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-b-pb>maindec-08-dhrka-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-b-pb.lbl>maindec-08-dhrka-b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-b-pb.od>maindec-08-dhrka-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Diskless Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-e-d.pdf>maindec-08-dhrka-e-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-e-pb>maindec-08-dhrka-e-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-e-pb.od>maindec-08-dhrka-e-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-e.bin>maindec-08-dhrka-e.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-e.lst>maindec-08-dhrka-e.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrka-e.pal>maindec-08-dhrka-e.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>RK8E Drive Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-b-pb>maindec-08-dhrkb-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-b-pb.lbl>maindec-08-dhrkb-b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-b-pb.od>maindec-08-dhrkb-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Drive Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-c-pb>maindec-08-dhrkb-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-c-pb.lbl>maindec-08-dhrkb-c-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-c-pb.od>maindec-08-dhrkb-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Drive Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-e-d.pdf>maindec-08-dhrkb-e-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-e-pb>maindec-08-dhrkb-e-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-e-pb.lbl>maindec-08-dhrkb-e-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-e-pb.od>maindec-08-dhrkb-e-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Drive Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-g-d.pdf>maindec-08-dhrkb-g-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-g-pb>maindec-08-dhrkb-g-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-g-pb.od>maindec-08-dhrkb-g-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-g-sv.htm>maindec-08-dhrkb-g-sv.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-g.bin>maindec-08-dhrkb-g.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkb-g.bin.od>maindec-08-dhrkb-g.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>RK8E Data Reliability Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-a-pb>maindec-08-dhrkc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-a-pb.lbl>maindec-08-dhrkc-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-a-pb.od>maindec-08-dhrkc-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Data Reliability Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-c-pb>maindec-08-dhrkc-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-c-pb.lbl>maindec-08-dhrkc-c-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-c-pb.od>maindec-08-dhrkc-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Data Reliability Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-e-d.pdf>maindec-08-dhrkc-e-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>RK8E Data Reliability Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-h-d.pdf>maindec-08-dhrkc-h-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-h-pb>maindec-08-dhrkc-h-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-h-pb.lbl>maindec-08-dhrkc-h-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkc-h-pb.od>maindec-08-dhrkc-h-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Formatter
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-a-d.pdf>maindec-08-dhrkd-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-a-pb>maindec-08-dhrkd-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-a-pb.lbl>maindec-08-dhrkd-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-a-pb.od>maindec-08-dhrkd-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RK8E Formatter
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-c-pb>maindec-08-dhrkd-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-c-pb.od>maindec-08-dhrkd-c-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-c-sv.htm>maindec-08-dhrkd-c-sv.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-c.bin>maindec-08-dhrkd-c.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-c.bin.od>maindec-08-dhrkd-c.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>RK8E Formatter
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-d-d.pdf>maindec-08-dhrkd-d-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-d-pb>maindec-08-dhrkd-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-d-pb.od>maindec-08-dhrkd-d-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-d-sv.htm>maindec-08-dhrkd-d-sv.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-d.bin>maindec-08-dhrkd-d.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhrkd-d.bin.od>maindec-08-dhrkd-d.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>TD8E DECTape Diagnostic Overlay (replaces 8E-D3AB)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhta-a-pb>maindec-08-dhta-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhta-a-pb.od>maindec-08-dhta-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TA8E Cassette System
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtaa-b-pb>maindec-08-dhtaa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtaa-b-pb.od>maindec-08-dhtaa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TA8E Cassette System
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtaa-c-pb>maindec-08-dhtaa-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtaa-c-pb.od>maindec-08-dhtaa-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TA8E Cassette Reliability
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtab-b-pb>maindec-08-dhtab-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtab-b-pb.od>maindec-08-dhtab-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TD8E/TU56 DECTape Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-a-d.pdf>maindec-08-dhtda-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-a-pb>maindec-08-dhtda-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-a-pb.od>maindec-08-dhtda-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-a-sv.htm>maindec-08-dhtda-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>TD8E/TU56 DECTape Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-b-pb>maindec-08-dhtda-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-b-pb.od>maindec-08-dhtda-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-b-sv.htm>maindec-08-dhtda-b-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>TD8E/TU56 DECTape Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-d-pb>maindec-08-dhtda-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-d-pb.od>maindec-08-dhtda-d-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-d.lst>maindec-08-dhtda-d.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtda-d.pal>maindec-08-dhtda-d.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>TM8E Control Test Part 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-a-d.pdf>maindec-08-dhtma-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-a-pb>maindec-08-dhtma-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-a-pb.od>maindec-08-dhtma-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-a-sv.htm>maindec-08-dhtma-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>TM8E Control Test Part 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-b-dg.htm>maindec-08-dhtma-b-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-b-pb>maindec-08-dhtma-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtma-b-pb.od>maindec-08-dhtma-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TM8E Control Test Part 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-a-d.pdf>maindec-08-dhtmb-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-a-pb>maindec-08-dhtmb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-a-pb.od>maindec-08-dhtmb-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-a-sv.htm>maindec-08-dhtmb-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>TM8E Control Test Part 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-b-dg.htm>maindec-08-dhtmb-b-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-b-pb>maindec-08-dhtmb-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmb-b-pb.od>maindec-08-dhtmb-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TM8E Drive Function Timer
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmc-a-d.pdf>maindec-08-dhtmc-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmc-a-pb>maindec-08-dhtmc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmc-a-pb.od>maindec-08-dhtmc-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmc-a-sv.htm>maindec-08-dhtmc-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>TM8E Data Reliability
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-a-d.pdf>maindec-08-dhtmd-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-a-pb>maindec-08-dhtmd-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-a-pb.od>maindec-08-dhtmd-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-a-sv.htm>maindec-08-dhtmd-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>TM8E Data Reliability
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-b-dg.htm>maindec-08-dhtmd-b-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-b-pb>maindec-08-dhtmd-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhtmd-b-pb.od>maindec-08-dhtmd-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VC8-E Display Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhvca-a-pb>maindec-08-dhvca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhvca-a-pb.od>maindec-08-dhvca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT8-E Video Display Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhvta-b-pb>maindec-08-dhvta-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhvta-b-pb.od>maindec-08-dhvta-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT50/VT52
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhvtc-d-pb>maindec-08-dhvtc-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dhvtc-d-pb.od>maindec-08-dhvtc-d-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DB8E Interrupt Buffer Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didba-a-bn.htm>maindec-08-didba-a-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didba-a-pb>maindec-08-didba-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didba-a-pb.od>maindec-08-didba-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32 Diskless Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didfb-a-d.pdf>maindec-08-didfb-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didfb-a-pb>maindec-08-didfb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didfb-a-pb.od>maindec-08-didfb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32 Interface Address Disk Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didfc-a-d.pdf>maindec-08-didfc-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didfc-a-pb>maindec-08-didfc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/didfc-a-pb.od>maindec-08-didfc-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-JA Teletype Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/diklb-a-d.pdf>maindec-08-diklb-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/diklb-a-pb>maindec-08-diklb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/diklb-a-pb.od>maindec-08-diklb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LA36 Printer Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilab-d-pb>maindec-08-dilab-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilab-d-pb.lbl>maindec-08-dilab-d-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilab-d-pb.od>maindec-08-dilab-d-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LA80 Printer Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-a-pb>maindec-08-dilac-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-a-pb.od>maindec-08-dilac-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LA80 Printer Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-b-d.pdf>maindec-08-dilac-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-b-dg.htm>maindec-08-dilac-b-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-b-pb>maindec-08-dilac-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-b-pb.od>maindec-08-dilac-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilac-b-sv.htm>maindec-08-dilac-b-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>LE8/LP08 Line Printer Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilpa-n-bn.htm>maindec-08-dilpa-n-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilpa-n-pb>maindec-08-dilpa-n-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dilpa-n-pb.od>maindec-08-dilpa-n-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-08 MAINDEC Index
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/diqac-e-d.pdf>maindec-08-diqac-e-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>RX8/RX01 Diagnostic Program
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-b-pb>maindec-08-dirxa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-b-pb.od>maindec-08-dirxa-b-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-b.bin>maindec-08-dirxa-b.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-b.bin.od>maindec-08-dirxa-b.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>RX8/RX01 Diagnostic Program
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-c-d.pdf>maindec-08-dirxa-c-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-c-pb>maindec-08-dirxa-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-c-pb.od>maindec-08-dirxa-c-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-c.bin>maindec-08-dirxa-c.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-c.bin.od>maindec-08-dirxa-c.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>RX8/RX01 Diagnostic Program
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-d-d.pdf>maindec-08-dirxa-d-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-d-pb>maindec-08-dirxa-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-d-pb.od>maindec-08-dirxa-d-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxa-d-sv.htm>maindec-08-dirxa-d-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>RX8/RX01 Data Reliability
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-c-pb>maindec-08-dirxb-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-c-pb.od>maindec-08-dirxb-c-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-c-sv.htm>maindec-08-dirxb-c-sv.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-c.bin>maindec-08-dirxb-c.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-c.bin.od>maindec-08-dirxb-c.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>RX8/RX01 Data Reliability
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-d-d.pdf>maindec-08-dirxb-d-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-d-pb>maindec-08-dirxb-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-d-pb.od>maindec-08-dirxb-d-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-d.bin>maindec-08-dirxb-d.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dirxb-d.bin.od>maindec-08-dirxb-d.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>TC01 Basic Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditca-a-d.pdf>maindec-08-ditca-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditca-a-pb>maindec-08-ditca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditca-a-pb.od>maindec-08-ditca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TC58 Random Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditcc-a-dg.htm>maindec-08-ditcc-a-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditcc-a-pb>maindec-08-ditcc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditcc-a-pb.od>maindec-08-ditcc-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TC58 Instruction Set Test part 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditcd-a-dg.htm>maindec-08-ditcd-a-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditcd-a-pb>maindec-08-ditcd-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/ditcd-a-pb.od>maindec-08-ditcd-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT20 Host Computer
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/divtb-a-d.pdf>maindec-08-divtb-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/divtb-a-pb>maindec-08-divtb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/divtb-a-pb.od>maindec-08-divtb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT20 Acceptance Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/divtc-a-pb>maindec-08-divtc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/divtc-a-pb.od>maindec-08-divtc-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DC8-AA Option Text No. 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djdka-b-d.pdf>maindec-08-djdka-b-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DC8-AA Option Text No. 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djdka-c-pb>maindec-08-djdka-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djdka-c-pb.od>maindec-08-djdka-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DC8-AA Option Text No. 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djdka-d-bn.htm>maindec-08-djdka-d-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djdka-d-pb>maindec-08-djdka-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djdka-d-pb.od>maindec-08-djdka-d-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/A 2K-32K Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexb-a-d.pdf>maindec-08-djexb-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexb-a-pb>maindec-08-djexb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexb-a-pb.od>maindec-08-djexb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/A 4K-32K Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexc-a-pb>maindec-08-djexc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexc-a-pb.od>maindec-08-djexc-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexc-a-sv.htm>maindec-08-djexc-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>PDP-8/A/VT78 4K-32K Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djexc-b-d.pdf>maindec-08-djexc-b-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>KK8A CPU Test (no interrupt tests)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-8-pb>maindec-08-djkka-8-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-8-pb.od>maindec-08-djkka-8-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-8-sv.htm>maindec-08-djkka-8-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>Patch djkka-c to djkka-8.
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-8p.bin>maindec-08-djkka-8p.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-8p.lst>maindec-08-djkka-8p.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-8p.pal>maindec-08-djkka-8p.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>KK8A PDP-8/A CPU Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-b-d.pdf>maindec-08-djkka-b-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>KK8A PDP-8/A CPU Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-c-bn.htm>maindec-08-djkka-c-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-c-pb>maindec-08-djkka-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkka-c-pb.od>maindec-08-djkka-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/A CPU Test w/Console Package
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkkb-a-dg.htm>maindec-08-djkkb-a-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkkb-a-pb>maindec-08-djkkb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkkb-a-pb.od>maindec-08-djkkb-a-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkkb-a-sv.htm>maindec-08-djkkb-a-sv.htm</a><td>(Saved web page)<tr>
</table>
</tr><tr>
<td>KL8-A Multiple Serial Line
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkla-c-pb>maindec-08-djkla-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkla-c-pb.od>maindec-08-djkla-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KL8-A Multiple Serial Line
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkla-d-bn.htm>maindec-08-djkla-d-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkla-d-pb>maindec-08-djkla-d-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkla-d-pb.od>maindec-08-djkla-d-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KM8-A Option Test No. 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkma-b-d.pdf>maindec-08-djkma-b-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>KM8-A Option Test No. 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkma-c-bn.htm>maindec-08-djkma-c-bn.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkma-c-pb>maindec-08-djkma-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djkma-c-pb.od>maindec-08-djkma-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>MS8-A 1K-4K MOS Memory Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djmsa-a-d.pdf>maindec-08-djmsa-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djmsa-a-pb>maindec-08-djmsa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/djmsa-a-pb.od>maindec-08-djmsa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT78 MOS Memory Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dkvta-a-d.pdf>maindec-08-dkvta-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dkvta-a-dg.htm>maindec-08-dkvta-a-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dkvta-a-pb>maindec-08-dkvta-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dkvta-a-pb.od>maindec-08-dkvta-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VT78 CPU Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./08/dkvtb-a-d.pdf>maindec-08-dkvtb-a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>maindec-12</b>: Diagnostics unique to the PDP-12.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>PDP-12 CP Test 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ab-pb>maindec-12-d0ab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ab-pb.od>maindec-12-d0ab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Instruction Test part 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ba-pb>maindec-12-d0ba-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ba-pb.od>maindec-12-d0ba-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ca-pb>maindec-12-d0ca-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ca-pb.od>maindec-12-d0ca-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 CP Test 3
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0cb-pb>maindec-12-d0cb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0cb-pb.od>maindec-12-d0cb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Quickie
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ga-pb>maindec-12-d0ga-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ga-pb.od>maindec-12-d0ga-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ga-pm>maindec-12-d0ga-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ga-pm.od>maindec-12-d0ga-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Quickie
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ga-a-d.pdf>maindec-12-d0ga-a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>FPP-12 Trace
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0lc-pb>maindec-12-d0lc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0lc-pb.od>maindec-12-d0lc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>FPP-12 Instruction Test 2A
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0mc-pb>maindec-12-d0mc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0mc-pb.od>maindec-12-d0mc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>FPP-12 Instruction Test 2B
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0nb-pb>maindec-12-d0nb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0nb-pb.od>maindec-12-d0nb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KF12B Auto Priority Interrupt
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0sa-pb>maindec-12-d0sa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0sa-pb.od>maindec-12-d0sa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>FPP-12 Trace EPM Version
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ta-pb>maindec-12-d0ta-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ta-pb.lbl>maindec-12-d0ta-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ta-pb.od>maindec-12-d0ta-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>FPP-12 Instruction Test 3 EPM Version
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ua-pb>maindec-12-d0ua-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d0ua-pb.od>maindec-12-d0ua-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Extended Memory Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ab-pb>maindec-12-d1ab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ab-pb.od>maindec-12-d1ab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Extended Memory Control
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ac-pb>maindec-12-d1ac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ac-pb.od>maindec-12-d1ac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>JMP Self
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ba-pb>maindec-12-d1ba-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ba-pb.od>maindec-12-d1ba-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ca-pb>maindec-12-d1ca-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ca-pb.od>maindec-12-d1ca-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PFP-12 Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1da-pb>maindec-12-d1da-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1da-pb.od>maindec-12-d1da-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Float 1's and 0's Through Memory
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ea-pb>maindec-12-d1ea-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1ea-pb.od>maindec-12-d1ea-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Basic Memory Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1fa-pb>maindec-12-d1fa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d1fa-pb.od>maindec-12-d1fa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ac-pb>maindec-12-d3ac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ac-pb.od>maindec-12-d3ac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Control Test part 1 of 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ad-d-d.pdf>maindec-12-d3ad-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Control Test part 1 of 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ae-pb>maindec-12-d3ae-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ae-pb.od>maindec-12-d3ae-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Data Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3db-pb>maindec-12-d3db-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3db-pb.od>maindec-12-d3db-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TC12-F Option Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3eb-pb>maindec-12-d3eb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3eb-pb.od>maindec-12-d3eb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3fb-pb>maindec-12-d3fb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3fb-pb.od>maindec-12-d3fb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Control Test part 2 of 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ga-pb>maindec-12-d3ga-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ga-pb.od>maindec-12-d3ga-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Tape Control Test part 2 of 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d3ga-d-d.pdf>maindec-12-d3ga-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>VR12 Display Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6ba-pb>maindec-12-d6ba-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6ba-pb.od>maindec-12-d6ba-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>VR14/VR20 Display Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6bc-pb>maindec-12-d6bc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6bc-pb.od>maindec-12-d6bc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>A to D Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6cb-pb>maindec-12-d6cb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6cb-pb.od>maindec-12-d6cb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>A to D Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6cc-pb>maindec-12-d6cc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d6cc-pb.od>maindec-12-d6cc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Relay Register Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d8ab-pb>maindec-12-d8ab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d8ab-pb.od>maindec-12-d8ab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KW12 Clock Test for Units w/o ECO #55
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d8ca-pb>maindec-12-d8ca-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d8ca-pb.od>maindec-12-d8ca-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KW12A Clock Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d8cc-pb>maindec-12-d8cc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d8cc-pb.od>maindec-12-d8cc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Operating Procedure
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/d9ca-d-d.pdf>maindec-12-d9ca-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>PDP-12 System Exerciser (replaces 12-D7CD)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/daexa-a-pb>maindec-12-daexa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/daexa-a-pb.od>maindec-12-daexa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpa-a-pb>maindec-12-dafpa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpa-a-pb.od>maindec-12-dafpa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-12 Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpa-b-pb>maindec-12-dafpa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpa-b-pb.od>maindec-12-dafpa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>FPP-12 Instruction Test 2C
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpb-a-pb>maindec-12-dafpb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpb-a-pb.od>maindec-12-dafpb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>FPP-12 Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpc-a-pb>maindec-12-dafpc-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/dafpc-a-pb.od>maindec-12-dafpc-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>BM812-I Memory Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/damca-a-pb>maindec-12-damca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./12/damca-a-pb.od>maindec-12-damca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>maindec-8e</b>: Diagnostics unique to the PDP-8/E/F/M.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>PDP-8/E Instruction Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0aa-pb>maindec-8e-d0aa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0aa-pb.lbl>maindec-8e-d0aa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0aa-pb.od>maindec-8e-d0aa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Instruction Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ab-d.pdf>maindec-8e-d0ab-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ab-pb>maindec-8e-d0ab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ab-pb.lbl>maindec-8e-d0ab-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ab-pb.od>maindec-8e-d0ab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Instruction Test 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ba-pb>maindec-8e-d0ba-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ba-pb.lbl>maindec-8e-d0ba-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ba-pb.od>maindec-8e-d0ba-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Instruction Test 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0bb-d.pdf>maindec-8e-d0bb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0bb-pb>maindec-8e-d0bb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0bb-pb.lbl>maindec-8e-d0bb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0bb-pb.od>maindec-8e-d0bb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>8E Adder Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ca-pb>maindec-8e-d0ca-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ca-pb.lbl>maindec-8e-d0ca-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ca-pb.od>maindec-8e-d0ca-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>8E Adder Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0cc-d.pdf>maindec-8e-d0cc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0cc-pb>maindec-8e-d0cc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0cc-pb.lbl>maindec-8e-d0cc-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0cc-pb.od>maindec-8e-d0cc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random AND Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0da-pb>maindec-8e-d0da-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0da-pb.lbl>maindec-8e-d0da-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0da-pb.od>maindec-8e-d0da-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random AND Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0db-d.pdf>maindec-8e-d0db-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0db-pb>maindec-8e-d0db-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0db-pb.lbl>maindec-8e-d0db-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0db-pb.od>maindec-8e-d0db-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random TAD Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ea-pb>maindec-8e-d0ea-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ea-pb.lbl>maindec-8e-d0ea-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ea-pb.od>maindec-8e-d0ea-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random TAD Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0eb-d.pdf>maindec-8e-d0eb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0eb-pb>maindec-8e-d0eb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0eb-pb.lbl>maindec-8e-d0eb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0eb-pb.od>maindec-8e-d0eb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random ISZ Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fa-pb>maindec-8e-d0fa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fa-pb.lbl>maindec-8e-d0fa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fa-pb.od>maindec-8e-d0fa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random ISZ Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fc-d.pdf>maindec-8e-d0fc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fc-pb>maindec-8e-d0fc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fc-pb.lbl>maindec-8e-d0fc-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0fc-pb.od>maindec-8e-d0fc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random DCA Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ga-pb>maindec-8e-d0ga-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ga-pb.lbl>maindec-8e-d0ga-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ga-pb.od>maindec-8e-d0ga-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random DCA Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0gc-d.pdf>maindec-8e-d0gc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0gc-pb>maindec-8e-d0gc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0gc-pb.od>maindec-8e-d0gc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random JMP Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ha-pb>maindec-8e-d0ha-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ha-pb.lbl>maindec-8e-d0ha-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ha-pb.od>maindec-8e-d0ha-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random JMP Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0hc-d.pdf>maindec-8e-d0hc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0hc-pb>maindec-8e-d0hc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0hc-pb.od>maindec-8e-d0hc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Basic JMP-JMS Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ia-pb>maindec-8e-d0ia-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ia-pb.lbl>maindec-8e-d0ia-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ia-pb.od>maindec-8e-d0ia-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Basic JMP-JMS Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ib-d.pdf>maindec-8e-d0ib-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ib-pb>maindec-8e-d0ib-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ib-pb.od>maindec-8e-d0ib-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random JMP-JMS Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ja-d.pdf>maindec-8e-d0ja-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ja-pb>maindec-8e-d0ja-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ja-pb.lbl>maindec-8e-d0ja-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ja-pb.od>maindec-8e-d0ja-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Random JMP-JMS Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0jc-d.pdf>maindec-8e-d0jc-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0jc-pb>maindec-8e-d0jc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0jc-pb.lbl>maindec-8e-d0jc-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0jc-pb.od>maindec-8e-d0jc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KE8-E (EAE) Instruction Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0la-pb>maindec-8e-d0la-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0la-pb.lbl>maindec-8e-d0la-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0la-pb.od>maindec-8e-d0la-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KE8-E (EAE) Instruction Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0lb-d.txt>maindec-8e-d0lb-d.txt</a><td>(Text write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0lb-pb>maindec-8e-d0lb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0lb-pb.lbl>maindec-8e-d0lb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0lb-pb.od>maindec-8e-d0lb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KE8-E (EAE) Instruction Test 2 Multiply and Divide
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ma-pb>maindec-8e-d0ma-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ma-pb.lbl>maindec-8e-d0ma-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0ma-pb.od>maindec-8e-d0ma-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KE8-E (EAE) Instruction Test 2 Multiply and Divide
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0mb-d.txt>maindec-8e-d0mb-d.txt</a><td>(Text write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0mb-pb>maindec-8e-d0mb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0mb-pb.lbl>maindec-8e-d0mb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d0mb-pb.od>maindec-8e-d0mb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>MM8E 4K Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1aa-pb>maindec-8e-d1aa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1aa-pb.lbl>maindec-8e-d1aa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1aa-pb.od>maindec-8e-d1aa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>MM8E 4K Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ab-d.pdf>maindec-8e-d1ab-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>KM8E 4K Extended Memory Checkerboard
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1bb-pb>maindec-8e-d1bb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1bb-pb.lbl>maindec-8e-d1bb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1bb-pb.od>maindec-8e-d1bb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ea-pm>maindec-8e-d1ea-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ea-pm.lbl>maindec-8e-d1ea-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ea-pm.od>maindec-8e-d1ea-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ec-d.pdf>maindec-8e-d1ec-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ec-pb>maindec-8e-d1ec-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ec-pb.lbl>maindec-8e-d1ec-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ec-pb.od>maindec-8e-d1ec-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP8E Extended Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fa-pb>maindec-8e-d1fa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fa-pb.lbl>maindec-8e-d1fa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fa-pb.od>maindec-8e-d1fa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP8E Extended Memory Address Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fb-d.pdf>maindec-8e-d1fb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fb-pb>maindec-8e-d1fb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fb-pb.lbl>maindec-8e-d1fb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1fb-pb.od>maindec-8e-d1fb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP8E Memory Power On/Off Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ga-pb>maindec-8e-d1ga-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ga-pb.lbl>maindec-8e-d1ga-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ga-pb.od>maindec-8e-d1ga-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP8E Memory Power On/Off Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb-d.pdf>maindec-8e-d1gb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb-pb>maindec-8e-d1gb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb-pb.lbl>maindec-8e-d1gb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb-pb.od>maindec-8e-d1gb-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb.bin>maindec-8e-d1gb.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb.bin.od>maindec-8e-d1gb.bin.od</a><td>(BIN format in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb.lst>maindec-8e-d1gb.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1gb.pal>maindec-8e-d1gb.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>PDP8E Memory Extension and Time Share Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ha-d.pdf>maindec-8e-d1ha-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ha-pb>maindec-8e-d1ha-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ha-pb.lbl>maindec-8e-d1ha-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ha-pb.od>maindec-8e-d1ha-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ha.bin>maindec-8e-d1ha.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ha.bin.od>maindec-8e-d1ha.bin.od</a><td>(BIN format in octal)<tr>
</table>
</tr><tr>
<td>PDP8E Memory Extension and Time Share Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1hb-d.pdf>maindec-8e-d1hb-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>MI8-E Bootstrap Diagnostic (Low, High)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ib-d.pdf>maindec-8e-d1ib-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ib-pb1>maindec-8e-d1ib-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ib-pb1.od>maindec-8e-d1ib-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ib-pb2>maindec-8e-d1ib-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1ib-pb2.od>maindec-8e-d1ib-pb2.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>MR8-E Read Only Memory Test (Low, High)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1jb-pb1>maindec-8e-d1jb-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1jb-pb1.od>maindec-8e-d1jb-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1jb-pb2>maindec-8e-d1jb-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d1jb-pb2.od>maindec-8e-d1jb-pb2.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Teletype Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2aa-pb>maindec-8e-d2aa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2aa-pb.lbl>maindec-8e-d2aa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2aa-pb.od>maindec-8e-d2aa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/E Teletype and KL8 Asynchronous Data Control Tests
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2ab-d-d.pdf>maindec-8e-d2ab-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>High Speed Reader/Punch Tests
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2ca-pb>maindec-8e-d2ca-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2ca-pb.od>maindec-8e-d2ca-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DecWriter (LA30) Control/Exerciser Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2fb-pb>maindec-8e-d2fb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d2fb-pb.od>maindec-8e-d2fb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TD8-E DECTape Diagnostic 
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d3aa-pb1>maindec-8e-d3aa-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d3aa-pb1.od>maindec-8e-d3aa-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d3aa-pb2>maindec-8e-d3aa-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d3aa-pb2.od>maindec-8e-d3aa-pb2.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP8E XY8-E Plotter Control and Display Diagnostic Program
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d6ab-pb>maindec-8e-d6ab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d6ab-pb.od>maindec-8e-d6ab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>AD8E/AM8E A-D Converter and Multiplexer Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d6bb-d-d.pdf>maindec-8e-d6bb-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>VC8-E Display Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d6ca-d.pdf>maindec-8e-d6ca-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DK8E Clocks Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d8ab-d-d.pdf>maindec-8e-d8ab-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DK8E Clocks Diagnostic (renamed to 08-DHDKA-A)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d8ac-d.pdf>maindec-8e-d8ac-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d8ac-pb>maindec-8e-d8ac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8e/d8ac-pb.od>maindec-8e-d8ac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>maindec-8i</b>: Diagnostics suitable only for the PDP-8/I.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>PDP-8/I Instruction Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01b-d.pdf>maindec-8i-d01b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01b-pb>maindec-8i-d01b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01b-pb.lbl>maindec-8i-d01b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01b-pb.od>maindec-8i-d01b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/I Instruction Test 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c-d.doc>maindec-8i-d01c-d.doc</a><td>(Word write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c-d.pdf>maindec-8i-d01c-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c-pb>maindec-8i-d01c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c-pb.lbl>maindec-8i-d01c-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c-pb.od>maindec-8i-d01c-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c.bin>maindec-8i-d01c.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c.lst>maindec-8i-d01c.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d01c.pal>maindec-8i-d01c.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>PDP-8/I Instruction Test 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d02b-d.doc>maindec-8i-d02b-d.doc</a><td>(Word write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d02b-d.pdf>maindec-8i-d02b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d02b-pb>maindec-8i-d02b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d02b-pb.lbl>maindec-8i-d02b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d02b-pb.od>maindec-8i-d02b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/I Instruction Test - Part 3A
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d0aa-pb>maindec-8i-d0aa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d0aa-pb.od>maindec-8i-d0aa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/I Instruction Test - Part 3B
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d0ba-d.pdf>maindec-8i-d0ba-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d0ba-pb>maindec-8i-d0ba-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d0ba-pb.lbl>maindec-8i-d0ba-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d0ba-pb.od>maindec-8i-d0ba-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>LE8/LP08 Line Printer Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d2ac-pb>maindec-8i-d2ac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d2ac-pb.od>maindec-8i-d2ac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32 Discless Logic Test, MiniDisc
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d5bb-d.pdf>maindec-8i-d5bb-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d5bb-pb>maindec-8i-d5bb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d5bb-pb.od>maindec-8i-d5bb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32D Discless Logic Test, MiniDisc
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d5fa-pb>maindec-8i-d5fa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d5fa-pb.od>maindec-8i-d5fa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>AX08 Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d6ab-d.pdf>maindec-8i-d6ab-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>KV8I Display Diagnostic
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d6ce-d.pdf>maindec-8i-d6ce-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d6ce-pb>maindec-8i-d6ce-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d6ce-pb.lbl>maindec-8i-d6ce-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d6ce-pb.od>maindec-8i-d6ce-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KW8I Real Time CLock
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d8ae-pb>maindec-8i-d8ae-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8i/d8ae-pb.od>maindec-8i-d8ae-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>maindec-8l</b>: Diagnostics suitable only for the PDP-8/L.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>8L Memory Protect Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d0aa-d.pdf>maindec-8l-d0aa-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>8L Memory Protect Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d0ab-pb>maindec-8l-d0ab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d0ab-pb.od>maindec-8l-d0ab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/L Extended Memory Control Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d1gc-pb>maindec-8l-d1gc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d1gc-pb.od>maindec-8l-d1gc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8/L Extended Memory Control Test (12K)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d1ha-pb>maindec-8l-d1ha-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./8l/d1ha-pb.od>maindec-8l-d1ha-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>maindec-x8</b>: Diagnostics suitable for the X8.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>DEC/X8 Module "TC12LT" TC12 LINCTape Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ddtca-a-pb>maindec-x8-ddtca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ddtca-a-pb.od>maindec-x8-ddtca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 EAE EDP Module
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhkea-a-pb>maindec-x8-dhkea-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhkea-a-pb.od>maindec-x8-dhkea-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 RK8 EDS Module
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhrka-a-pb>maindec-x8-dhrka-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhrka-a-pb.od>maindec-x8-dhrka-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 TA8-E Cassette System
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhtaa-a-pb>maindec-x8-dhtaa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhtaa-a-pb.od>maindec-x8-dhtaa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 DECtape System
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhtda-a-pb>maindec-x8-dhtda-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhtda-a-pb.od>maindec-x8-dhtda-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 TM8-E Magtape
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhtma-a-pb>maindec-x8-dhtma-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhtma-a-pb.od>maindec-x8-dhtma-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 VT8-E Display
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhvca-a-pb>maindec-x8-dhvca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhvca-a-pb.od>maindec-x8-dhvca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 VT8-E Display Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhvta-a-pb>maindec-x8-dhvta-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dhvta-a-pb.od>maindec-x8-dhvta-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 DC02 Module
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didca-a-pb>maindec-x8-didca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didca-a-pb.od>maindec-x8-didca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 DC08A Module
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didcb-a-pb>maindec-x8-didcb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didcb-a-pb.od>maindec-x8-didcb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "DF32DS" DF32/DF32D DECDisk System Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didfa-a-pb>maindec-x8-didfa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didfa-a-pb.od>maindec-x8-didfa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "TIMERA" Real Time Clock Elapsed Time Reporter, Job Dead Checker, and Rotation Randomizer
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didka-c-pb>maindec-x8-didka-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/didka-c-pb.od>maindec-x8-didka-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "FPP12"
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/difpa-a-pb>maindec-x8-difpa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/difpa-a-pb.od>maindec-x8-difpa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "MRI08A" Memory Reference Instruction Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikaa-a-pb>maindec-x8-dikaa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikaa-a-pb.od>maindec-x8-dikaa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "DF32DS" DF32/DF32D DECDisk System Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikab-a-pb>maindec-x8-dikab-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikab-a-pb.od>maindec-x8-dikab-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "OPERATE" Operate Instruction Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikac-b-d.pdf>maindec-x8-dikac-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikac-b-pb>maindec-x8-dikac-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikac-b-pb.od>maindec-x8-dikac-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "DF32DS" DF32/DF32D DECDisk System Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikad-b-d.pdf>maindec-x8-dikad-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikad-b-pb>maindec-x8-dikad-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikad-b-pb.od>maindec-x8-dikad-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "EAEALL" EAE Exerciser of MUY, DVI, SHL, LSR and NMI Instructions
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikea-b-d.pdf>maindec-x8-dikea-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikea-b-pb>maindec-x8-dikea-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikea-b-pb.od>maindec-x8-dikea-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 KL8, PT08 TTY Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikla-a-d.pdf>maindec-x8-dikla-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikla-a-pb>maindec-x8-dikla-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dikla-a-pb.od>maindec-x8-dikla-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 KL8E/F/J Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/diklb-b-d.pdf>maindec-x8-diklb-b-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DEC/X8 KL8A Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/diklc-a-d.pdf>maindec-x8-diklc-a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "PRINTER" Printer Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dilpa-b-pb>maindec-x8-dilpa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dilpa-b-pb.od>maindec-x8-dilpa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Typesetting Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dipaa-a-pb>maindec-x8-dipaa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dipaa-a-pb.od>maindec-x8-dipaa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "HSRHSP" High Speed Reader/Punch Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dipca-a-pb>maindec-x8-dipca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dipca-a-pb.od>maindec-x8-dipca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 User's Guide Monitor/Builder
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/diqab-b-pb>maindec-x8-diqab-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/diqab-b-pb.od>maindec-x8-diqab-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 User's Guide Monitor/Builder
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/diqab-d-d.pdf>maindec-x8-diqab-d-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DEC/X8 Software Module Index
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/diqaf-j-d.pdf>maindec-x8-diqaf-j-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "RF08DS" RF08 Disk System Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dirfa-a-d.pdf>maindec-x8-dirfa-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dirfa-a-pb>maindec-x8-dirfa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dirfa-a-pb.od>maindec-x8-dirfa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "RK8DS" RK8 Disk System Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dirka-a-d.pdf>maindec-x8-dirka-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dirka-a-pb>maindec-x8-dirka-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dirka-a-pb.od>maindec-x8-dirka-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "TC01DT" TC01/TC08 DECTape Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditca-b-d.pdf>maindec-x8-ditca-b-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditca-b-pb>maindec-x8-ditca-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditca-b-pb.od>maindec-x8-ditca-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "TC58MT" TC58 DECMagtape Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-a-dg.htm>maindec-x8-ditcb-a-dg.htm</a><td>(Saved web page)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-a-pb>maindec-x8-ditcb-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-a-pb.od>maindec-x8-ditcb-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "DF32DS" DF32/DF32D DECDisk System Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-b-pb>maindec-x8-ditcb-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-b-pb.od>maindec-x8-ditcb-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "TC58MT" TC58 DECMagtape Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-c-d.pdf>maindec-x8-ditcb-c-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-c-pb>maindec-x8-ditcb-c-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/ditcb-c-pb.od>maindec-x8-ditcb-c-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "PLOTTER" Incremental Plotter Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dixya-a-d.pdf>maindec-x8-dixya-a-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dixya-a-pb>maindec-x8-dixya-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/dixya-a-pb.od>maindec-x8-dixya-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DEC/X8 Module "FPP8-A" FPP8-A Exerciser
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/maindec/./x8/djfpa-a-d.pdf>maindec-x8-djfpa-a-d.pdf</a><td>(PDF write-up)<tr>
</table>
</table>
</FIELDSET>
</FIELDSET>
<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
