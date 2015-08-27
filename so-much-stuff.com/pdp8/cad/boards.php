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
<DT>Lafferty1</A>
  <DD>is a drawing based on Steve Lafferty's prototype.
<DT>Lafferty1ab</A>
  <DD>is an "as built" version of Lafferty1, with the changes incorporated in the group buy.
<DT>Lafferty2</A>
  <DD>is a drawing with ideas about a follow-on to Lafferty1.
<DT>msc3102</A>
  <DD>is a drawing of the MSC3102 design.
<DT>Omnimem</A>
  <DD>is a simplified version using 74244 instead of 74125.
<DT>rtc</A>
  <DD>is a version of Lafferty1 with some thoughts about adding a clock circuit.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/8ePanel target=_blank>./DEC/8ePanel</a></b>: 8/E Front Panel

</LEGEND><DL>
<DT>5409057D</A>
  <DD>is a drawing of DEC's 5409057 (bulb panel) revision D,
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx target=_blank>./DEC/Axxx</a></b>: Axxx Modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A100 target=_blank>./DEC/Axxx/A100</a></b>: Multiplexor Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A103 target=_blank>./DEC/Axxx/A103</a></b>: Multiplexor Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A121 target=_blank>./DEC/Axxx/A121</a></b>: Multiplexor Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A124 target=_blank>./DEC/Axxx/A124</a></b>: 4 Input Multiplexer Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A130 target=_blank>./DEC/Axxx/A130</a></b>: Multiplexor

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A131 target=_blank>./DEC/Axxx/A131</a></b>: Multiplexer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A133 target=_blank>./DEC/Axxx/A133</a></b>: Analog Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A163 target=_blank>./DEC/Axxx/A163</a></b>: Multiplexer and Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A200 target=_blank>./DEC/Axxx/A200</a></b>: Operational Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A202 target=_blank>./DEC/Axxx/A202</a></b>: Two Analog Preamplifiers

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A214 target=_blank>./DEC/Axxx/A214</a></b>: 2 Analog Amplifiers

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A215 target=_blank>./DEC/Axxx/A215</a></b>: Analog Buffer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A222 target=_blank>./DEC/Axxx/A222</a></b>: Selectable Gain Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A225 target=_blank>./DEC/Axxx/A225</a></b>: Deflection Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A400 target=_blank>./DEC/Axxx/A400</a></b>: Sample and Hold Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A401 target=_blank>./DEC/Axxx/A401</a></b>: Sample and Hold

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A404 target=_blank>./DEC/Axxx/A404</a></b>: Sample and Hold

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A405 target=_blank>./DEC/Axxx/A405</a></b>: Sample and Hold Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A502 target=_blank>./DEC/Axxx/A502</a></b>: Difference Amplifier

</LEGEND><DL>
<DT>A502D</A>
  <DD>is a drawing of DEC's A502D.
<DT>A502X</A>
  <DD>is a 'modernized' version of the A502.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A601 target=_blank>./DEC/Axxx/A601</a></b>: 3 Bit DAC

</LEGEND><DL>
<DT>A601E</A>
  <DD>is a drawing of DEC's A601E.
<DT>A601X</A>
  <DD>is a 'modernized' version of the A601.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A604 target=_blank>./DEC/Axxx/A604</a></b>: 2-bit D-A Converter

</LEGEND><DL>
<DT>A604E</A>
  <DD>is a drawing of DEC's A604E.
<DT>A604X</A>
  <DD>is a 'modernized' version of the A604.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A605 target=_blank>./DEC/Axxx/A605</a></b>: 2-bit D-A Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A606 target=_blank>./DEC/Axxx/A606</a></b>: D-A Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A607 target=_blank>./DEC/Axxx/A607</a></b>: 10-bit D/A Converter, Single Buffered

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A612 target=_blank>./DEC/Axxx/A612</a></b>: D/A Converter, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A614 target=_blank>./DEC/Axxx/A614</a></b>: 12 Bit bipolar D/A Converter, Double Long

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A615 target=_blank>./DEC/Axxx/A615</a></b>: D/A Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A701 target=_blank>./DEC/Axxx/A701</a></b>: Reference Supply

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A702 target=_blank>./DEC/Axxx/A702</a></b>: Reference Supply (-10V), double

</LEGEND><DL>
<DT>A702B</A>
  <DD>is a drawing of DEC's A702B.
<DT>A702X</A>
  <DD>is a 'modernized' version of the A702.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A704 target=_blank>./DEC/Axxx/A704</a></b>: Reference Supply, Double

</LEGEND><DL>
<DT>A704E</A>
  <DD>is a drawing of DEC's A704E.
<DT>A704X</A>
  <DD>is a 'modernized' version of the A704.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A706 target=_blank>./DEC/Axxx/A706</a></b>: Power Supply for A202

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A708 target=_blank>./DEC/Axxx/A708</a></b>: Dual Voltage Regulator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A801 target=_blank>./DEC/Axxx/A801</a></b>: !0-bit A/D Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A811 target=_blank>./DEC/Axxx/A811</a></b>: 10-bit A/D Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A860 target=_blank>./DEC/Axxx/A860</a></b>: A/D Converter, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A877 target=_blank>./DEC/Axxx/A877</a></b>: 13-bit A/D Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A990 target=_blank>./DEC/Axxx/A990</a></b>: Operational Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Axxx/A992 target=_blank>./DEC/Axxx/A992</a></b>: Operational Amplifier

</LEGEND></FIELDSET>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/buscon target=_blank>./DEC/buscon</a></b>: Negibus/Posibus Connectors

</LEGEND><DL>
<DT>BusCon</A>
  <DD>is a version of DEC's M90x and W0x1 connector paddles, 
(based on the work from the BusCon project).
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx target=_blank>./DEC/Bxxx</a></b>: Bxxx Modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B104 target=_blank>./DEC/Bxxx/B104</a></b>: 4 Inverters, 3 Loads

</LEGEND><DL>
<DT>B104B</A>
  <DD>is a drawing of DEC's B104B.
<DT>B104X</A>
  <DD>is a 'modernized' B104.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B105 target=_blank>./DEC/Bxxx/B105</a></b>: 5 Inverters, 5 Loads

</LEGEND><DL>
<DT>B105B</A>
  <DD>is a drawing of DEC's B105B.
<DT>B105D</A>
  <DD>is a drawing of DEC's B105D.
<DT>B105X</A>
  <DD>is a 'modernized' B105.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B113 target=_blank>./DEC/Bxxx/B113</a></b>: 4 2-Input Negative NAND Gages, 3 Loads

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B115 target=_blank>./DEC/Bxxx/B115</a></b>: 3 3-Input Negative NAND Gages, 3 Loads

</LEGEND><DL>
<DT>B115A</A>
  <DD>is a drawing of DEC's B115A.
<DT>B115B</A>
  <DD>is a drawing of DEC's B115B.
<DT>B115X</A>
  <DD>is a 'modernized' B115.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B117 target=_blank>./DEC/Bxxx/B117</a></b>: 2 5-Input Negative NAND Gates

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B123 target=_blank>./DEC/Bxxx/B123</a></b>: 4 2-Input OC NAND Gates

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B124 target=_blank>./DEC/Bxxx/B124</a></b>: 3 3-Input OC NOR Gates

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B130 target=_blank>./DEC/Bxxx/B130</a></b>: 4 3-Input ANDs ORed, both outputs, Parity for 3 Bits

</LEGEND><DL>
<DT>B130B</A>
  <DD>is a drawing of DEC's B130B.
<DT>B130X</A>
  <DD>is a 'modernized' B130.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B133 target=_blank>./DEC/Bxxx/B133</a></b>: 2 mA equivalient to B113

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B134 target=_blank>./DEC/Bxxx/B134</a></b>: 4 2-Input Positive AND Gates, 3 Loads, 2mA

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B135 target=_blank>./DEC/Bxxx/B135</a></b>: 2 mA equvalent to B115

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B136 target=_blank>./DEC/Bxxx/B136</a></b>: 3 mA equivalent to B134

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B137 target=_blank>./DEC/Bxxx/B137</a></b>: 2 mA equivalent to B117

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B138 target=_blank>./DEC/Bxxx/B138</a></b>: PDP10 Adder (B131 with added diode to kill the carry quickly)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B141 target=_blank>./DEC/Bxxx/B141</a></b>: 7 2-Input Gates, 2mA input equivalent to R141

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B142 target=_blank>./DEC/Bxxx/B142</a></b>: Diode Gate, B141 with 10mA Loads on inputs F, J, L, N, R, T, V, for PDP8

</LEGEND><DL>
<DT>B142A</A>
  <DD>is a drawing of DEC's B142A.
<DT>B142X</A>
  <DD>is a 'modernized' B142.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B152 target=_blank>./DEC/Bxxx/B152</a></b>: Binary to Octal Decoder, R151 with higher fan-in & no clamp loads & no emitter gating

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B155 target=_blank>./DEC/Bxxx/B155</a></b>: Half Binary to Octal Decoder

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B156 target=_blank>./DEC/Bxxx/B156</a></b>: 2mA equivalent to B155

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B163 target=_blank>./DEC/Bxxx/B163</a></b>: 6 2-Input Gates, 1 Paired Common Input, 2mA equivalent of R123

</LEGEND><DL>
<DT>B163D</A>
  <DD>is a drawing of DEC's B163D.
<DT>B163X</A>
  <DD>is a 'modernized' B163.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B165 target=_blank>./DEC/Bxxx/B165</a></b>: 2mA Diode equivalent of B105

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B166 target=_blank>./DEC/Bxxx/B166</a></b>: Counting Gate for SC Adder of PDP10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B167 target=_blank>./DEC/Bxxx/B167</a></b>: 8 2-Input NANDs ORed to 4 Outputs with 2 Enable Inputs, 2x4

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B168 target=_blank>./DEC/Bxxx/B168</a></b>: 4 3-Input NANDs ORed to 3 Outputs with 3 Enable Inputs, 3x3

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B169 target=_blank>./DEC/Bxxx/B169</a></b>: Diode Gate Equivalent to B129, PDP9, 8 2-Input NANDs ORed to 2 Outputs, 4 Enable Inputs, 4x2

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B171 target=_blank>./DEC/Bxxx/B171</a></b>: 6 Sets of 2-Input ANDs ORed, both polarities out, PDP7

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B172 target=_blank>./DEC/Bxxx/B172</a></b>: Faster B171, 2mA Fan-In

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B173 target=_blank>./DEC/Bxxx/B173</a></b>: 14 Input Negative NAND Gate with one input preceded by a 10 Input Positive NAND, ME10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B198 target=_blank>./DEC/Bxxx/B198</a></b>: Protection Comparator, PDP10  Memory, 0 & -3V in & out, Compares 2 8-bit Words

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B199 target=_blank>./DEC/Bxxx/B199</a></b>: FM Address Decoder for B250 IC's, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B200 target=_blank>./DEC/Bxxx/B200</a></b>: Flip Flop

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B201 target=_blank>./DEC/Bxxx/B201</a></b>: Flip Flop

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B204 target=_blank>./DEC/Bxxx/B204</a></b>: 4 Flip-flops

</LEGEND><DL>
<DT>B204B</A>
  <DD>is a drawing of DEC's B204B.
<DT>B204X</A>
  <DD>is a 'modernized' B204.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B211 target=_blank>./DEC/Bxxx/B211</a></b>: Flip-flop, Buffered, No Delay

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B212 target=_blank>./DEC/Bxxx/B212</a></b>: Dual RS Flip-flop, PDP10, Bus Driver Output, Delayed & not Delayed RS Inputs

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B213 target=_blank>./DEC/Bxxx/B213</a></b>: PDP9 Flip-flop, Single Input Jam, no Delay

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B214 target=_blank>./DEC/Bxxx/B214</a></b>: 4 Flip-flops, B204 made out of 3 mA Gates

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B250 target=_blank>./DEC/Bxxx/B250</a></b>: Flip-flop Memory, PDP10, Fairchild IC's, 8x12 bits/card, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B301 target=_blank>./DEC/Bxxx/B301</a></b>: 10 MC One Shot

</LEGEND><DL>
<DT>B301B</A>
  <DD>is a drawing of DEC's B301B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B310 target=_blank>./DEC/Bxxx/B310</a></b>: 4 Delay Lines, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B311 target=_blank>./DEC/Bxxx/B311</a></b>: Tapped Delay Line, 200 ns, 25 ns steps, Emitter Follower Input

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B312 target=_blank>./DEC/Bxxx/B312</a></b>: Delay Line, B311 Continuously Variable, Diode Input, PDP10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B360 target=_blank>./DEC/Bxxx/B360</a></b>: Screwdriver Delay Line + Pulse Amp, 200-250 ns max

</LEGEND><DL>
<DT>B360C</A>
  <DD>is a drawing of DEC's B360C.
<DT>B360D</A>
  <DD>is a drawing of DEC's B360D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B401 target=_blank>./DEC/Bxxx/B401</a></b>: Variable Clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B405 target=_blank>./DEC/Bxxx/B405</a></b>: Crystal Clock, 2 to 10 MC

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B410 target=_blank>./DEC/Bxxx/B410</a></b>: Voltage Controlled Clock, 1-10 MC, 40 to 100 ns negative pulses, potentiometer adjustment

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B602 target=_blank>./DEC/Bxxx/B602</a></b>: Dual 10 MC Pulse Amplifier

</LEGEND><DL>
<DT>B602A</A>
  <DD>is a drawing of DEC's B602A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B611 target=_blank>./DEC/Bxxx/B611</a></b>: Dual Pulse Amplifier, 25 ns, PDP10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B620 target=_blank>./DEC/Bxxx/B620</a></b>: Dual Carry Pulse Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B681 target=_blank>./DEC/Bxxx/B681</a></b>: 4 Power Inverters

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B683 target=_blank>./DEC/Bxxx/B683</a></b>: 3 Bus Drivers, OR output, 50 ohm load, 0 -3V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B684 target=_blank>./DEC/Bxxx/B684</a></b>: 2 Bus Drivers, like 6684

</LEGEND><DL>
<DT>B684C</A>
  <DD>is a drawing of DEC's B684C.
<DT>B684X</A>
  <DD>is a 'modernized' B684.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Bxxx/B685 target=_blank>./DEC/Bxxx/B685</a></b>: 3 Diode Gate Drivers, 2 circuits, 80 mA at ground, 8 mA at -3V, PDP10

</LEGEND></FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Charmille_Andrews target=_blank>./DEC/Charmille_Andrews</a></b>: Charmille Andrews Paper Tape Reader Controller

</LEGEND><DL>
<DT>005743-001</A>
  <DD>is a drawing of CA's 005743-001 paper tape reader controller,
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/COI_LINCtape target=_blank>./DEC/COI_LINCtape</a></b>: COI LINC Tape Controller

</LEGEND><DL>
<DT>C10450-01</A>
  <DD>is a reverse engineered drawing of Doug Jones'
LINC tape controller.
<DT>C1316G</A>
  <DD>is a reverse engineered drawing of the board inside
Doug Jones' COI LINC tape drive.
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
<DT>DM01x2</A>
  <DD>is DEC's DM01, scaled down for just 2 devices.
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
<DT>9-de-8</A>
  <DD>is a drawing of the 9-de-8.
<DT>26-de-8</A>
  <DD>is a drawing of the 26-de-8.
<DT>26-de-8x</A>
  <DD>is a drawing of the 26-de-8 done with more mordern components.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/flipchip target=_blank>./DEC/flipchip</a></b>: 6 pin flip-chip modules

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx target=_blank>./DEC/Gxxx</a></b>: Gxxx modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G005 target=_blank>./DEC/Gxxx/G005</a></b>: 4-input Sense Amp, PDP-6, 2us, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G007 target=_blank>./DEC/Gxxx/G007</a></b>: Sense Amplifier

</LEGEND><DL>
<DT>G007C</A>
  <DD>is a drawing of DEC's G007C.
<DT>G007X</A>
  <DD>is a 'modernized' G007.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G008 target=_blank>./DEC/Gxxx/G008</a></b>: Slice Control for G007 & G009

