<?php
  $title = "CAD Project Files";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>
<BODY>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./20ma-connections target=_blank>./20ma-connections</a></b>: Diagram of the 20ma connections in 8i, 8L.

</LEGEND><DL>
<DT>20ma</A>
  <DD>is a schematic of the various parts and their connections.
<DT>4915dec</A>
  <DD>is a drawing of DEC's 4915.
<DT>4915</A>
  <DD>is a more modern board similar to DEC's 4915.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./20ma-rs232 target=_blank>./20ma-rs232</a></b>: Board for TTY adapter box

</LEGEND><DL>
<DT>loop-rs232</A>
  <DD>is a board to convert current loop to RS-232.  It probably won't drive a TTY,  though, as the loops are too low voltage.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./32k-8i target=_blank>./32k-8i</a></b>: PDP-8/i Core replacement.

</LEGEND><DL>
<DT>sboardnew</A>
  <DD>is an SRAM core replacement that uses simple paddle cards to
hook into a PDP-8/i or PDP-12.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./32k-Omnibus target=_blank>./32k-Omnibus</a></b>: Omnibus 32K SRAM board

</LEGEND><DL>
<DT>msc3102</A>
  <DD>is a drawing of the MSC3102 design.
<DT>Omnimem</A>
  <DD>is a simplified version using 74244 instead of 74125.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./BusCon target=_blank>./BusCon</a></b>: Bus Connector paddles for Negibus and Posibus

</LEGEND><DL>
<DT>8j-merge</A>
  <DD>is a merge of the 34-pin and 40-pin paddles.
<DT>8j-merge2</A>
  <DD>is a merge of the 34-pin and 40-pin paddles, with various extras to make various cable ends.
<DT>BusConOld</A>
  <DD>is an early version based on the work of Charles Morris.
<DT>BusCon40</A>
  <DD>is an early incompatible version with better ground planes than BusConOld.
<DT>PosiBus</A>
  <DD>is a wacky idea with a molex connector.
<DT>BusCon</A>
  <DD>uses two 34-wire cables to carry Posibus, or just one for Negibus.
<DT>BusCon10</A>
  <DD>is BusCon again.
<DT>BusCon15</A>
  <DD>is BusCon again.
<DT>BusConPoly</A>
  <DD>is BusCon with Polygon fill.
<DT>tester</A>
  <DD>is another attempt at a backplane probe.
<DT>x-talk</A>
  <DD>is an attempt at a crosstalk measurement jig for Posibus cables.
<DT>BC08J</A>
  <DD>is essentially a BC08J paddle with a cheaper ribbon connector.
<DT>merge4</A>
  <DD>is four 8j-merge paddles on a single board.
<DT>proto</A>
  <DD>is four 8j-merge paddles simply panelized.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./BusStop target=_blank>./BusStop</a></b>: Bus Interconnect for Posibus

</LEGEND><DL>
<DT>busstop</A>
  <DD>is a simple rack terminus for Posibus.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./chipfudge target=_blank>./chipfudge</a></b>: Replacements for obsolete chips

</LEGEND><DL>
<DT>AM27S13</A>
  <DD>is my board that uses a 27256 to replace the AM27S13
(but has trouble meeting the speed specifications).
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./ConsoleEmu target=_blank>./ConsoleEmu</a></b>: Project with Henk Gooijen.

</LEGEND><DL>
<DT>core+io1</A>
  <DD>is an early draft of a 6802 CPU core and some I/O latches
(to drive lights from SIMH).
<DT>core+io2</A>
  <DD>is an early draft of the 6802+I/O board.
<DT>core+io3</A>
  <DD>is the 6802 board again, experimenting with form-factor 
and component placement.
<DT>core+io4</A>
  <DD>the bigger 6802 version again, with bypass caps added.
<DT>core1</A>
  <DD>splitting the 6802 board up -- this is the CPU core.
<DT>io1</A>
  <DD>splitting the 6802 board up -- this is the I/O stuff.
<DT>core+io5</A>
  <DD>another version of the combined core+io 6802 board.
<DT>core2</A>
  <DD>a newer version of core1.
<DT>io2</A>
  <DD>a newer version of io1.
<DT>core+io</A>
  <DD>is the last version of core+io.
<DT>io-ok</A>
  <DD>is a snapshot of the I/O board before io3.
<DT>io3</A>
  <DD>everything rearranged to get another pair of LS373 in.
<DT>core3</A>
  <DD>is a version of the core board that matches io3.
<DT>io-ol</A>
  <DD>is io3 with the Olimex scripts run to beef up the
silkscreen.
<DT>core4</A>
  <DD>is another revision of the 6802 CPU core.
<DT>core5</A>
  <DD>is another revision of the 6802 CPU core.
<DT>core6</A>
  <DD>is another revision of the 6802 CPU core.
<DT>core-ol</A>
  <DD>is the core board with the Olimex silkscreen scripts
run.
<DT>core</A>
  <DD>is the last version of the 6802 core board.
<DT>quadrature</A>
  <DD>is a simple quadrature clock.
<DT>adaptor</A>
  <DD>is a simple adaptor board to put a 6809 in an 6802
socket.
<DT>core09ss</A>
  <DD>is an early version of the 6809 core board, with the 6809 
replacing the 6802 (essentially building in the adapter board).
<DT>09-09e</A>
  <DD>is an adapter board for using the 6809E in a 6809 socket.
<DT>core09</A>
  <DD>is an early 6809E based CPU core.
<DT>core09e2</A>
  <DD>is a later version of the 6809E core.
<DT>core09e3</A>
  <DD>is a later version of the 6809E core, with Olimex
silkscreen scripts run.
<DT>io-ol2</A>
  <DD>is a version of the IO board to match the 6809E core, and 
with Olimex scripts run.
<DT>core-ol2</A>
  <DD>is the 6809E core, with Olimex scripts run.
<DT>corex</A>
  <DD>is a slightly different version of the 6809E core.
<DT>core09e</A>
  <DD>is the latest version of the 6809E CPU core.
<DT>corex2</A>
  <DD>is the latest version of the 6809E CPU core.
<DT>iognd</A>
  <DD>is the IO board, with a ground plane added on both sides.
<DT>core09gnd</A>
  <DD>is the 6809E core board, with a ground plane added on
both sides.
<DT>io</A>
  <DD>is the latest version of the IO board.
<DT>iotester</A>
  <DD>is a slight modification of the IO board, folding in the 
hooks for the tester board.
</DL>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./ConsoleEmu/FlipChip target=_blank>./ConsoleEmu/FlipChip</a></b>: FlipChip Test Jig based on core and i/o boards.

</LEGEND><DL>
<DT>flipchip</A>
  <DD>is a design for a flipchip tester based 
on the core and IO boards.
<DT>proto</A>
  <DD>explores some ideas output interfacing to 
Rxxx modules.</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./ConsoleEmuFDC target=_blank>./ConsoleEmuFDC</a></b>: Floppy Controller for ConsoleEmu Project

</LEGEND><DL>
<DT>core09gnd</A>
  <DD>is a copy of the 6809E CPU core, used as a starting point
to get the board dimensions and connectors in the right place.
<DT>fdc</A>
  <DD>is my Eagle drawing of Henk's floppy disk controller
prototype.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC target=_blank>./DEC</a></b>: Various stuff pertaining to DEC gear.

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/8aPanel target=_blank>./DEC/8aPanel</a></b>: PDP-8a Programmer's Panel

</LEGEND><DL>
<DT>8235.sch</A>
  <DD>is a schematic for an approximation of the function of
the unobtainium 8235 chip.
<DT>8235sub.sch</A>
  <DD>is a schematic for an approximation of the function of
the unobtainium 8235 chip.
<DT>8235sub1.sch</A>
  <DD>is a schematic for an approximation of the function of
the unobtainium 8235 chip.
<DT>8235sub2.sch</A>
  <DD>is a schematic for an approximation of the function of
the unobtainium 8235 chip.
<DT>programmerconsole.sch</A>
  <DD>is a schematic (before board layout) of 
an early draft of board1.
<DT>programmerconsolebrd2.sch</A>
  <DD>is a schematic (before board layout) of
an early draft of board1.
<DT>try1</A>
  <DD>is an early draft (05/26/2005) of board1 (the front-side
board).
<DT>try2</A>
  <DD>is an early draft (05/27/2005) of board2 (the back-side
board).
<DT>cut</A>
  <DD>is the stuff cut from board 1 and pasted to start board2, to
ensure size and alignment match up.
oboard2 is a checkpoint of an old version (06/02/2005) of
board2.
<DT>Progpanl.fpd</A>
  <DD>is a Front Panel Express drawing of the Programmer's
Panel artwork.
<DT>nosilkboth.brd</A>
  <DD>is both boards panelized, which is how the prototypes
were ordered.  This version has not had the silkscreen scripts run.
<DT>both.brd</A>
  <DD>is both boards panelized, which is how the prototypes
were ordered.  This version has had the silkscreen scripts run.
<DT>board1-0</A>
  <DD>is a snapshot of revision 0 of board1.
<DT>board2-0</A>
  <DD>is a snapshot of revision 0 of board2.
<DT>board1corrected</A>
  <DD>is board1 with the corrections to make DEC's
schematics work.
<DT>board2corrected</A>
  <DD>is board2 with the corrections to make DEC's
schematics work. (Has a consistency problem.)
<DT>board2eco</A>
  <DD>is board2 with the ECO's applied to make it work.
(Has a consistency problem which highlights the ECOs.)
<DT>board1</A>
  <DD>is the latest drawing of board 1 (front) of the 8/A front
panel replacement.
<DT>board2</A>
  <DD>is the latest drawing of board 2 (back) of the 8/A front
panel replacement.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/A601 target=_blank>./DEC/A601</a></b>: 3 Bit DAC

</LEGEND><DL>
<DT>A601hand</A>
  <DD>is a partially hand routed A601 DAC replacement as a single-sided
board.
<DT>A601</A>
  <DD>is another version of the A601 DAC replacement.
<DT>A601new</A>
  <DD>is the latest version of the A601 DAC replacement.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/BM812i target=_blank>./DEC/BM812i</a></b>: Omnibus Memory adapter for PDP-8/i and PDP-12

</LEGEND><DL>
<DT>proto</A>
  <DD>is a version od the bm812i board scaled down to a few
sockets, to make ordering a prototype cheaper.
<DT>bm812i</A>
  <DD>is a version of DEC's BM812i with extra space between the
connector blocks.
<DT>singleboard</A>
  <DD>is an implementation designed to fit into a single
slot in a standard Omnibus backplane.
<DT>sboardnew</A>
  <DD>is a newer version of singleboard, using 74S240
instead of 74H40 to drive the bus.
<DT>bm812inl</A>
  <DD>is a version of the BM812i board without the extra
space around the connector blocks.  (It needs to be checked against the
chassis to see if it has the needed clearances.)
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/DM01 target=_blank>./DEC/DM01</a></b>: Data Break Multiplexor

</LEGEND><DL>
<DT>DM04r</A>
  <DD>is an aborted attempt to think about doing a DMA multiplexer
from scratch.
<DT>DM01</A>
  <DD>is DEC's DM01, done up as a board in Eagle.
<DT>DM01eco</A>
  <DD>is DEC's DM01, with a TechTip fix added.
<DT>DM04mux</A>
  <DD>is another aborted early DM04 attempt.
<DT>DM04ttl</A>
  <DD>is my design for a DMA multiplexer similar to the DM04,
based on DEC's DM01.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/DouglasElectronics target=_blank>./DEC/DouglasElectronics</a></b>: Various Eagle approximations of boards sold by Douglas Electronics.

</LEGEND><DL>
<DT>5-de-7</A>
  <DD>is a drawing of the 5-de-7.
<DT>10-de-77</A>
  <DD>is a drawing of the 10-de-77.
<DT>11-de-7</A>
  <DD>is a drawing of the 11-de-7.
