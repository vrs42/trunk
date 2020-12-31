#!/usr/bin/perl

$/ = undef;
foreach $f (<*/*.txt>) {
  open(INPUT, $f) || die "$f: $!";
  $j = $f; $j =~ s/.txt$/.jpg/;
  if (-f $j) {
    $desc = <INPUT>;
    $desc =~ s/\(<a [^)]*\)//;
    $desc =~ s/\s*\r*$//;
    $desc =~ s/["]/\\"/g;
    ($title, $desc) = split(/\n/, $desc);
    print "./exiftool -Title=\"$title\" $j\n";
    print "./exiftool -'XPComment'=\"$desc\" $j\n" if $desc;
  }
}
