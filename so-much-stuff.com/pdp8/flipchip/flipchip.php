<?php
  $title = "FlipChip Modules";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>

<TABLE>
<TR>
<TD vAlign=top>
    <P><FONT size=3>
    <DIV>I have begun an effort to document the flipchips which DEC used
to implement various CPUs and controllers.  My ultimate goal is to collect 
the available information about these modules from various places on the 
web, and add CAD drawings for each revision of each module, thus documenting
them for posterity.  (Each CAD drawing takes me about a day, so progress
can be slow.)
    <P>There are a couple of ways to look at the stuff.  First, there is 
the classic "module list", much like Zane Healy and others have done:
<UL>
<LI><A href=modules.htm target=_blank>modules.htm</A>
<LI><A href=modules.txt target=_blank>modules.txt</A>
</UL>
    <P>A "+" next to a revision means that I have the information to do 
CAD drawings for that module, but haven't gotten to it yet.  A "*" means 
I don't have sufficient information to do CAD drawings (usually high 
quality photos of the front and back of the board will suffice).  No 
revisions listed means I don't even have the schematics (for any revision)
to work from.
    <P>Clicking on the first link for each item in the HTML version will
get you to the appropriate directory in the SVN repository, where all the
images and other files for all revisions of that module are just sort of
there in a jumble.
    <P>Clicking the second (and third) link, when present, will take you
to a datasheet (or two) describing the function of that module.
    <P>Second, I have made some tables that list each known revision of
each module and what is known about it, with links to the relevant 
individual files.  In many cases I have added an "X" version, which is 
intended to be a version of the module built with components that are 
still currently available.  (Most "X" versions have not yet been built
and tested.)
    <P>That makes it easier to see that, say, revision A is lacking a
DEC schematic, where revision B has one (which may not work too well
for revision A).  Hopefully there will be an Eagle schematic, though
that currently means you'd have to install some version of Eagle CAD to
view it.
    <P>I should be clear that what I mean by revision here refers to
the <I>etch</I> revision, not the DEC internal revision number.  (That
is, the version numbers here should match those etched into the back of
the actual modules.  The etch revision number is often missing or less 
prominently displayed than the internal DEC revision number on DEC
schematics.)
    <P>Here are those files:
<UL>
<LI><A href=Axxx.htm target=_blank>Axxx.htm</A>
<LI><A href=Bxxx.htm target=_blank>Bxxx.htm</A>
<LI><A href=Gxxx.htm target=_blank>Gxxx.htm</A>
<LI><A href=Hxxx.htm target=_blank>Hxxx.htm</A>
<LI><A href=Kxxx.htm target=_blank>Kxxx.htm</A>
<LI><A href=Mxxx.htm target=_blank>Mxxx.htm</A>
<LI><A href=Rxxx.htm target=_blank>Rxxx.htm</A>
<LI><A href=Sxxx.htm target=_blank>Sxxx.htm</A>
<LI><A href=Wxxx.htm target=_blank>Wxxx.htm</A>
</UL>
    <P>Currently, Mxxx and Rxxx have had the most work done.
    <P>If you are looking for more information about a Bxxx or an Sxxx module,
those are often quite similar to the corresponding Rxxx, with some changes
in component values.
    <P>There is not much information here about Axxx, Hxxx, or Kxxx modules yet.
    <P>In some cases, I have annotated these lists with information about
whether I am looking to acquire an instance, or have extras to sell.
    <P>I have seen a problem where I attempted to click on the link for 
a DEC schematic, and binary gibberish displayed in the browser instead 
of the nice PDF.  Please let me know something similar happens to you, 
as it means I have to fix the properties for that particular file in
the SVN repository.
    <P>My thanks to the many folks who've helped preserve this information,
especially Al Kossow of
<A href=http://www.bitsavers.org target=_blank>www.bitsavers.org</A>. 
Special thanks also to Joerg Hoppe of
<A href=http://retrocmp.com target=_blank>retrocmp.com</A>
for many of the module images.
    <P>If you want to do CAD drawings like mine, check out the "cad"
link at the top of the page.  <A href=eagle.php>This page</A> also 
gives information about how these drawings are created.

<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
