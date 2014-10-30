#!/usr/bin/perl

#
# Look for 3D files and create a web page about them.
$url = "http://svn.so-much-stuff.com/svn/trunk/3D";

$head = <<'EOM';
<?php
  $title = "3D CAD Files";
  include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/header.php';
?>
<BODY><FONT size=4>
EOM
print $head;

print "Here are some 3D design files mostly relevant to the PDP-8.\n";
print "These should mostly be printable with common 3D printing services\n";
print "like Shapeways, etc.  Be advised that the STL files are in inches,\n";
print "not mm.\n";
print "<P>Use the link in the page footer to let me know if there are issues\n";
print "with these files.\n";
print "<P>In no particular order:<P>\n";
print "<TABLE>\n";
$thisrow = 0;
foreach $stl (sort <*/*.stl>) {
  $jpg = $stl; $jpg =~ s/.stl$/.jpg/;
  next unless -f $jpg;
  print "<TD>";
  $txt = $stl; $txt =~ s/.stl$/.txt/;
  if (-f $txt) {
    open(INPUT, $txt) || die "$txt: $!";
    $dsc = <INPUT> || ($dsc = "");
    print "$dsc<BR>\n";
    $dsc = "";
    while (<INPUT>) {
      $dsc .= $_;
    }
    close(INPUT);
  } else {
    $dsc = "";
  }
  print "<A href=$url/$jpg><IMG src=$url/$jpg width=320></A><BR>\n";
  print "<A href=$url/$stl>STL file</A><BR>\n";
  $skp = $stl; $skp =~ s/.stl$/.skp/;
  if (-f $skp) {
    print "<A href=$url/$skp>Sketchup file</A><BR>\n";
  }
  print $dsc;
  print "</TD>\n";
  $thisrow++;
  if ($thisrow > 1) {
    print "<TR><TD><BR><BR></TD></TR>\n";
    print "<TR></TR>\n";
    $thisrow = 0;
  }
}
print "</TABLE>\n";


$tail = <<'EOM';
<?php include $_SERVER{'DOCUMENT_ROOT'}.'/pdp8/footer.php'; ?>
EOM
print $tail;

exit 0;