<DT>18-de-77</A>
  <DD>is a drawing of the 18-de-77.
<DT>21-de-7</A>
  <DD>is a drawing of the 21-de-7.
<DT>21-de-77</A>
  <DD>is a drawing of the 21-de-77.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/DW08A target=_blank>./DEC/DW08A</a></b>: Posibus to Negibus Converter

</LEGEND><DL>
<DT>dw08a2s</A>
  <DD>is a two-sided board based on DEC's DW08A Posibus
Converter backplane.
<DT>dw08aholes</A>
  <DD>is a version of dw08a2s with un-needed cutout holes,
and only 6 mil traces (too thin).
<DT>dw08a</A>
  <DD>is dw08aholes with the power traces beefed up, and is
the version that matches the prototypes.  It has a mechanical interference
fit at the right edge.
<DT>dw08aRev2</A>
  <DD>is a version of the dw08a backplane with the
interference fit fixed, and the un-needed holes removed.
<DT>dw08aRev3</A>
  <DD>is a version of the dw08a backplane that fixes another
interference fit, having to do with the backplane being more than 3U tall.
<DT>dw08a4lyr</A>
  <DD>is a four layer version, with all the traces
beefed up.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/DW08Bx target=_blank>./DEC/DW08Bx</a></b>: Negibus to Posibus Converter

</LEGEND><DL>
<DT>dw08a</A>
  <DD>is a version of the DW08A Posibus to Negibus Converter backplane,
for reference.
<DT>dw08b</A>
  <DD>is a drawing that approximates DEC's DW08B Negibus to Posibus
Converter backplane.  It is still an "x" version because the part/pin numbering has not 
been checked against the DEC version.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx target=_blank>./DEC/Gxxx</a></b>: Gxxx modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G021 target=_blank>./DEC/Gxxx/G021</a></b>: Sense Amplifier

</LEGEND><DL>
<DT>G021old</A>
  <DD>is a drawing of DEC's G021 Core Sense Amplifier board,
with the unobtainium MC1540 sense amp chips.
<DT>G021dec</A>
  <DD>is a drawing of DEC's G021 Core Sense Amplifier board,
with the unobtainium MC1540 sense amp chips.
<DT>G021K</A>
  <DD>is a drawing of DEC's G021K Core Sense Amplifier board,
with the layout based on the G021H.
<DT>G021K-E</A>
  <DD>is a drawing of DEC's G021 Core Sense Amplifier board,
with the layout based on the G021E.
<DT>G021Kng</A>
  <DD>is a drawing of DEC's G021 Core Sense Amplifier board,
with the H layout, but without the gold edge connector.
<DT>G021vrs</A>
  <DD>is a drawing of DEC's G021 Core Sense Amplifier board,
with the unobtainium MC1540 sense amp chips.
<DT>sense-amp</A>
  <DD>is an approximation of the function of the MC1540,
using LM148 op-amps.
<DT>G021-1</A>
  <DD>is a 12/04/2004 checkpoint of G021.
<DT>G021</A>
  <DD>is a version of the G021 with the MC1540 replaced with
LM837.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G228 target=_blank>./DEC/Gxxx/G228</a></b>: Core Inhibit Driver

</LEGEND><DL>
<DT>G228</A>
  <DD>is a drawing of DEC's G228 Inhibit Driver, including the 
unobtainium T-2052 transformers.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G717 target=_blank>./DEC/Gxxx/G717</a></b>: Positive Bus Control Signal Terminator.

</LEGEND><DL>
<DT>G717</A>
  <DD>is an implementation of DEC's G717 bus terminator.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G879 target=_blank>./DEC/Gxxx/G879</a></b>: Transport Detector

</LEGEND><DL>
<DT>G879</A>
  <DD>is an Eagle version of DEC's G879 Transport Detector.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G888 target=_blank>./DEC/Gxxx/G888</a></b>: Manchester Reader/Writer

</LEGEND><DL>
<DT>G888</A>
  <DD>is an early attempt to draw the G888.
<DT>G888a</A>
  <DD>is an Eagle version of DEC's G888 with DIP versions of the 
MC1709.
<DT>G888b</A>
  <DD>an updated version of G888a.
<DT>G888c</A>
  <DD>an older version of G888a.
<DT>G888x</A>
  <DD>The latest verion of the G888, with a bunch of
cross-reference information in the schematic.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/M11x target=_blank>./DEC/M11x</a></b>: Replacement for M11[13579] modules.

</LEGEND><DL>
<DT>MxxxRow</A>
  <DD>is a drawing for TTL versions of the M11[13579], all 
on one board.  (Populate only the row for the desired module type.)
<DT>MxxxCol</A>
  <DD>is similar to MxxxRow, but arranges the chips in columns
(less successful).
<DT>Mxxx</A>
  <DD>is a module that implements the M11[13579] in TTL
(a newer version of MxxxRow).
<DT>mxxx.pl</A>
  <DD>is some Perl code to look at input-output mapping for 
PAL implementations.
<DT>PALFromPerl</A>
  <DD>is a PAL-based version based on the results 
from mxxx.pl.
<DT>PALVersion</A>
  <DD>is another PAL-based version similar to PalFromPerl.
<DT>PAL3579</A>
  <DD>is a PAL version that fits everything except the M111.
<DT>PAL13579</A>
  <DD>is a PAL version that fits everything, but needs a 
fourth PAL.
<DT>MxxxOVR</A>
  <DD>is the latest through-hole TTL version.
<DT>MxxxSMT</A>
  <DD>is an SMT verstion, which adds the M206/M216 and M207.
<DT>MxxxSMT8x11</A>
  <DD>is an 7.7"x10.1" panelization of six MxxxSMT.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx target=_blank>./DEC/Mxxx</a></b>: Mxxx modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/buscon target=_blank>./DEC/Mxxx/buscon</a></b>: Negibus/Posibus Connectors

</LEGEND><DL>
<DT>BusCon</A>
  <DD>is a version of DEC's M90x and W0x1 connector paddles, 
(based on the work from the BusCon project).
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M002 target=_blank>./DEC/Mxxx/M002</a></b>: 15 Loads

</LEGEND><DL>
<DT>M002A</A>
  <DD>is a drawing of DEC's M002A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M040 target=_blank>./DEC/Mxxx/M040</a></b>: Solenoid Driver

</LEGEND><DL>
<DT>M040E</A>
  <DD>is a drawing of DEC's M040E.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M044 target=_blank>./DEC/Mxxx/M044</a></b>: 4-100mA Solenoid Drivers

</LEGEND><DL>
<DT>M044B</A>
  <DD>is a drawing of DEC's M044B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M050 target=_blank>./DEC/Mxxx/M050</a></b>: Inverter driver, 12 circuits, switch -30V and 50mA max/driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M051 target=_blank>./DEC/Mxxx/M051</a></b>: Level Converter, positive logic in and negative logic out, 12 circuits, open collector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M060 target=_blank>./DEC/Mxxx/M060</a></b>: Solenoid Driver

</LEGEND><DL>
<DT>M060A</A>
  <DD>is a drawing of DEC's M060A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M100 target=_blank>./DEC/Mxxx/M100</a></b>: Bus Data Interface

</LEGEND><DL>
<DT>M100A</A>
  <DD>is a drawing of DEC's M100A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M101 target=_blank>./DEC/Mxxx/M101</a></b>: Bus Data Interface

</LEGEND><DL>
<DT>M101</A>
  <DD>is an Eagle version of DEC's M101 Bus Interface.
<DT>M101A</A>
  <DD>is a drawing of DEC's M101A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M102 target=_blank>./DEC/Mxxx/M102</a></b>: Negative Bus Equivalent to M103

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M103 target=_blank>./DEC/Mxxx/M103</a></b>: Device Selector

</LEGEND><DL>
<DT>M103</A>
  <DD>is an Eagle version of DEC's M103 Device Selector.
<DT>M103A</A>
  <DD>is a drawing of DEC's M103A.
<DT>M103B</A>
  <DD>is a drawing of DEC's M103B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M104 target=_blank>./DEC/Mxxx/M104</a></b>: I/O Bus Multiplexor

</LEGEND><DL>
<DT>M104D</A>
  <DD>is a drawing of DEC's M104D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M105 target=_blank>./DEC/Mxxx/M105</a></b>: Address Selector

</LEGEND><DL>
<DT>M105-bad</A>
  <DD>is an Eagle version of DEC's M105 Address Selector, but 
without bus receivers that won't actually work.
<DT>M105</A>
  <DD>is an Eagle version of DEC's M105 Address Selector with 
proper bus receivers.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M106 target=_blank>./DEC/Mxxx/M106</a></b>: Dot NOR Gates

</LEGEND><DL>
<DT>M106A</A>
  <DD>is a drawing of DEC's M106A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M111 target=_blank>./DEC/Mxxx/M111</a></b>: Inverters

</LEGEND><DL>
<DT>M111</A>
  <DD>is an Eagle version of DEC's M111 Inverter card.
<DT>M111C</A>
  <DD>is a drawing of DEC's M111C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M112 target=_blank>./DEC/Mxxx/M112</a></b>: NOR Gates

</LEGEND><DL>
<DT>M112D</A>
  <DD>is a drawing of DEC's M112D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M113 target=_blank>./DEC/Mxxx/M113</a></b>: 10 2-Input NAND Gates

</LEGEND><DL>
<DT>M113</A>
  <DD>is an Eagle version of DEC's M113 NAND Gates
<DT>M113C</A>
  <DD>is a drawing of DEC's M113C.
<DT>M113D</A>
  <DD>is a drawing of DEC's M113D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M115 target=_blank>./DEC/Mxxx/M115</a></b>: 8 3-Input NAND Gates

</LEGEND><DL>
<DT>M115</A>
  <DD>is an Eagle version of DEC's M119 NAND Gates
<DT>M115C</A>
  <DD>is a drawing of DEC's M115C.
<DT>M115D</A>
  <DD>is a drawing of DEC's M115D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M117 target=_blank>./DEC/Mxxx/M117</a></b>: 6 4-Input NAND Gates

</LEGEND><DL>
<DT>M117</A>
  <DD>is an Eagle version of DEC's M117 4-Input NAND Gate Module
<DT>M117B</A>
  <DD>is a drawing of DEC's M117B.
<DT>M117C</A>
  <DD>is a drawing of DEC's M117C.
<DT>M117E</A>
  <DD>is a drawing of DEC's M117E.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M119 target=_blank>./DEC/Mxxx/M119</a></b>: 3 8-Input NAND Gates

</LEGEND><DL>
<DT>M119</A>
  <DD>is an Eagle version of DEC's M119 8-Input NAND Gate module.
<DT>M119B</A>
  <DD>is a drawing of DEC's M119B.
<DT>M119C</A>
  <DD>is a drawing of DEC's M119C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M121 target=_blank>./DEC/Mxxx/M121</a></b>: 6 AND-NOR Gates

</LEGEND><DL>
<DT>M121</A>
  <DD>is an Eagle version of DEC's M121 AND-NOR Gate module.
<DT>M121B</A>
  <DD>is a drawing of DEC's M121B.
<DT>M121D</A>
  <DD>is a drawing of DEC's M121D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M126 target=_blank>./DEC/Mxxx/M126</a></b>: H version of M121, not pin compatible

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M127 target=_blank>./DEC/Mxxx/M127</a></b>: 2 2-2-3 AND-NOR Gates

</LEGEND><DL>
<DT>M127A</A>
  <DD>is a drawing of DEC's M127A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M129 target=_blank>./DEC/Mxxx/M129</a></b>: 4-4 AND-NOR, H, 4 circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M130 target=_blank>./DEC/Mxxx/M130</a></b>: 5 8-bit parity circuits + 5 2-input XOR gates (MC4008)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M133 target=_blank>./DEC/Mxxx/M133</a></b>: 10-2 Input NAND Gates

