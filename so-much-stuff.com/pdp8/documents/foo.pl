#!/usr/bin/perl

require "ctime.pl";

@top = ("C:/Backups/vrs/pdp8/Documents");

#
# Get the list of my PDF files.
@todo = ();
while ($dir = (shift @top)) {
  opendir(DIR, $dir) || die "$dir: $!";
  while ($f = readdir(DIR)) {
    next if $f =~ /^\./;
    next if $f eq "old";
    $f = "$dir/$f";
    if (-d $f) {
      next if $f =~ / /;
      push(@top, $f);
      next;
    }
    next unless $f =~ /pdf$/;
    push(@todo, $f);
  }
}

#
# Get the list of files at bitsavers.org.
%bitsavers = ();
open(INPUT, "bitsavers.txt") || die "bitsavers.txt: $!";
while (<INPUT>) {
  s/\r*\n$//;
  next unless /pdf$/;
  next unless /dec\//i;
  s/\S+\s\S+\s//;
  warn $_ if / /;
  $basename = $fullname = $_;
  $basename =~ s:.*/::;
  if (defined $bitsavers{$basename}) {
    $bitsavers{$basename} .= " $fullname";
  } else {
    $bitsavers{$basename} = $fullname;
  }
}

$time = time;
$matches = $total = 0;
foreach $f (@todo) {
  $date = -M $f;
  $size = -s $f;
  $basename = $f;
  $basename =~ s:.*/::;
  $total++;
  $f =~ s?C:/Backups/vrs/pdp8/Documents/??;
  $url = "www.so-much-stuff/pdp8/documents/$f";
  $url = "www.bitsavers.org/pdf/$bitsavers{$basename}"
    if defined $bitsavers{$basename};
  $matches++
    if defined $bitsavers{$basename};
  print "$f\n";
  $date = &ctime($time+$date);
  $date =~ s/\S+\s//;
  $date =~ s/..:..:.. //;
  print $date;
  if ($size > 1024*1024) {
    $size = sprintf("%5.1f Mbytes", $size/1024/1024);
  } elsif ($size > 1024) {
    $size = sprintf("%5.1f Kbytes", $size/1024);
  }
  print "$size\n";
  print "$url\n";
  $desc = $basename;
  $desc =~ s/\.pdf$//;
  $desc =~ s/_/ /g;
  $desc =~ s/6rs20sp/Selenium Surge Supressors/;
  $desc =~ s/([0-9])([a-z])/\1 \2/g;
  $desc =~ s/([A-Z][a-z])/ \1/g;
  $desc =~ s/  +/ /g;
  $desc =~ s/^ //g;
  $desc =~ s/\bCTL\b/Control/i;
  $desc =~ s/\bUG\b/User's Group/i;
  $desc =~ s/\bUM\b/User's Manual/i;
  $desc =~ s/\bMaint\b/Maintenance/i;
  $desc =~ s/\btech\b/Technical/i;
  $desc =~ s/\bMan\b/Manual/i;
  $desc =~ s/Users/User's/i;
  $desc =~ s/\bDrws\b/Drawings/i;
  print "$desc\n";
  print ".\n";
}
print STDERR "$matches/$total matched\n";