</LEGEND><DL>
<DT>G008A</A>
  <DD>is a drawing of DEC's G008A.
<DT>G008X</A>
  <DD>is a 'modernized' G008.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G010 target=_blank>./DEC/Gxxx/G010</a></b>: Sense Amp Selector for PDP-9, 164, also used for G012

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G020 target=_blank>./DEC/Gxxx/G020</a></b>: Sense Amp for 8/I, G021 etch, IC levels

</LEGEND><DL>
<DT>G020E</A>
  <DD>needs a drawing.
<DT>G020H</A>
  <DD>is a drawing of DEC's G020H.
<DT>G020X</A>
  <DD>is a 'modernized' G020H.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G021 target=_blank>./DEC/Gxxx/G021</a></b>: Dual Sense Amp for 8/I, IC levels, also used for G020

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G022 target=_blank>./DEC/Gxxx/G022</a></b>: 4-input Sense Amp for PDP-10, with cable, +6.2V, -6.2V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G023 target=_blank>./DEC/Gxxx/G023</a></b>: Master Slice Control for G022

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G050 target=_blank>./DEC/Gxxx/G050</a></b>: 9 Track, 45 ips, Dual Gap Head Read Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G060 target=_blank>./DEC/Gxxx/G060</a></b>: Mag Tape Compressor, 9 Track

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G062 target=_blank>./DEC/Gxxx/G062</a></b>: Mag Tape Peak Detector, 9 Track

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G064 target=_blank>./DEC/Gxxx/G064</a></b>: Mag Tape Slicer, 9 Track

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G083 target=_blank>./DEC/Gxxx/G083</a></b>: Disk Pre-Amp

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G084 target=_blank>./DEC/Gxxx/G084</a></b>: Mag Tape Read, Rectify, Slice Amp, TU20, also used on G086

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G085 target=_blank>./DEC/Gxxx/G085</a></b>: Disk Amplifier (replaces 1/2 G083 + 1/2 W532) + (1/2 W533)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G094 target=_blank>./DEC/Gxxx/G094</a></b>: Threshold and Buffer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G100 target=_blank>./DEC/Gxxx/G100</a></b>: Sense Amp & Inhibit Driver, PDP15, 3 wire, 3D memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G102 target=_blank>./DEC/Gxxx/G102</a></b>: Sense, Inhibit, & Register (4 bits) for MM11 & ME10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G103 target=_blank>./DEC/Gxxx/G103</a></b>: Memory Voltage Levels, MM11 & ME10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G206 target=_blank>./DEC/Gxxx/G206</a></b>: Memory Selector, PDP-6, 2us, double, used for G212

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G207 target=_blank>./DEC/Gxxx/G207</a></b>: Inhibit Driver, 4 Quadrant, PDP-6, 2us, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G208 target=_blank>./DEC/Gxxx/G208</a></b>: Inhibit Driver

</LEGEND><DL>
<DT>G208B</A>
  <DD>is a drawing of DEC's G208B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G209 target=_blank>./DEC/Gxxx/G209</a></b>: Memory Selector, double

</LEGEND><DL>
<DT>G209B</A>
  <DD>is a drawing of DEC's G209B.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G212 target=_blank>./DEC/Gxxx/G212</a></b>: Memory common Driver, G206 + Misc. R&D, G206 etch, for PDP6 2us memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G217 target=_blank>./DEC/Gxxx/G217</a></b>: Word Driver, MA10, uses G219 for Digit Driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G219 target=_blank>./DEC/Gxxx/G219</a></b>: Memory Selector (A G209 for negative supply), PDP9

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G221 target=_blank>./DEC/Gxxx/G221</a></b>: Memory Driver, IC Inputs, 4 circuits, PDP8/I, PDP8/L

</LEGEND><DL>
<DT>G221A</A>
  <DD>needs a drawing.
<DT>G221B</A>
  <DD>is a drawing of DEC's G221B.
<DT>G221X</A>
  <DD>is a 'modernized' version of DEC's G221B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G222 target=_blank>./DEC/Gxxx/G222</a></b>: Memory Selector, IC Inputs, 4 circuits, 3 wire, 3D memory, PDP15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G223 target=_blank>./DEC/Gxxx/G223</a></b>: 2 Read-Write Drivers, PDP-15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G226 target=_blank>./DEC/Gxxx/G226</a></b>: XY Selection Switch, single 8.5", ME10, MM11

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G228 target=_blank>./DEC/Gxxx/G228</a></b>: Core Memory Inhibit Driver, IC Inputs, 8/I, 8/L

</LEGEND><DL>
<DT>G228B</A>
  <DD>needs a drawing.
<DT>G228C</A>
  <DD>needs a drawing.
<DT>G228H</A>
  <DD>is a drawing of DEC's G228H.
<DT>G228X</A>
  <DD>is a 'modernized' version of DEC's G228H.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G230 target=_blank>./DEC/Gxxx/G230</a></b>: Current Source, with Delay Line on input, 0 to 40ns

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G284 target=_blank>./DEC/Gxxx/G284</a></b>: Disk Writer, Disk

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G285 target=_blank>./DEC/Gxxx/G285</a></b>: Series Switch, Disk

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G286 target=_blank>./DEC/Gxxx/G286</a></b>: Center Tap Selector, Disk

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G287 target=_blank>./DEC/Gxxx/G287</a></b>: Mag Tape Writer, 2 channels, 100mA Head Current, no center tap, 0 to -15V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G290 target=_blank>./DEC/Gxxx/G290</a></b>: Dissk Writer, includes 2.5MHz flip-flop

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G294 target=_blank>./DEC/Gxxx/G294</a></b>: Disc Writer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G295 target=_blank>./DEC/Gxxx/G295</a></b>: Series Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G296 target=_blank>./DEC/Gxxx/G296</a></b>: Center Tap Selector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G350 target=_blank>./DEC/Gxxx/G350</a></b>: 9 Track, Dual Head, 45 IPS, Mag Tape Write Driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G380 target=_blank>./DEC/Gxxx/G380</a></b>: Solenoid Drivers

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G500 target=_blank>./DEC/Gxxx/G500</a></b>: TU55/TU56 Skew Tester

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G589 target=_blank>./DEC/Gxxx/G589</a></b>: Differential Integrator/Amp, RP10 Controller, RP01-Memorex 630-1

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G590 target=_blank>./DEC/Gxxx/G590</a></b>: Differential Filtered Integrator, RP10, RP02, Memorex 660

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G603 target=_blank>./DEC/Gxxx/G603</a></b>: Memory Selector Matrix

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G604 target=_blank>./DEC/Gxxx/G604</a></b>: Memory Selection Matrix, PDP-6

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G609 target=_blank>./DEC/Gxxx/G609</a></b>: Memory Mounting Board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G610 target=_blank>./DEC/Gxxx/G610</a></b>: "A" Diode Matrix Board for PDP-8 stack 30-05256

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G611 target=_blank>./DEC/Gxxx/G611</a></b>: "B" Diode Matrix Board for PDP-8 stack 30-05256 (double)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G613 target=_blank>./DEC/Gxxx/G613</a></b>: X Diode Matrix, 3 wire, 3D memory, 4K, 9/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G614 target=_blank>./DEC/Gxxx/G614</a></b>: Y Diode Matrix, 3 wire, 3D memory, 4K, 9/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G624 target=_blank>./DEC/Gxxx/G624</a></b>: Resistor Board for 8/I memory, similar to G621

</LEGEND><DL>
<DT>G624C</A>
  <DD>is a drawing of DEC's G624C.
<DT>G624X</A>
  <DD>is a 'modernized' version of DEC's G624C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G626 target=_blank>./DEC/Gxxx/G626</a></b>: Resistor Board for memory, PDP-10, 2.5 D

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G680 target=_blank>./DEC/Gxxx/G680</a></b>: DS32 Disk Head Matrix

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G681 target=_blank>./DEC/Gxxx/G681</a></b>: Track Matrix

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G700 target=_blank>./DEC/Gxxx/G700</a></b>: Cable Terminator, W028 etch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7000 target=_blank>./DEC/Gxxx/G7000</a></b>: I/O Bus Terminator 1

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7001 target=_blank>./DEC/Gxxx/G7001</a></b>: I/O Bus Terminator 2

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7002 target=_blank>./DEC/Gxxx/G7002</a></b>: I/O Bus Terminator 3

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7003 target=_blank>./DEC/Gxxx/G7003</a></b>: I/O Bus Terminator used in H807 quicklatch terminator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7004 target=_blank>./DEC/Gxxx/G7004</a></b>: I/O Bus Terminator used in H807 quicklatch terminator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7005 target=_blank>./DEC/Gxxx/G7005</a></b>: I/O Bus Terminator used in H807 quicklatch terminator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7006 target=_blank>./DEC/Gxxx/G7006</a></b>: I/O Bus Terminator used in H807 quicklatch terminator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G701 target=_blank>./DEC/Gxxx/G701</a></b>: Cable Terminator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G702 target=_blank>./DEC/Gxxx/G702</a></b>: DS32 Disk Simulator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G703 target=_blank>./DEC/Gxxx/G703</a></b>: 100 ohm Terminator, G700 pattern, double board with cut-out to fit over H003 or H004

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G704 target=_blank>./DEC/Gxxx/G704</a></b>: 2mA Level Terminator, G796 etch & components

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G705 target=_blank>./DEC/Gxxx/G705</a></b>: DEC Tape Jumper Module

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G706 target=_blank>./DEC/Gxxx/G706</a></b>: DEC Tape Attenuator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G711 target=_blank>./DEC/Gxxx/G711</a></b>: RF08 Terminator Board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G715 target=_blank>./DEC/Gxxx/G715</a></b>: Terminator, equiv 100 ohms to +4V, uses +10V & ground, G700 pins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G717 target=_blank>./DEC/Gxxx/G717</a></b>: Positive Bus Control Signal Terminator, 5 100 ohms to ground, pins K2, M2, P2, S2, T2, same grounds as W022

</LEGEND><DL>
<DT>G717</A>
  <DD>is an implementation of DEC's G717 bus terminator.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G718 target=_blank>./DEC/Gxxx/G718</a></b>: Timing Jumper for PDP12, when plugged in upside down, each delay line tape is shifted

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G726 target=_blank>./DEC/Gxxx/G726</a></b>: ME10 Bus Control, a Jumper Board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G727 target=_blank>./DEC/Gxxx/G727</a></b>: Grant Continuity, a Jumper Board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G7273 target=_blank>./DEC/Gxxx/G7273</a></b>: Grant Continuity, double height
</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G734 target=_blank>./DEC/Gxxx/G734</a></b>: Input Clamp

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G737 target=_blank>./DEC/Gxxx/G737</a></b>: 9 Dividers, 150 ohms to +3V, W028 pins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G741 target=_blank>./DEC/Gxxx/G741</a></b>: TU10 Negative Bus Terminator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G742 target=_blank>./DEC/Gxxx/G742</a></b>: Jumper Card, pins of non-inverting M500 & M531, TU56 with positive logic controls

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G766 target=_blank>./DEC/Gxxx/G766</a></b>: G796 with 3M cable, 14 signals, 2 grounds

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G772 target=_blank>./DEC/Gxxx/G772</a></b>: PDP-11 Power Connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G775 target=_blank>./DEC/Gxxx/G775</a></b>: 36 wires to Indicator, Q's, +6.5V from lamps, RF09

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G780 target=_blank>./DEC/Gxxx/G780</a></b>: Power Connector Card for PDP-12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G783 target=_blank>./DEC/Gxxx/G783</a></b>: 9 Twisted Pair and Shield, 1 pair ground return

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G785 target=_blank>./DEC/Gxxx/G785</a></b>: Power Connector, 8/L, with Power OK (double)

</LEGEND><DL>
<DT>G785D</A>
  <DD>needs a drawing.
<DT>G785E</A>
  <DD>is a drawing of DEC's G785E.
<DT>G785X</A>
  <DD>is a 'modernized' version of DEC's G785E.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G789 target=_blank>./DEC/Gxxx/G789</a></b>: Signal Simulator Connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G790 target=_blank>./DEC/Gxxx/G790</a></b>: Signal Simulator Generator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G792 target=_blank>./DEC/Gxxx/G792</a></b>: PDP-8/I Power Connector

</LEGEND><DL>
<DT>G792A</A>
  <DD>is an drawing of DEC's G792A power connector.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G793 target=_blank>./DEC/Gxxx/G793</a></b>: PDP-8/I Switch Connector, 8/I to console

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G795 target=_blank>./DEC/Gxxx/G795</a></b>: Clamped Level Cable Connector, W021 pins, diodes to +0.7V & -3V, PDP-9, extended memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G796 target=_blank>./DEC/Gxxx/G796</a></b>: Clamped Level Cable Connector, W034 with clamps, ground and -3V with 2mA clamped loads, G704 etch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G799 target=_blank>./DEC/Gxxx/G799</a></b>: Cable Connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G800 target=_blank>./DEC/Gxxx/G800</a></b>: Control for 739 Power Supply

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G8004 target=_blank>./DEC/Gxxx/G8004</a></b>: Power Fail

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G803 target=_blank>./DEC/Gxxx/G803</a></b>: Rectifying Slicer

</LEGEND><DL>
<DT>G803A</A>
  <DD>is a drawing of DEC's G803A.
<DT>G803X</A>
  <DD>is a 'modernized' G803.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G805 target=_blank>./DEC/Gxxx/G805</a></b>: Regulator for negative 8 memory, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G808 target=_blank>./DEC/Gxxx/G808</a></b>: Control for 708 Power Supply

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G809 target=_blank>./DEC/Gxxx/G809</a></b>: -15V Sense and Relay Driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G810 target=_blank>./DEC/Gxxx/G810</a></b>: 6V Regulator Control, Drives a G805

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G816 target=_blank>./DEC/Gxxx/G816</a></b>: Modified G806 for driving 70V Power Supply Regulator Outputs

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G817 target=_blank>./DEC/Gxxx/G817</a></b>: Card 1 for 713

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G818 target=_blank>./DEC/Gxxx/G818</a></b>: Card 2 for 713

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G821 target=_blank>./DEC/Gxxx/G821</a></b>: +5V Regulator Control and Output Card for PDP15 (see G829)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G822 target=_blank>./DEC/Gxxx/G822</a></b>: -6V Regulator (from -10V) for sense amps, PDP15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G823 target=_blank>./DEC/Gxxx/G823</a></b>: -24V Memory Regulator Control, drives G825, PDP15

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G824 target=_blank>./DEC/Gxxx/G824</a></b>: +5V Regulator Control, PDP-12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G825 target=_blank>./DEC/Gxxx/G825</a></b>: -24V Pass Element, from G823, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G826 target=_blank>./DEC/Gxxx/G826</a></b>: Regulator Control for 8/I, drives G805 & detects presence of other voltages

</LEGEND><DL>
<DT>G826D</A>
  <DD>needs a drawing.
<DT>G826K</A>
  <DD>is a drawing of DEC's G826K.
<DT>G826X</A>
  <DD>is a 'modernized' version of DEC's G826K.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G827 target=_blank>./DEC/Gxxx/G827</a></b>: Low Voltage Detector, PDP-15, + K303 RC's detects +9V, uses +5V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G828 target=_blank>./DEC/Gxxx/G828</a></b>: Regulator Control, ME10, uses G805

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G829 target=_blank>./DEC/Gxxx/G829</a></b>: 5V Connector Card for PDP15 peripherals, with overvoltage SCR & fuse, can replace G821, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G830 target=_blank>./DEC/Gxxx/G830</a></b>: 5V, 10 Amp Regulator from 8V, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G831 target=_blank>./DEC/Gxxx/G831</a></b>: -10V Reference, +5V output, 0 to +10V 6-bit DAC, Marginal Check Control, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G836 target=_blank>./DEC/Gxxx/G836</a></b>: Positive & -20V Regulator for VT14

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G838 target=_blank>./DEC/Gxxx/G838</a></b>: Fault Protection, provides +5V for intensity board W682, in VR14

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G847 target=_blank>./DEC/Gxxx/G847</a></b>: Dual Voltage Control for G848, TU56

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G848 target=_blank>./DEC/Gxxx/G848</a></b>: TU56 Motor Drive, Triple

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G850 target=_blank>./DEC/Gxxx/G850</a></b>: SCR Motor Driver, TU55

