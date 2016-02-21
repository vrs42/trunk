<?php
  $title = "CAD Stuff";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P>Most of this page is about 2D circuit boards.
    <P><B>For the 3D stuff go <A href=3d.php>here</A></B>.
    <P>Beware -- almost none of this
stuff has been built or debugged!  It's just here in case it is of some use
to someone.
    <P>I use Eagle CAD software with the "Pro" license to develop this stuff,
but you should be able to use and view it with either the freeware license
or the non-profit license.  As of 2/20/2016, the version of Eagle being used
is Eagle 6.6.  (If you retrieved drawings before then, I recommend you get the 
newer ones.)
<DL>
<DT>
<A href=boards.php>The boards</A>
<DD>
    This is a collection of most of my various schematics and boards.
There's no documentation for them, so you pretty much have to know what
you're looking at, and it may not be obvious which of the zillion boards
and schematics is what you want.  The list is automatically generated,
so if there's stuff in it that I shouldn't be republishing, let me know.
<P>
	One thing that is there, is that the "DEC" sub-directory has quite a 
collection of CAD drawings intended to mimic various original DEC boards.
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/dec-con.lbr">dec-con</A>
<DD>
This is a collection of board outlines and the obsolete components, which 
will be useful if you are trying to re-create flip-chip modules or design 
new boards for DEC machines.  There are outlines and edge connectors for 
single, double, quad and even hex-height boards.
<P>
You will need to set the "Copper/Dimension" design rule to 15 mils, to
eliminate diagnostics about copper too close to the edge in the edge
connectors.  I use 16 mil signal traces and 32 mil power traces, as in 
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/dru/16mils.dru">16mils.dru</A>.
<P>
You will also want to set the board routing grid to 25 mils (or other 
sub-multiple of 100 and 125 mils). Otherwise it will be difficult to route 
from the edge connector to the components, as the edge connector uses a 1/8" 
grid, and the components typically use a 1/10" grid.  I also set the main grid 
to 50 mils, and the multiple to "2", which causes the grid to be drawn at 0.1" 
(100 mils).  Then I set the alternate grid to 25 mils, so that I can place 
things to align with the 125 mil grid when necessary.  I can also then use the 
alternate grid to move traces around as needed.  (The schematic grid should 
just be left at the default of 0.1".)
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/dec-m.lbr">dec-m</A>
<DD>
This is a collection of symbolic representations of various DEC flip-chips. 
For instance, everything needed to draw the prints and backplane for a TC08 
DECTape controller is here.  The "m" now stands for "module", so all the various 
flip chip families are intended to be included ([ABGHKMRSW]xxx).  The package 
is one or more H807 connectors, which you can arrange to form your controller 
backplane.  (I recommend arranging them into standard 2x4 connector blocks, or 
you'll have an even harder problem sourcing compatible connectors!)
<P>
Note: This library has been updated.  The content formerly in <b>dec-r</b> 
has been merged in, and the "m" now stands for "modules", including all the 
various flip-chip series.
<P>
Most of what is needed for the various models of the PDP-8/S is there, as well 
as a fair bit of stuff for the peripherals.  Note also that the Sxxx and Bxxx 
families are essentially faster (and faster yet) versions of the Rxxx module 
with the same number, so you can often just over-ride the "value" of the Rxxx 
version to Sxxx or Bxxx.
<P>
Some of the older schematics and boards still use <b>dec-r</b>, though.  I 
intend to fix this, as well as some drawings that use <b>dec-m</b>, but fail 
to "update" in Eagle.
<P>
You will want to set the board grid to .125", to get proper placement of the 
parts.  Even so, you may have to move them to get them on-grid, as Eagle 
tends to place them with incorrect alignment initially.
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/deprecated/dec-r.lbr">dec-r</A>
<DD>
This is essentially now a copy of <b>dec-m</b>, and it's use is now deprecated.
(It won't be tracking future changes from <b>dec-m</b>, for instance.)
</DL>
</TD>
</TR>
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