</LEGEND><DL>
<DT>M133A</A>
  <DD>is a drawing of DEC's M133A.
<DT>M133B</A>
  <DD>is a drawing of DEC's M133B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M135 target=_blank>./DEC/Mxxx/M135</a></b>: 8-3 Input NAND Gates

</LEGEND><DL>
<DT>M135A</A>
  <DD>is a drawing of DEC's M135A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M139 target=_blank>./DEC/Mxxx/M139</a></b>: H version of M119

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M141 target=_blank>./DEC/Mxxx/M141</a></b>: 2-2-2-2 AND-NOR gates, 3 circuits, 2 inverters

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M142 target=_blank>./DEC/Mxxx/M142</a></b>: Adder, discrete equivalent to M132

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M143 target=_blank>./DEC/Mxxx/M143</a></b>: 10 2-input NAND gates, with one pair sharing common input, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M145 target=_blank>./DEC/Mxxx/M145</a></b>: 3-input NAND gates, 7 circuits, 74H, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M149 target=_blank>./DEC/Mxxx/M149</a></b>: 9x2 NAND Wired OR Matrix

</LEGEND><DL>
<DT>M149A</A>
  <DD>is a drawing of DEC's M149A.
<DT>M149C</A>
  <DD>is a drawing of DEC's M149C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M151 target=_blank>./DEC/Mxxx/M151</a></b>: Dual binary to octal with enable, H series, KI10, 74H20

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M152 target=_blank>./DEC/Mxxx/M152</a></b>: M151 non-inverting, KI10, 74H21

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M159 target=_blank>./DEC/Mxxx/M159</a></b>: 4 bit arithmetic logic unit (DEC 74181), uses 50-08908 board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M160 target=_blank>./DEC/Mxxx/M160</a></b>: AND-NOR Gate Module

</LEGEND><DL>
<DT>M160C</A>
  <DD>needs a drawing.
<DT>M160D</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M161 target=_blank>./DEC/Mxxx/M161</a></b>: Binary to Octal/Decimal Decoder

</LEGEND><DL>
<DT>M161</A>
  <DD>is an Eagle version of DEC's M161 Octal/Decimal Decoder module.
<DT>M161C</A>
  <DD>is a drawing of DEC's M161C.
<DT>M161x</A>
  <DD>is a version of revision C with design rules more suited to milling individual PCBs.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M162 target=_blank>./DEC/Mxxx/M162</a></b>: Parity Circuit

</LEGEND><DL>
<DT>M162</A>
  <DD>is an Eagle version of DEC's M162 Parity module.
<DT>M162B</A>
  <DD>is a drawing of DEC's M162B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M163 target=_blank>./DEC/Mxxx/M163</a></b>: Dual binary to decimal decoder

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M164 target=_blank>./DEC/Mxxx/M164</a></b>: 6-bit adder for PDP-15, 2 adders for carry-in 1 or 0

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M165 target=_blank>./DEC/Mxxx/M165</a></b>: Memory buffer, inverting and non-inverting output from open collector, 8 channels for KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M166 target=_blank>./DEC/Mxxx/M166</a></b>: 9-bit Counting Gate, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M169 target=_blank>./DEC/Mxxx/M169</a></b>: Functional gate module for PDP-12, 4 4-bit output multiplexors

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M170 target=_blank>./DEC/Mxxx/M170</a></b>: 3-3-3-2-2-2-2-2 AND-NOR & 3-2-2-2 AND-NOR, H series, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1701 target=_blank>./DEC/Mxxx/M1701</a></b>: 4 to 1 MUX, 4 circuits, 50-08912 etch, 74153

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M171 target=_blank>./DEC/Mxxx/M171</a></b>: 2-2-2-3 AND-NOR, 3 circuits, different pins than M127

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1713 target=_blank>./DEC/Mxxx/M1713</a></b>: 16 to 1 MUX inverting, 74150, 50-08908 etch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M172 target=_blank>./DEC/Mxxx/M172</a></b>: 2 En x 9 out mixer, 74H50, for KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M173 target=_blank>./DEC/Mxxx/M173</a></b>: Non-inverting M143

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M174 target=_blank>./DEC/Mxxx/M174</a></b>: 4 En x 9 out mixer, 74H53s, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M175 target=_blank>./DEC/Mxxx/M175</a></b>: 7 3-input AND gates, 74H, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M177 target=_blank>./DEC/Mxxx/M177</a></b>: Non-inverting M147

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M178 target=_blank>./DEC/Mxxx/M178</a></b>: 8 En x 6 out mixer, 74H53, 74H62, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M181 target=_blank>./DEC/Mxxx/M181</a></b>: Non-inverting M171

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M182 target=_blank>./DEC/Mxxx/M182</a></b>: M162 with fast ICs, 74H

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M191 target=_blank>./DEC/Mxxx/M191</a></b>: 2 Look-ahead elements (74182), uses W961 board, used with M190 or M159 (board 50-08912)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M203 target=_blank>./DEC/Mxxx/M203</a></b>: 8 Set-Reset Flip Flops

</LEGEND><DL>
<DT>M203B</A>
  <DD>is a drawing of DEC's M203B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M204 target=_blank>./DEC/Mxxx/M204</a></b>: Counter Buffer

</LEGEND><DL>
<DT>M204D</A>
  <DD>is a drawing of DEC's M204D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M205 target=_blank>./DEC/Mxxx/M205</a></b>: 5 D Flip Flops

</LEGEND><DL>
<DT>M205A</A>
  <DD>is a drawing of DEC's M205A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M206 target=_blank>./DEC/Mxxx/M206</a></b>: 6 D Flip-Flops

</LEGEND><DL>
<DT>M206</A>
  <DD>is an Eagle version of DEC's M206 Flip-Flop module.
<DT>M206C</A>
  <DD>is an Eagle version of DEC's M206C Flip-Flop module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M207 target=_blank>./DEC/Mxxx/M207</a></b>: 6 J-K Flip-Flops

</LEGEND><DL>
<DT>M207</A>
  <DD>is an Eagle version of DEC's M207 J-K Flip-Flop module.
<DT>M207C</A>
  <DD>is a drawing of DEC's M207C.
<DT>M207E</A>
  <DD>is a drawing of DEC's M207E.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M208 target=_blank>./DEC/Mxxx/M208</a></b>: Buffer/Shift Register

</LEGEND><DL>
<DT>M208C</A>
  <DD>is a drawing of DEC's M208C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M211 target=_blank>./DEC/Mxxx/M211</a></b>: 6-bit Up/down counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M212 target=_blank>./DEC/Mxxx/M212</a></b>: 6 Bit L-R Shift Register

</LEGEND><DL>
<DT>M212B</A>
  <DD>is a drawing of DEC's M212B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M214 target=_blank>./DEC/Mxxx/M214</a></b>: 6-bit Accumulator with 3 inputs

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M216 target=_blank>./DEC/Mxxx/M216</a></b>: 6 D Flip-Flops

</LEGEND><DL>
<DT>M206</A>
  <DD>is an Eagle version of DEC's M206 or M216 D Flip-Flop module.
<DT>M216B</A>
  <DD>needs a drawing.
<DT>M216C</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M217 target=_blank>./DEC/Mxxx/M217</a></b>: Clock register for PDP-12, 4 bit counter with buffer register for preset or readout

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M218 target=_blank>./DEC/Mxxx/M218</a></b>: Bi-directional shift register, 9 bits, 2 parallel loads

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M219 target=_blank>./DEC/Mxxx/M219</a></b>: 7-bit synchronous counter with jam and clear presets

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M220 target=_blank>./DEC/Mxxx/M220</a></b>: Major Registers

</LEGEND><DL>
<DT>m220print</A>
  <DD>is a snapshot of M220.
<DT>m220</A>
  <DD>is DEC's M220 Major Registers card (revision B).
<DT>m220noadder</A>
  <DD>is an incomplete attempt to replace the adder chip 
with gate-level logic.
<DT>m220new</A>
  <DD>is an implementation that doesn't use the hard to find 
7453 and 7482 chips.
<DT>m220pal</A>
  <DD>is a PAL implementation, using PALs programed with
m220pgm1.pds and m220pgm2.pds.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M221 target=_blank>./DEC/Mxxx/M221</a></b>: Register for PDP-12 (M220 plus extra logic)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M222 target=_blank>./DEC/Mxxx/M222</a></b>: Tape register for PDP-12, 2 bits, 6 registers

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M223 target=_blank>./DEC/Mxxx/M223</a></b>: MA,/MB Registers

</LEGEND><DL>
<DT>M223B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M226 target=_blank>./DEC/Mxxx/M226</a></b>: 1 Bit, all registers (except ACC) for PDP-15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M227 target=_blank>./DEC/Mxxx/M227</a></b>: Accumulator for PDP-15, 9 bits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M228 target=_blank>./DEC/Mxxx/M228</a></b>: Mark Track Decoder

</LEGEND><DL>
<DT>M228</A>
  <DD>is DEC's M228 Mark Track Decoder
<DT>M228pnames</A>
  <DD>is a version where the pin names are used instead of signal names.
<DT>M228A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M238 target=_blank>./DEC/Mxxx/M238</a></b>: 2 4-bit Synchronous up/down counters with parallel load, separate up & down clocks, board etch 50-08912

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M239 target=_blank>./DEC/Mxxx/M239</a></b>: 3-4 Bit Counter/Registers

</LEGEND><DL>
<DT>M239A</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M240 target=_blank>./DEC/Mxxx/M240</a></b>: 6 R/S Flip Flops

</LEGEND><DL>
<DT>M240B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M241 target=_blank>./DEC/Mxxx/M241</a></b>: 6 D Flip-flops (74H74) with common clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M242 target=_blank>./DEC/Mxxx/M242</a></b>: H version of M202

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M243 target=_blank>./DEC/Mxxx/M243</a></b>: 8 D Flip-flops (74H74) with 2 common clocks, 4 bits each

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M246 target=_blank>./DEC/Mxxx/M246</a></b>: 5 D flip-flops, all pins available (74H74)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M247 target=_blank>./DEC/Mxxx/M247</a></b>: 6 RS flip-flops, clocked to 6 D flip-flops

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M248 target=_blank>./DEC/Mxxx/M248</a></b>: 8-bit Shift right, parallel load, 50-08914 etch, 7495

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M250 target=_blank>./DEC/Mxxx/M250</a></b>: 16 Words, 4-bit memory (F9035), KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M253 target=_blank>./DEC/Mxxx/M253</a></b>: 16 Words, 12-bit memory (TI 7489)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M260 target=_blank>./DEC/Mxxx/M260</a></b>: Associative memory, 4x12, KI10, Fairchild 4102 IC, 35ns match time

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M302 target=_blank>./DEC/Mxxx/M302</a></b>: One Shot Delay

</LEGEND><DL>
<DT>M302</A>
  <DD>is an Eagle version of DEC's M302 One Shot Delay Board.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M304 target=_blank>./DEC/Mxxx/M304</a></b>: One Shot Delay

</LEGEND><DL>
<DT>M304B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M306 target=_blank>./DEC/Mxxx/M306</a></b>: Integrating One Shot

</LEGEND><DL>
<DT>M306B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M307 target=_blank>./DEC/Mxxx/M307</a></b>: Integrating One Shot

</LEGEND><DL>
<DT>M307-9601</A>
  <DD>is DEC's M307 Integrating One Shot module, with the
now hard to find 9601 monostables.
<DT>M307foo</A>
  <DD>is a messed up version.
<DT>M307mod</A>
  <DD>is a checkpoint of an early version of M307.
<DT>M307</A>
  <DD>is a version of the M307 using the more readily available
74123 instead of the 9601.
<DT>M307B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M3070 target=_blank>./DEC/Mxxx/M3070</a></b>: Dual integrating one-shot 200ns to 20ms in 5 steps

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M308 target=_blank>./DEC/Mxxx/M308</a></b>: Integrating one-shot, edge or pulse triggered, clock, power up & down

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M310 target=_blank>./DEC/Mxxx/M310</a></b>: Delay Line