</LEGEND><DL>
<DT>G850L</A>
  <DD>is a drawing of DEC's G850L.
<DT>G850X</A>
  <DD>is a 'modernized' G850.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G851 target=_blank>./DEC/Gxxx/G851</a></b>: DECtape Relay Module

</LEGEND><DL>
<DT>G851B</A>
  <DD>is a drawing of DEC's G851B.
<DT>G851X</A>
  <DD>is a 'modernized' G851.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G853 target=_blank>./DEC/Gxxx/G853</a></b>: DECtape Misc, Single Unit Selection & Timing Track Sensing

</LEGEND><DL>
<DT>G853A</A>
  <DD>is a drawing of DEC's G853A.
<DT>G853X</A>
  <DD>is a 'modernized' G853.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G854 target=_blank>./DEC/Gxxx/G854</a></b>: Telegraph Line Circuit

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G858 target=_blank>./DEC/Gxxx/G858</a></b>: Teletype Connector, PDP-15, 8 pin AMP connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G859 target=_blank>./DEC/Gxxx/G859</a></b>: Clock & Regulator for TU56, Long

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G879 target=_blank>./DEC/Gxxx/G879</a></b>: Transport Detector, TC08, TC09, TC15

</LEGEND><DL>
<DT>G879</A>
  <DD>is an Eagle version of DEC's G879 Transport Detector.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G882 target=_blank>./DEC/Gxxx/G882</a></b>: Manchester Reader-Writer

</LEGEND><DL>
<DT>G882B</A>
  <DD>is a drawing of DEC's G882B.
<DT>G882X</A>
  <DD>is a 'modernized' G882.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G888 target=_blank>./DEC/Gxxx/G888</a></b>: Manchester Reader/Writer

</LEGEND><DL>
<DT>G888A</A>
  <DD>is a drawing DEC's G888A.
<DT>G888X</A>
  <DD>is a 'modernized' version of the G888A.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G903 target=_blank>./DEC/Gxxx/G903</a></b>: Clock Accelerator for Paper Tape Reader

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G906 target=_blank>./DEC/Gxxx/G906</a></b>: LINC-8 Capacitor and Power Up

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G912 target=_blank>./DEC/Gxxx/G912</a></b>: Deflection Amplifier, -12 Amps into 30uH Push-Pull Yoke, 15us full deflection time, VR12, Long, Double, Thick

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G913 target=_blank>./DEC/Gxxx/G913</a></b>: Clock Control, (G903 + 1/2 R302 + 1/3 R603)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G916 target=_blank>./DEC/Gxxx/G916</a></b>: Power Detector & Switch Filter, PDP-12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G917 target=_blank>./DEC/Gxxx/G917</a></b>: Gain & Set Control for VR12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G918 target=_blank>./DEC/Gxxx/G918</a></b>: Photocell Amplifier for PT04, PT05, replacement for G908, for phototransistors

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G921 target=_blank>./DEC/Gxxx/G921</a></b>: PDP-8/L Console (plugs in)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G932 target=_blank>./DEC/Gxxx/G932</a></b>: Capstan Servo Preamp (drives H603)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G933 target=_blank>./DEC/Gxxx/G933</a></b>: Reel Motor Amp for TU10, +/-12V, +/-6A

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G9340 target=_blank>./DEC/Gxxx/G9340</a></b>: Replacement for logic portion of G934

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G9341 target=_blank>./DEC/Gxxx/G9341</a></b>: Replacement for output portion of G934, higher current

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G936 target=_blank>./DEC/Gxxx/G936</a></b>: Reel Motor Amp for TU10, +/-12V, +/-6A

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G938 target=_blank>./DEC/Gxxx/G938</a></b>: DECPack Head Position Servo Preamp, Long, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Gxxx/G998 target=_blank>./DEC/Gxxx/G998</a></b>: Current Measuring Extender, 1-1/2 length with Bus Loops

</LEGEND></FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx target=_blank>./DEC/Kxxx</a></b>: Kxxx modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K003 target=_blank>./DEC/Kxxx/K003</a></b>: Gate Expander

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K026 target=_blank>./DEC/Kxxx/K026</a></b>: Gate Expander

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K113 target=_blank>./DEC/Kxxx/K113</a></b>: Inverting Gate

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K123 target=_blank>./DEC/Kxxx/K123</a></b>: English Gate

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K138 target=_blank>./DEC/Kxxx/K138</a></b>: Eight Inverters

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K210 target=_blank>./DEC/Kxxx/K210</a></b>: Decimal or Binary Counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K220 target=_blank>./DEC/Kxxx/K220</a></b>: Decimal Up/Down Counter, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K230 target=_blank>./DEC/Kxxx/K230</a></b>: Parallel Input Shift Register

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K271 target=_blank>./DEC/Kxxx/K271</a></b>: Set/Reset Memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K273 target=_blank>./DEC/Kxxx/K273</a></b>: Retentive Memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K303 target=_blank>./DEC/Kxxx/K303</a></b>: Delay Timer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K374 target=_blank>./DEC/Kxxx/K374</a></b>: Calibrated Timer Control

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K376 target=_blank>./DEC/Kxxx/K376</a></b>: Calibrated Timer Control

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K378 target=_blank>./DEC/Kxxx/K378</a></b>: Calibrated Timer Control

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K508 target=_blank>./DEC/Kxxx/K508</a></b>: Pilot Circuit Converter, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K522 target=_blank>./DEC/Kxxx/K522</a></b>: Comparator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K604 target=_blank>./DEC/Kxxx/K604</a></b>: Pilot Circuit Converter, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K614 target=_blank>./DEC/Kxxx/K614</a></b>: Isolated AC Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K652 target=_blank>./DEC/Kxxx/K652</a></b>: DC Driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K671 target=_blank>./DEC/Kxxx/K671</a></b>: Decade Display

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K683 target=_blank>./DEC/Kxxx/K683</a></b>: Driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K716 target=_blank>./DEC/Kxxx/K716</a></b>: Pilot Circuit Converter, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K731 target=_blank>./DEC/Kxxx/K731</a></b>: Multi-Purpose Source

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K732 target=_blank>./DEC/Kxxx/K732</a></b>: Slave Regulator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K791 target=_blank>./DEC/Kxxx/K791</a></b>: Test Probe

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K940 target=_blank>./DEC/Kxxx/K940</a></b>: Mounting Bar Support

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Kxxx/K941 target=_blank>./DEC/Kxxx/K941</a></b>: Mounting Bar

</LEGEND></FIELDSET>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M002 target=_blank>./DEC/Mxxx/M002</a></b>: 15 Loads

</LEGEND><DL>
<DT>M002A</A>
  <DD>is a drawing of DEC's M002A.
<DT>M002X</A>
  <DD>is a 'modernized' M002.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M040 target=_blank>./DEC/Mxxx/M040</a></b>: Solenoid Driver

</LEGEND><DL>
<DT>M040E</A>
  <DD>is a drawing of DEC's M040E.
<DT>M040X</A>
  <DD>is a 'modernized' M040.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M044 target=_blank>./DEC/Mxxx/M044</a></b>: 4-100mA Solenoid Drivers

</LEGEND><DL>
<DT>M044B</A>
  <DD>is a drawing of DEC's M044B.
<DT>M044X</A>
  <DD>is a 'modernized' M044.</DL>
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
<DT>M060X</A>
  <DD>is a 'modernized' M060.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M100 target=_blank>./DEC/Mxxx/M100</a></b>: Bus Data Interface

</LEGEND><DL>
<DT>M100A</A>
  <DD>is a drawing of DEC's M100A.
<DT>M100X</A>
  <DD>is a 'modernized' M100.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M101 target=_blank>./DEC/Mxxx/M101</a></b>: Bus Data Interface

</LEGEND><DL>
<DT>M101A</A>
  <DD>is a drawing of DEC's M101A.
<DT>M101X</A>
  <DD>is a 'modernized' M101.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M102 target=_blank>./DEC/Mxxx/M102</a></b>: Negative Bus Equivalent to M103

</LEGEND><DL>
<DT>M102A</A>
  <DD>is a drawing of DEC's M102A.
<DT>M102X</A>
  <DD>is a 'modernized' M102.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M103 target=_blank>./DEC/Mxxx/M103</a></b>: Device Selector

</LEGEND><DL>
<DT>M103A</A>
  <DD>is a drawing of DEC's M103A.
<DT>M103B</A>
  <DD>is a drawing of DEC's M103B.
<DT>M103X</A>
  <DD>is a 'modernized' M103.
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
<DT>M105C</A>
  <DD>is a drawing of DEC's M105C.
<DT>M105X</A>
  <DD>is a 'modernized' M105.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M106 target=_blank>./DEC/Mxxx/M106</a></b>: Dot NOR Gates

</LEGEND><DL>
<DT>M106A</A>
  <DD>is a drawing of DEC's M106A.
<DT>M106X</A>
  <DD>is a 'modernized' M106.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M107 target=_blank>./DEC/Mxxx/M107</a></b>: Device Selector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M108 target=_blank>./DEC/Mxxx/M108</a></b>: Flag Module

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M109 target=_blank>./DEC/Mxxx/M109</a></b>: Device Select Module

</LEGEND><DL>
<DT>M109A</A>
  <DD>is a drawing of DEC's M109A.
<DT>M109X</A>
  <DD>is a 'modernized' M109.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1103 target=_blank>./DEC/Mxxx/M1103</a></b>: 10 2-Input AND Gates

</LEGEND><DL>
<DT>M1103A</A>
  <DD>is a drawing of DEC's M1103A.
<DT>M1103X</A>
  <DD>is a 'modernized' M1103.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M111 target=_blank>./DEC/Mxxx/M111</a></b>: Inverters

</LEGEND><DL>
<DT>M111A</A>
  <DD>is a drawing of DEC's M111A.
<DT>M111B</A>
  <DD>is a drawing of DEC's M111B.
<DT>M111C</A>
  <DD>is a drawing of DEC's M111C.
<DT>M111D</A>
  <DD>is a drawing of DEC's M111D.
<DT>M111X</A>
  <DD>is a 'modernized' M111.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M112 target=_blank>./DEC/Mxxx/M112</a></b>: NOR Gates

</LEGEND><DL>
<DT>M112D</A>
  <DD>is a drawing of DEC's M112D.
<DT>M112E</A>
  <DD>is a drawing of DEC's M112E.
<DT>M112X</A>
  <DD>is a 'modernized' M112.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M113 target=_blank>./DEC/Mxxx/M113</a></b>: 10 2-Input NAND Gates

</LEGEND><DL>
<DT>M113B</A>
  <DD>is a drawing of DEC's M113B.
<DT>M113C</A>
  <DD>is a drawing of DEC's M113C.
<DT>M113D</A>
  <DD>is a drawing of DEC's M113D.
<DT>M113X</A>
  <DD>is a 'modernized' M113.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M115 target=_blank>./DEC/Mxxx/M115</a></b>: 8 3-Input NAND Gates

</LEGEND><DL>
<DT>M115C</A>
  <DD>is a drawing of DEC's M115C.
<DT>M115D</A>
  <DD>is a drawing of DEC's M115D.
<DT>M115X</A>
  <DD>is a 'modernized' M115.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M116 target=_blank>./DEC/Mxxx/M116</a></b>: 6 4-Input NOR Gates

</LEGEND><DL>
<DT>M116A</A>
  <DD>is a drawing of DEC's M116A.
<DT>M116X</A>
  <DD>is a 'modernized' M116.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M117 target=_blank>./DEC/Mxxx/M117</a></b>: 6 4-Input NAND Gates

</LEGEND><DL>
<DT>M117B</A>
  <DD>is a drawing of DEC's M117B.
<DT>M117C</A>
  <DD>is a drawing of DEC's M117C.
<DT>M117E</A>
  <DD>is a drawing of DEC's M117E.
<DT>M117X</A>
  <DD>is a 'modernized' M117.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M119 target=_blank>./DEC/Mxxx/M119</a></b>: 3 8-Input NAND Gates

</LEGEND><DL>
<DT>M119B</A>
  <DD>is a drawing of DEC's M119B.
<DT>M119C</A>
  <DD>is a drawing of DEC's M119C.
<DT>M119X</A>
  <DD>is a 'modernized' M119.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M121 target=_blank>./DEC/Mxxx/M121</a></b>: 6 AND-NOR Gates

</LEGEND><DL>
<DT>M121B</A>
  <DD>is a drawing of DEC's M121B.
<DT>M121D</A>
  <DD>is a drawing of DEC's M121D.
<DT>M121X</A>
  <DD>is a 'modernized' M121.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M126 target=_blank>./DEC/Mxxx/M126</a></b>: H version of M121, not pin compatible

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M127 target=_blank>./DEC/Mxxx/M127</a></b>: 2 2-2-3 AND-NOR Gates

</LEGEND><DL>
<DT>M127A</A>
  <DD>is a drawing of DEC's M127A.
<DT>M127X</A>
  <DD>is a 'modernized' M127.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M129 target=_blank>./DEC/Mxxx/M129</a></b>: 4-4 AND-NOR, H, 4 circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M130 target=_blank>./DEC/Mxxx/M130</a></b>: 5 8-bit parity circuits + 5 2-input XOR gates (MC4008)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1307 target=_blank>./DEC/Mxxx/M1307</a></b>: 6 4-Input AND Gates

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M133 target=_blank>./DEC/Mxxx/M133</a></b>: 10-2 Input NAND Gates

</LEGEND><DL>
<DT>M133A</A>
  <DD>is a drawing of DEC's M133A.
<DT>M133B</A>
  <DD>is a drawing of DEC's M133B.
<DT>M133X</A>
  <DD>is a 'modernized' M133.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M135 target=_blank>./DEC/Mxxx/M135</a></b>: 8-3 Input NAND Gates

</LEGEND><DL>
<DT>M135A</A>
  <DD>is a drawing of DEC's M135A.
<DT>M135X</A>
  <DD>is a 'modernized' M135.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M139 target=_blank>./DEC/Mxxx/M139</a></b>: H version of M119

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M141 target=_blank>./DEC/Mxxx/M141</a></b>: Two 2-2-2-2 AND-NOR gates, 2-2-2 AND-NOR gate. 2 input NAND, 2 inverters

</LEGEND><DL>
<DT>M141B</A>
  <DD>is a drawing of DEC's M141B.
<DT>M141X</A>
  <DD>is a 'modernized' M141.</DL>
</FIELDSET>
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
<DT>M149X</A>
  <DD>is a 'modernized' M149.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1500 target=_blank>./DEC/Mxxx/M1500</a></b>: Bi-directional Bus Interfacing Gates, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1501 target=_blank>./DEC/Mxxx/M1501</a></b>: Bus Input Interface, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1502 target=_blank>./DEC/Mxxx/M1502</a></b>: Bus Output Interface, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M151 target=_blank>./DEC/Mxxx/M151</a></b>: Dual binary to octal with enable, H series, KI10, 74H20

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1510 target=_blank>./DEC/Mxxx/M1510</a></b>: Bus Device Selector Module, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M152 target=_blank>./DEC/Mxxx/M152</a></b>: M151 non-inverting, KI10, 74H21

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M155 target=_blank>./DEC/Mxxx/M155</a></b>: 4 Line to 16 Line Decoder

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M159 target=_blank>./DEC/Mxxx/M159</a></b>: 4 bit arithmetic logic unit (DEC 74181), uses 50-08908 board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M160 target=_blank>./DEC/Mxxx/M160</a></b>: AND-NOR Gate Module

</LEGEND><DL>
<DT>M160C</A>
  <DD>is a drawing of DEC's M160C.
<DT>M160X</A>
  <DD>is a 'modernized' M160.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M161 target=_blank>./DEC/Mxxx/M161</a></b>: Binary to Octal/Decimal Decoder

