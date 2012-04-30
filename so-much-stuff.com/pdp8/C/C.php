<?php
  $title = "PDP-8 C Compiler";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P>Every year or so for a while now, the topic of a PDP8 C 
compiler has come up in one or another discussion forum.  The PDP-8 
is not very suited for C -- there's no stack and consequently no 
recursion.  There are no addressing modes suitable for accessing a 
stack even if you create one, and the conveniently addressable 
address space is only 4096 words long.  Folks have argued about 
whether it was even possible, and how lame would it be if one 
did get it working.
    <P>Recently, I decided to have a go at creating one, thereby 
creating a data point for the discussion.  My C implementation is
based on the following tools:
<DL>
<DT><A href=Small-C.php>Small-C</A>
<DD>Small-C was written by Ron Cain and modified by James E. Hendrix.
I got the copy I started with from Toby Thain.  The compiler 
is quite small, contained mostly in 4 modest source files, with 
cc4.c being the one most concerned with code generation.  The 
compiler understands a simple subset of C, having only "char", 
"int", pointers to char and int, and functions.
    <P>The Small-C compiler generates code for a virtual machine
"middle-end".  This code is peephole optimized and then translated 
into assembler for the target machine.  A large part of the PDP-8 
implementation work is actually concerned with creating a "VM" on 
which to do the operations being requested by the peephole optimizer.
Each virtual operation is then typically implemented by an indirect 
JMS instruction through a pointer on page zero.
<DT><A href=Assembler.php>SMAL Assembler</A>
<DD>The SMAL assembler is an assembler framework written by Doug Jones
which understands notions of relocatability and an ability to also 
act as a linker.  I've done some work on this to add PDP-8 instructions 
and change the syntax to be more like a conventional PDP-8 assembler.
The result is a reasonable approximation to PAL-III, but with the 
ability to output a partially assembled/linked relocatable ".o" file.
<P>
<DT><A href=Linker.php>SMAL Linker</A>
<DD>The SMAL assembler is actually used again as a linker, to merge 
various ".o" files, resolving their references to one another and 
assigning final addresses to the code.  The code for various C functions 
is typically loaded after the VM.  Since OS/8 required handlers and 
whatnot to load in field 0, the VM and all the C code are currently 
loaded into field 1.
<P>
<DT><A href=Library.php>Small-C Library</A>
<DD>The Small-C compiler also comes with a library, containing implementations
of printf and other library routines typically used with C.  This is the 
part I have done the least with.  It still needs to be interfaced to OS/8
for file operations, in particular.  The hope is to add some code in field 
0 to handle file I/O, then interface the existing library to that.
</DL>
    <P>The compiled and linked "Hello World" comes in at about 1.7K, with the 
VM taking an additional 660 words.  (This is with "fputc" stubbed with a routine 
to output on the TTY.)  I estimate that adding support for proper stdio-style 
I/O would just about use the rest of the available 4K, unless most of it can be 
placed in field 0.
    <P>You can download a snapshot of the code <A href=small-c.tar>here</A>,
or browse the SVN repository
<A href=http://svn.so-much-stuff.com/svn/trunk/pdp8/small-c>here</A>. 
Once you have extracted the snapshot, you can update to the bleeding edge
with "svn update .".
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