</LEGEND><DL>
<DT>M310A</A>
  <DD>needs a drawing.
<DT>M310B</A>
  <DD>needs a drawing.
<DT>M310C</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M311 target=_blank>./DEC/Mxxx/M311</a></b>: Tap Delay Line

</LEGEND><DL>
<DT>M311A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M312 target=_blank>./DEC/Mxxx/M312</a></b>: Delay Module

</LEGEND><DL>
<DT>M312C</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M321 target=_blank>./DEC/Mxxx/M321</a></b>: M311 except one delay line, one output buffer can drive 30 TTL H loads

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M360 target=_blank>./DEC/Mxxx/M360</a></b>: Variable Delay

</LEGEND><DL>
<DT>M360</A>
  <DD>is a replacement for DEC's M360 Variable Delay, based in part on the MM360,
by Dave Brockman.
<DT>M360A</A>
  <DD>needs a drawing.
<DT>M360B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M362 target=_blank>./DEC/Mxxx/M362</a></b>: Delay, 25 to 50 ns

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M363 target=_blank>./DEC/Mxxx/M363</a></b>: Delay, 15 to 30 ns, inverts

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M401 target=_blank>./DEC/Mxxx/M401</a></b>: Variable Clock

</LEGEND><DL>
<DT>M401</A>
  <DD>is an Eagle version of DEC's M401 Variable Clock module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M402 target=_blank>./DEC/Mxxx/M402</a></b>: Remotely variable clock, Uses 5V photomod, 2Hz to 1MHz

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M405 target=_blank>./DEC/Mxxx/M405</a></b>: Crystal Clock, positive and negative pulse outputs, 5KHz to 10MHz

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M410 target=_blank>./DEC/Mxxx/M410</a></b>: Resonant Reed Clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M420 target=_blank>./DEC/Mxxx/M420</a></b>: Phase Lock Clock, RP09, RP15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M452 target=_blank>./DEC/Mxxx/M452</a></b>: Variable Clock

</LEGEND><DL>
<DT>M452A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M500 target=_blank>./DEC/Mxxx/M500</a></b>: Negative Input Converter

</LEGEND><DL>
<DT>M500A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M501 target=_blank>./DEC/Mxxx/M501</a></b>: Schmitt Trigger

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M502 target=_blank>./DEC/Mxxx/M502</a></b>: Negative Input Converter

</LEGEND><DL>
<DT>M502-3</A>
  <DD>is a checkpoint of an early version.
<DT>M502</A>
  <DD>is DEC's M502 Negative Input Converter.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M503 target=_blank>./DEC/Mxxx/M503</a></b>: Differential Schmitt, 2 channels, pulse amplifier in each

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M506 target=_blank>./DEC/Mxxx/M506</a></b>: Negative Input Converter, 6 channels, 0 and -3V in

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M507 target=_blank>./DEC/Mxxx/M507</a></b>: Bus Converter

</LEGEND><DL>
<DT>M507B</A>
  <DD>needs a drawing.
<DT>M507F</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M508 target=_blank>./DEC/Mxxx/M508</a></b>: Negative bus to positive bus converter, 6 circuits, open collector outputs, GND in = positive out

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M510 target=_blank>./DEC/Mxxx/M510</a></b>: I/O Bus Receiver

</LEGEND><DL>
<DT>M510A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M511 target=_blank>./DEC/Mxxx/M511</a></b>: Unibus Reciever, 15 circuits, 4 GND, DS11, DL10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M514 target=_blank>./DEC/Mxxx/M514</a></b>: TU10 Transceiver (for connection to TC58, TC59, & TM10), see M519

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M515 target=_blank>./DEC/Mxxx/M515</a></b>: Real Time Clock, 12VAC input on tabs, uses +11V & +5V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M516 target=_blank>./DEC/Mxxx/M516</a></b>: Hex Positive Bus Receiver

</LEGEND><DL>
<DT>M516</A>
  <DD>is DEC's M516 Hex Positive Bus Receiver module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M517 target=_blank>./DEC/Mxxx/M517</a></b>: M507 with an enable input

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M531 target=_blank>./DEC/Mxxx/M531</a></b>: 8 channel Negative Bus Receiver with noise filtering (M500 pins)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M564 target=_blank>./DEC/Mxxx/M564</a></b>: I/O Bus Receiver, 8 circuits, negative bus, positive logic, light input load

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M565 target=_blank>./DEC/Mxxx/M565</a></b>: Memory Bus Receiver, 8 circuite, negative bus, positive logic

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M592 target=_blank>./DEC/Mxxx/M592</a></b>: I/O Device Select (used with M71000)10 74H IC's

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M5940 target=_blank>./DEC/Mxxx/M5940</a></b>: 8 channel EIA-CCITT to DEC, 7 DEC to EIA-CCITT, DF11-A, 1V hysteresis, 5" veersion

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M597 target=_blank>./DEC/Mxxx/M597</a></b>: 6 Channel IBM Receiver

</LEGEND><DL>
<DT>M597D</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M602 target=_blank>./DEC/Mxxx/M602</a></b>: Pulse Amplifier

</LEGEND><DL>
<DT>M602</A>
  <DD>is DEC's M602 Pulse Amplifier module.
<DT>M602a</A>
  <DD>is essentially the same as M602.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M603 target=_blank>./DEC/Mxxx/M603</a></b>: 2 Pulse Amplifiers, negative edge in, 1 positive 60ns & 1 positive 45-100ns out, 4 2-input NANDs (74H00), 3 3-input ANDs (74H11)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M606 target=_blank>./DEC/Mxxx/M606</a></b>: Pulse Generator

</LEGEND><DL>
<DT>M606B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M611 target=_blank>./DEC/Mxxx/M611</a></b>: High Speed Power Inverter

</LEGEND><DL>
<DT>M611A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M612 target=_blank>./DEC/Mxxx/M612</a></b>: 6 Power Gates, 6 grounds, 5 inputs per gate pair

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M617 target=_blank>./DEC/Mxxx/M617</a></b>: 6-4 Input NOR Buffers

</LEGEND><DL>
<DT>M617A</A>
  <DD>needs a drawing.
<DT>M617B</A>
  <DD>is a drawing of DEC's M617B.
<DT>M617C</A>
  <DD>is a drawing of DEC's M617C.
<DT>M617E</A>
  <DD>is a drawing of DEC's M617E.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M621 target=_blank>./DEC/Mxxx/M621</a></b>: Bus Driver, 6 circuits, enables for each of 2 6-bit words

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M622 target=_blank>./DEC/Mxxx/M622</a></b>: Bus Drivers

</LEGEND><DL>
<DT>M622A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M623 target=_blank>./DEC/Mxxx/M623</a></b>: Bus Drivers

</LEGEND><DL>
<DT>M623</A>
  <DD>is DEC's M623 Bus Driver module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M624 target=_blank>./DEC/Mxxx/M624</a></b>: Bus Drivers

</LEGEND><DL>
<DT>M624A</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M627 target=_blank>./DEC/Mxxx/M627</a></b>: Power Amplifier Module

</LEGEND><DL>
<DT>M627</A>
  <DD>is DEC's M627 Power Amplifier module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M628 target=_blank>./DEC/Mxxx/M628</a></b>: 3 switches, 2 bit adder, 1 M621 type driver, for MX15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M629 target=_blank>./DEC/Mxxx/M629</a></b>: Bus Driver, 11 circuits, for positive bus, PDP11, 8881's

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M632 target=_blank>./DEC/Mxxx/M632</a></b>: Positive Input Converter Drivers

</LEGEND><DL>
<DT>M632A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M633 target=_blank>./DEC/Mxxx/M633</a></b>: Negative Bus Driver

</LEGEND><DL>
<DT>M633</A>
  <DD>is DEC's M633 Negative Bus Driver.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M650 target=_blank>./DEC/Mxxx/M650</a></b>: Negative output converter, 3 channels, R650 type outputs

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M651 target=_blank>./DEC/Mxxx/M651</a></b>: M650 with outputs clamped to ground when 5V goes away

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M652 target=_blank>./DEC/Mxxx/M652</a></b>: Negative Output Converters

</LEGEND><DL>
<DT>M652A</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M660 target=_blank>./DEC/Mxxx/M660</a></b>: Positive Level Drivers

</LEGEND><DL>
<DT>M660A</A>
  <DD>needs a drawing.
<DT>M660B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M661 target=_blank>./DEC/Mxxx/M661</a></b>: Positive Level Driver for 8/I bus, 3 circuits, output clamped to +3V, M660 pins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M663 target=_blank>./DEC/Mxxx/M663</a></b>: 3 negative Memory Bus Drivers, positive input, 50 ohm load, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M664 target=_blank>./DEC/Mxxx/M664</a></b>: I/O Bus Driver, 0 to +3V in, 0 to -3V out, 8 circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M665 target=_blank>./DEC/Mxxx/M665</a></b>: Memory Bus Driver, 0 to +3V in, 0 to -3V out, 8 circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M666 target=_blank>./DEC/Mxxx/M666</a></b>: I/O Bus Reset, 12 outputs, 20mA@-3V, 1/3 duty factor max

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M697 target=_blank>./DEC/Mxxx/M697</a></b>: 4 Channel IBM Transmitter

</LEGEND><DL>
<DT>M697D</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M700 target=_blank>./DEC/Mxxx/M700</a></b>: Manual Timing Generator

</LEGEND><DL>
<DT>M700A</A>
  <DD>needs a drawing and a DEC schematic.
<DT>M700B</A>
  <DD>needs a drawing and a DEC schematic.
<DT>M700C</A>
  <DD>needs a drawing and a DEC schematic.
<DT>M700D</A>
  <DD>needs a drawing.
<DT>M700E</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M703 target=_blank>./DEC/Mxxx/M703</a></b>: Power Fail Logic, 8/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M704 target=_blank>./DEC/Mxxx/M704</a></b>: Plotter Control, 8/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M705 target=_blank>./DEC/Mxxx/M705</a></b>: Reader Control

</LEGEND><DL>
<DT>M705</A>
  <DD>is DEC's M705 PR8i Reader Logic board.
<DT>M705ok</A>
  <DD>is a checkpoint of M705.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7050 target=_blank>./DEC/Mxxx/M7050</a></b>: Reader Control with feed hole strobe & feed hole transistion out-of-tape sense

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M706 target=_blank>./DEC/Mxxx/M706</a></b>: Teletype Receiver

</LEGEND><DL>
<DT>M706D</A>
  <DD>needs a drawing.
<DT>M706K</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M707 target=_blank>./DEC/Mxxx/M707</a></b>: Teletype Transmitter

</LEGEND><DL>
<DT>M707D</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M708 target=_blank>./DEC/Mxxx/M708</a></b>: Clock Control, 8/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M709 target=_blank>./DEC/Mxxx/M709</a></b>: Clock Counter, 8/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M710 target=_blank>./DEC/Mxxx/M710</a></b>: Punch control

</LEGEND><DL>
<DT>M710-9601</A>
  <DD>is a drawing of DEC's M710 Punch Controller card, which
uses the hard to find 9601 monstable.
<DT>M710</A>
  <DD>is a drawing of DEC's M710 Punch Controller card, which
uses the hard to find 9601 monstable.
<DT>M710F</A>
  <DD>needs a drawing.
<DT>M710H</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7100 target=_blank>./DEC/Mxxx/M7100</a></b>: I/O Device Control, used with M592, 10 74H IC's

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7102 target=_blank>./DEC/Mxxx/M7102</a></b>: Positive I/O Bus Converter

</LEGEND><DL>
<DT>M7102</A>
  <DD>is a drawing of DEC's M7102 Positive I/O Bus Converter Board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7103 target=_blank>./DEC/Mxxx/M7103</a></b>: Negative I/O Bus Converter

