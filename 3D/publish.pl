#!/usr/bin/perl

#
# Look for 3D files and create a web page about them.
$url = "https://svn.so-much-stuff.com/svn/trunk/3D";

$head = <<'EOM';
<?php
  $title = "3D CAD Files";
  include $_SERVER['DOCUMENT_ROOT'].'/pdp8/header.php';
?>
<BODY><FONT size=4>
EOM
print $head;
$status = 0;

print "Here are some 3D design files mostly relevant to the PDP-8.\n";
print "These should mostly be printable with common 3D printing services\n";
print "like Shapeways, etc.  Be advised that some of the STL files are in\n";
print "inches, not mm.\n";
print "<P>Use the link in the page footer to let me know if there are issues\n";
print "with these files.\n";
print "<P>In no particular order:<P>\n";
print "<TABLE>\n";
$thisrow = 0;
%work = (); # No sets found yet
# .scad => .stl or .3mf
foreach $scad (sort <*/*.scad>) {
  $noext = $scad; $noext =~ s/[.]scad$//;
  $work{$noext} = 1;
  next if -f "$noext.3mf";
  next if -f "$noext.stl";
  warn "no .stl or .3mf for $scad\n";
  undef $work{$noext};
}
# .skp => .stl
foreach $skp (sort <*/*.skp>) {
  $noext = $skp; $noext =~ s/[.]...$//;
  $work{$noext} = 1;
  next if -f "$noext.stl";
  warn "no .stl for $skp\n";
  undef $work{$noext};
}
# .stl => .3mf
foreach $stl (sort <*/*.stl>) {
  $noext = $stl; $noext =~ s/[.]...$//;
  $work{$noext} = 1;
# warn "./nonsolid $stl";
# $status += system("./nonsolid $stl") / 256;
  next if -f "$noext.3mf";
  next if -f "$noext.stl";
  warn "no .3mf for $stl\n";
  undef $work{$noext};
}
# Every .stl should be checked for solid
# Every .3mf needs a .jpg image
# Every .3mf needs a .txt description
foreach $stl (sort keys %work) {
  # Skip artefacts
  next if $stl =~ /^mangled\//;
  next if $stl =~ /-mm$/;
  # Look for the best 3D file to download
  if (-f "$stl.3mf") {
    $prt = "$stl.3mf";
  } else {
    $prt = "$stl.stl";
  }
  # TODO: Look for best source file to download
  # Look for a .jpg
  $jpg = "$stl.jpg";
  $jpg =~ s/.jpg$/.png/ unless -f $jpg;
  warn "$stl: no image .jpg\n" unless -f $jpg;
  next unless -f $jpg;
  $txt = "$stl.txt";
  warn "$stl: no descriptive .txt\n" unless -f $txt;
  next unless -f $txt;
  print "<TD>";
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
  print "<A href=$url/$stl>STL file (Imperial)</A><BR>\n";
  $mm = $stl; $mm =~ s/.stl$/-mm.stl/;
  print "<A href=$url/$mm>STL file (Metric)</A><BR>\n" if -f $mm;
  $skp = $stl; $skp =~ s/.stl$/.skp/;
  if (-f $skp) {
    print "<A href=$url/$skp>Sketchup file</A><BR>\n";
  }
  $mf = $stl; $mf =~ s/.stl$/.3mf/;
  if (-f $mf) {
    print "<A href=$url/$mf>Print profile</A><BR>\n";
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
<?php include $_SERVER['DOCUMENT_ROOT'].'/pdp8/footer.php'; ?>
EOM
print $tail;

exit $status;
