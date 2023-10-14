#!/usr/bin/perl

#
# Read in CUPL, and output a simpler version.
# In particular, remove signals which just copy 
# or invert their input.
#
$file = shift @ARGV;

#
# Read in CPLD pin assignments, if any.
#
%pads = ();
if (open(INPUT, "pld-pins.txt")) {
  while (<INPUT>) {
    y/[A-Z]/[a-z]/;
    s/[-]/_/g;
    s/[+]/_or_/g;
    s/n[\$](\d+)/n_t_$1x/g;
    s/!(\w+)/$1_low/;
    # Each line is expected to bind a pin.
    next unless /^\S*\s+(\d+)\s+(\S+)\s+(\S+)\s+(\S+)/;
    ($pad, $pin, $dir, $net) = ($1, $2, $3, $4);
#warn "Got net $net on pad $pad\n";
    $pads{$net} = $pad;
  }
}

#
# Scan the file, remembering simple assignments.
#
open(INPUT, $file) || die "$file: $!";
while (<INPUT>) {
  if (/^\s*pin\s+\d*\s*=\s*!*([\w]+)\s*;/) {
    # Can't easily elide latch outputs or pins.
    $pin{$1} = 1;
    next;
  };
  if (/^\s*(\w+)[.]/) {
    # Can't easily elide latch outputs or pins.
    $pin{$1} = 1;
    next;
  };
  next unless /^\s*([\w!]+)\s*=\s*([\w!']+)\s*;/;
  ($lh, $rh) = ($1, $2);
  if ($rh =~ /^!*(n_t_|gdollar)/) {
    # Prefer named signal to unnamed.
    ($lh, $rh) = ($rh, $lh) unless $lh =~ /^!*(n_t_|gdollar)/;
  }
  if ($lh =~ s/!//) {
    $rh = "!$rh";
    $rh =~ s/!!//;
  }
  next if $pin{$lh};
  $map{$lh} = $rh;
}
#foreach $lh (sort keys %map) {
#  print "$lh: $map{$lh}\n";
#}
#exit;

#
# Scan the file again, simplifying the code.
#
open(INPUT, $file) || die "$file: $!";
while (<INPUT>) {
  # Elide declarations for mapped signals.
  if (/^\s*node\s+([\w!]+)\s*[,;]/) {
    while (s/^\s*node\s+([\w!]+)\s*[,;]/node /) {
      print "node $1;\r\n" unless defined $map{$1};
    }
    next;
  }
  # Perform each mapping.
  foreach $lh (keys %map) {
    s/\b$lh\b/$map{$lh}/g;
  }
  s/!!//g; # Remove double negations.
  # Detect and remove resulant tautologies.
  if (/^\s*([\w!']+)\s*=\s*([\w!']+)\s*;/) {
    next if $1 eq $2;
  }
  # Insert a pad mapping, if any.
  if (/^\s*pin\s+\d*\s*=\s*!*([\w]+)\s*;/) {
    $net = $1;
#warn "$net: $pads{$net}: $_\n" if defined $pads{$net};
    $_ =~ s/\s+\d*\s*=/ $pads{$net} =/ if defined $pads{$net};
  };
  # Finally, output the rewritten statement.
  print $_;
}
@removed = keys %map;
$removed = $#removed + 1;
warn "$removed signals were removed:\n";
foreach $lh (sort keys %map) {
  warn "  $lh: $map{$lh}\n";
}
exit 0;
