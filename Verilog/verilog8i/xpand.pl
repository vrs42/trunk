#!/usr/bin/perl

# Perl script to read the partlist and pinlist from Eagle and 
# output VHDL to instantiate the parts.

open(STDOUT, ">pdp8i.vhdl") || die "pdp8i.vhdl: $!";


%partlist = ();

# Extract the architectures.
open(INPUT, "Mxxx.vhd") || die "Mxxx.vhd: $!";
$inarch = 0;
while (<INPUT>) {
  y/A-Z/a-z/;
  $part = $1 if /architecture\s+.*\sof\s+(\w+)/;
  if (/begin/) {
    $inarch = 1;
    next;
  }
  next unless $inarch;
  if (/end structural/) {
    $inarch = 0;
    next;
  }
  if (/end behavioral/) {
    $inarch = 0;
    next;
  }
  if (defined($arch{$part})) {
    $arch{$part} .= $_;
  } else {
    $arch{$part} = $_;
#print STDERR "Got arch for $part\n";
  }
}


# Now, read the instantiations.
open(INPUT, "pdp8i.inst") || die "pdp8i.inst: $!";
$incomponent = 0;
$inarch = 0;
$def = "";
while (<INPUT>) {
  y/A-Z/a-z/;

  # Strip comments
  s/--.*//;
  next unless /\S/;

  # Strip component declarations.
  if (/component\s/) {
    $incomponent = 1;
    next;
  }
  if (/end\s+component/) {
    $incomponent = 0;
    next;
  }
  if (/^\s*end\s+\S+/) {
    print $def;
    $inarch = 0;
  }
  next if $incomponent;

  # Copy until the begin line.
  print $_ unless $inarch;
  if (/begin/) {
    $inarch = 1;
    next;
  }
  next unless $inarch;

  # Begin substituting architectures.
  s/\);/,/ if /^\s+(\w+)\s+=>\s+(\S+)\)/;
  if (/^\s+(\w+)\s+=>\s+(\S+),/) {
    ($pad, $signal) = ($1, $2);
    $def =~ s/\b$pad\b/$signal/g;
    next;
  }
  print $def;
  if (/(\w+):\s+(\w+)\s+port/) {
    warn "$2" unless defined $arch{$2};
$arch{$2} = "bogus\n" unless defined $arch{$2};
    $device = $1;
    $def = $arch{$2};
    foreach $i ('a', 'b', 'c', 'd', 'e', 'f', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'u', 'v') {
      $def =~ s/(\bt[$i][12]\b)/$device\1/g;
      $def =~ s/(\bt[ab][$i][12]\b)/$device\1/g;
    }
    print "-- $1: $2\n";
  } else {
    print;
  }
}

exit;
