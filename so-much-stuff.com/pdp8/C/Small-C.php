<?php
  $title = "PDP-8 Small-C Compiler";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P>As mentioned on the previous page, the architecture of the PDP-8 
is not really suited to C.  The job of the C compiler is to span this
gap.  In this PDP-8 implementation several, possibly contentious, 
decisions had to made.  One way to illustrate this is to look at a few 
alternative C compiler designs:

<DL>
<DT>
4K, no recursion, mostly native PDP-8 instruction sequences.
<DD>
One of the possible ways to do a C compiler would be to mimic the way that 
assembler code is typically written for the PDP-8.  The PDP-8 doesn't support 
a notion of a base register (hence of a frame pointer), stack, etc.  So most 
PDP-8 code is written with explicit references to variables whose memory 
address is fixed.  This, together with the JMS instruction and the lack of 
a call stack, typically means non-recursive code.  Parameters typically 
follow the JMS instruction.  With the elimination of recursion, local variables 
can be of "static" storage class, for more efficient referencing.  (The result 
would actually be a bit like the Fortran II/SABR solution, but for C, or a subset 
of C, instead of for Fortran II.)
<P>
<DT>
4K, recursion/stack/VM (Like this implementation.)
<DD>
Another possibility would be to retain recursion, but "lift" the PDP-8 "Virtual 
Machine" to provide a stack, frame pointer, perhaps a couple of registers, etc.
This turns out to be the easiest, requiring few changes to the compiler, since 
the "VM" essentially emulates the machine the compiler is designed to target.
<P>
One of the decisions that has to be made in a C implementation is the representation 
of the basic types: "char", "int", "long" (if supported), and pointer types.  On the
PDP-8, keeping a pointer to a single word limits the address space to 4K.  An argument
can also be made for one-word "int", since "int"s are supposed to be "fast".  (An 
"int" is also supposed to be "16 or more bits", but there's probably no way to do 
that that is not also slow.  There is ample precedent for ignoring the 16 bit rule on 
small processors in the world of C for microcontrollers.)  If pointers are to be a 
single word, "char" will probably also need to be a simple word.
<DT>
32K/128K, recursion/stack/VM, big smart pointers, big ints.
<DD>
To be practical for larger programs, it may be necessary to make pointers larger.
A representation which I think would work well would be two word pointers, where
the first word is a pointer to a subroutine (in the current field) to establish 
addressability to the object using the value in the second word.  Since pointers 
are big, and we have more memory to work with, we can also make "int" standard 
conformant at two words, and maybe even implement "long" at 3 words.  (Heck, 
even some floating point, maybe.)  We'd still need a VM to implement the notions 
of frame pointer and stack pointer.
<P>
<DT>
32K, recursion/stack, VM, SABR-style pointers, small or big ints.
<DD>
A variation of the above idea, but it imposes a 4K limit on each module.  "Near" 
references (to use a term from my Intel 286 days) can still be used for data 
declared within the module, but "far" references for parameters and for externs 
in other modules, as other modules may have been loaded in a different field.
<P>
<DT>
Fortran IV/FPP output
<DD>
The Fortran IV implementation for the PDP-8 used a very different model of 
computation.  Essentially code is generated, not for the PDP-8, but rather 
for the Floating Point Processor (FPP).  On machines that don't have an FPP, 
an emulation provides the necessary VM.  The result would be much like the 
Fortran IV/RALF environment, but for (a subset of) C, rather than Fortran IV.
</DL>
<P>
You can see there are several design decisions, and more combinations than 
are described above.  Here are the major decisions taken in this compiler:
<UL>
<LI>The "char" and "int" types, as well as the pointer types, are all 
a single PDP-8 word.  This means the compiler isn't standard conformant, 
as an int should really be 16 or more bits, but I decided that doing 
extended precision arithmetic all the time would simply waste too much 
time and memory to be practical on such a small machine.
<P>
<LI>The Small-C compiler was chosen (for it's simplicity), and a "Virtual 
Machine" was implemented on the PDP-8 that closely matches the machine 
used in Small-C "middle-end", where the peep-hole optimizer does it's 
work.  Most of the operations are then implemented with a simple indirect 
JMS through a page 0 pointer.  Having these pointers on page zero also 
makes the code output by the compiler position independent, which rather 
simplifies the linker's job.
    <P>The VM implements a machine with two main "registers" for arithmetic, 
a third "register" used to pass the argument count to subroutines, a "register" 
used as a pointer, a frame pointer "register", and a stack pointer "register".  
These "registers" are actually implemented as memory locations on page zero.
    <P>The middle end op-codes/routines all follow a simple naming convention, 
which helps sort out what is going on in the code.  A simple example would be 
"add12" which adds the content of "register 2" to "register 1", and leaves the 
result in "register 1".  This operation would be invoked via "JMS I __add12".
A more complicated example would be "getw1s" which takes a word of immediate 
offset following the "JMS I __getw1s", adds it to the stack pointer, 
and loads the contents of that address into "register 1".  This is typical of 
how a reference to a local variable or parameter would be loaded into "register 1".  
    <P>There are also routines to call functions, return, push and pop arguments, etc. etc.
All told, there are over 80 such routines, and implementing them, together with 
their page zero pointers and "register" storage, takes about 660 (decimal) words.
That may not seem like that much, but it is about 17% of the available storage 
in field 1.
    <P>On the other hand, it does make the code position independent, which solves 
a variety of addressing mode problems and it also makes it possible to access stack-based 
variables with reasonable code density.
    <P>Another idea would be to try to trim down the size of the VM, eliminating 
some of the lesser-used "opcodes" in favor of longer sequences of simpler operations.
You'd want to keep the resulting code density high, though.  One of the things 
that might work would be to eliminate "register 2", always calculating into a 
single "register", and storing to memory (or stack) as needed.
<P>
</UL>
<P>
You can go <A href="C.php">back<A> to the "C" page, or <A href=Assembler.php>on</A>
to the assembler page.

</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