</LEGEND><DL>
<DT>M7103</A>
  <DD>is a drawing of DEC's M7103 Negative I/O Bus Converter Board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M711 target=_blank>./DEC/Mxxx/M711</a></b>: Scope Control, PDP-12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M714 target=_blank>./DEC/Mxxx/M714</a></b>: Control Logic I, CR8-I, CR8-L

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M715 target=_blank>./DEC/Mxxx/M715</a></b>: Reader Clock

</LEGEND><DL>
<DT>M715</A>
  <DD>is a drawing of DEC's M715 Reader Clock module, with the hard to find
9601 monostables.
<DT>M715E</A>
  <DD>needs a drawing.
<DT>M715F</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M716 target=_blank>./DEC/Mxxx/M716</a></b>: Control Logic II, CR8-I, CR8-L

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M717 target=_blank>./DEC/Mxxx/M717</a></b>: Display Control, VP09, VP15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M719 target=_blank>./DEC/Mxxx/M719</a></b>: Clock Sync & Decade Counter, KW12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M720 target=_blank>./DEC/Mxxx/M720</a></b>: Memory Detection

</LEGEND><DL>
<DT>M720</A>
  <DD>is DEC's M720 Memory Detection board.
<DT>M720db</A>
  <DD>is a version using monostables, based on the MM720 by 
Dave Brockman.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M750 target=_blank>./DEC/Mxxx/M750</a></b>: Line I/O Control, equivalent to 2 W750s

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M751 target=_blank>./DEC/Mxxx/M751</a></b>: Line Register & R Register for DC08A, I/O Bus Connection

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M752 target=_blank>./DEC/Mxxx/M752</a></b>: Instruction Decoder & Gates for DC08A

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M753 target=_blank>./DEC/Mxxx/M753</a></b>: Control for 2 Data Set Lines in DC08F

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M760 target=_blank>./DEC/Mxxx/M760</a></b>: A/D CONTROL FOR PDP-12, POSSIBLE GENERAL APPLICATION

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M763 target=_blank>./DEC/Mxxx/M763</a></b>: 9 TRACK WRITE BUFFER, FOR TU10, NEG LOGIC, SEE M893

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M765 target=_blank>./DEC/Mxxx/M765</a></b>: 9 TRACK READ BUFFER, FOR TU10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M767 target=_blank>./DEC/Mxxx/M767</a></b>: Clock and Skew Delay

</LEGEND><DL>
<DT>M767A</A>
  <DD>needs a drawing.
<DT>M767C</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7670 target=_blank>./DEC/Mxxx/M7670</a></b>: Forward BOT Timer, TU10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7672 target=_blank>./DEC/Mxxx/M7672</a></b>: TU10 Command Buffers

</LEGEND><DL>
<DT>M7672</A>
  <DD>is a drawing of DEC's M7672 TU10 Command Buffers board, including
the hard to find 8202 chip.
<DT>M7672n</A>
  <DD>is a drawing of DEC's M7672 TU10 Command Buffers board with the
8202 replaced with a 74821 chip.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M768 target=_blank>./DEC/Mxxx/M768</a></b>: DELAY SELECTOR FOR TU10 WITH TC58, TC59, TM10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M769 target=_blank>./DEC/Mxxx/M769</a></b>: Function Control for TU10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M770 target=_blank>./DEC/Mxxx/M770</a></b>: EAE CONTROL FOR PDP-15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M771 target=_blank>./DEC/Mxxx/M771</a></b>: INTERNAL DEVICE DECODER FOR PDP-15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M772 target=_blank>./DEC/Mxxx/M772</a></b>: CONSOLE CONTROL #1 FOR PDP-15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M773 target=_blank>./DEC/Mxxx/M773</a></b>: CONSOLE CONTROL #2 FOR PDP-15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M775 target=_blank>./DEC/Mxxx/M775</a></b>: TIME STATE GENERATOR

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M776 target=_blank>./DEC/Mxxx/M776</a></b>: Reader Register

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7820 target=_blank>./DEC/Mxxx/M7820</a></b>: Interrupt Control, 7 bits, 1 per PDP11 peripheral, Replaced by M7821

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7821 target=_blank>./DEC/Mxxx/M7821</a></b>: Interrupt Control, 7 bits, 1 per PDP11 peripheral, Faster M7820

</LEGEND><DL>
<DT>M7821</A>
  <DD>is a drawing of DEC's M7821 Interrupt Control board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M783 target=_blank>./DEC/Mxxx/M783</a></b>: Unibus/Omnibus Drivers

</LEGEND><DL>
<DT>M783bad</A>
  <DD>is a version of the M783 that won't work.
<DT>M783</A>
  <DD>is basically DEC's version of the M783 Bus Drivers module,
using the now hard to find DS8881.
<DT>M783new</A>
  <DD>is a version of DEC's M783 Bus Drivers module using the 
AM26S10 instead of the DS8881.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M784 target=_blank>./DEC/Mxxx/M784</a></b>: Unibus/Omnibus Receivers

</LEGEND><DL>
<DT>M784bad</A>
  <DD>is a version of the M784 that won't work.
<DT>M784</A>
  <DD>is basically DEC's version of the M784 Bus Receivers module,
using the now hard to find SP380.
<DT>M784new</A>
  <DD>is a version of DEC's M784 Bus Receivers module using the 
AM26S10 instead of the SP380.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M785 target=_blank>./DEC/Mxxx/M785</a></b>: Unibus/Omnibus Tranceiver

</LEGEND><DL>
<DT>M785dec</A>
  <DD>is an Eagle drawing of DEC's M785 Unibus/Omnibus Tranceiver board
using the hard to find DS8881 and SP380 chips..
<DT>M785</A>
  <DD>is a version of DEC's M785 Unibus/Omnibus Tranceiver board with the
hard to find chips replaced with AM26S10.
<DT>M785-3116</A>
  <DD>is a version of DEC's M785 Unibus/Omnibus Tranceiver board with the
hard to find chips replaced with 7438 and the (too) expensive TL3116.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M797 target=_blank>./DEC/Mxxx/M797</a></b>: Register Select

</LEGEND><DL>
<DT>M797B</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M837 target=_blank>./DEC/Mxxx/M837</a></b>: Omnibus Timeshare Option

</LEGEND><DL>
<DT>M837bb</A>
  <DD>is a 06/15/2007 checkpoint of M837.
M837 is a drawing of DEC's M837 Omnibus Timeshare Option board,
which uses a lot of hard to find chips.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M847 target=_blank>./DEC/Mxxx/M847</a></b>: MI8E Diode Bootstrap Loader

</LEGEND><DL>
<DT>fig4-9</A>
  <DD>is an early checkpoint of an attempt to draw the boot 
loader card.
<DT>M847</A>
  <DD>is a drawing of DEC's M847 Diode bootstrap loader.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M850 target=_blank>./DEC/Mxxx/M850</a></b>: EIA Converter and Cable Connector

</LEGEND><DL>
<DT>M850A</A>
  <DD>is a drawing of DEC's M850A EIA Connector card.
<DT>M850x</A>
  <DD>is a design for a version of the M850 EIA Connector card
with input flow control implemented.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M868 target=_blank>./DEC/Mxxx/M868</a></b>: TD8E Simple Dectape Controller

</LEGEND><DL>
<DT>M868</A>
  <DD>is an Eagle version of DEC's M868 Simple Dectape Controller.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M870 target=_blank>./DEC/Mxxx/M870</a></b>: IMPLEMENTS SIMPLE CLOCK IN PDP12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M890 target=_blank>./DEC/Mxxx/M890</a></b>: Motion Control for TU10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M891 target=_blank>./DEC/Mxxx/M891</a></b>: TU10 CRC and Write Gating

</LEGEND><DL>
<DT>M891</A>
  <DD>is a version of DEC's M891 CRC and Write Gating module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M896 target=_blank>./DEC/Mxxx/M896</a></b>: TU10 CRC Checker

</LEGEND><DL>
<DT>M896</A>
  <DD>is a drawing of DEC's M896 CRC Checker module, using the hard to find
8202.
<DT>M896n</A>
  <DD>is a version of the M896 CRC Checker with the 8202 replaced with
the more common 74174.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M900 target=_blank>./DEC/Mxxx/M900</a></b>: CONNECTOR TO 8/I CONSOLE, 30 SIGNALS, 2 GNDS, TTL BUFFERING

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M901 target=_blank>./DEC/Mxxx/M901</a></b>: FLAT MYLAR CABLE CONNECTOR, 10 OHMS IN A2,B2,U1 & V1, 2 CA8LES

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M902 target=_blank>./DEC/Mxxx/M902</a></b>: TERMINATOR, 18 100 OHM RESISTORS, M903 & M904 CONNECTIONS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M903 target=_blank>./DEC/Mxxx/M903</a></b>: FLAT MYLAR CONNECTOR, 18 SIGNALS, 14 GND PINS·

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M904 target=_blank>./DEC/Mxxx/M904</a></b>: COAX CONNECTOR, 2 9-CONDUCTOR COAXES, M903 PINS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M906 target=_blank>./DEC/Mxxx/M906</a></b>: Cable Terminator

</LEGEND><DL>
<DT>M906A</A>
  <DD>needs a drawing.
<DT>M906b</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M907 target=_blank>./DEC/Mxxx/M907</a></b>: Diode Clamp

</LEGEND><DL>
<DT>M907A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M908 target=_blank>./DEC/Mxxx/M908</a></b>: Connector Module

</LEGEND><DL>
<DT>M908B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M909 target=_blank>./DEC/Mxxx/M909</a></b>: Terminator Card

</LEGEND><DL>
<DT>M909A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M910 target=_blank>./DEC/Mxxx/M910</a></b>: CP Terminator Card

</LEGEND><DL>
<DT>M910A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M911 target=_blank>./DEC/Mxxx/M911</a></b>: Memory Bus CP Terminator

</LEGEND><DL>
<DT>M911A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M912 target=_blank>./DEC/Mxxx/M912</a></b>: I/O BUS CARD, 36 PAIRS, M904 CONNECTIONS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M915 target=_blank>./DEC/Mxxx/M915</a></b>: 35 WIRES TO PDP-15 CONSOLE WITH PULL-UP RESISTORS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M916 target=_blank>./DEC/Mxxx/M916</a></b>: 36 Pin connector

</LEGEND><DL>
<DT>M916</A>
  <DD>is a version of DEC's M916 36 pin paddle connector.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M919 target=_blank>./DEC/Mxxx/M919</a></b>: 11 EXTERNAL BUS, 2 60-WIRE MYLAR, 56 SIGNALS, 14 GND PINS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M921 target=_blank>./DEC/Mxxx/M921</a></b>: DEVICE CODE SELECT JUMPER MODULE, FOR 3 IOT'S

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M922 target=_blank>./DEC/Mxxx/M922</a></b>: M901 WITH JUMPERS INSTEAD OF RESISTORS FOR INDICATOR BUS, NOT TO BE USED ON BOTH ENDS OF ANY CABLE

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M926 target=_blank>./DEC/Mxxx/M926</a></b>: M901 WITH 100 OHMS IN SERIES WITH SOME OF THE PINS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M930 target=_blank>./DEC/Mxxx/M930</a></b>: RK05/Unibus Terminator

</LEGEND><DL>
<DT>M930</A>
  <DD>is a version of DEC's M930 RK05/Unibus Terminator card using discrete resistors.
<DT>M930c</A>
  <DD>is a version of DEC's M930C RK05/Unibus Terminator card, which uses
