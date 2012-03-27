<?php
  $title = "Smal8 Linker";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
<P>
One of my objectives in choosing the SMAL assembler as the starting point for 
my relocating assembler is that it can also behave as a linker.  The way this 
works is that the assembler resolves what symbols it can, keeping track of 
segment names and whatnot, and emits in the ".o" file a kind of stylized 
assember code.  Fully resolved instructions are emitted as constants,
relocatable values are typically output as &lt;symbol&gt; or
&lt;symbol&gt;+&lt;constant&gt;, and (in smal8) MRI instructions are
represented as the MRI operation followed by one of the above.  In addition,
there are instructions to set the location counter (".") to constant or
relocatable values.
<P>
Effectively then, the first assembly resolves all the local references, and 
emits a ".o" file suitable for another pass through the assembler, this time 
with the ".o" files for the other modules being linked.  The result will also 
be a ".o" module; similar to the first, but hopefully without relocatable 
values.  Unresolved references will give error messages, as you'd expect from 
a linker.
<P>
When the final ".o" file is produced, it will contain only constants and 
assignments of constants to the location counter.  I wrote a simple Perl 
script (o2bin.pl), which reads this and converts it into the standard PDP-8 
BIN loader format, if desired.
<P>
The other bit of magic that is needed in a linker, is the bit that searches 
the library for the relevant ".o" files, and includes them in the binary 
being linked.  The solution for that is another Perl script (mkDIR.pl), 
which scans the library files, and builds a "RESOLVER" macro.  This macro 
knows which symbols are in which files, and uses the conditional assembly 
features of smal8 to INCLUDE the relevant ".o" if one of it's symbols is 
an unresolved forward reference.  The mkDIR.pl script creates this macro 
(and invokation) in clib/DIR, where it can be included by the linker 
shell script.
<P>The linker shell script, then, just sets an origin, "INCLUDE"s any files 
explicitly referenced on the command line, and "INCLUDE"s clib/DIR.
<P>
You can go <A href="C.php">back<A> to the "C" page, or <A href=Library.php>on</A>
to the library page.

</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