</LEGEND><DL>
<DT>M161</A>
  <DD>is a version of revision C with design rules more suited to milling individual PCBs.
<DT>M161C</A>
  <DD>is a drawing of DEC's M161C.
<DT>M161X</A>
  <DD>is a 'modernized' M161.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M162 target=_blank>./DEC/Mxxx/M162</a></b>: Parity Circuit

</LEGEND><DL>
<DT>M162B</A>
  <DD>is a drawing of DEC's M162B.
<DT>M162X</A>
  <DD>is a 'modernized' M161.</DL>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M168 target=_blank>./DEC/Mxxx/M168</a></b>: 12 Bit Magnitude Comparator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M169 target=_blank>./DEC/Mxxx/M169</a></b>: Functional gate module for PDP-12, 4 4-bit output multiplexors

</LEGEND><DL>
<DT>M169B</A>
  <DD>is a drawing of DEC's M169B.
<DT>M169X</A>
  <DD>is a 'modernized' M169.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M170 target=_blank>./DEC/Mxxx/M170</a></b>: 3-3-3-2-2-2-2-2 AND-NOR & 3-2-2-2 AND-NOR, H series, KI10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1701 target=_blank>./DEC/Mxxx/M1701</a></b>: 4 to 1 MUX, 4 circuits, 50-08912 etch, 74153

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1705 target=_blank>./DEC/Mxxx/M1705</a></b>: Omnibus Dual 12 bit Output Interface

</LEGEND><DL>
<DT>M1705B</A>
  <DD>is a drawing of DEC's M1705B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M171 target=_blank>./DEC/Mxxx/M171</a></b>: 2-2-2-3 AND-NOR, 3 circuits, different pins than M127

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M1713 target=_blank>./DEC/Mxxx/M1713</a></b>: 16 to 1 MUX inverting, 74150, 50-08908 etch

</LEGEND><DL>
<DT>M1713A</A>
  <DD>is a drawing of DEC's M1713A.
<DT>M1713X</A>
  <DD>is a 'modernized' M1713.</DL>
</FIELDSET>
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

</LEGEND><DL>
<DT>M191C</A>
  <DD>is a drawing of DEC's M191C.
<DT>M191X</A>
  <DD>is a 'modernized' M191.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M202 target=_blank>./DEC/Mxxx/M202</a></b>: Triple J-K Flip Flop

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M203 target=_blank>./DEC/Mxxx/M203</a></b>: 8 Set-Reset Flip Flops

</LEGEND><DL>
<DT>M203B</A>
  <DD>is a drawing of DEC's M203B.
<DT>M203X</A>
  <DD>is a 'modernized' M203.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M204 target=_blank>./DEC/Mxxx/M204</a></b>: Counter Buffer

</LEGEND><DL>
<DT>M204D</A>
  <DD>is a drawing of DEC's M204D.
<DT>M204X</A>
  <DD>is a 'modernized' M204.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M205 target=_blank>./DEC/Mxxx/M205</a></b>: 5 D Flip Flops

</LEGEND><DL>
<DT>M205A</A>
  <DD>is a drawing of DEC's M205A.
<DT>M205X</A>
  <DD>is a 'modernized' M205.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M206 target=_blank>./DEC/Mxxx/M206</a></b>: 6 D Flip-Flops

</LEGEND><DL>
<DT>M206C</A>
  <DD>is an Eagle version of DEC's M206C Flip-Flop module.
<DT>M206X</A>
  <DD>is a 'modernized' M206.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M207 target=_blank>./DEC/Mxxx/M207</a></b>: 6 J-K Flip-Flops

</LEGEND><DL>
<DT>M207C</A>
  <DD>is a drawing of DEC's M207C.
<DT>M207E</A>
  <DD>is a drawing of DEC's M207E.
<DT>M207X</A>
  <DD>is a 'modernized' M207.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M208 target=_blank>./DEC/Mxxx/M208</a></b>: Buffer/Shift Register

</LEGEND><DL>
<DT>M208C</A>
  <DD>is a drawing of DEC's M208C.
<DT>M208X</A>
  <DD>is a 'modernized' M208.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M211 target=_blank>./DEC/Mxxx/M211</a></b>: 6-bit Up/down counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M212 target=_blank>./DEC/Mxxx/M212</a></b>: 6 Bit L-R Shift Register

</LEGEND><DL>
<DT>M212B</A>
  <DD>is a drawing of DEC's M212B.
<DT>M212X</A>
  <DD>is a 'modernized' M212.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M213 target=_blank>./DEC/Mxxx/M213</a></b>: BCD Up/Down Counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M214 target=_blank>./DEC/Mxxx/M214</a></b>: 6-bit Accumulator with 3 inputs

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M216 target=_blank>./DEC/Mxxx/M216</a></b>: 6 D Flip-Flops

</LEGEND><DL>
<DT>M216B</A>
  <DD>is a drawing of DEC's M216C.
<DT>M216X</A>
  <DD>is a 'modernized' M216.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M217 target=_blank>./DEC/Mxxx/M217</a></b>: Clock register for PDP-12, 4 bit counter with buffer register for preset or readout

</LEGEND><DL>
<DT>M217A</A>
  <DD>is a drawing of DEC's M217A.
<DT>M217X</A>
  <DD>is a 'modernized' M217.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M218 target=_blank>./DEC/Mxxx/M218</a></b>: Bi-directional shift register, 9 bits, 2 parallel loads

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M219 target=_blank>./DEC/Mxxx/M219</a></b>: 7-bit synchronous counter with jam and clear presets

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M220 target=_blank>./DEC/Mxxx/M220</a></b>: Major Registers, double

</LEGEND><DL>
<DT>M220A</A>
  <DD>is a drawing of DEC's M220A.
<DT>M220B</A>
  <DD>is a drawing of DEC's M220B.
<DT>M220new</A>
  <DD>is an implementation that doesn't use the hard to find
7453 and 7482 chips.
<DT>M220pal</A>
  <DD>is a PAL implementation, using 22V10 programed with
m220pgm1.pds and m220pgm2.pds.
<DT>M220p16</A>
  <DD>is a PAL implementation, using 16V8 programed with
m220a.pds, m220b.pds, and m220c.pds.
<DT>M220xc</A>
  <DD>is a PLD implementation, using XC9536XL programed with
m220a.v, m220b.v, and m220c.v.
<DT>M220X</A>
  <DD>is a 'modernized' M220 (using 16V8).
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M221 target=_blank>./DEC/Mxxx/M221</a></b>: Register for PDP-12 (M220 plus extra logic), Double

</LEGEND><DL>
<DT>M221D</A>
  <DD>is a drawing of DEC's M221D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M222 target=_blank>./DEC/Mxxx/M222</a></b>: Tape register for PDP-12, 2 bits, 6 registers, Double

</LEGEND><DL>
<DT>M222B</A>
  <DD>is a drawing of DEC's M222B.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M223 target=_blank>./DEC/Mxxx/M223</a></b>: MA,/MB Registers

</LEGEND><DL>
<DT>M223B</A>
  <DD>is a drawing of DEC's M223B.
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
<DT>M228A</A>
  <DD>is a drawing of DEC's M228A.
<DT>M228X</A>
  <DD>is a 'modernized' M228.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M230 target=_blank>./DEC/Mxxx/M230</a></b>: Binary to BCD and BCD to Binary Converter, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M232 target=_blank>./DEC/Mxxx/M232</a></b>: 16x1 RAM

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M233 target=_blank>./DEC/Mxxx/M233</a></b>: Disk Shift Register

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M236 target=_blank>./DEC/Mxxx/M236</a></b>: 12 Bit Binary Up/Down Counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M237 target=_blank>./DEC/Mxxx/M237</a></b>: 3 Digit BCD Up/Down Counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M238 target=_blank>./DEC/Mxxx/M238</a></b>: 2 4-bit Synchronous up/down counters with parallel load, separate up & down clocks, board etch 50-08912

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M239 target=_blank>./DEC/Mxxx/M239</a></b>: 3-4 Bit Counter/Registers

</LEGEND><DL>
<DT>M239A</A>
  <DD>is a drawing of DEC's M239A.
<DT>M239X</A>
  <DD>is a 'modernized' M239.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M240 target=_blank>./DEC/Mxxx/M240</a></b>: 6 R/S Flip Flops

</LEGEND><DL>
<DT>M240B</A>
  <DD>is a drawing of DEC's M240B.
<DT>M240X</A>
  <DD>is a 'modernized' M240.</DL>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M245 target=_blank>./DEC/Mxxx/M245</a></b>: Dual 4 Bit Shift Register

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M261 target=_blank>./DEC/Mxxx/M261</a></b>: 4-State Motor Translator

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M262 target=_blank>./DEC/Mxxx/M262</a></b>: 10-State Motor Translator, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M302 target=_blank>./DEC/Mxxx/M302</a></b>: One Shot Delay

</LEGEND><DL>
<DT>M302D</A>
  <DD>is a drawing of DEC's M302D.
<DT>M302K</A>
  <DD>is a drawing of DEC's M302K.
<DT>M302X</A>
  <DD>is a 'modernized' M302.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M304 target=_blank>./DEC/Mxxx/M304</a></b>: One Shot Delay

</LEGEND><DL>
<DT>M304A</A>
  <DD>is a drawing of DEC's M304A.
<DT>M304B</A>
  <DD>is a drawing of DEC's M304B.
<DT>M304X</A>
  <DD>is a 'modernized' M304.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M306 target=_blank>./DEC/Mxxx/M306</a></b>: Integrating One Shot

</LEGEND><DL>
<DT>M306B</A>
  <DD>is a drawing of DEC's M306B.
<DT>M306X</A>
  <DD>is a 'modernized' M306.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M307 target=_blank>./DEC/Mxxx/M307</a></b>: Integrating One Shot

</LEGEND><DL>
<DT>M307-9601</A>
  <DD>is DEC's M307 Integrating One Shot module, with the
now hard to find 9601 monostables.
<DT>M307</A>
  <DD>is a version of the M307 using the more readily available
74123 instead of the 9601.
<DT>M307A</A>
  <DD>is a drawing of DEC's M307A.
<DT>M307B</A>
  <DD>is a drawing of DEC's M307B.
<DT>M307X</A>
  <DD>is a 'modernized' M307.</DL>
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
  <DD>is a drawing of DEC's M310A.
<DT>M310B</A>
  <DD>is a drawing of DEC's M310B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M311 target=_blank>./DEC/Mxxx/M311</a></b>: Tapped Delay Lines

</LEGEND><DL>
<DT>M311A</A>
  <DD>is a drawing of DEC's M311A.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M312 target=_blank>./DEC/Mxxx/M312</a></b>: Delay Module

</LEGEND><DL>
<DT>M312B</A>
  <DD>is a drawing of DEC's M312B.
<DT>M312C</A>
  <DD>is a drawing of DEC's M312C.
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
<DT>M360B</A>
  <DD>is a drawing of DEC's M360B.</DL>
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
<DT>M401B</A>
  <DD>is a drawing of DEC's M401B.
<DT>M401M</A>
  <DD>is a drawing of DEC's M401M.
<DT>M401X</A>
  <DD>is a 'modernized' M401.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M402 target=_blank>./DEC/Mxxx/M402</a></b>: Remotely variable clock, Uses 5V photomod, 2Hz to 1MHz

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M403 target=_blank>./DEC/Mxxx/M403</a></b>: RC Multivibrator Clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M404 target=_blank>./DEC/Mxxx/M404</a></b>: Crystal Clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M405 target=_blank>./DEC/Mxxx/M405</a></b>: Crystal Clock, positive and negative pulse outputs, 5KHz to 10MHz

</LEGEND><DL>
<DT>M405A</A>
  <DD>is a drawing of DEC's M405A.
<DT>M405B</A>
  <DD>is a drawing of DEC's M405B.
<DT>M405X</A>
  <DD>is a 'modernized' M405.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M410 target=_blank>./DEC/Mxxx/M410</a></b>: Resonant Reed Clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M420 target=_blank>./DEC/Mxxx/M420</a></b>: Phase Lock Clock, RP09, RP15, double

</LEGEND><DL>
<DT>M420C</A>
  <DD>is a drawing of DEC's M420C.
<DT>M420X</A>
  <DD>is a 'modernized' M420.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M452 target=_blank>./DEC/Mxxx/M452</a></b>: Variable Clock

</LEGEND><DL>
<DT>M452A</A>
  <DD>is a drawing of DEC's M452A.
<DT>M452X</A>
  <DD>is a 'modernized' M452.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M453 target=_blank>./DEC/Mxxx/M453</a></b>: Variable Clock

</LEGEND><DL>
<DT>M453A</A>
  <DD>is a drawing of DEC's M453A.
<DT>M453X</A>
  <DD>is a 'modernized' M453.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M500 target=_blank>./DEC/Mxxx/M500</a></b>: Negative Input Converter

</LEGEND><DL>
<DT>M500B</A>
  <DD>is a drawing of DEC's M500B.
<DT>M500X</A>
  <DD>is a 'modernized' M500.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M501 target=_blank>./DEC/Mxxx/M501</a></b>: Schmitt Trigger

</LEGEND><DL>
<DT>M501B</A>
  <DD>is a drawing of DEC's M501B.
<DT>M501X</A>
  <DD>is a 'modernized' M501.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M502 target=_blank>./DEC/Mxxx/M502</a></b>: Negative Input Converter

</LEGEND><DL>
<DT>M502A</A>
  <DD>is a drawing of DEC's M502A.
<DT>M502B</A>
  <DD>is a drawing of DEC's M502B.
<DT>M502X</A>
  <DD>is a 'modernized' M502.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M503 target=_blank>./DEC/Mxxx/M503</a></b>: Differential Schmitt, 2 channels, pulse amplifier in each

</LEGEND><DL>
<DT>M503A</A>
  <DD>is a drawing of DEC's M503A.
<DT>M503X</A>
  <DD>is a 'modernized' M503.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M506 target=_blank>./DEC/Mxxx/M506</a></b>: Negative Input Converter, 6 channels, 0 and -3V in

</LEGEND><DL>
<DT>M506C</A>
  <DD>is a drawing of DEC's M506C.
<DT>M506X</A>
  <DD>is a 'modernized' M506.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M507 target=_blank>./DEC/Mxxx/M507</a></b>: Bus Converter

</LEGEND><DL>
<DT>M507A</A>
  <DD>is a drawing of DEC's M507A.
<DT>M507X</A>
  <DD>is a 'modernized' M507.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M508 target=_blank>./DEC/Mxxx/M508</a></b>: Negative bus to positive bus converter, 6 circuits, open collector outputs, GND in = positive out

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M510 target=_blank>./DEC/Mxxx/M510</a></b>: I/O Bus Receiver

</LEGEND><DL>
<DT>M510A</A>
  <DD>is a drawing of DEC's M510A.
<DT>M510X</A>
  <DD>is a 'modernized' M510.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M511 target=_blank>./DEC/Mxxx/M511</a></b>: Unibus Reciever, 15 circuits, 4 GND, DS11, DL10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M514 target=_blank>./DEC/Mxxx/M514</a></b>: TU10 Transceiver (for connection to TC58, TC59, & TM10), see M519, double

</LEGEND><DL>
<DT>M514H</A>
  <DD>is a drawing of DEC's M514H.
<DT>M514X</A>
  <DD>is a 'modernized' M514.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M515 target=_blank>./DEC/Mxxx/M515</a></b>: Real Time Clock, 12VAC input on tabs, uses +11V & +5V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M516 target=_blank>./DEC/Mxxx/M516</a></b>: Hex Positive Bus Receiver

</LEGEND><DL>
<DT>M516A</A>
  <DD>is a drawing of DEC's M516A.
<DT>M516X</A>
  <DD>is a 'modernized' M516.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M517 target=_blank>./DEC/Mxxx/M517</a></b>: M507 with an enable input

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M521 target=_blank>./DEC/Mxxx/M521</a></b>: K to M Converter

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
  <DD>is a drawing of DEC's M597D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M602 target=_blank>./DEC/Mxxx/M602</a></b>: Pulse Amplifier

