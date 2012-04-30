<?php
  $title = "CAD Stuff";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P>Here are my collection of CAD files.  Beware -- almost none of this
stuff has been built or debugged!  It's just here in case it is of some use
to someone.
    <P>I use Eagle CAD software with the "Pro" license to develop this stuff,
but you should be able to use and view it with either the freeware license
or the non-profit license.
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
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/74xx-jameco.lbr">74xx-JameCo</A>
<DD>
This is an attempt to put together a library that contains the subset of 74xx TTL 
that is actually available from JameCo.  The idea was that if it is in this library, 
you might actually be able to buy it affordably, so it was "safe" to design with.
Of course, what JameCo actually carries is a moving target, so the correspondence 
is no longer perfect.
<P>
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/dec-con.lbr">dec-con</A>
<DD>
This is a collection of board outlines and the occasional obsolete component, which 
will be useful if you are trying to re-create flip-chip modules.  There are outlines 
and edge connectors for single, double, quad and even hex-height boards.
<P>
You will need to set the "Copper/Dimension" design rule to 25 mils, to
eliminate a diagnostic about copper too close to the edge in the edge
connectors.
<P>
You will also want to set the routing grid to 25 mils (or other sub-multiple
of 100 and 125 mils). Otherwise it will be difficult to route from the edge
connector to the components, as the edge connector uses a 1/8" grid, and
the components typically use a 1/10" grid.
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/dec-m.lbr">dec-m</A>
<DD>
Note: This library is sort of obsolete.  I use <b>dec-r</b> instead, these days.
Some of the older schematics and boards still use it, though.
<P>
This is a collection of symbolic representations of various DEC flip-chips. 
For instance, everything needed to draw the prints for a TC08 DECTape
controller is here.  Despite the name, there are Gxxx and Wxxx modules, in
addition to Mxxx modules.  The package is one or more H807 connectors, which
you can arrange to form your controller backplane.  (I recommend arranging
them into standard 2x4 connector blocks, or you'll have an even harder problem
getting compatible connectors!)
<P>
You will want to set the board grid to .125", to get proper placement of the 
parts.  Even so, you may have to move them to get them on-grid, as Eagle 
tends to place them with incorrect alignment initially.
<DT>
<A href="http://svn.so-much-stuff.com/svn/trunk/Eagle/lbr/dec-r.lbr">dec-r</A>
<DD>
This is a collection of symbolic representations of various DEC flip-chips.  
It has newer versions of the stuff in dec-m, as well as a number of Rxxx 
modules.  Most of what is needed for the PDP-8/S is there.  Note also that 
the Sxxx and Bxxx families are essentially faster (and faster yet) versions 
of the Rxxx module with the same number, so you can just over-ride the
"value" of the Rxxx version to Sxxx or Bxxx.
<P>
You will want to set the board grid to .125", to get proper placement of the 
parts.  Even so, you may have to move them to get them on-grid, as Eagle 
tends to place them with incorrect alignment initially.
</DL>
</TD>
</TR>
</TABLE>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
