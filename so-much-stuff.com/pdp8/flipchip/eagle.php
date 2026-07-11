<?php
  $title = "Eagle Notes";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<P>
Some notes about the Eagle drawings:
<DL>
<DT>Eagle 4.11
<DD>The CAD drawings are currently in Eagle 4.11's proprietary format.
The schematics and boards can be accessed (but not edited) with a 
free download, but as Eagle has moved on through Eagle 5.x and is
currently somewhere in 6.x.  Later versions of Eagle have no trouble
reading these files, but the older formats are proprietary.  Eagle 6.x, 
is attractive because it stores it's files as XML, which is a "plain
text" format.  That means that decades down the road, you may not be
able to get Eagle anymore, but you can still write tools that will
understand the files.
<P>
The downside of course, is that I'd have to buy fairly expensive Eagle
upgrade licenses to move the authoring to Eagle 6.  For now, I'm still
using 4.11, but you can download the free version of Eagle 6.x and load
up the schematics to view them (you can even re-save them locally if
you want in the new XML format).

<DT>Naming
<DD>Module schematics and boards should have a file name that reflects 
both the module basename and the etch revision (i.e., R107A).  DGL variants 
usually have a specific suffix, called out in the schematic (i.e., R107S1A).
Field variations should have both an etch revision and the Yx suffix
(i.e., G700BYA is a G700-YA module with revision B etch).  (This basename 
is referred to as the revision name below.)
<P>

<DT>Schematics
<DD>Every schematic should start with a "frame" from the "frames" 
library, in either letter or A3 landscape, then a board "outline"
and an edge connector from the "dec-con" library.
<P>

<DT>Boards
<DD>The "outline" and edge connector are usually positioned with the 
edge connector on the right, which puts "A" at the top.  (Board drawings
with the edge connector on the left are generally older, and have 
not been brought up to the standards implied on this page.)
<P>Components are normally aligned on a 0.05" grid with a multiple
of 2, which is to say that you can position things at 0.05" multiples,
but the visible grid will be 0.1" (I use a dot grid).
<P>There are two net classes in most of the boards.  The default 
nets are routed with 16mil traces, and the "Power" nets are routed 
with 32mil traces.  Most of the routing is done by hand, to 
approximate DEC's routing.  Vias should be round, with a 32mil 
drill diameter.
<P>The file <A href="/pdp8/trunk/Eagle/dru/16mils.dru">16mils.dru</A>
should be used to force round pads and enforce clearance and
other design rules.

<DT>"Replica" Boards
<DD>As a consequence of the above, most of the "replica" boards 
have an average placement error of less than 0.05", and try for a 
worst case placement error of about 0.1", for both components 
and traces.
<P>
<DT>Components and Packages
<DD>Diodes and resistors generally start as "1N4148" and "R-US_0207/10",
with their values modified to reflect the EIA equivalent to the 
DEC part number or the resistance.  These give the standard 0.4"
through-hole lead spacing, which is what is usually wanted.
<P>Small capacitors are usually "C-US050-025x075" (bypass ceramic)
or "C-US075-032x103" (mylar), depending on the desired through-hole 
spacing.  Electrolytics are often "CPOL-USE15-5Axial".  As usual, 
don't forget to set the values!
<P>Transistors are typically in a TO-39 case, which puts the pads 
on the grid and spaced approximately the correct distance apart.
"2N3637" and "2N2102" work nicely, but don't forget to set the 
value to match the EIA equivalent of the DEC part number.
<P>Jumpers can be done as "0 ohm" resistors, but then they clutter 
the schematic, so generally jumpers are a pair of vias and a 0.4" 
segment in the top layer.  (For double-sided boards, a 0 ohm resistor
may be required.) 
<P>The library <A href="/pdp8/trunk/Eagle/lbr/dec-con.lbr">dec-con.lbr</A>
also contains parts which are used in DEC boards, for which there
is no similar part in the standard Eagle libraries.

<DT>Component Substitutions
<DD>The script <A href="/pdp8/trunk/Eagle/ulp/xversion.ulp">xversion.ulp</A>
will iterate over a schematic, replacing values of parts favored
by DEC with readily available "modern" equivalents.  This is generally
used for the "X" (non-replica) version of a board.  It performs
substitutions like these:
<UL>
<LI>D664/1N3606 are replaced with 1N4154.  The 1N4154 is a switching 
diode with a low forward voltage drop.
<LI>D662/1N645 are replaced with 1N914.  The 1N914 is a switching 
diode with a higher forward voltage drop.
<LI>DEC3639/2N3639 are replaced with PN3640.  The PN3640 (2N3640) is
a switching transistor nearly identical (higher breakdown voltage) to
the 2N3639.
<LI>DEC3009/2N3009 are replaced with PN3569.  The PN3569 is a fast
switching transistor very similar to the 2N3009.
<LI>16J1/2N3605 are replaced with 2N2222.  The 2N2222 is a slower
transistor very similar to the 2N3605.
<LI>DEC1008/MM1008 are replaced with BC639.  The BC639 is a slower
transistor very similar to the MM1008.
</UL>
<P>
Boards intended as "replica" versions must not have these substitutions.
Instead, the EIA equivalent (where known) of the DEC part should be used.
(If no EIA equivalent is known, just use the DEC part number.)
<P>

<DT>Other Files
<DD>Be sure to keep DESCRIPTION files up to date as schematics and
boards are added.
<P>
The PDF of a revision's schematic should have ".pdf" appended to the 
revision name.
<P>
Images of a board etch revision should have "front.jpg" and "back.jpg"
appended to the revision name.
<P>
Datasheets and such should have "-ds.pdf" or "-ds2.pdf" appended to the 
revision name.
<P>
Modules for which I have an example should have a ".xpl" file for the 
particular revision name.  Likewise, modules I am looking for should
have a ".wtb" file, and modules I have an excess of should have a ".wts"
file.
</DL>

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