</LEGEND><DL>
<DT>M602A</A>
  <DD>is a drawing of DEC's M602A.
<DT>M602X</A>
  <DD>is a 'modernized' M602.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M603 target=_blank>./DEC/Mxxx/M603</a></b>: 2 Pulse Amplifiers, negative edge in, 1 positive 60ns & 1 positive 45-100ns out, 4 2-input NANDs (74H00), 3 3-input ANDs (74H11)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M606 target=_blank>./DEC/Mxxx/M606</a></b>: Pulse Generator

</LEGEND><DL>
<DT>M606A</A>
  <DD>is a drawing of DEC's M606A.
<DT>M606B</A>
  <DD>is a drawing of DEC's M606B.
<DT>M606X</A>
  <DD>is a 'modernized' M606.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M610 target=_blank>./DEC/Mxxx/M610</a></b>: 6 Open Collector 2-Input NAND Gates + Pulse Amplifier

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M611 target=_blank>./DEC/Mxxx/M611</a></b>: High Speed Power Inverter

</LEGEND><DL>
<DT>M611A</A>
  <DD>is a drawing of DEC's M611A.
<DT>M611B</A>
  <DD>is a drawing of DEC's M611B.
<DT>M611X</A>
  <DD>is a 'modernized' M611.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M612 target=_blank>./DEC/Mxxx/M612</a></b>: 6 Power Gates, 6 grounds, 5 inputs per gate pair

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M617 target=_blank>./DEC/Mxxx/M617</a></b>: 6-4 Input NOR Buffers

</LEGEND><DL>
<DT>M617B</A>
  <DD>is a drawing of DEC's M617B.
<DT>M617C</A>
  <DD>is a drawing of DEC's M617C.
<DT>M617E</A>
  <DD>is a drawing of DEC's M617E.
<DT>M617X</A>
  <DD>is a 'modernized' M617.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M621 target=_blank>./DEC/Mxxx/M621</a></b>: Bus Driver, 6 circuits, enables for each of 2 6-bit words

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M622 target=_blank>./DEC/Mxxx/M622</a></b>: Bus Drivers

</LEGEND><DL>
<DT>M622A</A>
  <DD>is a drawing of DEC's M622A.
<DT>M622X</A>
  <DD>is a 'modernized' M622.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M623 target=_blank>./DEC/Mxxx/M623</a></b>: Bus Drivers

</LEGEND><DL>
<DT>M623A</A>
  <DD>is a drawing of DEC's M623A.
<DT>M623E</A>
  <DD>is a drawing of DEC's M623E.
<DT>M623X</A>
  <DD>is a 'modernized' M623.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M624 target=_blank>./DEC/Mxxx/M624</a></b>: Bus Drivers

</LEGEND><DL>
<DT>M624A</A>
  <DD>is a drawing of DEC's M624A.
<DT>M624X</A>
  <DD>is a 'modernized' M624.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M627 target=_blank>./DEC/Mxxx/M627</a></b>: Power Amplifier Module

</LEGEND><DL>
<DT>M627A</A>
  <DD>is a drawing of DEC's M627A.
<DT>M627C</A>
  <DD>is a drawing of DEC's M627C.
<DT>M627X</A>
  <DD>is a 'modernized' M627.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M628 target=_blank>./DEC/Mxxx/M628</a></b>: 2 switches, 2 bit adder, 1 M621 type driver, for MX15

</LEGEND><DL>
<DT>M628A</A>
  <DD>is a drawing of DEC's M628A.
<DT>M628X</A>
  <DD>is a 'modernized' M628.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M629 target=_blank>./DEC/Mxxx/M629</a></b>: Bus Driver, 11 circuits, for positive bus, PDP11, 8881's

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M632 target=_blank>./DEC/Mxxx/M632</a></b>: Positive Input Converter Drivers

</LEGEND><DL>
<DT>M632B</A>
  <DD>is a drawing of DEC's M632B.
<DT>M632X</A>
  <DD>is a 'modernized' M632.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M633 target=_blank>./DEC/Mxxx/M633</a></b>: Negative Bus Driver

</LEGEND><DL>
<DT>M633B</A>
  <DD>is a drawing of DEC's M633B.
<DT>M633X</A>
  <DD>is a 'modernized' M633.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M640 target=_blank>./DEC/Mxxx/M640</a></b>: Master Interface Bus Driver, double

</LEGEND><DL>
<DT>M640C</A>
  <DD>is a drawing of DEC's M640C.
<DT>M640X</A>
  <DD>is a 'modernized' M640.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M650 target=_blank>./DEC/Mxxx/M650</a></b>: Negative output converter, 3 channels, R650 type outputs

</LEGEND><DL>
<DT>M650D</A>
  <DD>is a drawing of DEC's M650D.
<DT>M650X</A>
  <DD>is a 'modernized' M650.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M651 target=_blank>./DEC/Mxxx/M651</a></b>: M650 with outputs clamped to ground when 5V goes away

</LEGEND><DL>
<DT>M651C</A>
  <DD>is a drawing of DEC's M651C.
<DT>M651X</A>
  <DD>is a 'modernized' M651.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M652 target=_blank>./DEC/Mxxx/M652</a></b>: Negative Output Converters

</LEGEND><DL>
<DT>M652A</A>
  <DD>is a drawing of DEC's M652A.
<DT>M652X</A>
  <DD>is a 'modernized' M652.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M660 target=_blank>./DEC/Mxxx/M660</a></b>: Positive Level Drivers

</LEGEND><DL>
<DT>M660A</A>
  <DD>is a drawing of DEC's M660A.
<DT>M660B</A>
  <DD>is a drawing of DEC's M660B.
<DT>M660X</A>
  <DD>is a 'modernized' M660.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M661 target=_blank>./DEC/Mxxx/M661</a></b>: Positive Level Driver for 8/I bus, 3 circuits, output clamped to +3V, M660 pins

</LEGEND><DL>
<DT>M661A</A>
  <DD>is a drawing of DEC's M661A.
<DT>M661X</A>
  <DD>is a 'modernized' M661.
</DL>
</FIELDSET>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M671 target=_blank>./DEC/Mxxx/M671</a></b>: M to K Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M697 target=_blank>./DEC/Mxxx/M697</a></b>: 4 Channel IBM Transmitter

</LEGEND><DL>
<DT>M697D</A>
  <DD>is a drawing of DEC's M697D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M700 target=_blank>./DEC/Mxxx/M700</a></b>: Manual Timing Generator, double

</LEGEND><DL>
<DT>M700A</A>
  <DD>is a drawing of DEC's M700A.
<DT>M700B</A>
  <DD>is a drawing of DEC's M700B.
<DT>M700E</A>
  <DD>is a drawing of DEC's M700E.
<DT>M700X</A>
  <DD>is a 'modernized' M700.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M701 target=_blank>./DEC/Mxxx/M701</a></b>: Display Control, VC8/I, double

</LEGEND><DL>
<DT>M701D</A>
  <DD>is a drawing of DEC's M701D.
<DT>M701X</A>
  <DD>is a 'modernized' M701.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7011 target=_blank>./DEC/Mxxx/M7011</a></b>: Serial Transmitter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M703 target=_blank>./DEC/Mxxx/M703</a></b>: Power Fail Logic, 8/I

</LEGEND><DL>
<DT>M703E</A>
  <DD>is a drawing of DEC's M703E.
<DT>M703X</A>
  <DD>is a 'modernized' M703.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M704 target=_blank>./DEC/Mxxx/M704</a></b>: Plotter Control, 8/I

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M705 target=_blank>./DEC/Mxxx/M705</a></b>: Reader Control, double

</LEGEND><DL>
<DT>M705D</A>
  <DD>is a drawing of DEC's M705D.
<DT>M705J</A>
  <DD>is a drawing of DEC's M705J.
<DT>M705X</A>
  <DD>is a 'modernized' M705.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7050 target=_blank>./DEC/Mxxx/M7050</a></b>: Reader Control with feed hole strobe & feed hole transistion out-of-tape sense, Double

</LEGEND><DL>
<DT>M7050C</A>
  <DD>is a version of DEC's M7050C.
<DT>M7050D</A>
  <DD>is a version of DEC's M7050D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M706 target=_blank>./DEC/Mxxx/M706</a></b>: Teletype Receiver, double

</LEGEND><DL>
<DT>M706D</A>
  <DD>needs a drawing.
<DT>M706K</A>
  <DD>is a drawing of DEC's M706K.
<DT>M706X</A>
  <DD>is a 'modernized' version of DEC's M706K.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M707 target=_blank>./DEC/Mxxx/M707</a></b>: Teletype Transmitter, double

</LEGEND><DL>
<DT>M707C</A>
  <DD>is a drawing of M707 etch C.
<DT>M707C+</A>
  <DD>is a drawing of M707 etch C with a resistor in SERIAL OUT, like M707D.
<DT>M707D</A>
  <DD>is a drawing of M707 etch D.
<DT>M707X</A>
  <DD>is a 'modernized' version of M707D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M708 target=_blank>./DEC/Mxxx/M708</a></b>: Clock Control, 8/I

</LEGEND><DL>
<DT>M708A</A>
  <DD>needs a drawing.
<DT>M708B</A>
  <DD>is an Eagle version of DEC's M708B.
<DT>M708C</A>
  <DD>needs a drawing.
<DT>M708X</A>
  <DD>is an modernized version of DEC's M708B with unused inputs tied high.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M709 target=_blank>./DEC/Mxxx/M709</a></b>: Clock Counter, 8/I

</LEGEND><DL>
<DT>M709A</A>
  <DD>needs a drawing.
<DT>M709B</A>
  <DD>is an Eagle version of DEC's M708B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M710 target=_blank>./DEC/Mxxx/M710</a></b>: Punch control, double

</LEGEND><DL>
<DT>M710F</A>
  <DD>needs a drawing.
<DT>M710H</A>
  <DD>is a drawing of DEC's M710H.
<DT>M710X</A>
  <DD>is a 'modernized' M710H.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7104 target=_blank>./DEC/Mxxx/M7104</a></b>: RK8E Data Buffer and Status

</LEGEND><DL>
<DT>M7104</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7105 target=_blank>./DEC/Mxxx/M7105</a></b>: RK8E Major Registers

</LEGEND><DL>
<DT>M7105</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7106 target=_blank>./DEC/Mxxx/M7106</a></b>: RK8E Control

</LEGEND><DL>
<DT>M7106</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M711 target=_blank>./DEC/Mxxx/M711</a></b>: Scope Control, PDP-12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M714 target=_blank>./DEC/Mxxx/M714</a></b>: Control Logic I, CR8-I, CR8-L

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M715 target=_blank>./DEC/Mxxx/M715</a></b>: Reader Clock, double

</LEGEND><DL>
<DT>M715A</A>
  <DD>needs a drawing.
<DT>M715E</A>
  <DD>needs a drawing.
<DT>M715F</A>
  <DD>is a drawing of DEC's M715F Reader Clock module.
<DT>M715X</A>
  <DD>is a 'modernized' drawing of DEC's M715F.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M730 target=_blank>./DEC/Mxxx/M730</a></b>: Positive Output Bus Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M731 target=_blank>./DEC/Mxxx/M731</a></b>: Negative Output Bus Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M732 target=_blank>./DEC/Mxxx/M732</a></b>: Positive Input Bus Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M733 target=_blank>./DEC/Mxxx/M733</a></b>: Negative Input Bus Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M734 target=_blank>./DEC/Mxxx/M734</a></b>: Input/Output Bus Multiplexer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M735 target=_blank>./DEC/Mxxx/M735</a></b>: Input/Output Bus Transfer Register

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M736 target=_blank>./DEC/Mxxx/M736</a></b>: Priority Interrupt Module

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M737 target=_blank>./DEC/Mxxx/M737</a></b>: 12-Bit Bus Receiver Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M738 target=_blank>./DEC/Mxxx/M738</a></b>: Counter-Buffer Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7390 target=_blank>./DEC/Mxxx/M7390</a></b>: Aynchronous Transceiver, extended double

</LEGEND></FIELDSET>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M763 target=_blank>./DEC/Mxxx/M763</a></b>: 9 Track Write Buffler for TU10, negative logic, see M893, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M765 target=_blank>./DEC/Mxxx/M765</a></b>: 9 Track Read Buffer for TU10, double

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7671 target=_blank>./DEC/Mxxx/M7671</a></b>: Master Slave Bus Driver, TU10, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7672 target=_blank>./DEC/Mxxx/M7672</a></b>: TU10 Command Buffers, Double

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7673 target=_blank>./DEC/Mxxx/M7673</a></b>: Data Checker, TU10, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M768 target=_blank>./DEC/Mxxx/M768</a></b>: Delay Selector for TU10, with TC58, TC59, TM10, double

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M776 target=_blank>./DEC/Mxxx/M776</a></b>: Reader Register, PC15, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7820 target=_blank>./DEC/Mxxx/M7820</a></b>: Interrupt Control, 7 bits, 1 per PDP11 peripheral, Replaced by M7821, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M7821 target=_blank>./DEC/Mxxx/M7821</a></b>: Interrupt Control, 7 bits, 1 per PDP11 peripheral, Faster M7820, extended single

</LEGEND><DL>
<DT>M7821</A>
  <DD>is a drawing of DEC's M7821 Interrupt Control board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M783 target=_blank>./DEC/Mxxx/M783</a></b>: Unibus/Omnibus Drivers, extended single

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M784 target=_blank>./DEC/Mxxx/M784</a></b>: Unibus/Omnibus Receivers, extended single

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M785 target=_blank>./DEC/Mxxx/M785</a></b>: Unibus/Omnibus Tranceiver, extended single

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M786 target=_blank>./DEC/Mxxx/M786</a></b>: Device Register Interface, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M795 target=_blank>./DEC/Mxxx/M795</a></b>: Word Count and Bus Address Module, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M796 target=_blank>./DEC/Mxxx/M796</a></b>: Unibus Master Control, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M797 target=_blank>./DEC/Mxxx/M797</a></b>: Register Select

</LEGEND><DL>
<DT>M797B</A>
  <DD>needs a drawing and a DEC schematic.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M798 target=_blank>./DEC/Mxxx/M798</a></b>: Unibus Drivers, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8300 target=_blank>./DEC/Mxxx/M8300</a></b>: KK8E Major Registers

</LEGEND><DL>
<DT>M8300E</A>
  <DD>needs a drawing.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8310 target=_blank>./DEC/Mxxx/M8310</a></b>: KK8E Major Register Control

</LEGEND><DL>
<DT>M8310H</A>
  <DD>needs a drawing.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8320 target=_blank>./DEC/Mxxx/M8320</a></b>: KK8E Bus Loads

</LEGEND><DL>
<DT>M8320D</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8330 target=_blank>./DEC/Mxxx/M8330</a></b>: KK8E Timing Generator

</LEGEND><DL>
<DT>M8330C</A>
  <DD>needs a drawing.
<DT>M8330D</A>
  <DD>needs a drawing.
<DT>M8330E</A>
  <DD>needs a drawing.
<DT>M8330F</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8340 target=_blank>./DEC/Mxxx/M8340</a></b>: KE8E Decoder and Step Counter

</LEGEND><DL>
<DT>M8340F</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8341 target=_blank>./DEC/Mxxx/M8341</a></b>: KE8E Multiplexers and Timing Generator

</LEGEND><DL>
<DT>M8341D</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8350 target=_blank>./DEC/Mxxx/M8350</a></b>: KA8E Positive I/O Bus Interface

</LEGEND><DL>
<DT>M8350C</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M837 target=_blank>./DEC/Mxxx/M837</a></b>: Omnibus Memory Extension and Timeshare Option

</LEGEND><DL>
<DT>M837</A>
  <DD>is a drawing of DEC's M837 Omnibus Timeshare Option board,
which uses a lot of hard to find chips.
M837bb is a version of M837 with the signals renamed to match their function.
M837cc is a variant without the the TP_CB1 input.

</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M8416 target=_blank>./DEC/Mxxx/M8416</a></b>: KT8A 128K Memory Management Board

