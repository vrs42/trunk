#!/usr/bin/perl

while (<STDIN>) {
  if (!/(\s*vertex\s+)([-eE\d.]+)\s([-eE\d.]+)\s([-eE\d.]+)/) {
    print $_;
    next;
  }
  print $1, $2/2, " ", $3, " ", $4/2, "\n";
}
