<?php
    $title = "Bulb Page";
    include "../top.php";
?>
<HT>
Here are some part numbers for replacement front panel bulbs.
<p>

<DL>
<h3>PDP-8/E, PDP-8/F, PDP-8/M</h3>
<dt>12-09219
<dd>See PDP-8/L (bulb panels only).
</DL>

<DL>
<h3>PDP-8/L</h3>
<dt>12-09219
<dd>The official cross-reference is Chicago Miniature's CM2309, but 
many panels in people's collections use the equivalent Oshino OL-2.
<dt>OL-2/CM2309
<dd>10V, 40ma, .05mscp, 5Khours -- The real deal.  These were the "blue base" bulbs.
<dd>The OL-2/CM2309 was also used in the 5408458 peripheral indicator panel.
<dd>Generally no longer stocked, but can be special ordered from Mouser (last checked 10/2009).
<dd>Oshino OL-367 is a newer part number for what appears to be the same bulb.
<dt>CM7371
<dd>12V, 40ma, .12mscp, 10Khours -- These derate at 10V to approximately 
36ma, .06mscp, 89Khours.
<dd>In stock at Mouser for $9.90 qty 10 (last checked 10/2009).
<dd>These have been used in panels and seem to work well.  The brightness 
is about 20% high, so you may want to do whole registers at a time to 
make them less noticeable.
</DL>

<DL>
<h3>PDP-8/i</h3>
<dt>12-09169
<dd>See Oshino's OL-1.
<dt>OL-1
<dd>15V, 40ma, .075mscp -- The real deal.  These were the "black base" bulbs.
<dd>The OL-1 was also used in the RK05 control panel,
and the KA10 CPU front panel.
<dd>In stock at www.donsbulbs.com for $8.75 each (as of 10/2009).
<dt>OL-6003
<dd>15V, 37ma, .075mscp 50Khours -- A very close substitute.
<dd>Mark G. Thomas found them at sunraylighting.com.
<dt>CM7370
<dd>18V, 40ma, .15mscp, 10Khours -- These derate at 15V to approximately
36ma, .08mscp, 89K hours, so they should work well.
<dd>$7.00 qty 10 at Mouser (as of 10/2009).
</DL>

<DL>
<h3>PDP-8/S</h3>
<dt>1762F/CM1762
<dd>See Straight-8 below.
</DL>

<DL>
<h3>PDP-8 (Straight-8)</h3>
<dt>1762F/CM1762
<dd>28V, 40ma, .34mscp, 4Khours -- The real deal. Unlike the ones above,
it doesn't have a base.
<dd>The wires just stick out of the glass at the bottom. Some of these are available at www.donsbulbs.com.
<dd>Can be special ordered from Mouser in qty 500 or more.
<dt>CM2187
<dd>28V, 40ma, .30mscp, 7Khours -- a close match for the original bulb.
<dd>Available from Mouser for $4.90 qty 10 with a 3 week lead time (as of 10/2009).
<dt>CM7387
<dd>28V, 40ma, .30mscp, 7Khours-- Like the CM2187, but with a bi-pin base.
<dd>The bi-pin bulbs seem to fit the 8/S panel, but I don't know about the 
spacing on the straight-8.  (Bi-pin bulbs have the advantage that they can 
be reliably socketed.)
<dd>Available from Mouser for $8.40 qty 10 (as of 10/2009).
</DL>


<DL>
<h3>TU56</h3>
<dt>Line-o-Lite 3590A20
<dd>12V indicator assembly.  A white box and frosted panel, with a wire-lead
bulb inside.  From the circuit, we can conclude that a 12V, 80ma or less 
bulb must have been used.  (The circuit is actually powered with 15V, however.)
<dt>CM2182
<dd>14V, 80ma, .3mscp, 40Khours -- This has been successfully used to replace the 
bulb inside the white box of the indicator assembly.
</DL>

<?php include "../footer.php"; ?>