</LEGEND><DL>
<DT>M8416C</A>
  <DD>needs a drawing.
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
<DT>M868H</A>
  <DD>is an Eagle version of DEC's M868 (ECO Rev. K) Simple Dectape Controller.
<DT>M868Hcjl</A>
  <DD>is a version of M868Hl with an SDLD bug fix described by Charles Lasner.
<DT>M868Hvrs1</A>
  <DD>is a version of M868Hl with an SDLD bug with easier mods.
<DT>M868Hvrs2</A>
  <DD>is another version of M868Hl with an SDLD bug fix (cleaner design).
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M870 target=_blank>./DEC/Mxxx/M870</a></b>: IMPLEMENTS SIMPLE CLOCK IN PDP12

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M890 target=_blank>./DEC/Mxxx/M890</a></b>: Motion Control for TU10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M891 target=_blank>./DEC/Mxxx/M891</a></b>: TU10 CRC and Write Gating, Double

</LEGEND><DL>
<DT>M891</A>
  <DD>is a version of DEC's M891 CRC and Write Gating module.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M892 target=_blank>./DEC/Mxxx/M892</a></b>: TU10 Write Gap Timing, Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M895 target=_blank>./DEC/Mxxx/M895</a></b>: TU10/TU15 Read Timing, Double

</LEGEND></FIELDSET>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M901 target=_blank>./DEC/Mxxx/M901</a></b>: Flat Mylar Cable Connector, 10 ohms in A2,B2,U1 & V1, 2 cables

</LEGEND><DL>
<DT>M901B</A>
  <DD>is a drawing if DEC's M901B.
<DT>M901X</A>
  <DD>is a 'mdernized' version of M901.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M902 target=_blank>./DEC/Mxxx/M902</a></b>: TERMINATOR, 18 100 OHM RESISTORS, M903 & M904 CONNECTIONS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M903 target=_blank>./DEC/Mxxx/M903</a></b>: Flat Mylar Connector, 18 signals, 14 GND pins

</LEGEND><DL>
<DT>M903B</A>
  <DD>is a drawing if DEC's M903B.
<DT>M903X</A>
  <DD>is a 'mdernized' version of M903.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M904 target=_blank>./DEC/Mxxx/M904</a></b>: Coax Connector, 2x 9-signals, split lug, M903 Pins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M906 target=_blank>./DEC/Mxxx/M906</a></b>: Cable Terminator

</LEGEND><DL>
<DT>M906A</A>
  <DD>is a drawing if DEC's M906A.
<DT>M906X</A>
  <DD>is a 'mdernized' version of M906A.
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
  <DD>is a drawing of DEC's M908B.
<DT>M908X</A>
  <DD>is a 'modernized' version of DEC's M908B.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M9100 target=_blank>./DEC/Mxxx/M9100</a></b>: H854 to H854 or Flip Chip Adapter, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M911 target=_blank>./DEC/Mxxx/M911</a></b>: Memory Bus CP Terminator

</LEGEND><DL>
<DT>M911A</A>
  <DD>needs a drawing.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M912 target=_blank>./DEC/Mxxx/M912</a></b>: Coax Connector, 4x 9-conductor, split lug, M904 Connections, double

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M917 target=_blank>./DEC/Mxxx/M917</a></b>: Ribbon Connector, 18 Signals, 14 GND Pins, split lug

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M918 target=_blank>./DEC/Mxxx/M918</a></b>: Flat Mylar Connector, 36 Signals

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M919 target=_blank>./DEC/Mxxx/M919</a></b>: 11 EXTERNAL BUS, 2 60-WIRE MYLAR, 56 SIGNALS, 14 GND PINS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M920 target=_blank>./DEC/Mxxx/M920</a></b>: Unibus Jumper Module

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M921 target=_blank>./DEC/Mxxx/M921</a></b>: DEVICE CODE SELECT JUMPER MODULE, FOR 3 IOT'S

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M922 target=_blank>./DEC/Mxxx/M922</a></b>: M901 WITH JUMPERS INSTEAD OF RESISTORS FOR INDICATOR BUS, NOT TO BE USED ON BOTH ENDS OF ANY CABLE

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M925 target=_blank>./DEC/Mxxx/M925</a></b>: Flat Mylar Connector, 18 Signals, 19 Grounds, short single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M926 target=_blank>./DEC/Mxxx/M926</a></b>: M901 WITH 100 OHMS IN SERIES WITH SOME OF THE PINS

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M927 target=_blank>./DEC/Mxxx/M927</a></b>: Coax Connector, 18-signals, split lug, short

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M929 target=_blank>./DEC/Mxxx/M929</a></b>: Bus Connector, double

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M935 target=_blank>./DEC/Mxxx/M935</a></b>: Omnibus Jumper Module

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M953 target=_blank>./DEC/Mxxx/M953</a></b>: Flat Cable Connector, 18 Signals, 18 Grounds

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M954 target=_blank>./DEC/Mxxx/M954</a></b>: Flat Cable Connector, 36 Signals

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M955 target=_blank>./DEC/Mxxx/M955</a></b>: Flat Cable Connector, 18 Signals

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Mxxx/M975 target=_blank>./DEC/Mxxx/M975</a></b>: Flip Chip to 2x H854 Adapter, special double

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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Proto target=_blank>./DEC/Proto</a></b>: DEC Compatible Prototyping boards

</LEGEND><DL>
<DT>proto</A>
  <DD>is a quad prototype board suitable for DIP/through hole designs.
<DT>omniproto</A>
  <DD>is a quad prototype board suitable for Omnibus DIP/through hole designs.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R001 target=_blank>./DEC/Rxxx/R001</a></b>: Diode Network, 7 diodes, both ends brought to pins

</LEGEND><DL>
<DT>R001A</A>
  <DD>is a drawing of DEC's R001A.
<DT>R001B</A>
  <DD>is a drawing of DEC's R001B.
<DT>R001X</A>
  <DD>is a 'modernized' R001.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R002 target=_blank>./DEC/Rxxx/R002</a></b>: Diode Network, 5 groups of 2 diodes, cathode common

</LEGEND><DL>
<DT>R002A</A>
  <DD>is a drawing of DEC's R002A.
<DT>R002B</A>
  <DD>is a drawing of DEC's R002B.
<DT>R107X</A>
  <DD>is a 'modernized' R002.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R012 target=_blank>./DEC/Rxxx/R012</a></b>: Diode Network, R002 etch, anodes common

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R107 target=_blank>./DEC/Rxxx/R107</a></b>: 7 Inverters, 1 with expansion node

</LEGEND><DL>
<DT>R107A</A>
  <DD>is a drawing of DEC's R107A.
<DT>R107B</A>
  <DD>needs a drawing.
<DT>R107C</A>
  <DD>needs a drawing.
<DT>R107D</A>
  <DD>is a drawing of DEC's R107D.
<DT>R107E</A>
  <DD>needs a drawing.
<DT>R107S1A</A>
  <DD>is a drawing of DEC's R107S1A.
<DT>R107X</A>
  <DD>is a 'modernized' R107.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R111 target=_blank>./DEC/Rxxx/R111</a></b>: 3 2-Input Gates, Expandable, Open Collector, 3 clamp load resistors

</LEGEND><DL>
<DT>R111E</A>
  <DD>is a drawing of DEC's R111E.
<DT>R111F</A>
  <DD>is a drawing of DEC's R111F.
<DT>R111X</A>
  <DD>is a 'modernized' R111.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R1110 target=_blank>./DEC/Rxxx/R1110</a></b>: R111 with 2mA fan-in & 6534-C transistors, sinks 63ma

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R113 target=_blank>./DEC/Rxxx/R113</a></b>: 5 2-Input Gates

</LEGEND><DL>
<DT>R113A</A>
  <DD>is a drawing of DEC's R113A.
<DT>R113B</A>
  <DD>is a drawing of DEC's R113B.
<DT>R113X</A>
  <DD>is a 'modernized' R113.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R1130 target=_blank>./DEC/Rxxx/R1130</a></b>: R113 with 2mA fan-in & 6534-C transistors, sinks 63ma

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R121 target=_blank>./DEC/Rxxx/R121</a></b>: 2 2-Input, 1 3-Input, 1 4-Input Gates

</LEGEND><DL>
<DT>R121A</A>
  <DD>is a drawing if DEC's R121A.
<DT>R121B</A>
  <DD>needs a drawing.
<DT>R121X</A>
  <DD>is a 'modernized' R121.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R122 target=_blank>./DEC/Rxxx/R122</a></b>: Logical Complement of R121

</LEGEND><DL>
<DT>R122X</A>
  <DD>is a drawing of a 'modernized' R122.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R123 target=_blank>./DEC/Rxxx/R123</a></b>: Input Bus Gate, 6 Gates, 1 Independent Input, 1 Paired Common Input

</LEGEND><DL>
<DT>R123B</A>
  <DD>is a drawing of DEC's R123B.
<DT>R123X</A>
  <DD>is a 'modernized' R123.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R131 target=_blank>./DEC/Rxxx/R131</a></b>: Exclusive OR, 4 circuits, Output is -3V if inputs are the same

</LEGEND><DL>
<DT>R131C</A>
  <DD>is a drawing of DEC's R131C.
<DT>R131X</A>
  <DD>is a 'modernized' R131.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R141 target=_blank>./DEC/Rxxx/R141</a></b>: AND-NOR Gate, 7 sets of 2-Input AND Gates NORed together

</LEGEND><DL>
<DT>R141E</A>
  <DD>is a drawing of DEC's R141E.
<DT>R141X</A>
  <DD>is a 'modernized' R141.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R151 target=_blank>./DEC/Rxxx/R151</a></b>: Binary-Octal Decoder, 6 Inputs + Enable, 8 Outputs

</LEGEND><DL>
<DT>R151A</A>
  <DD>is a drawing of DEC's R151A.
<DT>R151B</A>
  <DD>is a drawing of DEC's R151B.
<DT>R151D</A>
  <DD>is a drawing of DEC's R151D.
<DT>R151X</A>
  <DD>is a 'modernized' R151.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R152 target=_blank>./DEC/Rxxx/R152</a></b>: Obsolete, R151 without clamp loads, see B152

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R181 target=_blank>./DEC/Rxxx/R181</a></b>: DC Carry Cahin, 6 Interconnected Diode Gates + 1 Inverter

</LEGEND><DL>
<DT>R181A</A>
  <DD>is a drawing of DEC's R181A.
<DT>R181C</A>
  <DD>is a drawing of DEC's R181C.
<DT>R181X</A>
  <DD>is a 'modernized' R181.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R200 target=_blank>./DEC/Rxxx/R200</a></b>: Set-Reset Flip-flop

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R201 target=_blank>./DEC/Rxxx/R201</a></b>: RS FF with 3 Set and 2 Reset DCD Gates

</LEGEND><DL>
<DT>R201A</A>
  <DD>needs a drawing.
<DT>R201C</A>
  <DD>is a drawing of DEC's R201C.
<DT>R201D</A>
  <DD>needs a drawing.
<DT>R201X</A>
  <DD>is a 'modernized' R201.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R202 target=_blank>./DEC/Rxxx/R202</a></b>: Dual FF, Direct Clear, Common Set, 1 set & 1 reset DCD Gate each

</LEGEND><DL>
<DT>R202D</A>
  <DD>is a drawing of DEC's R202D.
<DT>R202E</A>
  <DD>is a drawing of DEC's R202E.
<DT>R202X</A>
  <DD>is a 'modernized' R202.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R203 target=_blank>./DEC/Rxxx/R203</a></b>: Triple FF, Direct Clear, Set DCD Gate each

</LEGEND><DL>
<DT>R203D</A>
  <DD>is a drawing of DEC's R203D.
<DT>R203X</A>
  <DD>is a 'modernized' R203.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R204 target=_blank>./DEC/Rxxx/R204</a></b>: Quad FF, Direct Set for each, Direct Clear for 2, Common for 2

</LEGEND><DL>
<DT>R204B</A>
  <DD>is a drawing of DEC's R204B.
<DT>R204X</A>
  <DD>is a 'modernized' R204.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R205 target=_blank>./DEC/Rxxx/R205</a></b>: Dual FF, Common Direct Clear, 2 DCD Gates each

</LEGEND><DL>
<DT>R205D</A>
  <DD>is a drawing of DEC's R205D.
<DT>R205X</A>
  <DD>is a 'modernized' R205.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R210 target=_blank>./DEC/Rxxx/R210</a></b>: PDP8 Accumulator

</LEGEND><DL>
<DT>R210A</A>
  <DD>is a drawing of DEC's R210A.
<DT>R210I</A>
  <DD>is a drawing of DEC's R210I.
<DT>R210L</A>
  <DD>is a drawing of DEC's R210L.
<DT>R210X</A>
  <DD>is a 'modernized' R210.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R211 target=_blank>./DEC/Rxxx/R211</a></b>: MB, PC, MA, (PDP8)

</LEGEND><DL>
<DT>R211J</A>
  <DD>is a drawing of DEC's R211J.
<DT>R211K</A>
  <DD>needs a drawing.
<DT>R211L</A>
  <DD>needs a drawing.
<DT>R211X</A>
  <DD>is a 'modernized' R211.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R212 target=_blank>./DEC/Rxxx/R212</a></b>: MQ (PDP8), 2 FFs, SR, SL, Read-in, Clear

</LEGEND><DL>
<DT>R212D</A>
  <DD>is a drawing of DEC's R212D.
<DT>R212F</A>
  <DD>is a drawing of DEC's R212F.
<DT>R212J</A>
  <DD>needs a drawing.
<DT>R212X</A>
  <DD>is a 'modernized' R212.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R220 target=_blank>./DEC/Rxxx/R220</a></b>: 3-Bit SR, Parallel Read-in, Diodes out for detecting all 0s in R111 node

</LEGEND><DL>
<DT>R220J</A>
  <DD>is a drawing of DEC's R220J.
<DT>R220X</A>
  <DD>is a 'modernized' R220.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R284 target=_blank>./DEC/Rxxx/R284</a></b>: Quadraflop, PDP8, 4 stable states

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R302 target=_blank>./DEC/Rxxx/R302</a></b>: 2 One-shots

</LEGEND><DL>
<DT>R302J</A>
  <DD>is a drawing of DEC's R302J.
<DT>R302K</A>
  <DD>is a drawing of DEC's R302K.
<DT>R302L</A>
  <DD>is a drawing of DEC's R302L.
<DT>R302M</A>
  <DD>needs a drawing.
<DT>R302X</A>
  <DD>is a 'modernized' R302.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R303 target=_blank>./DEC/Rxxx/R303</a></b>: Integrating One Shot

</LEGEND><DL>
<DT>R303D</A>
  <DD>needs a drawing.
<DT>R303X</A>
  <DD>is a 'modernized' R303.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R401 target=_blank>./DEC/Rxxx/R401</a></b>: Variable Clock, 30CPS to 2 MC

</LEGEND><DL>
<DT>R401D</A>
  <DD>is a drawing of DEC's R401D.
<DT>R401F</A>
  <DD>is a drawing of DEC's R401F.
<DT>R401H</A>
  <DD>is a drawing of DEC's R401H.
<DT>R401X</A>
  <DD>is a 'modernized' R401.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R405 target=_blank>./DEC/Rxxx/R405</a></b>: Crystal Clock, 5KC to 2 Mc Available

</LEGEND><DL>
<DT>R405H</A>
  <DD>is a drawing of DEC's R405H.
<DT>R405J</A>
  <DD>is a drawing of DEC's R405J.
<DT>R405X</A>
  <DD>is a 'modernized' R405.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R406 target=_blank>./DEC/Rxxx/R406</a></b>: Clock for PDP9/L, 1.5us

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R407 target=_blank>./DEC/Rxxx/R407</a></b>: PDP9 Parity Clock, 1.2us

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R408 target=_blank>./DEC/Rxxx/R408</a></b>: PDP8 Clock

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R409 target=_blank>./DEC/Rxxx/R409</a></b>: PDP9 Clock (R405 configured for 1MC)

</LEGEND><DL>
<DT>R409H</A>
  <DD>is a drawing of DEC's R409H.
