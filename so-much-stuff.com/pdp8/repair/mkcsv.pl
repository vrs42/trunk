#!/usr/bin/perl

#
# Read a .xls file, extracting the requested page as a .csv file.
#

@xls = ();
$wpage = 1;
foreach (@ARGV) {
  if (/-(\d+)/) {
    $wpage = $1;
  } else {
    push(@xls, $_);
  }
}
open(INPUT, "xls2csv -q0 @xls |") || die "xls2csv-q0 @xls: $!";


$page = 1;
while (<INPUT>) {
  $page++ if s/\f//;
  print if $page == $wpage;
  last if $page > $wpage;
}
