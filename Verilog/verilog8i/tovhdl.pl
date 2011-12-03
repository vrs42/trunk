#!/usr/bin/perl

# Perl script to read the partlist and pinlist from Eagle and 
# output VHDL to instantiate the parts.

open(STDOUT, ">pdp8i.inst") || die "pdp8i.inst: $!";


%partlist = ();

open(INPUT, "partlist.txt") || die "partlist.txt: $!";
while (<INPUT>) {
  last if /^Part\s/;
}
while (<INPUT>) {
  y/A-Z/a-z/;
  next unless /^(\w+)\s+(\w+)\s+(\w+)/;
  ($part, $value, $device) = ($1, $2, $3);
  $device =~ s/x$//;
  $device =~ s/-array$//;
  warn "$value ne $device" unless $value eq $device;
  $partlist{$part} = $device;
}

print "begin\n";
open(INPUT, "pinlist.txt") || die "pinlist.txt: $!";
while (<INPUT>) {
  last if /^Part/;
}
$comma = 1;
undef $part;
while (<INPUT>) {
  chop;
  s/\r$//;
  y/A-Z/a-z/;
  if (/^$/) {
    print ");\n" if $part;
    $comma = 1;
    undef $part;
    next;
  }
  if (/^(\w+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/) {
    # Some parts are in the board, but not the schematic.
    # (Ignore them).
    next unless defined $partlist{$1};
    ($part, $pad, $signal) = ($1, $2, $5);
    print "\t$part: $partlist{$part} port map(\n";
  } else {
    die "$_" unless /^\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
    ($pad, $signal) = ($1, $4);
    next unless $part;
#   print ",\n" unless $comma++;
  }
  # Ignore undefined parts.
  next if $signal =~ /^[\*]/;
  next if $signal =~ /^nc$/;
  next if ($pad eq "a2") and ($signal eq "vcc");
  next if ($pad eq "aa2") and ($signal eq "vcc");
  next if ($pad eq "b2") and ($signal eq "-15v");
  next if ($pad eq "ab2") and ($signal eq "-15v");
  next if ($pad eq "c2") and ($signal eq "gnd");
  next if ($pad eq "ac2") and ($signal eq "gnd");
  next if ($pad eq "t1") and ($signal eq "gnd");
  next if ($pad eq "at1") and ($signal eq "gnd");
  $signal = "'1'" if $signal eq "vcc";
  $signal = "'0'" if $signal eq "gnd";
  $signal =~ s/^[\+]//;
  $signal =~ s/[\+]/_or_/;
  $signal =~ s/[\-@\/]/_/g;
  $signal =~ s/[\$]/__/;
  $signal =~ s/\\$/_l/;
  $signal = 'end_h' if $signal eq 'end';
  $signal =~ s/^/n/ if $signal =~ /^\d/;
  print ",\n" unless $comma++;
  print "\t\t$pad => $signal";
  $signals{$signal} = 1;
  $comma = 0;
}
print "end;\n";

print "\n";
foreach (sort keys %signals) {
  next if $_ eq "'1'";
  next if $_ eq "'0'";
  print "\tsignal $_ : bit;\n";
}
exit 0;
