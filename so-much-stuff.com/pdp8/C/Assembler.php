<?php
  $title = "SMAL8 Assembler";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
<P>
The output of the Small-C compiler is PDP-8 assembler.  Initially, this 
assembler code was being emitted in a form similar to that understood by 
the PALX cross-assembler, and I was trying to use that.  There were some 
minor issues as well, but the main issue was that the cross-assembler isn't 
really set up to have a "linker" step.  It expects you to hand it all the 
assembler code at once, and to generate a load image in BIN loader format.
<P>
What I wanted was something that followed the usual C language conventions, 
where you do incremental compilation of the libraries and source modules, 
then "link" them together later to form the load image.  Also, Small-C will 
compile itself, but there's no way the result is going to fit in 4K (in fact, 
32K might be a tight fit).  That meant I was looking for a cross-assembler.
The main cross-assembler for the PDP-8 is Doug Jones' PAL assembler, but that 
has the same issue -- it wants all the source, and generates an executable in 
BIN format.
<P>
However, Doug Jones also did something called 
<A href=http://www.divms.uiowa.edu/~jones/cross/>SMAL</A> 
(<A href=http://www.divms.uiowa.edu/~jones/cross/smal32/>manual</A>), 
which is a combination assembler and linker.  This was pretty much exactly 
what I was looking for, and I began to modify it to assemble PDP-8 code.
<P>
While creating the assembler, I kept running across a variety of differences 
between what SMAL32 wanted for assembly language input and the syntactical and 
lexical conventions commonly used in PDP-8 assembler, as well as concepts like 
page packing and literals that were not present.  What I eventually did about 
this was to survey PDP-8 assemblers to try to determine which features a good 
PDP-8 assembler would need, and how those needs had been addressed before.
<P>
There is a surprising amount of variety in PDP-8 assemblers.  In the end, I had 
identified over 130 features that were present in some assemblers and not others.
That doesn't even include RALF/FLAP, which I decided was different enough to not 
even really be comparable.  I think RALF/FLAP are so different that they are best 
understood as assemblers for the FPP, rather than as assemblers for the PDP-8.
<P>
Fortunately, most of these features form a family, or progression, that follows 
an evolutionary path from PAL-III through various versions of PAL-D, PAL-8, and 
eventually MACREL.  MACREL is the first of these to really support relocatable 
output files which get linked together later.  It also merges in the interesting 
features of MACRO-8, which otherwise is sort of the odd-man-out.
<P>
The other major assembler for the PDP-8 is SABR, and it is quite different.  SABR
has a programming model that isn't really quite assembler, as the PAL-style assemblers 
mean it.
<P>
In a PAL-style assembler, addressability is a big issue.  The addressing modes of 
the PDP-8 divide memory into 128-word pages and 4096 word fields.  Extra code is 
needed to cross these boundaries, and the programmer explicitly writes this 
code.  The programmer also uses the notions of page and field to organize the code:
pages are local, the current field less so, and stuff in another field is generally
hard and slow to access.
<P>
In SABR, there effectively are no pages.  The assembler is keenly aware of pages,
of course, as otherwise it can't generate PDP-8 code that will actually execute.
But to the person writing code for SABR, the page boundaries could be anywhere. 
The assembler will figure out where to split the code between pages, and there's 
no notion of where your code will end up.  The only thing that is guaranteed to 
be on your same page is the literal, if you use one.  Since your instruction may 
or may not be on the same page with the preceding instruction, your literal may 
or not be on the same page as theirs, even if it refers to the same expression.
This also has all kinds of complex implications about the assembler understanding 
about skip instructions, knowing how to establish addressability to your data
(which is likely not on the same page), how to get from one page to another, etc.  
Since the data you are referencing is likely not on the same page (unless it's a 
literal), I'd guess that the code probably expands about 50% as it passes through 
SABR.
<P>
SABR does have fields, but they can't be specified at assembly time.  The assumption 
in SABR is that each assembly module fits in a single field.  Code to pass parameters 
and reference data in COMMON or outside the current module must all use helper 
pseudo-ops and functions to cross a potential field boundary (even if the modules 
were actually loaded into the same field).  All the helper functions to establish 
addressability across page and field boundaries form a small run-time that gets 
copied by the loader into each field which contains SABR code.
<P>
For my purposes, I decided that I liked MACREL better than SABR, so the version 
of SMAL for the PDP-8 (smal8) implements PAL-III, with the following exceptions:
EXPUNGE, FIXMRI, and FIXTAB are missing, and the output files are in a relocatable 
".o" format.  The smal8 assembler also supports conditional assembly and macros, 
in a hybrid of the MACREL and SMAL32 styles.  Perhaps someday I will feel ambitious
enough to implement literals and the various minor features needed for full MACREL 
compatibility.
<P>
You can go <A href="C.php">back<A> to the "C" page, or <A href=Linker.php>on</A>
to the linker page.

</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
