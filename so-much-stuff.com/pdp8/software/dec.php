<?php
  $title = "$DIR Software Files";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>
<BODY><FONT size=4>
This is an archive of the DEC-xx software titles.
<P>
Since the files are organized by DEC part number, a 
word about part numbers is probably in order.  A DEC part number
might look like any of these:
        dec-812-pb
        dec-08-d01a-pb
        dec-08-d01a-b-pb
        ac-6527d-ma
depending on the vintage of the title in question.
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
<table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>Single Precision Integer Multiply
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-2b-a-sym>dec-5-2b-a-sym</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-2b-a-sym.od>dec-5-2b-a-sym.od</a><td>(DEC PAL tape, octal image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-2b-a.bin>dec-5-2b-a.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-2b-a.lst>dec-5-2b-a.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-2b-a.pal>dec-5-2b-a.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>Double Precision Integer Multiply
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-33b-a-pa>dec-5-33b-a-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-33b-a-pa.od>dec-5-33b-a-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-33b-a.bin>dec-5-33b-a.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-33b-a.lst>dec-5-33b-a.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-33b-a.pal>dec-5-33b-a.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>Double Precision Integer Divide
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-34-a-pa>dec-5-34-a-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-34-a-pa.od>dec-5-34-a-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-34-a.bin>dec-5-34-a.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-34-a.lst>dec-5-34-a.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-34-a.pal>dec-5-34-a.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>BCD to Binary Conversion
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-4-a-pa>dec-5-4-a-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-4-a-pa.od>dec-5-4-a-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-4-a.bin>dec-5-4-a.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-4-a.lst>dec-5-4-a.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./5-4-a.pal>dec-5-4-a.pal</a><td>(PAL source)<tr>
</table>
</table>
<FIELDSET><LEGEND>
  <b>dec-08</b>: Titles suitable for more than one PDP-8 environment.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>8K Fortran Compiler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b1-pb>dec-08-a2b1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b1-pb.lbl>dec-08-a2b1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b1-pb.od>dec-08-a2b1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>8 to 32K Linking Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b3-pb>dec-08-a2b3-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b3-pb.lbl>dec-08-a2b3-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b3-pb.od>dec-08-a2b3-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>8K Fortran Library Subroutines 1/2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b4-pr>dec-08-a2b4-pr</a><td>(Fortran Library image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b4-pr.lbl>dec-08-a2b4-pr.lbl</a><td>(Fortran Library image label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b4-pr.od>dec-08-a2b4-pr.od</a><td>(Fortran Library image in octal)<tr>
</table>
</tr><tr>
<td>8K Fortran Library Subroutines 2/2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b5-pr>dec-08-a2b5-pr</a><td>(Fortran Library image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b5-pr.lbl>dec-08-a2b5-pr.lbl</a><td>(Fortran Library image label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b5-pr.od>dec-08-a2b5-pr.od</a><td>(Fortran Library image in octal)<tr>
</table>
</tr><tr>
<td>8K Fortran Library Dectape I/O
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b6-pr>dec-08-a2b6-pr</a><td>(Fortran Library image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b6-pr.lbl>dec-08-a2b6-pr.lbl</a><td>(Fortran Library image label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2b6-pr.od>dec-08-a2b6-pr.od</a><td>(Fortran Library image in octal)<tr>
</table>
</tr><tr>
<td>8K SABR Assembler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2c2-pb>dec-08-a2c2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2c2-pb.lbl>dec-08-a2c2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2c2-pb.od>dec-08-a2c2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>8K-32K Linking Loader (PT Version)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2c3-pb>dec-08-a2c3-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2c3-pb.lbl>dec-08-a2c3-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/a2c3-pb.od>dec-08-a2c3-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran Symbol Print
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afa2-pb>dec-08-afa2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afa2-pb.lbl>dec-08-afa2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afa2-pb.od>dec-08-afa2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran Compiler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afc1-pb>dec-08-afc1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afc1-pb.lbl>dec-08-afc1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afc1-pb.od>dec-08-afc1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran Operating System
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afc3-pb>dec-08-afc3-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afc3-pb.lbl>dec-08-afc3-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/afc3-pb.od>dec-08-afc3-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Utility Overlays for Focal 1969 (4 word, 8K)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj1e-pb>dec-08-aj1e-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj1e-pb.lbl>dec-08-aj1e-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj1e-pb.od>dec-08-aj1e-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Four User Focal 1969 Overlay (Quad)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj2e-4-11-69-pb>dec-08-aj2e-4-11-69-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj2e-4-11-69-pb.lbl>dec-08-aj2e-4-11-69-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj2e-4-11-69-pb.od>dec-08-aj2e-4-11-69-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Graphics Overlays for Focal 1969
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj2e-7-09-69-pb>dec-08-aj2e-7-09-69-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj2e-7-09-69-pb.lbl>dec-08-aj2e-7-09-69-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj2e-7-09-69-pb.od>dec-08-aj2e-7-09-69-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>CLINE Overlay for Focal 1969
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj3e-pb>dec-08-aj3e-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj3e-pb.lbl>dec-08-aj3e-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj3e-pb.od>dec-08-aj3e-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Multiuser Overlays for Focal 1969
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj6e-pb>dec-08-aj6e-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj6e-pb.lbl>dec-08-aj6e-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/aj6e-pb.od>dec-08-aj6e-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Focal, 1968 + Initial Dialogue
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajab-d.pdf>dec-08-ajab-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajab-pb>dec-08-ajab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajab-pb.lbl>dec-08-ajab-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajab-pb.od>dec-08-ajab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Focal, 1969 + Initial Dialogue
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajae-pb>dec-08-ajae-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajae-pb.lbl>dec-08-ajae-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ajae-pb.od>dec-08-ajae-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PAL III Assembler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/asb1-pb>dec-08-asb1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/asb1-pb.lbl>dec-08-asb1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/asb1-pb.od>dec-08-asb1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DDT Debugger
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cdda-pb>dec-08-cdda-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cdda-pb.lbl>dec-08-cdda-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cdda-pb.od>dec-08-cdda-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DDT-8 Debugger
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cddb-pb>dec-08-cddb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cddb-pb.lbl>dec-08-cddb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cddb-pb.od>dec-08-cddb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>MACRO-8
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cmaa-d.pdf>dec-08-cmaa-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cmaa-pb>dec-08-cmaa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/cmaa-pb.od>dec-08-cmaa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>ODT Debugger (Low)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/coc1-pb>dec-08-coc1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/coc1-pb.lbl>dec-08-coc1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/coc1-pb.od>dec-08-coc1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>ODT Debugger (High)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/coc2-pb>dec-08-coc2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/coc2-pb.lbl>dec-08-coc2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/coc2-pb.od>dec-08-coc2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>High Speed Reader/Punch Tests
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d2ge-pb>dec-08-d2ge-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d2ge-pb.lbl>dec-08-d2ge-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d2ge-pb.od>dec-08-d2ge-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32 Disc Data, Interface, Address, Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d5cc-pb>dec-08-d5cc-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d5cc-pb.lbl>dec-08-d5cc-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d5cc-pb.od>dec-08-d5cc-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DF32 Multi Disc
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d5db-pb>dec-08-d5db-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d5db-pb.lbl>dec-08-d5db-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d5db-pb.od>dec-08-d5db-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DP01A Bit Synchronous IOT and Data Test
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d8fa-pb>dec-08-d8fa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d8fa-pb.lbl>dec-08-d8fa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/d8fa-pb.od>dec-08-d8fa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Symbolic Tape Editor
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esa2-pb>dec-08-esa2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esa2-pb.lbl>dec-08-esa2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esa2-pb.od>dec-08-esa2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Symbolic Tape Editor
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac-pa>dec-08-esac-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac-pb>dec-08-esac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac-pb.lbl>dec-08-esac-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac-pb.od>dec-08-esac-pb.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac.bin>dec-08-esac.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac.lst>dec-08-esac.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/esac.pal>dec-08-esac.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>TC01-TU55 DECtape Formatter
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/eufb-pb>dec-08-eufb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/eufb-pb.lbl>dec-08-eufb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/eufb-pb.od>dec-08-eufb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Double Precision Sine Routine
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmfb-pa>dec-08-fmfb-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmfb-pa.lbl>dec-08-fmfb-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmfb-pa.od>dec-08-fmfb-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmfb-pa.txt>dec-08-fmfb-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Four-word Floating Point Package
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmha-pb>dec-08-fmha-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmha-pb.lbl>dec-08-fmha-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/fmha-pb.od>dec-08-fmha-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Focal 1969 disassembly
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/focal69.bin>dec-08-focal69.bin</a><td>(BIN format)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/focal69.lst>dec-08-focal69.lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/focal69.pal>dec-08-focal69.pal</a><td>(PAL source)<tr>
</table>
</tr><tr>
<td>BIN Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lbaa-d.pdf>dec-08-lbaa-d.pdf</a><td>(PDF write-up)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lbaa-pm>dec-08-lbaa-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lbaa-pm.lbl>dec-08-lbaa-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lbaa-pm.od>dec-08-lbaa-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>Focal-8 Family of 8 Overlay
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lfoca-a-pb>dec-08-lfoca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lfoca-a-pb.lbl>dec-08-lfoca-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lfoca-a-pb.od>dec-08-lfoca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Help Bootstrap Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lha1-pb>dec-08-lha1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lha1-pb.lbl>dec-08-lha1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lha1-pb.od>dec-08-lha1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Help Bootstrap Generator
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lha2-pb>dec-08-lha2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lha2-pb.lbl>dec-08-lha2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lha2-pb.od>dec-08-lha2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PAL III, replaces DEC-08-ASB1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lpala-a-pb>dec-08-lpala-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lpala-a-pb.lbl>dec-08-lpala-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/lpala-a-pb.od>dec-08-lpala-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>TC01 Bootstrap Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/luaa-pm>dec-08-luaa-pm</a><td>(RIM image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/luaa-pm.lbl>dec-08-luaa-pm.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/luaa-pm.od>dec-08-luaa-pm.od</a><td>(RIM image in octal)<tr>
</table>
</tr><tr>
<td>PDP-8 23 Bit Floating Point Package (1972)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/nfppa-a-pb>dec-08-nfppa-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/nfppa-a-pb.lbl>dec-08-nfppa-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/nfppa-a-pb.od>dec-08-nfppa-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RIM Punch (Low)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/pmp1-pb>dec-08-pmp1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/pmp1-pb.lbl>dec-08-pmp1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/pmp1-pb.od>dec-08-pmp1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RIM Punch (High)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/pmp2-pb>dec-08-pmp2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/pmp2-pb.lbl>dec-08-pmp2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/pmp2-pb.od>dec-08-pmp2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Dectape Subroutines
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/suco-pa>dec-08-suco-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/suco-pa.lbl>dec-08-suco-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/suco-pa.od>dec-08-suco-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/suco-pa.txt>dec-08-suco-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>160AX Interface for PDP8
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa0-pb>dec-08-usa0-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa0-pb.lbl>dec-08-usa0-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa0-pb.od>dec-08-usa0-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Single Parameter Height Analysis, AC Mode 160AX
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa1-pb>dec-08-usa1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa1-pb.lbl>dec-08-usa1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa1-pb.od>dec-08-usa1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Dual Parameter Height Analysis, AC Mode 160AX
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa2-pb>dec-08-usa2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa2-pb.lbl>dec-08-usa2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/usa2-pb.od>dec-08-usa2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>KV8/I Character Generator
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yisb-pa>dec-08-yisb-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yisb-pa.lbl>dec-08-yisb-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yisb-pa.od>dec-08-yisb-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yisb-pa.txt>dec-08-yisb-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Octal Memory Dump
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yppa-pb>dec-08-yppa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yppa-pb.od>dec-08-yppa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DECtape Copy Routine
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ypta-pb>dec-08-ypta-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ypta-pb.lbl>dec-08-ypta-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/ypta-pb.od>dec-08-ypta-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 1 (Basic System)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq1a-pb>dec-08-yq1a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq1a-pb.lbl>dec-08-yq1a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq1a-pb.od>dec-08-yq1a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 1 (Basic System)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq1b-pb>dec-08-yq1b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq1b-pb.lbl>dec-08-yq1b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq1b-pb.od>dec-08-yq1b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 2 (Interpreter + I/O Controller)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq2a-pb>dec-08-yq2a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq2a-pb.lbl>dec-08-yq2a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq2a-pb.od>dec-08-yq2a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 3 (Interpreter + Extended Functions)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq3a-pb>dec-08-yq3a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq3a-pb.lbl>dec-08-yq3a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq3a-pb.od>dec-08-yq3a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 3 (Interpreter + Extended Functions)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq3b-pb>dec-08-yq3b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq3b-pb.lbl>dec-08-yq3b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq3b-pb.od>dec-08-yq3b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 4 (Interpreter + I/O + Extended)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq4a-pb>dec-08-yq4a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq4a-pb.lbl>dec-08-yq4a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq4a-pb.od>dec-08-yq4a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Floating Point Package 4 (Interpreter + I/O + Extended)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq4b-pb>dec-08-yq4b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq4b-pb.lbl>dec-08-yq4b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yq4b-pb.od>dec-08-yq4b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>BIN Punch (ASR33 Teletype)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yx1a-pb>dec-08-yx1a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yx1a-pb.lbl>dec-08-yx1a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/yx1a-pb.od>dec-08-yx1a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Edgrin Translator (3 parts)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-pb>dec-08-zj2b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-pb.lbl>dec-08-zj2b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-pb.od>dec-08-zj2b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Edgrin Translator 1/3
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-1-pa>dec-08-zj2b-1-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-1-pa.lbl>dec-08-zj2b-1-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-1-pa.od>dec-08-zj2b-1-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-1-pa.txt>dec-08-zj2b-1-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Edgrin Translator 2/3
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-2-pa>dec-08-zj2b-2-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-2-pa.lbl>dec-08-zj2b-2-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-2-pa.od>dec-08-zj2b-2-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-2-pa.txt>dec-08-zj2b-2-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Edgrin Translator 3/3
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-3-pa>dec-08-zj2b-3-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-3-pa.lbl>dec-08-zj2b-3-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-3-pa.od>dec-08-zj2b-3-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj2b-3-pa.txt>dec-08-zj2b-3-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Edgrin Cursor Mosiac
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj4b-pa>dec-08-zj4b-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj4b-pa.lbl>dec-08-zj4b-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj4b-pa.od>dec-08-zj4b-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj4b-pa.txt>dec-08-zj4b-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Disk Editor Translator
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj5b-pb>dec-08-zj5b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj5b-pb.lbl>dec-08-zj5b-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj5b-pb.od>dec-08-zj5b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>RF08 Disk Editor Translator
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj6a-pb>dec-08-zj6a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj6a-pb.lbl>dec-08-zj6a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./08/zj6a-pb.od>dec-08-zj6a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-12</b>: Titles suitable for the PDP-12.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>OS/12 FORTRAN IV ADC Routine
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa1>dec-12-lliba-b-pa1</a><td>(DEC PAL tape #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa1.lbl.jpg>dec-12-lliba-b-pa1.lbl.jpg</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa1.od>dec-12-lliba-b-pa1.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa1.txt>dec-12-lliba-b-pa1.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa2>dec-12-lliba-b-pa2</a><td>(DEC PAL tape #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa2.lbl.jpg>dec-12-lliba-b-pa2.lbl.jpg</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa2.od>dec-12-lliba-b-pa2.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa2.txt>dec-12-lliba-b-pa2.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa3>dec-12-lliba-b-pa3</a><td>(DEC PAL tape #3)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa3.lbl>dec-12-lliba-b-pa3.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa3.lbl.jpg>dec-12-lliba-b-pa3.lbl.jpg</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa3.od>dec-12-lliba-b-pa3.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./12/lliba-b-pa3.txt>dec-12-lliba-b-pa3.txt</a><td>(PAL Source as text file)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-8e</b>: Titles suitable for the PDP-8/E.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>Focal-8 and Init
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/lfoca-a-pb>dec-8e-lfoca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/lfoca-a-pb.lbl>dec-8e-lfoca-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/lfoca-a-pb.od>dec-8e-lfoca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Focal-8 Quad
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/lquda-a-pb>dec-8e-lquda-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/lquda-a-pb.lbl>dec-8e-lquda-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/lquda-a-pb.od>dec-8e-lquda-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Self Starting Binary Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/xbina-a-pb>dec-8e-xbina-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/xbina-a-pb.lbl>dec-8e-xbina-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./8e/xbina-a-pb.od>dec-8e-xbina-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-cp</b>: I don't know which product line these were for.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>Quickpoint Floating Point Package V. D 1
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa1-pb>dec-cp-qpa1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa1-pb.lbl>dec-cp-qpa1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa1-pb.od>dec-cp-qpa1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Quickpoint Floating Point Package V. D 2
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa2-pb>dec-cp-qpa2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa2-pb.lbl>dec-cp-qpa2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa2-pb.od>dec-cp-qpa2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Quickpoint EIA to ASCII Conversion
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa3-pb>dec-cp-qpa3-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa3-pb.lbl>dec-cp-qpa3-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa3-pb.od>dec-cp-qpa3-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Quickpoint Parity Check
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa4-pb>dec-cp-qpa4-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa4-pb.lbl>dec-cp-qpa4-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./cp/qpa4-pb.od>dec-cp-qpa4-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-d8</b>: Titles intended for the Disk Monitor System.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>Fortran D Compiler Loader (FORT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa1-pb>dec-d8-afa1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa1-pb.lbl>dec-d8-afa1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa1-pb.od>dec-d8-afa1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran D Compiler Loader (.FT.)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa2-pb>dec-d8-afa2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa2-pb.lbl>dec-d8-afa2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa2-pb.od>dec-d8-afa2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran D Operating System Loader (FOSL)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa3-pb>dec-d8-afa3-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa3-pb.lbl>dec-d8-afa3-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa3-pb.od>dec-d8-afa3-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran D Operating System (.OS.)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa4-pb>dec-d8-afa4-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa4-pb.lbl>dec-d8-afa4-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa4-pb.od>dec-d8-afa4-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran D Symbol Print (STBL)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa5-pb>dec-d8-afa5-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa5-pb.lbl>dec-d8-afa5-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa5-pb.od>dec-d8-afa5-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Fortran D Daignose (DIAG)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa6-pb>dec-d8-afa6-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa6-pb.lbl>dec-d8-afa6-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/afa6-pb.od>dec-d8-afa6-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Diak Assembler (PALD)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/asab-pb>dec-d8-asab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/asab-pb.lbl>dec-d8-asab-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/asab-pb.od>dec-d8-asab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Diak Assembler (PALD)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/asac-pb>dec-d8-asac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/asac-pb.lbl>dec-d8-asac-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/asac-pb.od>dec-d8-asac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System DDT Driver (DDT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pa>dec-d8-cdd1-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pa.lbl>dec-d8-cdd1-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pa.od>dec-d8-cdd1-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pa.txt>dec-d8-cdd1-pa.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pb>dec-d8-cdd1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pb.lbl>dec-d8-cdd1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd1-pb.od>dec-d8-cdd1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System DDT (.DDT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd2-pb>dec-d8-cdd2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd2-pb.lbl>dec-d8-cdd2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cdd2-pb.od>dec-d8-cdd2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System DDT Driver (DDT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pa>dec-d8-cde1-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pa.lbl>dec-d8-cde1-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pa.od>dec-d8-cde1-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pa.txt>dec-d8-cde1-pa.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pb>dec-d8-cde1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pb.lbl>dec-d8-cde1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde1-pb.od>dec-d8-cde1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System DDT (.DDT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde2-pb>dec-d8-cde2-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde2-pb.lbl>dec-d8-cde2-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/cde2-pb.od>dec-d8-cde2-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System Editor (EDIT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esab-pb>dec-d8-esab-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esab-pb.lbl>dec-d8-esab-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esab-pb.od>dec-d8-esab-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System Editor (EDIT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esac-pb>dec-d8-esac-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esac-pb.lbl>dec-d8-esac-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esac-pb.od>dec-d8-esac-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System Editor (EDIT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esad-pb>dec-d8-esad-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esad-pb.lbl>dec-d8-esad-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/esad-pb.od>dec-d8-esad-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DisK System PIP-DF32 (PIP)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdaa-pb>dec-d8-pdaa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdaa-pb.lbl>dec-d8-pdaa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdaa-pb.od>dec-d8-pdaa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DisK System PIP-DF32 (PIP)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdad-pb>dec-d8-pdad-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdad-pb.lbl>dec-d8-pdad-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdad-pb.od>dec-d8-pdad-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>DisK System PIP-DF32 (PIP)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdad-12-30-69-pb>dec-d8-pdad-12-30-69-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdad-12-30-69-pb.lbl>dec-d8-pdad-12-30-69-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdad-12-30-69-pb.od>dec-d8-pdad-12-30-69-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System PIP-RF08 (PIP)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdze-pb>dec-d8-pdze-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdze-pb.lbl>dec-d8-pdze-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/pdze-pb.od>dec-d8-pdze-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System Restore
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-lst>dec-d8-rwda-lst</a><td>(PAL listing)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-lst.lbl>dec-d8-rwda-lst.lbl</a><td>(PAL listing tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-lst.od>dec-d8-rwda-lst.od</a><td>(PAL listing as octal image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-lst.txt>dec-d8-rwda-lst.txt</a><td>(PAL listing as a text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-pa>dec-d8-rwda-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-pa.lbl>dec-d8-rwda-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-pa.od>dec-d8-rwda-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/rwda-pa.txt>dec-d8-rwda-pa.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>Patch D8-SBAE (R022A.PAT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sba1-pb>dec-d8-sba1-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sba1-pb.lbl>dec-d8-sba1-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sba1-pb.od>dec-d8-sba1-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System Builder for RF08
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sbae-pb>dec-d8-sbae-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sbae-pb.lbl>dec-d8-sbae-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sbae-pb.od>dec-d8-sbae-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>Disk System Builder for DF32/RF08
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sbaf-pb>dec-d8-sbaf-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sbaf-pb.lbl>dec-d8-sbaf-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./d8/sbaf-pb.od>dec-d8-sbaf-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-l8</b>: Titles intended for the LINC-8.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>SUDSY II Prolog (Test 0)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./l8/d0ba-pb>dec-l8-d0ba-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./l8/d0ba-pb.lbl>dec-l8-d0ba-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./l8/d0ba-pb.od>dec-l8-d0ba-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-p8</b>: Titles intended for PS/8.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>PS/8 DEC Config (DECtape)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw0a-pb>dec-p8-mw0a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw0a-pb.lbl>dec-p8-mw0a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw0a-pb.od>dec-p8-mw0a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PS/8 DEC Config (RK8)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw1a-pb>dec-p8-mw1a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw1a-pb.lbl>dec-p8-mw1a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw1a-pb.od>dec-p8-mw1a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PS/8 DEC Config (RF08)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw2a-pb>dec-p8-mw2a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw2a-pb.lbl>dec-p8-mw2a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw2a-pb.od>dec-p8-mw2a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PS/8 DEC Config (DF32)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw3a-pb>dec-p8-mw3a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw3a-pb.lbl>dec-p8-mw3a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mw3a-pb.od>dec-p8-mw3a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PS/8 Binary Tape
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mwza-pb>dec-p8-mwza-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mwza-pb.lbl>dec-p8-mwza-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/mwza-pb.od>dec-p8-mwza-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PS/8 Command Decoder
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/swxb-pb>dec-p8-swxb-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/swxb-pb.lbl>dec-p8-swxb-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/swxb-pb.od>dec-p8-swxb-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>PS/8 CREF
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/yrxa-pb>dec-p8-yrxa-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/yrxa-pb.lbl>dec-p8-yrxa-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./p8/yrxa-pb.od>dec-p8-yrxa-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
<FIELDSET><LEGEND>
  <b>dec-s8</b>: Titles suitable for the OS/8 environment.

</LEGEND><table width=100% border=1>
<col width=50%>
<col width=50%>
</tr><tr>
<td>BASIC-8 (8K)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb1>dec-s8-lbasa-a-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb1.od>dec-s8-lbasa-a-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb2>dec-s8-lbasa-a-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb2.od>dec-s8-lbasa-a-pb2.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb3>dec-s8-lbasa-a-pb3</a><td>(BIN image #3)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb3.od>dec-s8-lbasa-a-pb3.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb4>dec-s8-lbasa-a-pb4</a><td>(BIN image #4)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb4.od>dec-s8-lbasa-a-pb4.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb5>dec-s8-lbasa-a-pb5</a><td>(BIN image #5)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lbasa-a-pb5.od>dec-s8-lbasa-a-pb5.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN IV Compiler (F4.SV)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps1>dec-s8-lfiva-b-ps1</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps1.lbl.jpg>dec-s8-lfiva-b-ps1.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps1.od>dec-s8-lfiva-b-ps1.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps2>dec-s8-lfiva-b-ps2</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps2.lbl.jpg>dec-s8-lfiva-b-ps2.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps2.od>dec-s8-lfiva-b-ps2.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps3>dec-s8-lfiva-b-ps3</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps3.lbl.jpg>dec-s8-lfiva-b-ps3.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps3.od>dec-s8-lfiva-b-ps3.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps4>dec-s8-lfiva-b-ps4</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps4.lbl.jpg>dec-s8-lfiva-b-ps4.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfiva-b-ps4.od>dec-s8-lfiva-b-ps4.od</a><td>(OS/8 .SV image octal dump)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN II Compiler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfora-b-pb>dec-s8-lfora-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfora-b-pb.lbl.jpg>dec-s8-lfora-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lfora-b-pb.od>dec-s8-lfora-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN IV Librarian (LIBRA)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/llbra-b-ps>dec-s8-llbra-b-ps</a><td>(OS/8 .SV image (paper tape))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/llbra-b-ps.od>dec-s8-llbra-b-ps.od</a><td>(OS/8 .SV image octal dump)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN IV Library (FORLIB)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps1>dec-s8-lliba-b-ps1</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps1.lbl.jpg>dec-s8-lliba-b-ps1.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps1.od>dec-s8-lliba-b-ps1.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps2>dec-s8-lliba-b-ps2</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps2.lbl.jpg>dec-s8-lliba-b-ps2.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps2.od>dec-s8-lliba-b-ps2.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps3>dec-s8-lliba-b-ps3</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps3.lbl.jpg>dec-s8-lliba-b-ps3.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps3.od>dec-s8-lliba-b-ps3.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps4>dec-s8-lliba-b-ps4</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps4.lbl.jpg>dec-s8-lliba-b-ps4.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps4.od>dec-s8-lliba-b-ps4.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps5>dec-s8-lliba-b-ps5</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps5.lbl.jpg>dec-s8-lliba-b-ps5.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps5.od>dec-s8-lliba-b-ps5.od</a><td>(OS/8 .SV image octal dump)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps6>dec-s8-lliba-b-ps6</a><td>(OS/8 .SV image (paper tape #1))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps6.lbl.jpg>dec-s8-lliba-b-ps6.lbl.jpg</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lliba-b-ps6.od>dec-s8-lliba-b-ps6.od</a><td>(OS/8 .SV image octal dump)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAM IV Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lloda-b-ps>dec-s8-lloda-b-ps</a><td>(OS/8 .SV image (paper tape))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lloda-b-ps.od>dec-s8-lloda-b-ps.od</a><td>(OS/8 .SV image octal dump)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN IV RALF
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lrafa-b-ps>dec-s8-lrafa-b-ps</a><td>(OS/8 .SV image (paper tape))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lrafa-b-ps.od>dec-s8-lrafa-b-ps.od</a><td>(OS/8 .SV image octal dump)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN IV V02 FRTS.SV
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lrtsa-b-ps>dec-s8-lrtsa-b-ps</a><td>(OS/8 .SV image (paper tape))<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lrtsa-b-ps.lbl>dec-s8-lrtsa-b-ps.lbl</a><td>(OS/8 .SV image tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/lrtsa-b-ps.od>dec-s8-lrtsa-b-ps.od</a><td>(OS/8 .SV image octal dump)<tr>
</table>
</tr><tr>
<td>OS/8 Auxiliary Device Drivers
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/obada-b-pb>dec-s8-obada-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/obada-b-pb.od>dec-s8-obada-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Batch
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/obata-a-pb>dec-s8-obata-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/obata-a-pb.od>dec-s8-obata-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Builder (BUILD)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oblda-b-pb>dec-s8-oblda-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oblda-b-pb.od>dec-s8-oblda-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Configuration (CONFIG)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa1>dec-s8-ocfga-b-pa1</a><td>(DEC PAL tape #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa1.lbl.jpg>dec-s8-ocfga-b-pa1.lbl.jpg</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa1.od>dec-s8-ocfga-b-pa1.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa1.txt>dec-s8-ocfga-b-pa1.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa2>dec-s8-ocfga-b-pa2</a><td>(DEC PAL tape #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa2.lbl.jpg>dec-s8-ocfga-b-pa2.lbl.jpg</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa2.od>dec-s8-ocfga-b-pa2.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa2.txt>dec-s8-ocfga-b-pa2.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa3>dec-s8-ocfga-b-pa3</a><td>(DEC PAL tape #3)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa3.lbl.jpg>dec-s8-ocfga-b-pa3.lbl.jpg</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa3.od>dec-s8-ocfga-b-pa3.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocfga-b-pa3.txt>dec-s8-ocfga-b-pa3.txt</a><td>(PAL Source as text file)<tr>
</table>
</tr><tr>
<td>OS/8 Command Decoder/ODT
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocmda-b-pb>dec-s8-ocmda-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocmda-b-pb.od>dec-s8-ocmda-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Cross Reverence Program (CREF)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocrfa-b-pb>dec-s8-ocrfa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocrfa-b-pb.lbl.jpg>dec-s8-ocrfa-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ocrfa-b-pb.od>dec-s8-ocrfa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 DF32 Configure
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oddfa-b-pb>dec-s8-oddfa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oddfa-b-pb.od>dec-s8-oddfa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 RF08 Configure
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/odrfa-b-pb>dec-s8-odrfa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/odrfa-b-pb.od>dec-s8-odrfa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 RK8 Configure
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/odrka-b-pb>dec-s8-odrka-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/odrka-b-pb.od>dec-s8-odrka-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Editor (EDIT)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oedta-b-pb>dec-s8-oedta-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oedta-b-pb.lbl.jpg>dec-s8-oedta-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oedta-b-pb.od>dec-s8-oedta-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 FORTRAN Library (LIB 8)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oliba-b-pr>dec-s8-oliba-b-pr</a><td>(Fortran Library image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oliba-b-pr.od>dec-s8-oliba-b-pr.od</a><td>(Fortran Library image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Linking Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ollda-b-pb>dec-s8-ollda-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ollda-b-pb.lbl.jpg>dec-s8-ollda-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ollda-b-pb.od>dec-s8-ollda-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Library Setup (LIBSET)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/olsta-b-pb>dec-s8-olsta-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/olsta-b-pb.od>dec-s8-olsta-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Monitor and Absolute Loader
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oos8a-b-pb>dec-s8-oos8a-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/oos8a-b-pb.od>dec-s8-oos8a-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 PAL 8 Assembler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/opala-b-pb>dec-s8-opala-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/opala-b-pb.lbl.jpg>dec-s8-opala-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/opala-b-pb.od>dec-s8-opala-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 PIP
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/opipa-b-pb>dec-s8-opipa-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/opipa-b-pb.lbl.jpg>dec-s8-opipa-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/opipa-b-pb.od>dec-s8-opipa-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 SABR Assembler
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osaba-b-pb>dec-s8-osaba-b-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osaba-b-pb.lbl.jpg>dec-s8-osaba-b-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osaba-b-pb.od>dec-s8-osaba-b-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 VIII Base System
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa>dec-s8-osysb-a-pa</a><td>(DEC PAL tape)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa.lbl>dec-s8-osysb-a-pa.lbl</a><td>(PAL Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa.od>dec-s8-osysb-a-pa.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa.txt>dec-s8-osysb-a-pa.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa1>dec-s8-osysb-a-pa1</a><td>(DEC PAL tape #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa1.od>dec-s8-osysb-a-pa1.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa1.txt>dec-s8-osysb-a-pa1.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa2>dec-s8-osysb-a-pa2</a><td>(DEC PAL tape #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa2.od>dec-s8-osysb-a-pa2.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa2.txt>dec-s8-osysb-a-pa2.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa3>dec-s8-osysb-a-pa3</a><td>(DEC PAL tape #3)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa3.od>dec-s8-osysb-a-pa3.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa3.txt>dec-s8-osysb-a-pa3.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa4>dec-s8-osysb-a-pa4</a><td>(DEC PAL tape #4)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa4.od>dec-s8-osysb-a-pa4.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa4.txt>dec-s8-osysb-a-pa4.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa5>dec-s8-osysb-a-pa5</a><td>(DEC PAL tape #5)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa5.od>dec-s8-osysb-a-pa5.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa5.txt>dec-s8-osysb-a-pa5.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa6>dec-s8-osysb-a-pa6</a><td>(DEC PAL tape #6)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa6.od>dec-s8-osysb-a-pa6.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa6.txt>dec-s8-osysb-a-pa6.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa7>dec-s8-osysb-a-pa7</a><td>(DEC PAL tape #7)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa7.od>dec-s8-osysb-a-pa7.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa7.txt>dec-s8-osysb-a-pa7.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa8>dec-s8-osysb-a-pa8</a><td>(DEC PAL tape #8)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa8.od>dec-s8-osysb-a-pa8.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa8.txt>dec-s8-osysb-a-pa8.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa9>dec-s8-osysb-a-pa9</a><td>(DEC PAL tape #9)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa9.od>dec-s8-osysb-a-pa9.od</a><td>(PAL image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pa9.txt>dec-s8-osysb-a-pa9.txt</a><td>(PAL Source as text file)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb1>dec-s8-osysb-a-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb1.lbl.jpg>dec-s8-osysb-a-pb1.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb1.od>dec-s8-osysb-a-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb10>dec-s8-osysb-a-pb10</a><td>(BIN image #10)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb10.lbl.jpg>dec-s8-osysb-a-pb10.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb10.od>dec-s8-osysb-a-pb10.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb11>dec-s8-osysb-a-pb11</a><td>(BIN image #11)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb11.lbl.jpg>dec-s8-osysb-a-pb11.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb11.od>dec-s8-osysb-a-pb11.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb12>dec-s8-osysb-a-pb12</a><td>(BIN image #12)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb12.lbl.jpg>dec-s8-osysb-a-pb12.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb12.od>dec-s8-osysb-a-pb12.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb13>dec-s8-osysb-a-pb13</a><td>(BIN image #13)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb13.lbl.jpg>dec-s8-osysb-a-pb13.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb13.od>dec-s8-osysb-a-pb13.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb14>dec-s8-osysb-a-pb14</a><td>(BIN image #14)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb14.lbl.jpg>dec-s8-osysb-a-pb14.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb14.od>dec-s8-osysb-a-pb14.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb15>dec-s8-osysb-a-pb15</a><td>(BIN image #15)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb15.lbl.jpg>dec-s8-osysb-a-pb15.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb15.od>dec-s8-osysb-a-pb15.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb16>dec-s8-osysb-a-pb16</a><td>(BIN image #16)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb16.lbl.jpg>dec-s8-osysb-a-pb16.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb16.od>dec-s8-osysb-a-pb16.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb17>dec-s8-osysb-a-pb17</a><td>(BIN image #17)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb17.lbl.jpg>dec-s8-osysb-a-pb17.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb17.od>dec-s8-osysb-a-pb17.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb18>dec-s8-osysb-a-pb18</a><td>(BIN image #18)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb18.lbl.jpg>dec-s8-osysb-a-pb18.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb18.od>dec-s8-osysb-a-pb18.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb19>dec-s8-osysb-a-pb19</a><td>(BIN image #19)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb19.lbl.jpg>dec-s8-osysb-a-pb19.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb19.od>dec-s8-osysb-a-pb19.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb2>dec-s8-osysb-a-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb2.lbl.jpg>dec-s8-osysb-a-pb2.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb2.od>dec-s8-osysb-a-pb2.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb20>dec-s8-osysb-a-pb20</a><td>(BIN image #20)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb20.lbl.jpg>dec-s8-osysb-a-pb20.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb20.od>dec-s8-osysb-a-pb20.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb21>dec-s8-osysb-a-pb21</a><td>(BIN image #21)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb21.lbl.jpg>dec-s8-osysb-a-pb21.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb21.od>dec-s8-osysb-a-pb21.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb22>dec-s8-osysb-a-pb22</a><td>(BIN image #22)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb22.lbl.jpg>dec-s8-osysb-a-pb22.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb22.od>dec-s8-osysb-a-pb22.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb23>dec-s8-osysb-a-pb23</a><td>(BIN image #23)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb23.lbl.jpg>dec-s8-osysb-a-pb23.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb23.od>dec-s8-osysb-a-pb23.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb24>dec-s8-osysb-a-pb24</a><td>(BIN image #24)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb24.lbl.jpg>dec-s8-osysb-a-pb24.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb24.od>dec-s8-osysb-a-pb24.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb3>dec-s8-osysb-a-pb3</a><td>(BIN image #3)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb3.lbl.jpg>dec-s8-osysb-a-pb3.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb3.od>dec-s8-osysb-a-pb3.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb4>dec-s8-osysb-a-pb4</a><td>(BIN image #4)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb4.lbl.jpg>dec-s8-osysb-a-pb4.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb4.od>dec-s8-osysb-a-pb4.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb5>dec-s8-osysb-a-pb5</a><td>(BIN image #5)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb5.lbl.jpg>dec-s8-osysb-a-pb5.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb5.od>dec-s8-osysb-a-pb5.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb6>dec-s8-osysb-a-pb6</a><td>(BIN image #6)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb6.lbl.jpg>dec-s8-osysb-a-pb6.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb6.od>dec-s8-osysb-a-pb6.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb7>dec-s8-osysb-a-pb7</a><td>(BIN image #7)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb7.lbl.jpg>dec-s8-osysb-a-pb7.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb7.od>dec-s8-osysb-a-pb7.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb8>dec-s8-osysb-a-pb8</a><td>(BIN image #8)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb8.lbl.jpg>dec-s8-osysb-a-pb8.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb8.od>dec-s8-osysb-a-pb8.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb9>dec-s8-osysb-a-pb9</a><td>(BIN image #9)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb9.lbl.jpg>dec-s8-osysb-a-pb9.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pb9.od>dec-s8-osysb-a-pb9.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pr>dec-s8-osysb-a-pr</a><td>(Fortran Library image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pr.lbl>dec-s8-osysb-a-pr.lbl</a><td>(Fortran Library image label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/osysb-a-pr.od>dec-s8-osysb-a-pr.od</a><td>(Fortran Library image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 Bitmap
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ubita-a-pb>dec-s8-ubita-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/ubita-a-pb.od>dec-s8-ubita-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 VIII Extensions
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb1>dec-s8-uextb-a-pb1</a><td>(BIN image #1)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb1.lbl.jpg>dec-s8-uextb-a-pb1.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb1.od>dec-s8-uextb-a-pb1.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb2>dec-s8-uextb-a-pb2</a><td>(BIN image #2)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb2.lbl.jpg>dec-s8-uextb-a-pb2.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb2.od>dec-s8-uextb-a-pb2.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb3>dec-s8-uextb-a-pb3</a><td>(BIN image #3)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb3.lbl.jpg>dec-s8-uextb-a-pb3.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb3.od>dec-s8-uextb-a-pb3.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb4>dec-s8-uextb-a-pb4</a><td>(BIN image #4)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb4.lbl.jpg>dec-s8-uextb-a-pb4.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb4.od>dec-s8-uextb-a-pb4.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb5>dec-s8-uextb-a-pb5</a><td>(BIN image #5)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb5.lbl.jpg>dec-s8-uextb-a-pb5.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb5.od>dec-s8-uextb-a-pb5.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb6>dec-s8-uextb-a-pb6</a><td>(BIN image #6)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb6.lbl.jpg>dec-s8-uextb-a-pb6.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb6.od>dec-s8-uextb-a-pb6.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb7>dec-s8-uextb-a-pb7</a><td>(BIN image #7)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb7.lbl.jpg>dec-s8-uextb-a-pb7.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb7.od>dec-s8-uextb-a-pb7.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb8>dec-s8-uextb-a-pb8</a><td>(BIN image #8)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb8.lbl.jpg>dec-s8-uextb-a-pb8.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb8.od>dec-s8-uextb-a-pb8.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb9>dec-s8-uextb-a-pb9</a><td>(BIN image #9)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb9.lbl.jpg>dec-s8-uextb-a-pb9.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pb9.od>dec-s8-uextb-a-pb9.od</a><td>(BIN image in octal)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pr>dec-s8-uextb-a-pr</a><td>(Fortran Library image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pr.lbl.jpg>dec-s8-uextb-a-pr.lbl.jpg</a><td>(Fortran Library image label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uextb-a-pr.od>dec-s8-uextb-a-pr.od</a><td>(Fortran Library image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 EPIC (Edit, Patch, & Compare)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uptha-a-pb>dec-s8-uptha-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uptha-a-pb.lbl>dec-s8-uptha-a-pb.lbl</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uptha-a-pb.od>dec-s8-uptha-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 EPIC (Edit, Patch, & Compare)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uptha-b-d.pdf>dec-s8-uptha-b-d.pdf</a><td>(PDF write-up)<tr>
</table>
</tr><tr>
<td>OS/8 Source Compare (SRCCOM)
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/usrca-a-pb>dec-s8-usrca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/usrca-a-pb.od>dec-s8-usrca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</tr><tr>
<td>OS/8 TECO
<td><table width=100%><col width=50%><col width=50%>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uteca-a-pb>dec-s8-uteca-a-pb</a><td>(BIN image)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uteca-a-pb.lbl.jpg>dec-s8-uteca-a-pb.lbl.jpg</a><td>(Tape label)<tr>
<td><a href=http://svn.so-much-stuff.com/svn/trunk/pdp8/src/dec/./s8/uteca-a-pb.od>dec-s8-uteca-a-pb.od</a><td>(BIN image in octal)<tr>
</table>
</table>
</FIELDSET>
</FIELDSET>
<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