<DT>R409J</A>
  <DD>is a drawing of DEC's R409J.
<DT>R409X</A>
  <DD>is a 'modernized' R409.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R450 target=_blank>./DEC/Rxxx/R450</a></b>: Variable Clock

</LEGEND><DL>
<DT>R450E</A>
  <DD>is a drawing of DEC's R450E.
<DT>R450X</A>
  <DD>is a 'modernized' R450.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R451 target=_blank>./DEC/Rxxx/R451</a></b>: Teletype Clock, for faster teletype think R450

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R601 target=_blank>./DEC/Rxxx/R601</a></b>: Pulse Amplifier, 6 DCD Gates, 100 or 400 ns pulses

</LEGEND><DL>
<DT>R601F</A>
  <DD>is a drawing of DEC's R601F.
<DT>R601H</A>
  <DD>is a drawing of DEC's R601H.
<DT>R601X</A>
  <DD>is a 'modernized' R601.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R602 target=_blank>./DEC/Rxxx/R602</a></b>: Pulse Amplifier, 2 DCD Gates & 1 Diode Input each, 100 or 400 ns pulses

</LEGEND><DL>
<DT>R602H</A>
  <DD>is a drawing of DEC's R602H.
<DT>R602K</A>
  <DD>is a drawing of DEC's R602K.
<DT>R602X</A>
  <DD>is a 'modernized' R602.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R603 target=_blank>./DEC/Rxxx/R603</a></b>: Pulse Amplifier, 3 circuits, 1 DCD Gate & 1 Diode Input each

</LEGEND><DL>
<DT>R603D</A>
  <DD>is a drawing of DEC's R603D.
<DT>R603X</A>
  <DD>is a 'modernized' R603.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R613 target=_blank>./DEC/Rxxx/R613</a></b>: R603 that cannot be triggered from output, with 5 mA loads

</LEGEND><DL>
<DT>R613B</A>
  <DD>is a drawing of DEC's R613B.
<DT>R613X</A>
  <DD>is a 'modernized' R613.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R623 target=_blank>./DEC/Rxxx/R623</a></b>: R603 with 400us pulse, R603 etch, retrofit for LINC-8

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R650 target=_blank>./DEC/Rxxx/R650</a></b>: Bus Driver, 2 circuits, 2 Inputs & Node

</LEGEND><DL>
<DT>R650BS1B</A>
  <DD>is a drawing of DEC's R650BS1B.
<DT>R650C</A>
  <DD>is a drawing of DEC's R650C.
<DT>R650E</A>
  <DD>is a drawing of DEC's R650E.
<DT>R650X</A>
  <DD>is a 'modernized' R650.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Rxxx/R663 target=_blank>./DEC/Rxxx/R663</a></b>: B163 with DEC 6534C (6 2-Input NANDs, 1 Input/Gate + 1 Input/Gate pair, 2mA fan-in)

</LEGEND></FIELDSET>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx target=_blank>./DEC/Sxxx</a></b>: Sxxx Modules

</LEGEND><FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S107 target=_blank>./DEC/Sxxx/S107</a></b>: R107 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S107D</A>
  <DD>is a drawing of DEC's S107D.
<DT>S107S1A</A>
  <DD>is a drawing of DEC's S107S1A.
<DT>S107X</A>
  <DD>is a 'modernized' S107.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S111 target=_blank>./DEC/Sxxx/S111</a></b>: R111 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S111E</A>
  <DD>is a drawing of DEC's S111E.
<DT>S111F</A>
  <DD>is a drawing of DEC's S111F.
<DT>S111X</A>
  <DD>is a 'modernized' RS111.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S123 target=_blank>./DEC/Sxxx/S123</a></b>: Diode Gate

</LEGEND><DL>
<DT>S123B</A>
  <DD>is a drawing of DEC's S123B.
<DT>S123X</A>
  <DD>is a 'modernized' S123.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S151 target=_blank>./DEC/Sxxx/S151</a></b>: R151 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S151A</A>
  <DD>is a drawing of DEC's S151A.
<DT>S151B</A>
  <DD>is a drawing of DEC's S151B.
<DT>S151D</A>
  <DD>is a drawing of DEC's S151D.
<DT>S151X</A>
  <DD>is a 'modernized' S151.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S181 target=_blank>./DEC/Sxxx/S181</a></b>: DC Carry Chain, 6 Interconnected Diode Gates + 1 Inverter

</LEGEND><DL>
<DT>S181A</A>
  <DD>is a drawing of DEC's S181A.
<DT>S181C</A>
  <DD>is a drawing of DEC's S181C.
<DT>S181X</A>
  <DD>is a 'modernized' S181.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S202 target=_blank>./DEC/Sxxx/S202</a></b>: R202 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S202D</A>
  <DD>is a drawing of DEC's S202D.
<DT>S202X</A>
  <DD>is a 'modernized' S202.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S203 target=_blank>./DEC/Sxxx/S203</a></b>: R203 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S203D</A>
  <DD>is a drawing of DEC's S203D.
<DT>S203X</A>
  <DD>is a 'modernized' S203.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S205 target=_blank>./DEC/Sxxx/S205</a></b>: R205 Dual Flip Flop with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S205C</A>
  <DD>is a drawing of DEC's S205C.
<DT>S205D</A>
  <DD>is a drawing of DEC's S205D.
<DT>S205X</A>
  <DD>is a 'modernized' S205.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S206 target=_blank>./DEC/Sxxx/S206</a></b>: S205 Dual Flip Flop with 10mA clamp loads

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S284 target=_blank>./DEC/Sxxx/S284</a></b>: R284 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S284B</A>
  <DD>is a drawing of DEC's S284B.
<DT>S284X</A>
  <DD>is a 'modernized' S284.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S602 target=_blank>./DEC/Sxxx/S602</a></b>: R602 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>S602H</A>
  <DD>is a drawing of DEC's S602H.
<DT>S602K</A>
  <DD>is a drawing of DEC's S602K.
<DT>S602X</A>
  <DD>is a 'modernized' S602.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Sxxx/S603 target=_blank>./DEC/Sxxx/S603</a></b>: R603 with 5 mA Clamp Loads

</LEGEND><DL>
<DT>R603D</A>
  <DD>is a drawing of DEC's R603D.
<DT>R603X</A>
  <DD>is a 'modernized' R603.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/TP34_Autoloader target=_blank>./DEC/TP34_Autoloader</a></b>: TP-34 Autoloader

</LEGEND><DL>
<DT>tp34</A>
  <DD>is a drawing of the Tennecomp TP-34 Autoloader for Omnibus machines.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W002 target=_blank>./DEC/Wxxx/W002</a></b>: 15 2mA Clamped Loads, W005 etch

</LEGEND><DL>
<DT>W002B</A>
  <DD>is a drawing of DEC's W002B.
<DT>W002X</A>
  <DD>is a 'modernized' W002.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W005 target=_blank>./DEC/Wxxx/W005</a></b>: 15 Clamped Loads

</LEGEND><DL>
<DT>W005B</A>
  <DD>is a drawing of DEC's W005B.
<DT>W005X</A>
  <DD>is a 'modernized' W005.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W010 target=_blank>./DEC/Wxxx/W010</a></b>: 10 10mA Cleamped loads to -15V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W011 target=_blank>./DEC/Wxxx/W011</a></b>: W021 but 3.25" long.

</LEGEND><DL>
<DT>W011B</A>
  <DD>is a drawing of DEC's W011B.
<DT>W011X</A>
  <DD>is a 'modernized' W011.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W012 target=_blank>./DEC/Wxxx/W012</a></b>: Flexprint Indicator Cable, -15 +15 Signal, PDP10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W013 target=_blank>./DEC/Wxxx/W013</a></b>: Word Sink Stack Connector, W016 etc, PDP10, 2 1/2 D Memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W014 target=_blank>./DEC/Wxxx/W014</a></b>: Digit Stack Connector, PDP10, 2 1/2 D Memory, modified W015 layout

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W017 target=_blank>./DEC/Wxxx/W017</a></b>: Drive Cable Connector, PDP9 Memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W018 target=_blank>./DEC/Wxxx/W018</a></b>: Cable Connector for Indicator Amplifiers (with diodes)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W020 target=_blank>./DEC/Wxxx/W020</a></b>: Indicator Cable Conn,. 18 ribbon cable, 1.5K resistors

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W021 target=_blank>./DEC/Wxxx/W021</a></b>: Signal Cable Conn., 19 wire ribbon, D, E, H, K, M, P, S, T, V hot, 10 grounds: C, F, J, L, N, R, U

</LEGEND><DL>
<DT>W021A</A>
  <DD>is a drawing of DEC's W021A.
<DT>W021B</A>
  <DD>is a drawing of DEC's W021B.
<DT>W021X</A>
  <DD>is a 'modernized' W021.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W022 target=_blank>./DEC/Wxxx/W022</a></b>: W021 with 100 ohm shunt terminators

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W023 target=_blank>./DEC/Wxxx/W023</a></b>: 18 Line Ribbon Connector, component spaces near A & B, others straight through

</LEGEND><DL>
<DT>W023A</A>
  <DD>is a drawing of DEC's W023A.
<DT>W023X</A>
  <DD>is a 'modernized' W023.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W024 target=_blank>./DEC/Wxxx/W024</a></b>: Coax Connector, 16-signals, split lug, short

</LEGEND><DL>
<DT>W024X</A>
  <DD>is a 'modernized' W024.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W025 target=_blank>./DEC/Wxxx/W025</a></b>: 32 Split Lugs, 4 slots, double size, Memory Paddle used for W075

</LEGEND><DL>
<DT>W025A</A>
  <DD>is a drawing of DEC's W025A.
<DT>W025X</A>
  <DD>is a 'modernized' W025.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W026 target=_blank>./DEC/Wxxx/W026</a></b>: 18 Split Lugs, diode and resistor termination

</LEGEND><DL>
<DT>W026B</A>
  <DD>is a drawing of DEC's W026B.
<DT>W026X</A>
  <DD>is a 'modernized' W026.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W027 target=_blank>./DEC/Wxxx/W027</a></b>: Ribbon Cable Connector, 18 Signals with 3Kohm resistors, split lugs

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W028 target=_blank>./DEC/Wxxx/W028</a></b>: W021 with lugs for series of shunt resistors or diodes in signal leads

</LEGEND><DL>
<DT>W028A</A>
  <DD>is a drawing of DEC's W028A.
<DT>W028X</A>
  <DD>is a 'modernized' W028.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W031 target=_blank>./DEC/Wxxx/W031</a></b>: Flat Mylar Cable Connector, 9 Signals, 9 Grounds, short single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W032 target=_blank>./DEC/Wxxx/W032</a></b>: 5 shielded triples, DEC Tape Signal Connector, double

</LEGEND><DL>
<DT>W032B</A>
  <DD>is a drawing of DEC's W032B.
<DT>W032X</A>
  <DD>is a 'modernized' W032.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W033 target=_blank>./DEC/Wxxx/W033</a></b>: Flexprint, W023 connections on "A" side, side entry cable

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W034 target=_blank>./DEC/Wxxx/W034</a></b>: Flexprint, 16 connections on "B" side 10 ohms on A2, B2

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W035 target=_blank>./DEC/Wxxx/W035</a></b>: Cable Connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W040 target=_blank>./DEC/Wxxx/W040</a></b>: 2 Solenoid Drivers, 2 Inputs plus a node, 0.6A max, similar to 4113 + 4681

</LEGEND><DL>
<DT>W040B</A>
  <DD>is a drawing of DEC's W040B.
<DT>W040X</A>
  <DD>is a 'modernized' W040.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W042 target=_blank>./DEC/Wxxx/W042</a></b>: 10 Amp Driver (double height, double width)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W043 target=_blank>./DEC/Wxxx/W043</a></b>: 2 Solenoid Drivers, 2 Inputs plus a node, 2.0A max, similar to W040

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W050 target=_blank>./DEC/Wxxx/W050</a></b>: 7 Indicator/Solenoid Drivers, 30mA -20V max

</LEGEND><DL>
<DT>W050C</A>
  <DD>is a drawing of DEC's W050C.
<DT>W050X</A>
  <DD>is a 'modernized' W050.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W051 target=_blank>./DEC/Wxxx/W051</a></b>: 7 Indicator/Solenoid Drivers, 100mA -15V max

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W061 target=_blank>./DEC/Wxxx/W061</a></b>: 4 Relay Drivers, 250mA +55V max

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W070 target=_blank>./DEC/Wxxx/W070</a></b>: Teletype Cable Connector, PDP8, PT08

</LEGEND><DL>
<DT>W070C</A>
  <DD>is a drawing of DEC's W070C.
<DT>W070X</A>
  <DD>is a 'modernized' W070.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W072 target=_blank>./DEC/Wxxx/W072</a></b>: LINC-8 Scope Cable Connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W073 target=_blank>./DEC/Wxxx/W073</a></b>: LINC-8 Tape Cable Connector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W076 target=_blank>./DEC/Wxxx/W076</a></b>: Teletype Connector, from Positive Logic 8/I, logic equivalent to W070

</LEGEND><DL>
<DT>W076B</A>
  <DD>is a drawing of DEC's W076B.
<DT>W076D</A>
  <DD>is a drawing of DEC's W076D.
<DT>W076X</A>
  <DD>is a 'modernized' W076D.
<DT>W076Dclone</A>
  <DD>is a drawing of a clone of DEC's W076D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W078 target=_blank>./DEC/Wxxx/W078</a></b>: W076 with AMP connector instead of cable

</LEGEND><DL>
<DT>W078</A>
  <DD>is a drawing of DEC's W078.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W080 target=_blank>./DEC/Wxxx/W080</a></b>: Isolated AC/DC Switch

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W100 target=_blank>./DEC/Wxxx/W100</a></b>: Emitter Follower

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W101 target=_blank>./DEC/Wxxx/W101</a></b>: I/O Bus Driver, similar to 4657

</LEGEND><DL>
<DT>W101B</A>
  <DD>is a drawing of DEC's W101B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W102 target=_blank>./DEC/Wxxx/W102</a></b>: Memory Bus Transceiver, 1665 type

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W103 target=_blank>./DEC/Wxxx/W103</a></b>: Device Selector, PDP8, double

</LEGEND><DL>
<DT>W103C</A>
  <DD>is a drawing of DEC's W103C.
<DT>W103X</A>
  <DD>is a 'modernized' W103.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W104 target=_blank>./DEC/Wxxx/W104</a></b>: PDP-9 I/O Bus Module

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W106 target=_blank>./DEC/Wxxx/W106</a></b>: Priority Interrupt Grant

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W107 target=_blank>./DEC/Wxxx/W107</a></b>: I/O Receiver, PDP10, 7 channels

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W108 target=_blank>./DEC/Wxxx/W108</a></b>: Bipolar Decoding Driver, double

</LEGEND><DL>
<DT>W108C</A>
  <DD>is a drawing of DEC's W108C.
<DT>W108X</A>
  <DD>is a 'modernized' W108.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W122 target=_blank>./DEC/Wxxx/W122</a></b>: Pulsed Bus Transceiver, pin compatible with W102 & W112, positive logic in, -bus, -logic out

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W132 target=_blank>./DEC/Wxxx/W132</a></b>: Memory Bus Transceiver, KI10, negative bus, 4 circuits, similar to W102

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W250 target=_blank>./DEC/Wxxx/W250</a></b>: 12 Indicator Drivers, flex print, ground & -15V from male end

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W300 target=_blank>./DEC/Wxxx/W300</a></b>: Tapped 800ns Delay Lines with 50ns taps, 3 Output Amplifiers, replaced by W301

</LEGEND><DL>
<DT>W300C</A>
  <DD>is a drawing of DEC's W300C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W301 target=_blank>./DEC/Wxxx/W301</a></b>: Tapped 800ns Delay Lines with 50ns taps, W300 pins, different input loading and improved margins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W404 target=_blank>./DEC/Wxxx/W404</a></b>: DTR Jumper

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W500 target=_blank>./DEC/Wxxx/W500</a></b>: High Impedance Follower, 7 circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W501 target=_blank>./DEC/Wxxx/W501</a></b>: Schmitt Trigger, +/-10V in, 0 and 03V out

