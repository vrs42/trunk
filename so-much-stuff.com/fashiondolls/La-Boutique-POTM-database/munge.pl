#!/usr/bin/perl

$myname = `pwd`;
$myname =~ s/\r$//;
chop $myname;
$myname =~ s/^.*\///;
open(INPUT, "captions") || die "captions: $!";
open(LIST, ">../$myname.txt") || die "../$myname.txt: $!";

while (($caption = <INPUT>)) {
  $caption =~ s/\r$//;
  chop $caption;
  $jpg = $caption; $jpg =~ s/[ ()]//g;
  warn "$jpg: not found\n" unless -f $jpg;
  $txt = $jpg;
  die unless $txt =~ s/.jpg$/.txt/;
  open(OUTPUT, ">$txt") || die "$txt: $!";
  $caption =~ s/^(20..)\S*\s/\1 /;
  $caption =~ s/(\S*)\s+(\S*)/\2 \1/; # Swap month and year
  $caption =~ s/.jpg$//; # Lose the file type
  print OUTPUT "$caption\n";
  print LIST "$myname/$txt\n";
}
