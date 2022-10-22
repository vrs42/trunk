<?php
  $title = "PDP-8 Tools";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

    <P>At the suggestion of Bill Cattey, I have made available a suite of
tools I use for a variety of forensic work with PDP-8 files.  I started out
working with paper tapes, but these days most of my work is with RK05,
DECtape, and floppy (RX01 and RX02) images.  Most of these are OS/8 images,
but I also have some with P?S8, TSS/8, COS, and other file-systems on them.
(The floppies also come with various interleave and bit packing schemes.)
    <P>To make use of these tools, you will want to install Subversion and
Perl.  The tools are written in an ancient dialect of Perl because that's
the rapid prototyping language I'm most used to, and because it's available
for almost any reasonable machine you'd want to use for this work.
    <P>The tools themselves are
<a href="https://svn.so-much-stuff.com/svn/trunk/pdp8/8tools">here</a>
with a documentation sub-directory
<a href="https://svn.so-much-stuff.com/svn/trunk/pdp8/8tools/doc">here.</a>
Best way to get a local copy is with Subversion's "co" command.
    <P>The tools fall into a few rough categories:
<DL>
<DT>Paper Tape Tools
<dd><P>
The paper tape tools deal with paper tape images which are basically
byte streams, with each byte representing a frame or character of the paper
tape.  The main things to do with them have to do with inspecting them,
stripping mark parity, and using utilities that understand BIN format, etc.
to compare them.
<dd><P>
One thing to be aware of is that I generally want the paper tape
image to be useful, rather than purely an historical record.  This means
my paper tape images generally have the large "buffer" regions of extra
nulls and cruft removed from each end.  That way they are ready to be used
with SIMH or whatever, without worrying about "positioning the tape".
<dd><P>
One main workflow is to use "dood" to create a ".od" file for a given paper
tape image, then edit the octal in the ".od" file, then use "mktapes" to
convert the edited octal back into the edited image.
<DT>Disk Image Tools
<dd><P>
The files I use most often here are the OS/8 image tools (some
support exists for P?S8, TSS/8, COS, and other volumes).  The tool
"os8xplode" converts an image in ".dsk" format (similar to the SIMH format
for RK05) into a directory (or two, in the case of an RK05) containing a
file for each file in the OS/8 image.  It also writes an XML file, with
a description of the volume sufficient for "mkdsk" to re-create it.  There
is also an "os8implode", which will (re)enumerate the sub-directory (or
directories) and create a new XML file.  This makes it pretty easy to
work in SIMH to test things, while using Makefiles and other "modern"
stuff to maintain the files.
<DT>Cross Assembler
<dd><P>
There is an extensively tested cross assembler included, which can
assemble nearly every extant PAL assembler files.  (Two exceptions are
currently known.)
<DT>File Conversion Tools
<dd><P>
A number of tools are provided to convert from one file format to
another, and to work with common file formats.
<dd>An important one of these is "bincmp", which compares two files in BIN
format.  They are considered equivalent if they load the same values into
every location.  If not, the locations that differ are listed.  As a side
effect, the format of the BIN files is checked.  (This also means that
comparing a file to itself will quickly check it's format.)
<dd>Another important set of tools are "2asc" and "2mark", which set or
clear mark party, effectively making files useable in the cross environment
or on the PDP-8, respectively.
<dd><P>
There are a couple of common ways to represent or convert data between
12 bit words and 8 bit bytes.  One common format, used in ".dsk" files and
quite often inside SIMH, is to represent the 12 bit binary value in 2 bytes
as a "short", usually in x86 byte order.  Another is the OS/8 "3 for 2"
format, in which 3 bytes are used to represent the 24 bits of a pair of
12 bit words.  The os8 image tools generally create output files in "3 for 2"
format, which is natural for byte oriented data, and is also more compact.
The tools "3to4" and "4to3" are useful to convert back and forth,
if you need to visualize the data as octal words, rather than bytes..
</DL>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
