<?php
    $title = "Bulb Page";
    include $_SERVER{'DOCUMENT_ROOT'} . '/pdp8/header.php';
?>
<HT>
Here are some part numbers for replacement front panel bulbs.
<p>

<DL>
<h3>PDP-8/E, PDP-8/F, PDP-8/M</h3>
<DT>12-09219
<dd>See PDP-8/L below (bulb panels only).
</DL>

<DL>
<h3>PDP-8/L</h3>
<DT>12-09219
<dd>The official cross-reference is Chicago Miniature's CM2309, but 
many panels in people's collections use the equivalent Oshino OL-2.
<DT>OL-2/CM2309
<dd>10V, 40ma, .05mscp, 5,000 hours -- The real deal.  These were the
"blue base" bulbs.
<dd>The OL-2/CM2309 was also used in the 54-08458 peripheral indicator panel.
<dd>Oshino OL-367BP is a newer part number for what appears to be the same bulb.
<DT>CM7371
<dd>12V, 40ma, .12mscp, 10,000 hours -- approximately 36ma, .06mscp, 89,000 hours at 10V.
<dd>In stock at Mouser for $9.90 for 10 (last checked 12/2011).
<dd>These have been used in panels and seem to work well.  The brightness 
is about 20% high, so you may want to do whole registers at a time to 
make them less noticeable.
</DL>

<DL>
<h3>PDP-12</h3>
<DT>12-09169
<dd>See PDP-8/i below.
</DL>

<DL>
<h3>PDP-8/i</h3>
<DT>12-09169
<dd>See Oshino's OL-1.
<DT>OL-1
<dd>15V, 40ma, .075mscp -- The real deal.  These were the "black base" bulbs.
<dd>The OL-1 was also used in the KA10 CPU front panel.
<DT>OL-6003BP
<dd>15V, 37ma, .075mscp, 50,000 hours -- A very close substitute.
<dd>Mark G. Thomas found them at sunraylighting.com.
<DT>CM7003
<dd>15V, 40ma, .075mscp, 2,000 hours.
<dd>I found some 
<A href=http://www.atlantalightbulbs.com/ecart/10Expand.asp?ProductCode=7003>here</A>
(12/2011).
<DT>CM7370
<dd>18V, 40ma, .15mscp, 10,000 hours -- These de-rate at 15V to approximately
36ma, .08mscp, 89K hours, so they should work well.  Michael Thompson reports
that they are also an excellent visual match to the OL-1 in PDP-8/i panels.
<dd>In stock at Mouser for $7.00 for 10 (as of 9/2012).
<!-- The CM/Sylvania/BP 7003 is an exact equivalent. -->
<!-- The 12-05859 is Hudson/Sylvania 2339 -- an exact equivalent! -->
</DL>

<DL>
<h3>PDP-8 (Straight-8)</h3>
<DT>12-01741
<dd>See PDP-8/S below.
</DL>

<DL>
<h3>LINC-8</h3>
<DT>12-01741 (most likely)
<dd>See PDP-8/S below.
</DL>

<DL>
<h3>PDP-8/S</h3>
<DT>12-01741
<dd>See 1762F/CM1762.
<DT>1762F/CM1762
<dd>28V, 40ma, .34mscp, 4,000 hours -- The real deal.
<dd>Unlike the ones above, it doesn't have a base.  The wires just stick out
of the glass at the bottom.
<dd>Some of these are available at www.donsbulbs.com (as of 12/2011).
<DT>CM2187
<dd>28V, 40ma, .30mscp, 7,000 hours -- a close match for the original bulb.
<dd>In stock at Mouser for $4.90 for 10 (as of 12/2011).
<DT>CM7387
<dd>28V, 40ma, .30mscp, 7,000 hours-- Like the CM2187, but with a bi-pin base.
(Bi-pin bulbs have the advantage that they can be reliably socketed.)
<dd>The bi-pin bulbs seem to fit the 8/S panel, but Doug Ingraham reports there
is not enough vertical clearance in his straight-8.  (A bi-pin bulb is 5/8" tall, 
my 8/S panel has about 3/4" clearance, and Doug's straight-8 has about 9/16" clearance.)
<dd>In stock at Mouser for $8.40 for 10 (as of 12/2011).
<!-- The 12-03483 is also the 1762F. -->
</DL>


