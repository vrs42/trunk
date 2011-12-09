<?php
  $title = "Paper Tape Images";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>

<P><FONT size=3>
<BODY>
<P><B>Tape Categories:</B>
<UL>
<LI><A href=../tapes/dec.html target=_blank>dec</A>
<LI><A href=../tapes/decus.html target=_blank>decus</A>
<LI><A href=../tapes/digital.html target=_blank>digital</A>
<LI><A href=../tapes/maindec.html target=_blank>maindec</A>
<LI><A href=../tapes/misc.html target=_blank>misc</A>
<P><P>
</UL>
<P>Hello, and welcome to my tape archive.
<P>The various sub-directories have various tape images in them,using what I hope is a fairly obvious system.
<P>The actual tape images themselves come as a set of relatedfiles:
<DL>
<DT><DD>The tape image itself generally has no extension.
File names that end in "-pb" should be in BIN format,
"-pm" is for RIM format, "-pa" is for PAL source code,
and "-ft" is for FORTRAN source code.
<DT>.od<DD>There will always be a .od for every tape image,
which contains a human readable octal dump of the tape image.
<DT>.txt<DD>If the file looks like it most likely contains
text, there will be a .txt file, which contains the ASCII
text, with nulls stripped out, and the eighth bit forced off,
which is usually necessary for the text to display properly
with modern equipment.
</DL>
<P><P>Vince Slyngstad
<P><P><A href="../tapes/theworks.tar.gz">tarball</A>

<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