</LEGEND><DL>
<DT>W501F</A>
  <DD>is a drawing of DEC's W501F.
<DT>W501X</A>
  <DD>is a 'modernized' W501.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W502 target=_blank>./DEC/Wxxx/W502</a></b>: 2 Photon Coupled Triggers

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W504 target=_blank>./DEC/Wxxx/W504</a></b>: Initial Transient Detector, A Schmitt, 0 delay, 10ms blackout

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W505 target=_blank>./DEC/Wxxx/W505</a></b>: Low Voltage Detector, measures +10V & -15V

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W506 target=_blank>./DEC/Wxxx/W506</a></b>: Power Monitor

</LEGEND><DL>
<DT>W506C</A>
  <DD>is a drawing of DEC's W506C.
<DT>W506X</A>
  <DD>is a 'modernized' W506.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W507 target=_blank>./DEC/Wxxx/W507</a></b>: Low Voltage Detector, ME10, measures +5, +5, -15, -15, all reg, -15, +10 unreg, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W509 target=_blank>./DEC/Wxxx/W509</a></b>: 3 phase AC Low Voltage Detector

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W510 target=_blank>./DEC/Wxxx/W510</a></b>: Positive Level Convertor, 3 circuits, thresholds of 0, +1 or +2V; 0 & -3V out

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W511 target=_blank>./DEC/Wxxx/W511</a></b>: Negative Level Convertor, 2 circuits, thresholds of 0, -1, -2V, -3V; 0 & -3V out

</LEGEND><DL>
<DT>W511A</A>
  <DD>is a drawing of DEC's W511A.
<DT>W511X</A>
  <DD>is a 'modernized' W511.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W512 target=_blank>./DEC/Wxxx/W512</a></b>: Positive Level Converter, 7 circuits, thresholds of +1.6 or 0.8V for use with TTL; 0 & -3V out

</LEGEND><DL>
<DT>W512A</A>
  <DD>is a drawing of DEC's W512A.
<DT>W512X</A>
  <DD>is a 'modernized' W512.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W513 target=_blank>./DEC/Wxxx/W513</a></b>: Negative Level Converter, 6 circuits, used in TU55

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W514 target=_blank>./DEC/Wxxx/W514</a></b>: Positive Level Converter, 6 circuits, 100 ohm input

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W519 target=_blank>./DEC/Wxxx/W519</a></b>: Power Sequence & Crowbar

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W520 target=_blank>./DEC/Wxxx/W520</a></b>: Comparator, 3 differential circuits, 100mV resolution, like 1501 level converter

</LEGEND><DL>
<DT>W520B</A>
  <DD>is a drawing of DEC's W520B.
<DT>W520X</A>
  <DD>is a 'modernized' W520.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W532 target=_blank>./DEC/Wxxx/W532</a></b>: Dual AC coupled Sense Amplifier, used on PDP8-S

</LEGEND><DL>
<DT>W532B</A>
  <DD>is a drawing of DEC's W532B.
<DT>W532X</A>
  <DD>is a 'modernized' W532.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W533 target=_blank>./DEC/Wxxx/W533</a></b>: Dual Rectifying Slicer, was G803

</LEGEND><DL>
<DT>W533A</A>
  <DD>is a drawing of DEC's W533A.
<DT>W533X</A>
  <DD>is a 'modernized' W533.</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W590 target=_blank>./DEC/Wxxx/W590</a></b>: IBM N Line to DEC converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W591 target=_blank>./DEC/Wxxx/W591</a></b>: Positive Bus to DEC converter, for Memorex, 0 to +3V, 8 MC, 5 channels, W592 pins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W592 target=_blank>./DEC/Wxxx/W592</a></b>: IBM 360 Bus to DEC Converter (non-inverting)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W600 target=_blank>./DEC/Wxxx/W600</a></b>: Negative Level Amplifier, like 1667, 3 inverting circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W601 target=_blank>./DEC/Wxxx/W601</a></b>: Positive Level Amplifier, 3 inverting circuits

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W602 target=_blank>./DEC/Wxxx/W602</a></b>: Bipolar Level Amplifier, 3 circuits, EIA Line Interfacer

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W603 target=_blank>./DEC/Wxxx/W603</a></b>: Positive Level Amplifier, 7 circuits

</LEGEND><DL>
<DT>W603A</A>
  <DD>is a drawing of DEC's W603A.
<DT>W603B</A>
  <DD>is a drawing of DEC's W603B.
<DT>W603X</A>
  <DD>is a 'modernized' W603.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W607 target=_blank>./DEC/Wxxx/W607</a></b>: 3 Pulse Converters, positive or negarive, 70ns 2.5V pulse out

</LEGEND><DL>
<DT>W607B</A>
  <DD>is a drawing of DEC's W607B.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W612 target=_blank>./DEC/Wxxx/W612</a></b>: Dual Pulse Amplifier, B602 pins, 120 & 320ns, Diode Output for "OR" Bus

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W640 target=_blank>./DEC/Wxxx/W640</a></b>: 3 Pulse Converters, positive or negative, 400ns or 1us, 2.5V pulse out

</LEGEND><DL>
<DT>W640D</A>
  <DD>is a drawing of DEC's W640D.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W681 target=_blank>./DEC/Wxxx/W681</a></b>: Scope Intensifier for 34 Display

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W682 target=_blank>./DEC/Wxxx/W682</a></b>: Scope Intensifier, 0 to +3V step, delay 50 to 300ns, 400ns pulse (for VR12 & VR14)

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W690 target=_blank>./DEC/Wxxx/W690</a></b>: DEC to IBM N Line Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W692 target=_blank>./DEC/Wxxx/W692</a></b>: DEC to IBM 360 Bus Driver

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W693 target=_blank>./DEC/Wxxx/W693</a></b>: DEC to CTUL Converter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W700 target=_blank>./DEC/Wxxx/W700</a></b>: Switch Filter, 6 circuits, similar to 1703, used on W710

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W701 target=_blank>./DEC/Wxxx/W701</a></b>: Input Network, for PDP8 Card Reader

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W702 target=_blank>./DEC/Wxxx/W702</a></b>: Teletype Level Converter for DC10B Data Line Scanner

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W705 target=_blank>./DEC/Wxxx/W705</a></b>: 3.6V Power Supply, triple width

</LEGEND><DL>
<DT>W705A</A>
  <DD>is a drawing of DEC's W705A.
<DT>W705X</A>
  <DD>is a 'modernized' W705.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W706 target=_blank>./DEC/Wxxx/W706</a></b>: Teletype Receiver, 8-bit, 11 Unit Codes, double

</LEGEND><DL>
<DT>W706C</A>
  <DD>is a drawing of DEC's W706C.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W707 target=_blank>./DEC/Wxxx/W707</a></b>: Teletype Transmitter, 8 bit, 2 unit stop code, double

</LEGEND><DL>
<DT>W707F</A>
  <DD>is a drawing of DEC's W707F.
<DT>W707H</A>
  <DD>is a drawing of DEC's W707H.
<DT>W707L</A>
  <DD>is a drawing of DEC's W707L.
<DT>W707P</A>
  <DD>is a drawing of DEC's W707P.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W708 target=_blank>./DEC/Wxxx/W708</a></b>: Teletype Communications Interface

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W709 target=_blank>./DEC/Wxxx/W709</a></b>: Divide by 16/64 Counter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W714 target=_blank>./DEC/Wxxx/W714</a></b>: Switch Module, 2 form C microswitches, no circuits, 9/I memory

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W726 target=_blank>./DEC/Wxxx/W726</a></b>: 4 DC & 3 Differentiating Switch Filters, for positive logic, TU10

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W800 target=_blank>./DEC/Wxxx/W800</a></b>: 2 Form A Reed Relays, similar to 1803

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W802 target=_blank>./DEC/Wxxx/W802</a></b>: Relay Multiplexer, 8 Reed Relays, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W808 target=_blank>./DEC/Wxxx/W808</a></b>: 2-2 Form A, 1/8 Amp 250V Relays

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W841 target=_blank>./DEC/Wxxx/W841</a></b>: 1/2 W851 for 9 Coax

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W850 target=_blank>./DEC/Wxxx/W850</a></b>: Connector, 2 double boards with W021 layout, frame, hold-down screw

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W851 target=_blank>./DEC/Wxxx/W851</a></b>: Connector, similar to W850, W851 is card & components, BC10 is assembly & cable

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W852 target=_blank>./DEC/Wxxx/W852</a></b>: W851 with no components, used in BC10C-xx, uses W851 board

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W900 target=_blank>./DEC/Wxxx/W900</a></b>: Multilayer Externder, Long Double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W940 target=_blank>./DEC/Wxxx/W940</a></b>: Wire Wrappable Module, 50x 16 pin, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W941 target=_blank>./DEC/Wxxx/W941</a></b>: Wire Wrappable Module, 25x 16 pin, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W942 target=_blank>./DEC/Wxxx/W942</a></b>: Wire Wrappable Module, 50x 16 pin, with sockets, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W943 target=_blank>./DEC/Wxxx/W943</a></b>: Wire Wrappable Module, 25x 16 pin, with sockets, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W950 target=_blank>./DEC/Wxxx/W950</a></b>: Wire Wrappable Module, 30x 16 pin, 8x 24 pin, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W951 target=_blank>./DEC/Wxxx/W951</a></b>: Wire Wrappable Module, 15x 16 pin, 4x 24 pin, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W952 target=_blank>./DEC/Wxxx/W952</a></b>: Wire Wrappable Module, 30x 16 pin, 8x 24 pin, with sockets, extended quad

</LEGEND><DL>
<DT>W952</A>
  <DD>is a drawing of DEC's W952 Wire Wrap prototype board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W953 target=_blank>./DEC/Wxxx/W953</a></b>: Wire Wrappable Module, 15x 16 pin, 4x 24 pin, with sockets, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W960 target=_blank>./DEC/Wxxx/W960</a></b>: MSI Mounting Board (2 14-16 pin or 1 24 pin, all pins brought out)

</LEGEND><DL>
<DT>W960</A>
  <DD>is a drawing of DEC's W960 MSI Mounting Board, which allows 16 and 24
pin DIP components to be connected to a DEC backplane.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W964 target=_blank>./DEC/Wxxx/W964</a></b>: Blank Universal Terminator, 28 pins, single 5", 50-09733 etch

</LEGEND><DL>
<DT>W964</A>
  <DD>is a drawing of DEC's W964 Universal Terminator board.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W966 target=_blank>./DEC/Wxxx/W966</a></b>: Wire Wrappable Module, 42x 16 pin, 72 terminal fingers, I/O header, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W967 target=_blank>./DEC/Wxxx/W967</a></b>: Wire Wrappable Module, 42x 16 pin, 72 terminal fingers, I/O header, with sockets, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W968 target=_blank>./DEC/Wxxx/W968</a></b>: Collage Mounting Board, 72x 16 pin, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W969 target=_blank>./DEC/Wxxx/W969</a></b>: Collage Mounting Board, 36x 16 pin, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W970 target=_blank>./DEC/Wxxx/W970</a></b>: Bare Board, 36 pins, no split lugs, similar to W990

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W971 target=_blank>./DEC/Wxxx/W971</a></b>: Bare board, 72 pins, no lugs, similar to W991, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W972 target=_blank>./DEC/Wxxx/W972</a></b>: Copper Clad, 36 pins, similar to W992

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W9720 target=_blank>./DEC/Wxxx/W9720</a></b>: Copper clad boad, both sides, extended single

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W9721 target=_blank>./DEC/Wxxx/W9721</a></b>: Copper clad boad, both sides, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W9722 target=_blank>./DEC/Wxxx/W9722</a></b>: Copper clad boad, both sides, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W973 target=_blank>./DEC/Wxxx/W973</a></b>: Bare Board, 72 pins, copper clad, similar to W993, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W974 target=_blank>./DEC/Wxxx/W974</a></b>: Perforated single height board, 36 pins, 0.1" grid, contacts only

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W975 target=_blank>./DEC/Wxxx/W975</a></b>: Perforated double height board, 72 pins, 0.1" grid, contacts only

</LEGEND><DL>
<DT>W975</A>
  <DD>is a drawing of DEC's W975 double-height perfboard.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W979 target=_blank>./DEC/Wxxx/W979</a></b>: Collage Mounting Board, 18x 16 pin, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W980 target=_blank>./DEC/Wxxx/W980</a></b>: Module Extender, single sided

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W982 target=_blank>./DEC/Wxxx/W982</a></b>: Module Extender, double sided

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W983 target=_blank>./DEC/Wxxx/W983</a></b>: Module Extender, double height double sided

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W984 target=_blank>./DEC/Wxxx/W984</a></b>: Module Extender, extended double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W985 target=_blank>./DEC/Wxxx/W985</a></b>: System Module Adapter

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W987 target=_blank>./DEC/Wxxx/W987</a></b>: Module Extender, extended quad

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W990 target=_blank>./DEC/Wxxx/W990</a></b>: Blank Module, split lug for each of 18 pins

</LEGEND><DL>
<DT>W990D</A>
  <DD>is a drawing of DEC's W990D.
<DT>W990X</A>
  <DD>is a 'modernized' W990.
</DL>
</FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W991 target=_blank>./DEC/Wxxx/W991</a></b>: Bare board, split lugs, 36 pins, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W992 target=_blank>./DEC/Wxxx/W992</a></b>: Copper clad, 18 pins

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W993 target=_blank>./DEC/Wxxx/W993</a></b>: Copper clad, 36 pins, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W994 target=_blank>./DEC/Wxxx/W994</a></b>: Perforated Module, 0.2" centers, 18 lands

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W995 target=_blank>./DEC/Wxxx/W995</a></b>: Perforated Module, 0.2" centers, 36 lands, double

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W998 target=_blank>./DEC/Wxxx/W998</a></b>: Perforated single height board, 18 pins, 0.1" grid, contacts only

</LEGEND></FIELDSET>
<FIELDSET><LEGEND>
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DEC/Wxxx/W999 target=_blank>./DEC/Wxxx/W999</a></b>: Perforated double height board, 36 pins, 0.1" grid, contacts only

</LEGEND></FIELDSET>
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./DS32-pdp8.net target=_blank>./DS32-pdp8.net</a></b>: DS32 replacement based on effort of Dave G. at www.pdp8.net.

</LEGEND><DL>
<DT>ds32djg</A>
  <DD>follows Dave's schematic closely, laid out on one long and two standard paddles.
<DT>ds32</A>
  <DD>is a start on a "shrink" using SMT.
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
<DT>diodes</A>
  <DD>is an attempt to lay out diode level converters for the flipchip tester.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./IOB6120 target=_blank>./IOB6120</a></b>: IOB 6120 by Jim Kearney

</LEGEND><DL>
<DT>iob6-r</A>
  <DD>is the "A" version from Jim Kearney.
<DT>iob7c</A>
  <DD>is the "B" version from Jim Kearney.
<DT>iob7cvrs</A>
  <DD>is iob7c with the silk-screen visible.
<DT>iob9avrs</A>
  <DD>is my first attempt at fixing the battery issue (single CE#, lots of read/write enables).
<DT>iob9bvrs</A>
  <DD>is my second attempt at fixing the battery issue (DS1321D, CE# per ramdisk, series batteries).
<DT>iob9cvrs</A>
  <DD>is the fixed "9C" version manufactured in 2009 (DS1321D with parallel batteries).
<DT>iob9xvrs</A>
  <DD>is iob9c re-routed with slightly beefed up power rails.
<DT>iob10avrs</A>
  <DD>is a copy of iob9c with the bottom side silkscreen glitch (RN2) fixed.
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
  <b><a href=http://svn.so-much-stuff.com/svn/trunk/Eagle/projects/./LD12 target=_blank>./LD12</a></b>: PDP-8 Clone based on Prosser Book
</LEGEND></FIELDSET>
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
<DT>RF08bOmnibus</A>
  <DD>is an start on an Omnibus version.
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