DIP resistor packs.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M931 target=_blank>./DEC/Mxxx/M931</a></b>: 15 TERMINATORS, 2K TO +5V, CLAMPED AT +.75 & +3V, M903 PINS EXCEPT 9 INDICATOR OUTPUTS, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M941 target=_blank>./DEC/Mxxx/M941</a></b>: JUMPER/EXTENDER BOARD FOR TU56

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M947 target=_blank>./DEC/Mxxx/M947</a></b>: INDICATOR DRIVER, 24 CKTS, CABLE OUT BACK

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M948 target=_blank>./DEC/Mxxx/M948</a></b>: 24 RESISTORS TO CABLE, 4 RESISTORS TO COMMON POINT, COMPANION TO M947

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M949 target=_blank>./DEC/Mxxx/M949</a></b>: 9 INDICATOR DRIVERS, 18 SIGNALS, FOR KI CONSOLE

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M950 target=_blank>./DEC/Mxxx/M950</a></b>: 9 RESISTORS TO CABLE, 9 R TO COMMON, 18 RC FILTERS, COMPANION TO M949

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M952 target=_blank>./DEC/Mxxx/M952</a></b>: 27 LEVEL TERMINATORS, CLAMPS AT +.75 & 3.25V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M956 target=_blank>./DEC/Mxxx/M956</a></b>: 18 130 OHMS TO +3.0V, M903 PINS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M957 target=_blank>./DEC/Mxxx/M957</a></b>: 8,5" LONG M908, NO HANOLE, CABLE CLAMP LOCATION ON SIDES & END

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M960 target=_blank>./DEC/Mxxx/M960</a></b>: TD8E Connector #1

</LEGEND><DL>
<DT>M960</A>
  <DD>is a version of DEC's M960 TD8E Connector board.
<DT>M960old</A>
  <DD>is a checkpoint of an incomplete version of DEC's M960 TD8E Connector
board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M961 target=_blank>./DEC/Mxxx/M961</a></b>: TD8E Connector #2

</LEGEND><DL>
<DT>M961</A>
  <DD>is a version of DEC's M961 TD8E Connector board.
<DT>intercon</A>
  <DD>is just the interconnection of the ribbon cables.
<DT>M961old</A>
  <DD>is an early incomplete version of M961.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M966 target=_blank>./DEC/Mxxx/M966</a></b>: PDP15 Memory Bus Terminator

</LEGEND><DL>
<DT>M966A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M969 target=_blank>./DEC/Mxxx/M969</a></b>: 24 LEVEL TERMINATORS LIKE M952 + 1 THERMISTOR

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M970 target=_blank>./DEC/Mxxx/M970</a></b>: H854 MTD ON SINGLE X 8.5 CARD, ACCEPTS BC05C & BC01V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M993 target=_blank>./DEC/Mxxx/M993</a></b>: RK8E Control Cable Connector

</LEGEND><DL>
<DT>M993</A>
  <DD>is a version of DEC's M993 RK8E Control Cable Connector, with the
select DEC7384 replaced with a more readily available gate.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/PDP8I target=_blank>./DEC/PDP8I</a></b>: PDP-8/i

</LEGEND><DL>
<DT>pdp8i</A>
  <DD>is a drawing of DEC's PDP-8/i computer backplane, rounded up from the CPU and option drawings.
<DT>pdp8i-dec</A>
  <DD>is a drawing of DEC's PDP-8/i computer backplane.
<DT>pdp8i-fpga</A>
  <DD>is a drawing of DEC's PDP-8/i computer backplane, tweaked for FPGA conversion.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/PDP8L target=_blank>./DEC/PDP8L</a></b>: PDP-8/L

</LEGEND><DL>
<DT>pdp8l</A>
  <DD>is a drawing of DEC's PDP-8/L computer backplane, with some NC pins 
grounded to suppress warnings, and the hand-wired +5 distribution connections omitted.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/PDP8S target=_blank>./DEC/PDP8S</a></b>: PDP-8/S

</LEGEND><DL>
<DT>Memory-4K.sch</A>
  <DD>is a schematic by John Price of a proposed core 
replacement for the 8/S.
<DT>memory-32kx13.sch</A>
  <DD>is another schematic by John Price of a proposed
core replacement for the 8/S.
<DT>ramboard</A>
  <DD>is my drawing for a battery backed SRAM for the 8/S.
This one uses an open collector bus to reduce the number of drivers.
<DT>mtiming</A>
  <DD>is a schematic with my notes on memory timing in the 
8/S.
<DT>PDP8S</A>
  <DD>is a snapshot of the 8/S schematics (just the first page).
<DT>pre-io</A>
  <DD>is another snapshot of the 8/S schematics (9 pages done).
<DT>memory</A>
  <DD>is a complete schematic for the 8/S, with the core memory 
subsystem replaced with level converters and a ramboard.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/RL0x target=_blank>./DEC/RL0x</a></b>: RL01/RL02 Related stuff.
</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/RL0x/terminator target=_blank>./DEC/RL0x/terminator</a></b>: RL0x Termininator boards.

</LEGEND><DL>
<DT>terminator-sil</A>
  <DD>is a terminator implemented with SIL resistors.
<DT>terminator</A>
  <DD>is a terminator implemented with discrete SMT (0805) resistors.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/RX8E target=_blank>./DEC/RX8E</a></b>: M8357 RX8E Floppy Interface

</LEGEND><DL>
<DT>RX8E</A>
  <DD>is a drawing of DEC's M8357 RX8E Floppy Interface board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx target=_blank>./DEC/Rxxx</a></b>: Rxxx modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R001 target=_blank>./DEC/Rxxx/R001</a></b>: Diode Network

</LEGEND><DL>
<DT>R001A</A>
  <DD>is a drawing of DEC's R001A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R002 target=_blank>./DEC/Rxxx/R002</a></b>: Diode Cluster

</LEGEND><DL>
<DT>R002A</A>
  <DD>is a drawing of DEC's R002A.
<DT>R002B</A>
  <DD>is a drawing of DEC's R002B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R107 target=_blank>./DEC/Rxxx/R107</a></b>: 7 Inverters

</LEGEND><DL>
<DT>R107C</A>
  <DD>needs a drawing.
<DT>R107D</A>
  <DD>is a drawing of DEC's R107D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R111 target=_blank>./DEC/Rxxx/R111</a></b>: 3 Diode Gates

</LEGEND><DL>
<DT>R111D</A>
  <DD>is a drawing of DEC's R111D.
<DT>R111E</A>
  <DD>is a drawing of DEC's R111E.
<DT>R111F</A>
  <DD>is a drawing of DEC's R111F.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R113 target=_blank>./DEC/Rxxx/R113</a></b>: 5 Diode Gates

</LEGEND><DL>
<DT>R113A</A>
  <DD>is a drawing of DEC's R113A.
<DT>R113B</A>
  <DD>is a drawing of DEC's R113B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R121 target=_blank>./DEC/Rxxx/R121</a></b>: 4 Nand Gates

</LEGEND><DL>
<DT>R121A</A>
  <DD>needs a drawing.
<DT>R121B</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R123 target=_blank>./DEC/Rxxx/R123</a></b>: 6 Diode Gates

</LEGEND><DL>
<DT>R123B</A>
  <DD>is a drawing of DEC's R123B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R131 target=_blank>./DEC/Rxxx/R131</a></b>: 6 Diode Gates

</LEGEND><DL>
<DT>R131C</A>
  <DD>is a drawing of DEC's R131C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R141 target=_blank>./DEC/Rxxx/R141</a></b>: Diode Gate

</LEGEND><DL>
<DT>R141E</A>
  <DD>is a drawing of DEC's R141E.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R151 target=_blank>./DEC/Rxxx/R151</a></b>: Binary to Octal Decoder

</LEGEND><DL>
<DT>R151D</A>
  <DD>is a drawing of DEC's R151D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R181 target=_blank>./DEC/Rxxx/R181</a></b>: DC Carry Chain

</LEGEND><DL>
<DT>R181B</A>
  <DD>needs a drawing.
<DT>R181C</A>
  <DD>is a drawing of DEC's R181C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R201 target=_blank>./DEC/Rxxx/R201</a></b>: Flip Flop

</LEGEND><DL>
<DT>R201C</A>
  <DD>is a drawing of DEC's R201C.
<DT>R201D</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R202 target=_blank>./DEC/Rxxx/R202</a></b>: Dual Flip Flop

</LEGEND><DL>
<DT>R202D</A>
  <DD>is a drawing of DEC's R202D.
<DT>R202E</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R203 target=_blank>./DEC/Rxxx/R203</a></b>: Triple Flip Flop

</LEGEND><DL>
<DT>R203D</A>
  <DD>is a drawing of DEC's R203D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R204 target=_blank>./DEC/Rxxx/R204</a></b>: Quadruple Flip Flop

</LEGEND><DL>
<DT>R204B</A>
  <DD>is a drawing of DEC's R204B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R205 target=_blank>./DEC/Rxxx/R205</a></b>: Dual Flip Flop

</LEGEND><DL>
<DT>R205D</A>
  <DD>is a drawing of DEC's R205D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R302 target=_blank>./DEC/Rxxx/R302</a></b>: Delay

</LEGEND><DL>
<DT>R302K</A>
  <DD>is a drawing of DEC's R302K.
<DT>R302L</A>
  <DD>is a drawing of DEC's R302L.
<DT>R302M</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R303 target=_blank>./DEC/Rxxx/R303</a></b>: Integrating One Shot

</LEGEND><DL>
<DT>R303D</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/TC08 target=_blank>./DEC/TC08</a></b>: TC08 Backplane

</LEGEND><DL>
<DT>tc083-18</A>
  <DD>is a 3-18-2004 checkpoint of TC08 drawing in progress.
<DT>indicators</A>
  <DD>is an LED version of the TC08 Indicator panel.
<DT>so-indicators</A>
  <DD>is a surface mount version of the indicators
board.
<DT>so-indicators-ok</A>
  <DD>is a backup of so-indicators.
<DT>tc08ss</A>
  <DD>is an experiment with routing one layer at a time.
<DT>tc08nh</A>
  <DD>is a successful routing without screw holes.  (It also
lacks an NC layer.)
<DT>tc08ttl</A>
  <DD>is an aborted attempt to convert to a "big board"
TTL implementation.
<DT>tc08</A>
  <DD>is a drawing of DEC's TC08 DECtape Controller.
<DT>tc08-6u</A>
  <DD>is a drawing of DEC's TC08 DECtape Controller, drawn to fit in 6Uin a DEC rack.
<DT>tc08-8-07</A>
  <DD>is an 8/2007 checkpoint of the TC08 drawing.  This one
does have the hidden "NC" layer, to simplify routing and reduce spurious
error messages.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/TR02x target=_blank>./DEC/TR02x</a></b>: TR02 Incremental Tape Controller

</LEGEND><DL>
<DT>tr02</A>
  <DD>is a drawing of DEC's TR02 Incremental Tape Controller.  So far, only one
of the two drive's controllers is complete.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/VC8x target=_blank>./DEC/VC8x</a></b>: VC8i Compatible Posibus Device.

</LEGEND><DL>
<DT>vc8</A>
  <DD>is a drawing of a VC8/I compatible device built out of flipchips.
It is based on www.chd.dyndns.org/pdp8/VC8.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx target=_blank>./DEC/Wxxx</a></b>: Wxxx modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W005 target=_blank>./DEC/Wxxx/W005</a></b>: Clamped Loads

</LEGEND><DL>
<DT>W005</A>
  <DD>is a drawing of DEC's W005 Clamped Loads card.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W023 target=_blank>./DEC/Wxxx/W023</a></b>: Connector

</LEGEND><DL>
<DT>W023</A>
  <DD>is an obsolete drawing for an 18 pin paddle card.  (Use the one from the 
BusCon project.)</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W032 target=_blank>./DEC/Wxxx/W032</a></b>: Connector

</LEGEND><DL>
<DT>W032</A>
  <DD>is a drawing of DEC's W032 Connector cable paddle.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W070 target=_blank>./DEC/Wxxx/W070</a></b>: DEC W070 TTY Connector

</LEGEND><DL>
<DT>W070</A>
  <DD>is a drawing of DEC's W070 TTY Connector card used with Negibus