<DL>
<h3>TC01</h3>
<DT>12-01741
<dd>The TC01 uses modified 4910 and 4904 indicator brackets, which in turn hold 
Drake 11-504 or DialCo 39-28-375 or Eldema CF ZWT-1762 (per the PDP-5
manual).  That last is equivalent to the 1762F.  See PDP-8/S above.
</DL>

<DL>
<h3>TU56</h3>
<DT>12-09637
<dd>See Line-o-Lite 3590A20.
<DT>Line-o-Lite 3590A20
<dd>12V indicator assembly.  A white box and frosted panel, with a wire-lead
bulb inside.  From the circuit, we can conclude that a 12V, 80ma or less 
bulb must have been used.  (The circuit is actually powered with 15V, however.)
<DT>CM2182
<dd>14V, 80ma, .3mscp, 40,000 hours -- These are the bulb inside the white box
of the indicator assembly.
<dd>In stock at Mouser for $3.01 for 10 (as of 12/2011).
</DL>

<DL>
<h3>TU55</h3>
<DT>12-02749 (most likely)
<dd>The TU55 uses a similar indicator assembly to that later used in the TU56, 
but it is a 28V version.  The markings on mine are "1090B44 28V", but the parts 
list says "1090B" which suggests perhaps a 1090B4-28V would be equivalent.  The
bulbs inside the assembly seem to be CM2187 equivalents.
See PDP-8/S above.
<!-- The 12-03218 is the same part as 12-02749. -->
<!-- The 12-02116 is a 28V cartridge lamp -- is it similar? -->
<!-- The 12-04706 is a 1090C cartridge lamp -- what voltage? -->
<!-- The 12-05299 is a 1090C cartridge lamp -- what voltage? -->
</DL>

<DL>
<h3>RK05</h3>
<DT>12-09169
<dd>See PDP-8/i above.
</DL>

<DL>
<h3>RK08 Controller</h3>
<DT>12-09219
<dd>See PDP-8/L above.
</DL>

<DL>
<h3>TC08 Controller</h3>
<DT>12-09219 (most likely)
<dd>See PDP-8/L above.  I haven't been able to confirm this one.
<!-- The 12-05591 is a CM2306, which would be a 6V lamp, which could be what was used. -->
</DL>

<DL>
<h3>TU10</h3>
<DT>12-09169
<dd>See PDP-8/i above.
<DT>12-01280
<dd>A #1020C55 125V cartridge lamp with a red lens (power).
<!-- The 12-05303 is a 1020A cartridge lamp -- what voltage? -->
<!-- The 12-05458 is a 1020C55 125V cartridge lamp -->
</DL>

<DL>
<h3>TU20</h3>
<DT>12-09169
<dd>See PDP-8/i above.
Michael Thompson reports no problems when using the CM7370 with TU20 panels.
</DL>

<DL>
<h3>RL01/RL02</h3>
<DT>12-12716
<dd>See GE 73.
<DT>GE 73
<dd>14V, 80ma, T1.75 Wedge base W2.1x9.5d, 4 lumens,15000 hours. AKA GE 23015.
</DL>

<DL>
<h3>PC04</h3>
<DT>12-04734 (most likely)
<dd>See Osram 6475.
(The Spare parts list has "12V 18W P.T.RDR" hand-written.)
<DT>Osram 6475
<dd>A 12V 1.5A SV8.5-8 T4.75 1.77" 300 hour "festoon" bulb usually sold as an automotive
dome light or license plate light.
<!-- The 12-04903 is a similar Osram 6411/8935, also a 12 festoon lamp, but 10W T3.25. -->
</DL>

<DL>
<h3>RP06 (Memorex 677)</h3>
<DT>CM7387
<dd>See above.
(According to Dave McGuire.)
</DL>

<?php include $_SERVER{'DOCUMENT_ROOT'} . '/pdp8/footer.php'; ?>
