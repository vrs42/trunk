<?php
  $title = "Small-C Library";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
<P>
The "clib" directory contains the library of support routines supplied with Small-C,
as well as the implementation of the virtual machine required by the code output from 
the compiler.
<P>
Currently, several modules are actually broken, in the sense that they haven't yet 
been ported to the PDP-8:
<DL>
<DT>csyslib
<DD>
This module used to contain code to call MS-DOS to perform various BIOS calls for 
setting up argc and argv, for memory allocation, file I/O, and whatnot.  It also 
contains most of the static tables for "per-file" book-keeping.  My current thought 
is that the thing to do here is to write a replacement in PDP-8 assembler, using 
OS/8 USR calls.  Since OS/8 requires drivers to load into field 0, I think it makes 
sense to locate this code in field 0 also.  The result should probably be a ".ASM" 
file; perhaps "usr.ASM".
<DT>fgetc, fputc
<DD>
These are the main workhorse routines for file I/O.  They need to be reworked to 
pack three characters into every two words for files opened in the usual way, and
to output words one-for-one which have been opened with a "b" in the second argument 
to fopen().  Of course, it will also be desirable to special case input/output to 
the console terminal.  (There is a file linked with hello.c during "make test" 
that has a rudimentary fputc for the console terminal only.)
<DT>free
<DD>
The current implementation of free() is broken.  It actually works much like the 
old brk() did in V7 UNIX.  That is to say, it just sets the top of memory to be 
the argument!  What is needed here instead is a proper implementation of a memory 
heap.
<DT>isatty, iscons
<DD>
These routines are used to discover if a file is actually referring to a file 
or a device, and whether the device in question is the console terminal.
They will need to be converted from BIOS calls to appropriate calls to OS/8.
<DT>rename, unlink
<DD>
These routines do the obvious operation on named files.  They will need to 
be recoded for OS/8.
</DL>
There are some additional possibilities.  For instance, printf and scanf routines 
are relatively large -- would it be worthwhile to move the bulk of their implementation
to field 0?  Or would it be simpler to recode them in PDP-8 assembly, hopefully 
achieving a size reduction?
<P>
There are some known minor issues with the VM.  Since the stdio stuff isn't
actually implemented, the VM call to initialize that sub-system isn't
implemented either.  The VM could also use a proper test suite.  Many of the
"opcodes" it implements have never actually been tested.
<P>
As you can see, there are several moderately complicated bits to work on in the 
library, but I haven't got the motivation to do them as yet.
<P>
You can go <A href="C.php">back<A> to the "C" page, or pick another topic from the links 
at the top of the page.

</TABLE>

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