machines.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W076 target=_blank>./DEC/Wxxx/W076</a></b>: TTY Connectors

</LEGEND><DL>
<DT>W076B</A>
  <DD>is a drawing of DEC's W076B.
<DT>W076D</A>
  <DD>is a drawing of DEC's W076D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W078 target=_blank>./DEC/Wxxx/W078</a></b>: TTY Connector

</LEGEND><DL>
<DT>W078</A>
  <DD>is a drawing of DEC's W078.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W101 target=_blank>./DEC/Wxxx/W101</a></b>: I/O Bus Driver

</LEGEND><DL>
<DT>W101B</A>
  <DD>is a drawing of DEC's W101B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W952 target=_blank>./DEC/Wxxx/W952</a></b>: Wire Wrappable Module

</LEGEND><DL>
<DT>W952</A>
  <DD>is a drawing of DEC's W952 Wire Wrap prototype board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W960 target=_blank>./DEC/Wxxx/W960</a></b>: MSI Mounting Board

</LEGEND><DL>
<DT>W960</A>
  <DD>is a drawing of DEC's W960 MSI Mounting Board, which allows 16 and 24
pin DIP components to be connected to a DEC backplane.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W964 target=_blank>./DEC/Wxxx/W964</a></b>: Blank Universal Terminator

</LEGEND><DL>
<DT>W964</A>
  <DD>is a drawing of DEC's W964 Universal Terminator board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W975 target=_blank>./DEC/Wxxx/W975</a></b>: Perforated double height board

</LEGEND><DL>
<DT>W975</A>
  <DD>is a drawing of DEC's W975 double-height perfboard.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/X127026 target=_blank>./DEC/X127026</a></b>: Misc. Function Control

</LEGEND><DL>
<DT>12706</A>
  <DD>is an incomplete drawing of DEC's 127026 Misc. Function Control board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/xR210 target=_blank>./DEC/xR210</a></b>: Straight-8 Accumulator

</LEGEND><DL>
<DT>smt</A>
  <DD>is a incomplete, half-hearted attempt at a surface mount version of the R210
Straight-8 Accumulator board.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC9601 target=_blank>./DEC9601</a></b>: Functional equivalent to DEC9601 chip.

</LEGEND><DL>
<DT>DEC9601</A>
  <DD>is an attempt to draw an equivalent for the DEC 9601 monostable
chip.
<DT>libTest</A>
  <DD>is an failed attempt to create and use a library part for the equivalent.
(The libary part is full of DRC errors.)
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./EpromEmu target=_blank>./EpromEmu</a></b>: EPROM Emulator based on work of Philip Pemberton.

</LEGEND><DL>
<DT>EpromEmu</A>
  <DD>is an adaptation of Philip Pemberton's EPROM emulator, which 
attaches to the parallel port of a PC.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./FlipChip target=_blank>./FlipChip</a></b>: Flip Chip Edge Connector

</LEGEND><DL>
<DT>EdgeConnector</A>
  <DD>is a gold plated edge connector (outer).
<DT>Outline</A>
  <DD>is a board outline to match EdgeConnector.
<DT>Alignment</A>
  <DD>is a drawing of an EdgeConnector overlaid on the board Outline.
<DT>OuterConnector</A>
  <DD>is an EdgeConnector aligned for the outer quad slots.
<DT>InnerConnector</A>
  <DD>is an EdgeConnector aligned for the inner quad slots.
<DT>ConnectorPair</A>
  <DD>is a pair of EdgeConnectors one inner, one outer.
<DT>proto</A>
  <DD>is a drawing of a single-height proto board.
<DT>proto2</A>
  <DD>is a drawing of a double-height proto board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./FlipChipTester target=_blank>./FlipChipTester</a></b>: Various ideas for a flip-chip tester.

</LEGEND><DL>
<DT>io</A>
  <DD>is a copy of the I/O board, for reference and component
placement.
<DT>TestJig</A>
  <DD>is an incomplete notion involving a PCI slot.
<DT>io2</A>
  <DD>is another copy of the I/O board.
<DT>iotst</A>
  <DD>is an early version of the tester, which connects the 
I/O board from the ConsoleEmu project to a DEC connector block.
<DT>cblockyeesh</A>
  <DD>is a messy connector block mounting board that 
attempts to give each socket it's own connection.
<DT>cblockyeeshok</A>
  <DD>is a version of connectorblockyeesh which is 
fully routed.
<DT>cblock-vrs</A>
  <DD>is a simple connector block board that uses paddle 
cards to connect up to four sockets.
<DT>tester-7410</A>
  <DD>is a version of the tester board that builds a 
latch for the OC line using a 7410.
<DT>pcbproto-.brd</A>
  <DD>is a panelization of two copies of the tester,
connector block boards, and an experimental G888 board. 
<DT>pcbproto.brd</A>
  <DD>is a newer version of the panelization, with 
silkscreen scripts run.
<DT>FlipChip.brd</A>
  <DD>is still a newer version of the panelization.
<DT>cblock</A>
  <DD>is a version of the connector block board, modified 
to implement four pairs of socket connections.
<DT>tester-2</A>
  <DD>is revision 2 of the tester board.
<DT>transducer</A>
  <DD>is a messy design for a transducer for negative logic, 
etc.
<DT>transistor</A>
  <DD>is another messy design for a transducer.
<DT>smb</A>
  <DD>is a surface mount transducer using FET's and whatnot.
<DT>small</A>
  <DD>is a simpler transducer using through-hole parts.
<DT>cd4007</A>
  <DD>is yet another transducer, this time using the 4007.
<DT>5transistor</A>
  <DD>is a transducer for positive or negative logic, 
implemented with five FETs.
<DT>3transistor</A>
  <DD>is a transducer for positive or negative logic, 
implemented with three FETs and a section of an LM139 comparator.
<DT>32pins</A>
  <DD>is a set of 32 transducers of the 3transistor variety.
<DT>tester</A>
  <DD>is the flipchip tester, revision 1 (similar to iotst).
<DT>tester-rp</A>
  <DD>is another copy of the flipchip tester, revision 1.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./H11-5 target=_blank>./H11-5</a></b>: Heath H-11 Serial Card

</LEGEND><DL>
<DT>h11-5</A>
  <DD>is drawing of the H11-5 serial controller card by Heathkit.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./KM11 target=_blank>./KM11</a></b>: KM-11 Debug flip-chip

</LEGEND><DL>
<DT>km11</A>
  <DD>is my version of the KM11 debug flip-chip.  (The one by 
Guy Sotomayor is much better.)
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./LogoPanel target=_blank>./LogoPanel</a></b>: Logo Panel for the top of the rack.

</LEGEND><DL>
<DT>8ipanelb</A>
  <DD>is the outline of an 8/i logo panel.
<DT>8ipanel</A>
  <DD>is an 8/i logo panel, drawn in Eagle.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./M1709 target=_blank>./M1709</a></b>: OMNIBUS Interface Foundation Module

</LEGEND><DL>
<DT>M1709</A>
  <DD>is a drawing of DEC's M1709 Omnibus Interface Foundation (I/O 
prototyping) board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./M452r target=_blank>./M452r</a></b>: M452 Replacement based on MC14411

</LEGEND><DL>
<DT>M452r</A>
  <DD>is a replacement for DEC's M452 Baud Rate Generator, based on the 
MC14411 baud rate generator chip.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./M452S target=_blank>./M452S</a></b>: Simplified M452X that lays out.

</LEGEND><DL>
<DT>M452sx</A>
  <DD>is a version of the M452 replacement based loosely on DEC's M8655.
<DT>M452s</A>
  <DD>is a crowded version of the M452 replacement that routes in a single
layer.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./M452X target=_blank>./M452X</a></b>: M452 Replacement -- M8655 Style

</LEGEND><DL>
<DT>M452x</A>
  <DD>is a version of the M452 Baud Rate Generator based on the M8655, but 
not finished.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./mmu6100 target=_blank>./mmu6100</a></b>: MMU for the 6100 PDP-8 on a chip

</LEGEND><DL>
<DT>error</A>
  <DD>is a schematic fragment of the error circuitry.
<DT>mmu6100</A>
  <DD>is an early incomplete attempt at a 6100 with an MMU.
<DT>mmu6100x</A>
  <DD>is another incomplete attempt at a 6100 with an MMU.
<DT>mmu6100cp</A>
  <DD>is a snapshot of a nearly complete 6100 with an MMU.
<DT>ts6907</A>
  <DD>is a timeshare enhancement for the EMC 6907 MMU for the
6100.
<DT>emc6907</A>
  <DD>is a drawing of the EMC6907 MMU used with the Intersil
Intercept (not the Junior).
<DT>vrs6907</A>
  <DD>is my design for an EMC6907 MMU board with the timeshare
features added.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./NTC08 target=_blank>./NTC08</a></b>: Bogus TC08 clone in TTL.

</LEGEND><DL>
<DT>nt08</A>
  <DD>is an early version of a mechanical translation of the 
TC08 DECtape controller into TTL.
<DT>ntc08</A>
  <DD>is a start at a "big-board" version of the TC08 DECtape 
controller.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./Overvoltage target=_blank>./Overvoltage</a></b>: Power Safety Switch

</LEGEND><DL>
<DT>max486x</A>
  <DD>is a drawing using the max486x chips to isolate valuable
circuits from power supply anomalies.
<DT>ncp346</A>
  <DD>is a drawing using the ncp346 chip to isolate valuable
circuits from power supply anomalies.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./PCBShop target=_blank>./PCBShop</a></b>: Boards sent out for fabrication.

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./PCBShop/M452x target=_blank>./PCBShop/M452x</a></b>: M452 Replacement Board (as fabbed)

</LEGEND><DL>
<DT>M452x</A>
  <DD>is the version of the M452 replacement that was actually built.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./PCBShop/W076x target=_blank>./PCBShop/W076x</a></b>: W076 Replacement Board (as fabbed)

</LEGEND><DL>
<DT>w076x</A>
  <DD>is an old version of the W076 replacement.
<DT>w076o</A>
  <DD>is version of the W076 replacement as ordered from the 
board fab.
<DT>w076oAsBuilt</A>
  <DD>is a version that matches the blue-wire changes
in the as-shipped assembled boards.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./PosiDMux target=_blank>./PosiDMux</a></b>: FPGA PDP-8 Demultiplexer to Posibus

</LEGEND><DL>
<DT>8j-merge</A>
  <DD>is the paddle card used to interface to the Posibus device.
<DT>posidmux</A>
  <DD>is an attempt to design an interface between the XESS based 
FPGA implementation of the PDP-8 and older Posibus gear.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./PT08 target=_blank>./PT08</a></b>: PT08 TTY Interface

</LEGEND><DL>
<DT>PT08</A>
  <DD>is a drawing of DEC's PT08 TTY Interface for the PDP-8/S.
<DT>PT08pos</A>
  <DD>is a thought experiment about a Posibus variation on DEC's PT08 TTY Interface for the PDP-8/S.
<DT>PT08ttl</A>
  <DD>is a Posibus TTY TTY Interface implemented in TTL.
<DT>PT08ttl2</A>
  <DD>is a Posibus TTY TTY Interface implemented in TTL with some bugs fixed.
<DT>PT08ttl3</A>
  <DD>is a Posibus TTY TTY Interface implemented in TTL, designed for a ribbon cable bus.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./RF08 target=_blank>./RF08</a></b>: RF08 Replacement

</LEGEND><DL>
<DT>8x11</A>
  <DD>is an old version of all the boards for the RF08 replacement, 
panelized on an 8"x11" sheet.
<DT>RF08old</A>
  <DD>is an old version of the controller part of the RF08
replacement.
<DT>lights</A>
  <DD>is the debug display for the RF08 replacement.
<DT>drives</A>
  <DD>contains the "drives" for the RF08 replacement.
<DT>drivessop</A>
  <DD>contains a variation of drives that allows for the
