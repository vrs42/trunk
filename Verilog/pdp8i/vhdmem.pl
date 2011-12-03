#!/usr/bin/perl

open(STDIN, "PDP8mem_B16.vhd") || die "PDP8mem_B16.vhd: $!";
@core = ();
while (<STDIN>) {
  next unless /INIT_(..)=>x"(.*)"/;
  $index = hex($1);
  @digits = split(//, $2);
  $i = $index * 64 + 63;
  foreach (@digits) {
     $core[$i] = 0 unless defined $core[$i];
     $core[$i] = $core[$i]*16 + hex($_);
     $foo = hex($_);
     $i--;
  }
}
for ($i = 0; $i < 4096; $i++) {
  printf "%04o\n", $core[$i];
}