cheaper SMT versions of the SRAM chip.
<DT>RF08b</A>
  <DD>is the latest version of the controller for the RF08 
replacement.
</DL>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./RF08/Old8x12 target=_blank>./RF08/Old8x12</a></b>: RF08 Replacement (Old Version)

</LEGEND><DL>
<DT>writelockswitches</A>
  <DD>is the writelockswitches board from the DF32 
project, for reference.
<DT>RS08-.brd</A>
  <DD>is the disk emulator from the DF32 project, for
reference.
<DT>RF08-</A>
  <DD>is the disk emulator from the DF32 project, for
reference.
<DT>DF32-revision-B</A>
  <DD>is revision B of the DF32 project, for
reference.
<DT>DEC8i-buscon</A>
  <DD>is a slightly updated version of the paddle cable 
used with the DF32 project.
<DT>DEC8L-buscon</A>
  <DD>is a paddle cable similar to the BC08J.
<DT>busadapt</A>
  <DD>is the bus adaptor board from the DF32 project.
<DT>DF32-revision-C</A>
  <DD>is an attempted revision to the DF32 board.
<DT>DF32-revision-D</A>
  <DD>is another attempted revision to the DF32 board.
<DT>DataBreak</A>
  <DD>is some schematic musings about data break.
<DT>array</A>
  <DD>is a design for an RF08-sized "drive".
<DT>cmorris</A>
  <DD>is the board from the DF32 project, yet again.
<DT>foo</A>
  <DD>is a tangled attempt to route a revision to the DF32
project.
<DT>RF08bck</A>
  <DD>is a checkpoint of some early work on an RF08 board.
<DT>RF08x</A>
  <DD>is a much more complete attempt at an RF08 replacement.
<DT>RS08</A>
  <DD>is a fairly complete RS08 "drive" pair.
<DT>RF08nv</A>
  <DD>is a newer version of the RF08 replacement, that didn't
route.
<DT>RF08indx.sch</A>
  <DD>is the RF08 schematic with an extra sheet for 
the indicators and their drivers.
<DT>RF08ind</A>
  <DD>is a routed oversize board with the controller and the 
indicators.
<DT>olimex</A>
  <DD>is the controller and the drives, without the indicators.
<DT>spe10</A>
  <DD>is a set of controller, drives and indicators in an 8"x12.6"
panel.
<DT>swizzle</A>
  <DD>is a swizzle board to allow the use of new paddles (34 
wire ribbons) with the DF32 project.
<DT>RF08-1</A>
  <DD>is a revision to the controller that doesn't quite route.
<DT>RF08</A>
  <DD>is just the RF08 controller, in the panel by itself.
<DT>olimex10</A>
  <DD>is the RF08 replacement controller, drives, and
indicators, all on an olimex sized panel, with 10mil design rules.
</DL>
</FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./rs-232-20ma target=_blank>./rs-232-20ma</a></b>: RS-232 converter to go in the Logic Lab

</LEGEND><DL>
<DT>loop-rs232o</A>
  <DD>is an older version of the  current loop to RS-232 converter (CTS 
flow control only).
<DT>loop-rs232</A>
  <DD>is a slightly newer version of the current loop to RS-232 converter, 
with CTS or DTR flow control.
<DT>sel-driver.sch</A>
  <DD>is a schematic of the selector magnet driver card in the TTY.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./RX08 target=_blank>./RX08</a></b>: Posibus version of RX8E

</LEGEND><DL>
<DT>RX08-</A>
  <DD>is an older version of the Posibus RX08 controller.
<DT>l8r</A>
  <DD>is a somewhat newer version of the Posibus RX08 controller.
<DT>RX08</A>
  <DD>is the Posibus RX08 controller, as ordered from the board
fab.
<DT>RX8E</A>
  <DD>is a drawing of DEC's RX8E Omnibus controller.
<DT>RX08b</A>
  <DD>is a revision to address problems found in the prototype.
<DT>RX08c</A>
  <DD>is another revision to address problems found in the
prototype.
<DT>RX08b19</A>
  <DD>is the Posibus RX08 Controller as of 04/19/2005.
<DT>asbuilt</A>
  <DD>is the Posibus RX08 Controller as built, with all the
blue wires (so far).
<DT>RX08-8-9</A>
  <DD>is the 08/09/2005 version.
<DT>RX08-3-5-9</A>
  <DD>is the 03/05/2009 version.
<DT>kludge</A>
  <DD>is the schematic of the kludge daughter board being
used to debug the prototype.
<DT>kludge2</A>
  <DD>is the schematic of the kludge daughter board being
used to debug the prototype.
</DL>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./RX08/RX08 target=_blank>./RX08/RX08</a></b>: The Posibus RX08 files as sent to the fab (prototype didn't work).
</LEGEND></FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./RX8-Ulrich target=_blank>./RX8-Ulrich</a></b>: RX8E to Posibus Adapter per Ulrich Fierz

</LEGEND><DL>
<DT>rx08-ulrich</A>
  <DD>is a schematic for Ulrich Fierz's modifications to
an 8/i and a TC08 to interface the RX8E.
<DT>pbusRX8E</A>
  <DD>is an attempt to modify Ulrich's design to remove the 
8/i dependency.
<DT>rx08-vrs</A>
  <DD>is another attempt to modify Ulrich's design to remove 
the 8/i dependency, and makes the Omnibus connections more explicit.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./RXM target=_blank>./RXM</a></b>: RX01/RX02 Emulation with a PC

</LEGEND><DL>
<DT>rxm</A>
  <DD>is a drawing of Charles Dickman's card to interface emulate the RX02 with
the parallel port of a PC.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./SMT-8 target=_blank>./SMT-8</a></b>: Thoughts about a discrete SMT PDP-8.

</LEGEND><DL>
<DT>adapter</A>
  <DD>is a drawing of an adapter from the DEC connector to 
something more current and affordable (2x20 header).
<DT>r202smt</A>
  <DD>is an SMT version of the R202 flip-flop board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./TU56x target=_blank>./TU56x</a></b>: TU56 Drive Emulation

</LEGEND><DL>
<DT>tu56</A>
  <DD>is a drawing for a proposed TU56 replacement using anSD card.
<DT>tu56o</A>
  <DD>is a older, less flexible version.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./W076O target=_blank>./W076O</a></b>: W076 for either RS-232 or Current Loop

</LEGEND><DL>
<DT>w076o</A>
  <DD>is a board to implement M8655 style interface to RS-232 or current loop 
for machines which use DEC's W076 card.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./Watch target=_blank>./Watch</a></b>: PIC based timepieces

</LEGEND><DL>
<DT>bcdwatch</A>
  <DD>is a drawing of an SMT version of a BCD wrist-watch.
<DT>watch</A>
  <DD>is a drawing of an SMT version of a binary wrist-watch.
<DT>clock</A>
  <DD>is a drawing of a binary clock using a 5704 dot-matrix 
display.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./WireWrap target=_blank>./WireWrap</a></b>: DEC Compatible Wire-Wrap boards

</LEGEND><DL>
<DT>1highfront</A>
  <DD>is a single-height prototyping board for narrow DIPs 
up to 32 pins.
<DT>1high</A>
  <DD>is a single-height prototyping board for narrow DIPs 
up to 32 pins.
<DT>2high</A>
  <DD>is a double-height prototyping board for narrow DIPs 
up to 32 pins.
<DT>4high</A>
  <DD>is an Omnibus form-factor prototype card that will 
take DIP packages in narrow or wide form up to 42 pins.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./X target=_blank>./X</a></b>: M452 Replacement

</LEGEND><DL>
<DT>M452sx</A>
  <DD>is a drawing of a replacement for the M452 Baud Rate 
Generator based on the M8655 (doesn't route).
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./X4915 target=_blank>./X4915</a></b>: DEC 4915 Reader Control for ASR-33.

</LEGEND><DL>
<DT>4915.sch</A>
  <DD>is a schematic for DEC's 4915 Reader Control modifications for
the ASR-33.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./X8iHenk target=_blank>./X8iHenk</a></b>: 8iPanel Driver boards for Henk

</LEGEND><DL>
<DT>9iSwitches</A>
  <DD>needs a description.
<DT>DeMux</A>
  <DD>needs a description.
<DT>DeMux2</A>
  <DD>needs a description.
<DT>DeMux3</A>
  <DD>needs a description.
<DT>DeMuxRow</A>
  <DD>needs a description.
<DT>DeMuxRow2</A>
  <DD>needs a description.
<DT>LEDproto</A>
  <DD>needs a description.
<DT>LEDtemplate</A>
  <DD>needs a description.
<DT>regulator</A>
  <DD>needs a description.
<DT>slot1</A>
  <DD>needs a description.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./X8iPanel target=_blank>./X8iPanel</a></b>: PDP-8/i Front Panel PCB

</LEGEND><DL>
<DT>foo</A>
  <DD>is a messed up version of the indicator PCB of an 8/i front
panel.
<DT>M900dec</A>
  <DD>is a drawing of DEC's M900 paddle card, which contains
the indicator drivers, as well as connecting to the front panel cabling.
<DT>M900</A>
  <DD>is my version of the M900 indicator driver card, which
provides through-hole (ribbon cable header) connections as well as DEC's
surface mount.
<DT>d-cs-8i-0-27</A>
  <DD>is a schematic of the M900 indicator sockets in
the 8/i backplane.
<DT>8iPanelDec</A>
  <DD>is a drawing of DEC's indicator PCB, using the
surface mount ribbon connectors.
<DT>8iPanel</A>
  <DD>is my version of the indicator PCB, allowing through-hole
headers for ribbon connection, as well as DEC's original surface mount.
<DT>8iPanelLED</A>
  <DD>is a version of 8iPanel with current limiting resistors suitable for
the use of LEDs instead of indicator lamps.
<DT>LEDPanel</A>
  <DD>is a version of 8iPanel with current limiting resistors suitable for
the use of LEDs instead of indicator lamps.
<DT>LEDPanelmpsl</A>
  <DD>is a version of 8iPanel with current limiting resistors suitable for
the use of LEDs instead of indicator lamps.
<DT>protol</A>
  <DD>is a version of my indicator panel, broken in two, so it
could be ordered from a protoype shop.
<DT>proto2.brd</A>
  <DD>is a panelized set of six M900 boards, suitable
for ordering from a prototype house.
<DT>8iSwitches</A>
  <DD>is a drawing of a replacement for the switches PCB.
<DT>8iSwitchesOK</A>
  <DD>is a checkpoint of the replacement for the switches PCB.
<DT>G793</A>
  <DD>is a pull-up and clamping module for the switch register of the PDP-8/i.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./XDS32 target=_blank>./XDS32</a></b>: DS32 Disk Drive Emulation

</LEGEND><DL>
<DT>ds32</A>
  <DD>is a preliminary drawing of a replacement for a DS32 disk drive, which 
would attach to a DEC RF08 controller.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./Xeltec target=_blank>./Xeltec</a></b>: Replacement for Xeltec SuperPro interface card.

</LEGEND><DL>
<DT>foo1</A>
  <DD>is a messed up old version of the SuperPro card.
<DT>fie</A>
  <DD>is a messed up old version of the SuperPro card.
<DT>SuperPro</A>
  <DD>is a replacement ISA card to interface the Xeltec
SuperPro to a PC.
<DT>SuperPro-res-moved</A>
  <DD>is a newer version of the replacement ISA 
card to interface the Xeltec SuperPro to a PC.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./XMM8i target=_blank>./XMM8i</a></b>: Memory extension for PDP-8/i.

</LEGEND><DL>
<DT>mm8i</A>
  <DD>is a start on drawing the MM8/i memory extension.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./xRK08 target=_blank>./xRK08</a></b>: RK01 Disk Controller for Posibus.

</LEGEND><DL>
<DT>rk08i</A>
  <DD>is a start on drawing the RK08 disk controller.
</DL>
</FIELDSET>
</FIELDSET>
<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
