#!/usr/bin/perl

# Perl script to read the partlist, pinlist and netlist from Eagle and 
# output Verilog to instantiate the parts.

@pins = ("a","b","c","d","e","f","h","j","k","l","m","n","p","r","s","t","u","v");

# Read the partlist.
%partlist = ();
open(INPUT, "pdp8i.prt") || die "pdp8i.prt: $!";
while (<INPUT>) {
  last if /^Part\s/;
}
while (<INPUT>) {
  y/A-Z/a-z/;
  next unless /^(\S+)\s+(\S+)\s+(\S+)/;
  ($part, $value, $device) = ($1, $2, $3);
  $device =~ s/x$//;
  $device =~ s/-array$//;
  #warn "$value ne $device" unless $value eq $device;
  $value =~ s:.*/::;
  $partlist{$part} = $value;
}

# Munge an Eagle name into a valid Verilog name.
sub sigfix {
#print "$signal: ";
  $signal =~ s/^\+/s/;
  $signal =~ s/^\-/m/;
  $signal =~ s/^/n/ if $signal =~ /^[^a-z]/;
  $signal = "1'b1" if $signal eq 'vcc';
  $signal = "1'b0" if $signal eq 'gnd';
  $signal = "1'b1" if $signal =~ /^s3v.*/;
  $signal =~ s/^[\+]//;
  $signal =~ s/[\+]$/_plus/;
  $signal =~ s/[\+]/_or_/g;
  $signal =~ s/[\-@\/]/_/g;
  $signal =~ s/[\$\(\)]/__/g;
  $signal =~ s/\\$/_l/;
  $signal =~ s/\\/_bar/g;
  $signal = 'and_h' if $signal eq 'and';
  $signal = 'end_h' if $signal eq 'end';
#print "$signal\n";
}

# Read the pinlist, acquiring a list of the signals
# and their directions.
%ignore = ("m6v", 1, "m30v", 1, "m36v", 1);
print "module pdp8i(\n";
open(INPUT, "pdp8i.pin") || die "pdp8i.pin: $!";
while (<INPUT>) {
  last if /^Part/;
}
while (<INPUT>) {
  chop;
  s/\r$//;
  y/A-Z/a-z/;
  if (s/^(\S+)//) {
    $part = $1;
    $parts{$part} = 1;
    $dev = $partlist{$part};
    print "\t$list\n" if $list;
    $list = "";
  }
  ($foo, $pad, $pin, $dir, $signal, $foo) = split(/\s+/, $_);
  next unless defined $signal;
  next if $signal eq "***";
  next if $dir eq "pwr"; # ignore power pads
  *func = eval "*elide_$dev";
  next if defined &func; # Skip pads if no code for device
  &sigfix;
  $signal{"$part$pad"} = $signal;
  next if $signal eq "1'b1"; # Skip vcc on I/O connector
  next if $signal eq "m15v"; # Skip -15v on I/O connector
  next if $signal eq "1'b0"; # Skip gnd on I/O connector
  $nets{$signal} = 1;
  $direction{"$part$pad"} = $dir;
#print "$signal: $dir\n" if $signal =~ /^in00/; 
  next if $ignore{$signal}; # Skip it if blacklisted
  if ($dir eq "out") {
    $out{$signal} = 1;
  } elsif ($dir eq "oc") {
    warn "Mixed 'out' and 'wc' on $signal; converted 'out' to 'oc\n"
      if (!defined $wand{$signal}) && defined $out{$signal};
    $out{$signal} = 1;
    $wand{$signal} = 1;
  } elsif ($dir eq "pas") {
    # Just assume the passive is actually a pull-up.
    $wand{$signal} = 1;
  } elsif ($dir eq "in") {
    $in{$signal} = 1;
  } elsif ($dir eq "i/o") {
    next if $io{$signal}; # Skip it if seen before
    $io{$signal} = 1;
    if ($list) {
      $list .= " $signal,";
    } else {
      $list = "$signal,";
    }
  }
}
print "\tdclk\n);\n";
print "input dclk;\n";
print "// synthesis attribute CLOCK_SIGNAL of dclk is \"yes\";\n";

# Read the netlist, acquiring a list of the sheet 
# number on which the parts and pads appear.
open(INPUT, "pdp8i.net") || die "pdp8i.net: $!";
while (<INPUT>) {
  last if /^Net\s/;
}
while (<INPUT>) {
  chop;
  s/\r$//;
  y/A-Z/a-z/;
  next if /^change.*;$/;
  if (s/^(\S+)//) {
    $signal = $1;
    &sigfix;
  }
  ($foo, $part, $pad, $pin, $sheet) = split(/\s+/, $_);
  next unless defined $sheet;
  next if $sheet eq "*";
  $sheets{$sheet} = 1;
  $sheet{"$part$pad"} = $sheet;
  $sheet{$part} = $sheet unless defined $sheet{$part};
  $sheet{$part} = $sheet if $sheet < $sheet{$part};
  #$signal{"$part$pad"} = $signal; # redundant
}


# Pass 1
# Figure out where the "reg"s and pullups are.
for $part (sort keys %parts) {
  $dev = $partlist{$part};
  *func = eval "*pass1_$dev";
  &func if defined &func;
}

#
# Now we have all the I/O pins, and enough
# information about the signals to finish 
# declaring them.
foreach (sort keys %nets) {
  if (defined $io{$_}) {
    if (defined $wand{$_}) {
      if ($out{$_}) {
        print "output wand $_;\n" unless $in{$_};
        print "inout wand $_;\n" if $in{$_};
      } else {
        print "input wand $_;\n";
      }
      print "// synthesis attribute PULLUP of $_ is \"yes\";\n";
    } elsif (defined $out{$_}) {
      # Assume that since we set it, it's an output.
      print "output $_;\n" unless $reg{$_};
      print "output reg $_;\n" if $reg{$_};
    } else {
      # Didn't set it, must be an input.
      print "input $_;\n";
    }
  } elsif (defined $wand{$_}) {
    print "wand $_ = 1'b1;\n";
    print "// synthesis attribute PULLUP of $_ is \"yes\";\n";
  } elsif (defined $reg{$_}) {
    print "reg $_;\n";
  } else {
    print "// " unless defined $in{$_} || defined $out{$_};
    print "wire $_;\n";
  }
}
print "\n";

sub bynum { $a <=> $b }

# Now iterate over the sheets and invoke the code generator 
# functions to emit code for the gates and latches.
for $sheet (sort bynum keys %sheets) {
  print "\n// Sheet $sheet\n";
  for $part (sort keys %parts) {
    $dev = $partlist{$part};
    *func = eval "*$dev";
    #warn "No code generator for $part/$dev" unless defined &func;
    *func = *foobar unless defined &func;
    &func;
  }
}
print "\n";
print "endmodule\n";
close(STDOUT) || die;

# BUGBUG: Experimental
for $sheet (sort bynum keys %sheets) {
  open(STDOUT, ">sheet$sheet.v") || die "sheet$sheet.v: $!";
  #
  # Iterate over all pads, collecting information for those which 
  # appear on the current sheet.
  %sheet_sig = ();
  %sheet_out = %sheet_in = ();
  for $partpad (sort keys %signal) {
    next unless $sheet{$partpad} == $sheet;
    $dir = $direction{$partpad};
    $signal = $signal{$partpad};
    next unless $signal;
    next if $signal =~ /^1'b/;
    $sheet_sig{$signal} = 1;
    $sheet_out{$signal} = 1 if $dir eq "out";
    $sheet_out{$signal} = 1 if $dir eq "oc";
    $sheet_in{$signal}  = 1 if $dir eq "in";
#print "$signal: $dir\n" if $signal =~ /^in00/; 
  }
  #
  # Now output an interface specification for this sheet.
  print "module sheet$sheet(";
  foreach $signal (sort keys %sheet_sig) {
    print "$signal, ";
  }
  print "dclk);\n";
  print "input dclk;\n";
  print "// synthesis attribute CLOCK_SIGNAL of dclk is \"yes\";\n";
  # Iterate again and declare a direction for each signal.
  foreach $signal (sort keys %sheet_sig) {
#print "$reg{'pause'}: $signal: $reg{$signal}\n";
    if ($sheet_out{$signal}) {
      if ($reg{$signal}) {
        print "output reg";
      } elsif ($sheet_in{$signal}) {
        print "inout";
      } else {
        print "output";
      }
      print " wand" if @wand{$signal};
      print " $signal;\n";
    } else {
      print "input $signal;\n";
    }
  }
  #
  # Now output the code for the sheet.
  print "\n// Sheet $sheet\n";
  for $part (sort keys %parts) {
    $dev = $partlist{$part};
    *func = eval "*$dev";
    #warn "No code generator for $part/$dev" unless defined &func;
    *func = *foobar unless defined &func;
    &func;
  }
  print "\n";
  print "endmodule\n";
  close(STDOUT) || die;
}
exit 0;

#
# Given a bit of vhdl code, substitute signal names for 
# pad names, and emit the code.
sub emit {
  ($text) = @_;
  # Substitute the module name as needed.
  $text =~ s/\${m}/$part/g;
  # Substitute the signal names as needed.
  foreach (@pins) {
    $text =~ s/([^'])\b${_}1\b/\1$signal{$part.$_.1}/g;
    $text =~ s/([^'])\b${_}2\b/\1$signal{$part.$_.2}/g;
    $text =~ s/([^'])\ba${_}1\b/\1$signal{${part}."a$_".1}/g;
    $text =~ s/([^'])\ba${_}2\b/\1$signal{${part}."a$_".2}/g;
    $text =~ s/([^'])\bb${_}1\b/\1$signal{${part}."b$_".1}/g;
    $text =~ s/([^'])\bb${_}2\b/\1$signal{${part}."b$_".2}/g;
  }
  print "$text\n";
}

#
# lookup substitutes signal names for pad names, and also does 
# simple substitutions for common constant expressions.
sub lookup {
  local @_ = @_;
  # Substitute the signal names as needed.
#print "in lookup $dev: @_\n";
  foreach $p (@pins) {
    foreach (@_) {
      next if /'/;
      s/\b${p}1\b/\1$signal{$part.$p.1}/g;
      s/\b${p}2\b/\1$signal{$part.$p.2}/g;
      s/\ba${p}1\b/\1$signal{${part}."a$p".1}/g;
      s/\ba${p}2\b/\1$signal{${part}."a$p".2}/g;
      s/\bb${p}1\b/\1$signal{${part}."b$p".1}/g;
      s/\bb${p}2\b/\1$signal{${part}."b$p".2}/g;
    }
  }
#print "out lookup: @_\n";
  return @_;
}

#
# andr simplifies a set of AND terms.
sub andr {
  foreach (@_) {
    s/^s3v__.*/1'b1/;
  }
  return ("1'b0") if grep(/^1'b0$/, @_);
  return grep(!/^1'b1$/, @_);
}

#
# nand takes a nand expression, simplifies it, and returns an 
# equivalent string.
sub nand {
  return unless $sheet == $sheet{"${part}$_[0]"};
  @_ = &lookup(@_);
  $dest = shift(@_);
  return unless $dest;
  @_ = &andr(@_);
  $text = join(" & ", @_);
  $text = "1'b1" if $text eq "";
  if ($text eq "1'b0") {
    print "assign $dest = 1'b1;\n" unless $dest =~ /^1'b/;
  } else {
    print "assign $dest = ~($text);\n";
  }
}

# For use only in pass 1.  (The PULLUP attribute must be
# specified at declaration time.)
sub pullup {
  foreach $pad (@_) {
    $partpad = "$part$pad";
    next unless $signal{$partpad};
    next if $signal{$partpad} =~ /^1'b1/;
    # We mark each signal with a pull-up as being "wand".
    $wand{$signal{$partpad}} = 1;
  }
}

sub foobar {
  return unless $sheet == $sheet{$part};
  print "//\n";
  print "// $part: BUGBUG: No code generator for $dev!\n";
  print "//\n";
}

sub a607 {
  return unless $sheet == $sheet{$part};
  print "// $part: A607 D-A Converter\n";
  print "// implement externally (analog)\n";
}

sub elide_g021 {}
sub g021 {
  return unless $sheet == $sheet{$part};
  print "// $part: G021 Core Sense Amplifier\n";
  print "// not implemented (core memory)\n";
}

sub elide_g221 {}
sub g221 {
  return unless $sheet == $sheet{$part};
  print "// $part: G221 Memory Selector\n";
  print "// not implemented (core memory)\n";
}

sub elide_g228 {}
sub g228 {
  return unless $sheet == $sheet{$part};
  print "// $part: G228 Inhibit Driver\n";
  print "// not implemented (core memory)\n";
}

sub elide_g610 {}
sub g610 {
  return unless $sheet == $sheet{$part};
  print "// $part: G610 Diode Board\n";
  print "// not implemented (core memory)\n";
}

sub elide_g611 {}
sub g611 {
  return unless $sheet == $sheet{$part};
  print "// $part: G611A Diode Board\n";
  print "// not implemented (core memory)\n";
}

sub elide_g624 {}
sub g624 {
  return unless $sheet == $sheet{$part};
  print "// $part: G624 Resistor Board\n";
  print "// not implemented (core memory)\n";
}

sub g785a {
  return unless $sheet == $sheet{$part};
  print "// $part: G785A Regulator Board\n";
  print "// not implemented (power supply)\n";
}

sub g785b {
  return unless $sheet == $sheet{$part};
  print "// $part: G785B Regulator Board\n";
  print "// not implemented (power supply)\n";
}

sub g805 {
  return unless $sheet == $sheet{$part};
  print "// $part: G805 Negative Regulator\n";
  print "// not implemented (power supply)\n";
}

sub g821 {
  return unless $sheet == $sheet{$part};
  print "// $part: G821 Regulator Control\n";
  print "// not implemented (power supply)\n";
}

sub pass1_g826 {
  &pullup("af2", "ah2", "aj2", "as2");
  # Convert AJ2 from an output to an input pin.
  ($aj2) = &lookup("aj2");
  undef $out{$aj2};
  $io{$aj2} = 1;
  $in{$aj2} = 1;
  ($af2) = &lookup("af2");
  undef $out{$af2};
}
sub g826 {
  return unless $sheet == $sheet{$part};
  print "// $part: G826 Regulator Control\n";
  print "// not implemented (power supply)\n";
  # Just claim that power is OK.
  # BUGBUG: Should really assert as2 at power up.
  #&emit("assign af2 = 1'b1;"); # shut_down_
  #&emit("assign ah2 = 1'b1;"); # stop_ok_ (input with pullup)
  #&emit("assign aj2 = 1'b0;"); # power_ok_
  #&emit("assign as2 = 1'b1;"); # power_clear_
}
 
sub g921a {
  return unless $sheet == $sheet{$part};
  print "// $part: G921b 8/L Front Panel Connector\n";
  print "// implemented in the interface (above)\n";
}

sub g921b {
  return unless $sheet == $sheet{$part};
  print "// $part: G921b 8/L Front Panel Connector\n";
  print "// implemented in the interface (above)\n";
}

sub g921c {
  return unless $sheet == $sheet{$part};
  print "// $part: G921c 8/L Front Panel Connector\n";
  print "// implemented in the interface (above)\n";
}

sub g921d {
  return unless $sheet == $sheet{$part};
  print "// $part: G921d 8/L Front Panel Connector\n";
  print "// implemented in the interface (above)\n";
}

sub m040 {
  # Can't mimic the darlington drive, so just do the logic.
  &nand("r2", "d2", "e2", "f2", "h2");
  &nand("s2", "j2", "k2", "l2", "m2");
}

sub pass1_m113 {
  &pullup("u1", "v1");
}
sub m113 {
  # M113 2 Input NAND Gates
  &nand("c1", "a1", "b1");
  &nand("f1", "d1", "e1");
  &nand("k1", "h1", "j1");
  &nand("n1", "l1", "m1");
  &nand("s1", "p1", "r1");
  &nand("f2", "d2", "e2");
  &nand("k2", "h2", "j2");
  &nand("n2", "l2", "m2");
  &nand("s2", "p2", "r2");
  &nand("v2", "t2", "u2");
}

sub m115 {
  # M115 3 Input NAND Gates
  &nand("d1", "a1", "b1", "c1");
  &nand("j1", "e1", "f1", "h1");
  &nand("n1", "k1", "l1", "m1");
  &nand("u1", "p1", "r1", "s1");
  &nand("h2", "d2", "e2", "f2");
  &nand("m2", "j2", "k2", "l2");
  &nand("s2", "n2", "p2", "r2");
  &nand("v1", "t2", "u2", "v2");
}

sub pass1_m117 {
  &pullup("u1", "v1");
}
sub m117 {
  # M117 4 Input NAND Gates
  &nand("e1", "a1", "b1", "c1", "d1");
  &nand("l1", "f1", "h1", "j1", "k1");
  &nand("s1", "m1", "n1", "p1", "r1");
  &nand("j2", "d2", "e2", "f2", "h2");
  &nand("p2", "k2", "l2", "m2", "n2");
  &nand("v2", "r2", "s2", "t2", "u2");
}

sub pass1_m119 {
  &pullup("u1", "v1");
}
sub m119 {
  # M119 8 Input NAND Gates
  &nand("j2", "a1", "b1", "c1", "d1", "d2", "e2", "f2", "h2");
  &nand("p2", "f1", "h1", "j1", "k1", "k2", "l2", "m2", "n2");
  &nand("v2", "m1", "n1", "p1", "r1", "r2", "s2", "t2", "u2");
}

sub m160 {
  if ($sheet == $sheet{"${part}r1"}) {
    ($r1, $a1, $b1, $c1, $d1, $e1, $f1, $h1, $j1, $k1, $l1, $m1, $n1, $p1) =
      &lookup("r1", "a1", "b1", "c1", "d1", "e1", "f1", "h1", "j1", "k1", "l1", "m1", "n1", "p1");
    $tmp1 = join(" & ", &andr($a1, $b1, $c1, $d1));
    $tmp2 = join(" & ", &andr($e1, $f1));
    $tmp3 = join(" & ", &andr($h1, $j1));
    $tmp4 = join(" & ", &andr($k1, $l1));
    $tmp5 = join(" & ", &andr($m1, $n1, $p1));
    print "assign $r1 = ($tmp1) | ($tmp2) | ($tmp3) | ($tmp4) | ($tmp5);\n";
  }
  if ($sheet == $sheet{"${part}t2"}) {
    ($t2, $d2, $e2, $f2, $h2, $j2, $k2, $l2, $m2, $n2, $p2, $r2, $s2) =
      &lookup("t2", "d2", "e2", "f2", "h2", "j2", "k2", "l2", "m2", "n2", "p2", "r2", "s2");
    $tmp1 = join(" & ", &andr($d2, $e2, $f2, $h2));
    $tmp2 = join(" & ", &andr($j2, $k2));
    $tmp3 = join(" & ", &andr($l2, $m2));
    $tmp4 = join(" & ", &andr($n2, $p2, $r2, $s2));
    print "assign $t2 = ($tmp1) | ($tmp2) | ($tmp3) | ($tmp4);\n";
  }
  if ($sheet == $sheet{"${part}v2"}) {
    ($v2, $s1, $u1, $v1, $u2) = &lookup("v2", "s1", "u1", "v1", "u2");
    $tmp1 = join(" & ", &andr($s1, $u1));
    $tmp2 = join(" & ", &andr($v1, $u2));
    print "assign $v2 = ($tmp1) | ($tmp2);\n";
  }
}

sub m162 {
  if (($sheet == $sheet{"${part}k1"}) || ($sheet == $sheet{"${part}l1"})) {
    ($k1, $l1, @_) =
      &lookup("k1", "l1", "a1", "b1", "c1", "d1", "e1", "f1", "h1", "j1");
    if (!$k1) {
      $k1 = $l1;
      $k1 =~ s/_$//;
    }
    @_ = grep(!/^1'b0$/, @_);
    print "assign $k1 =  ", join(" ^ ", @_), ";\n";
    print "assign $l1 =  ~$k1;\n" if $l1;
  }
  if (($sheet == $sheet{"${part}u2"}) || ($sheet == $sheet{"${part}v2"})) {
    ($u2, $v2, @_) =
      &lookup("u2", "v2", "k2", "l2", "m2", "n2", "p2", "r2", "s2", "t2");
    if (!$u2) {
      $u2 = $v2;
      $u2 =~ s/_$//;
    }
    @_ = grep(!/^1'b0$/, @_);
    print "assign $u2 =  ", join(" ^ ", @_), ";\n";
    print "assign $v2 =  ~$u2;\n" if $v2;
  }
}

#
# Force foo into existence as the complement of bar.
sub kludge {
  local($foopad, $barpad) = @_;
  ($foo, $bar) = &lookup($foopad, $barpad);
  if (!$foo) { # Already defined
    return unless $bar;
    $foo = $bar; # Convert $bar to a value for $foo.
    $foo =~ s/_$//; # Convert $bar to a value for $foo.
    $foo = $bar."__" unless $bar =~ /_$/;
    $nets{$foo} = 1;
    $signal{$part.$foopad} = $foo;
    $direction{$part.$foopad} = "out";
    $sheet{$part.$foopad} = $sheet{$part.$barpad};
    $out{$foo} = 1;
#print "// kludge: created $bar on sheet ", $sheet{"$part$barpad"}, "\n";
#print "// kludge: \$sheet{$part.$foopad} = \$sheet{$part.$barpad};\n";
#print "// kludge: $sheet{$part.$foopad} = $sheet{$part.$barpad};\n";
  }
  $reg{$foo} = 1;
}

sub pass1_m216 {
  # By convention, we have chosen to make "Q" a reg, and "Q_" a wire.
  @foopad = ("e1", "h2", "l1", "p2", "s1", "v2");
  @barpad = ("f1", "j2", "m1", "r2", "u1", "v1");
  foreach $foopad (@foopad) {
    $barpad = shift @barpad;
    &kludge($foopad, $barpad);
  }
}
sub dflop {
  if ($sheet == $sheet{"${part}$_[0]"}) {
    ($q, $q_, $d, $c, $r_, $s_) = &lookup(@_);
    #print "// synthesis attribute CLOCK_SIGNAL of $c is \"yes\";\n";
    print "always @(posedge $c";
    print ", negedge $r_" if $r_ ne "1'b1";
    print ", negedge $s_" if $s_ ne "1'b1";
    print ") begin\n  ";
    if ($d eq "1'b1") {
      if ($s_ ne "1'b1") {
        print "if (~$s_)\n    $q <= 1'b1;\n  else\n  ";
      }
      if ($r_ ne "1'b1") {
        print "if (~$r_)\n    $q <= 1'b0;\n  else\n  ";
      }
    } else {
      if ($r_ ne "1'b1") {
        print "if (~$r_)\n    $q <= 1'b0;\n  else\n  ";
      }
      if ($s_ ne "1'b1") {
        print "if (~$s_)\n    $q <= 1'b1;\n  else\n  ";
      }
    }
    print "  $q <= $d;\nend\n";
    print "assign $q_ = ~$q;\n" if $q_;
  }
}
sub m216 {
  &dflop("e1", "f1", "c1", "b1", "a1", "d1");
  &dflop("h2", "j2", "e2", "d2", "a1", "f2");
  &dflop("l1", "m1", "j1", "h1", "a1", "k1");
  &dflop("p2", "r2", "m2", "l2", "k2", "n2");
  &dflop("s1", "u1", "p1", "n1", "k2", "r1");
  &dflop("v2", "v1", "t2", "s2", "k2", "u2");
}


sub pass1_m220 {
  # By convention, we have chosen to make "Q" a reg, and "Q_" a wire.
  # Here, we also kludge into existance Q, if only Q_ has a net.
  @foopad = ("ba1", "at2", "ap1", "am2", "av1", "as2", "an1", "al2");
  @barpad = ("bb1", "au2", "ar2", "am1", "av2", "as1", "ap2", "al1");
  foreach $foopad (@foopad) {
    $barpad = shift @barpad;
    &kludge($foopad, $barpad);
  }
  ($aj1, $ak2, $am2, $al2) = &lookup("aj1", "ak2", "am2", "al2");
  if (!$aj1) {
    $aj1 = $am2;
    $aj1 =~ s/^ma/regbus/;
    $ak2 = $al2;
    $ak2 =~ s/^ma/regbus/;
    $nets{$aj1} = 1;
    $nets{$ak2} = 1;
    $signal{"${part}aj1"} = $aj1;
    $signal{"${part}ak2"} = $ak2;
    $direction{"${part}aj1"} = "in";
    $direction{"${part}ak2"} = "in";
    $sheet{"${part}aj1"} = $sheet{"${part}am2"};
    $sheet{"${part}ak2"} = $sheet{"${part}al2"};
    $out{$aj1} = 1;
    $out{$ak2} = 1;
  }
}

#
# Now for the hair.
sub m220 {
  if ($sheet == $sheet{"${part}am2"}) {
     print "// Latch ALU results in the appropriate register.\n";
     ($ak1, $aj1, $am2, $ak2, $al2, $am1, $al1) = 
       &lookup("ak1", "aj1", "am2", "ak2", "al2", "am1", "al1");
     if ($aj1 eq "") {
       ($aj1, $ak2) = ($am2, $al2);
       grep(s/ma/regbus/, ($aj1, $ak2));
       print "wire $aj1, $ak2;\n";
     }
     print "always @(posedge $ak1) begin\n";
     print "  $am2 <= $aj1; // MA\n";
     print "  $al2 <= $ak2;\n";
     print "end\n";
     print "assign $am1 = ~$am2;\n";
     print "assign $al1 = ~$al2;\n";

     ($an2, $ap1, $an1, $ar2, $ap2) = 
       &lookup("an2", "ap1", "an1", "ar2", "ap2");
     if ($ap1 eq "") {
       ($ap1, $an1) = ($ar2, $ap2);
       grep(s/_$//, ($ap1, $an1));
       print "reg $ap1, $an1;\n";
     }
     print "always @(posedge $an2) begin\n";
     print "  $ap1 <= $aj1; // PC\n";
     print "  $an1 <= $ak2;\n";
     print "end\n";
     print "assign $ar2 = ~$ap1;\n";
     print "assign $ap2 = ~$an1;\n";

     ($ar1, $at2, $as2, $au2, $as1) = 
       &lookup("ar1", "at2", "as2", "au2", "as1");
     print "always @(posedge $ar1) begin\n";
     print "  $at2 <= $aj1; // MB\n";
     print "  $as2 <= $ak2;\n";
     print "end\n";
     print "assign $au2 = ~$at2;\n";
     print "assign $as1 = ~$as2;\n";

     ($au1, $ba1, $av1, $bb1, $av2) = 
       &lookup("au1", "ba1", "av1", "bb1", "av2");
     print "always @(posedge $au1) begin\n";
     print "  $ba1 <= $aj1; // AC\n";
     print "  $av1 <= $ak2;\n";
     print "end\n";
     print "assign $bb1 = ~$ba1;\n";
     print "assign $av2 = ~$av1;\n";
  }
  if ($sheet == $sheet{"${part}af1"}) {
     # Select the adder inputs.
     ($bh1, $bf1, $bh2, $ba1, $bj2, $bb1, $bm2, $bl1, $be1, $bc1, $bd1, $bf2, $bl2, $bk1) =
       &lookup("bh1", "bf1", "bh2", "ba1", "bj2", "bb1", "bm2", "bl1", "be1", "bc1", "bd1", "bf2", "bl2", "bk1");
     $t1 = join(" & ", &andr($bf1, $bh1));
     $t2 = join(" & ", &andr($bh2, $ba1));
     $t3 = join(" & ", &andr($bj2, $bb1));
     $t4 = join(" & ", &andr($bl1, $bm2));
     $t5 = join(" & ", &andr($bc1, $be1));
     $t6 = join(" & ", &andr($bf2, $bd1));
     $t7 = join(" & ", &andr($bl2, $bk1));
     $l0 = "~($t1 | $t2 | $t3 | $t4 | $t5 | $t6 | $t7)";
     ($bn2, $av1, $be2, $av2, $bp2, $bd2, $bn1, $bm1) =
       &lookup("bn2", "av1", "be2", "av2", "bp2", "bd2", "bn1", "bm1");
     $t1 = join(" & ", &andr($bf1, $bn2));
     $t2 = join(" & ", &andr($bh2, $av1));
     $t3 = join(" & ", &andr($bj2, $av2));
     $t4 = join(" & ", &andr($bl1, $bp2));
     $t5 = join(" & ", &andr($bc1, $bd2));
     $t6 = join(" & ", &andr($bf2, $bn1));
     $t7 = join(" & ", &andr($bl2, $bm1));
     $l1 = "~($t1 | $be2 | $t2 | $t3 | $t4 | $t5 | $t6 | $t7)";
     ($br1, $bu2, $am2, $bp1, $ap1, $bs2, $bt2, $bs1) =
       &lookup("br1", "bu2", "am2", "bp1", "ap1", "bs2", "bt2", "bs1");
     if ($ap1 eq "") {
       $ap1 = $am2;
       $ap1 =~ s/^ma/pc/;
     }
     $t1 = join(" & ", &andr($bu2, $br1));
     $t2 = join(" & ", &andr($bp1, $am2));
     $t3 = join(" & ", &andr($bs2, $ap1));
     $t4 = join(" & ", &andr($bt2, $bs1));
     $r0 = "~($t1 | $t2 | $t3 | $t4)";
     ($bv1, $bv2, $al2, $br2, $an1, $bu1) =
       &lookup("bv1", "bv2", "al2", "br2", "an1", "bu1");
     if ($an1 eq "") {
       $an1 = $al2;
       $an1 =~ s/^ma/pc/;
     }
     $t1 = join(" & ", &andr($bv1, $bv2));
     $t2 = join(" & ", &andr($br2, $al2));
     $t3 = join(" & ", &andr($bs2, $an1));
     $t4 = join(" & ", &andr($bt2, $bu1));
     $r1 = "~($t1 | $t2 | $t3 | $t4)";
     ($bk2, $ae2, $af1, $bj1) = &lookup("bk2", "ae2", "af1", "bj1");
     print "// This hair takes two operand bits and carry-in, adds them, and\n";
     print "// generates two bits of result and a carry-out.  Note that the\n";
     print "// inputs are complemented, and therefore, so are the outputs.\n";
     print "assign {$bk2, $ae2, $af1} = $bj1 + { $l0, $l1 } + { $r0, $r1 };\n";
     # Now select the correct outputs for regbus.
     ($aa1, $ad1, $ae1, $ad2, $af2, $ah1, $ab2) =
       &lookup("aa1", "ad1", "ae1", "ad2", "af2", "ah1", "ab2");
     ($aj1, $au2, $ab1, $ae2, $ac1, $af1, $ah2, $bb2) = &lookup("aj1", "au2", "ab1", "ae2", "ac1", "af1", "ah2", "bb2");
     if ($aj1 eq "") {
       $aj1 = $ae2;
       $aj1 =~ s/adder/regbus/;
     }
     $t1 = join(" & ", &andr($aa1, $au2));
     $t2 = join(" & ", &andr($ad1, $ab1));
     $t3 = join(" & ", &andr($ae1, $ae2));
     $t4 = join(" & ", &andr($ad2, $ac1));
     $t5 = join(" & ", &andr($af2, $af1));
     $t6 = join(" & ", &andr($ah1, $ah2));
     $t7 = join(" & ", &andr("~$ab2", $bb2));
     print "assign $aj1 = ~($t1 | $t2 | $t3 | $t4 | $t5 | $t6 | $t7);\n";
     ($ak2, $as1, $aj2) = &lookup("ak2", "as1", "aj2");
     if ($ak2 eq "") {
       $ak2 = $af1;
       $ak2 =~ s/adder/regbus/;
     }
     $t1 = join(" & ", &andr($aa1, $as1));
     $t2 = join(" & ", &andr($ad1, $ac1));
     $t3 = join(" & ", &andr($ae1, $af1));
     $t4 = join(" & ", &andr($ad2, $ae2));
     $t5 = join(" & ", &andr($af2, $ah2));
     $t6 = join(" & ", &andr($ah1, $aj2));
     $t7 = join(" & ", &andr("~$ab2", $af1));
     print "assign $ak2 = ~($t1 | $t2 | $t3 | $t4 | $t5 | $t6 | $t7);\n";
  }
}

sub m310 {
  if ($sheet == $sheet{"${part}h2"}) {
    ($h2, @_) = &lookup("h2", "j2", "k2", "l2", "m2", "n2", "p2", "r2", "s2", "t2", "u2", "v2");
    for ($d = 0; $d <= 500; $d += 50) {
      $signal = shift @_;
      next unless $signal;
      print "DelayLine #($d) dl_$signal(dclk, $h2, $signal);\n";
      die "$signal must not be 'wand'" if $wand{$signal};
    }
  }
  if ($sheet == $sheet{"${part}f1"}) {
    ($e1, $f1) = &lookup("e1", "f1");
    print "assign $f1 = $e1;\n" if $f1;
  }
  if ($sheet == $sheet{"${part}j1"}) {
    ($h1, $j1) = &lookup("h1", "j1");
    print "assign $j1 = $h1;\n" if $j1;
  }
}

sub m360 {
  next unless $sheet == $sheet{"${part}s2"};
  ($p2, $r2, $s2, $t2) = &lookup("p2", "r2", "s2", "t2");
  print "Monostable #(100) m360s_$s2(dclk, $p2 & $r2, $s2);\n";
  print "assign $t2 = ~$s2;\n";
}

sub m452 {
  next unless $sheet == $sheet{"${part}k2"};
  ($p2, $r2, $j2, $m2, $n2, $l2, $k2) =
    &lookup("p2", "r2", "j2", "m2", "n2", "l2", "k2");
  # BUGBUG:  This is specific to the particular invocation excpected.
  print "Oscillator #(880) m452_$j2(dclk, 1'b1, $j2);\n";
  die "$j2 must not be 'wand'" if $wand{$j2};
  print "Oscillator #(220) m452_$k2(dclk, 1'b1, $k2);\n";
  die "$k2 must not be 'wand'" if $wand{$k2};
  print "assign $r2 = $p2;\n";
}

sub m501 {
  next unless $sheet == $sheet{"${part}f2"};
  ($j2, $f2) = &lookup("j2", "f2");
  # BUGBUG:  This is specific to the particular invocation excpected.
  print "Oscillator #(60) m501_$f2(dclk, $j2, $f2);\n";
  die "$f2 must not be 'wand'" if $wand{$f2};
}

sub pass1_m506 {
  &pullup("a1", "b1", "f1", "h1", "m1", "n1");
  &pullup("d2", "e2", "k2", "l2", "r2", "s2");
}
sub m506 {
  # Obviously we can't do the negative input conversion for
  # a1, d2, f1, k2, m1, and r2, so we just assume those will 
  # positive level inputs, driven by OC devices.  This makes 
  # us essentially equivalent to the M516.
  &m516;
}

sub pass1_m516 {
  &pullup("b1", "h1", "n1", "e2", "l2", "s2");
  #&pullup("a1", "b1", "f1", "h1", "m1", "n1");
  #&pullup("d2", "e2", "k2", "l2", "r2", "s2");
}
sub m516 {
  # The M516 is essentially a set of NAND gates, with pull-ups 
  # on some of the inputs.
  &nand("e1", "a1", "b1", "c1", "d1");
  &nand("l1", "f1", "h1", "j1", "k1");
  &nand("s1", "m1", "n1", "p1", "r1");
  &nand("j2", "d2", "e2", "f2", "h2");
  &nand("p2", "k2", "l2", "m2", "n2");
  &nand("v2", "r2", "s2", "t2", "u2");
}

sub m617 {
  &m117;
}

sub pass1_m650 {
    &pullup("d2", "k2", "s2");
}
sub m650 {
  # We can't do the negative logic conversion for the M650, 
  # so our M650 ends up equivalent to an M661.  (This also 
  # means we ignore the disable inputs.)
  &m661;
}

sub m660 {
  # The M660 is a set of 3 2-input NAND buffers with huge fan-out.
  &nand("d2", "h2", "j2");
  &nand("k2", "n2", "p2");
  &nand("s2", "u2", "v2");
}

sub pass1_m661 {
    &pullup("d2", "k2", "s2");
}
sub m661 {
  # These are essentially 3-input OC AND gates with a pull-up.
  if ($sheet == $sheet{"${part}d2"}) {
    ($d2, $f2, $h2, $j2) = &lookup("d2", "f2", "h2", "j2");
    print "assign $d2 = ", join(" & ", andr($f2, $h2, $j2)), ";\n";
  }
  if ($sheet == $sheet{"${part}k2"}) {
    ($k2, $m2, $n2, $p2) = &lookup("k2", "m2", "n2", "p2");
    print "assign $k2 = ", join(" & ", andr($m2, $n2, $p2)), ";\n";
  }
  if ($sheet == $sheet{"${part}s2"}) {
    ($s2, $t2, $u2, $v2) = &lookup("s2", "t2", "u2", "v2");
    print "assign $s2 = ", join(" & ", andr($t2, $u2, $v2)), ";\n";
  }
}

sub pass1_m700 {
  ($aj2, $af2) = &lookup("aj2", "af2");
  $reg{$aj2} = 1;
  $reg{$af2} = 1;
  &pullup("be2", "bf2");
}
sub m700 {
  if ($sheet == $sheet{"${part}at2"}) {
    ($at2, $ar2, $as2, $ap2, $an2, $am2) = &lookup("at2", "ar2", "as2", "ap2", "an2", "am2");
    print "// TODO: $as2 should be suitably filtered.\n";
    print "assign $at2 = ($ar2 & $as2) | ~$ap2;\n";
    print "assign $an2 = $at2;\n" if $an2;
    print "assign $am2 = ~$at2;\n";
    ($al2, $ah2, $aj2, $ak2) = &lookup("al2", "ah2", "aj2", "ak2");
    print "always @(posedge $am2, negedge $al2, negedge $ah2) begin\n";
    print "  if (~$ah2)\n";
    print "    $aj2 = 1'b0;\n";
    print "  else if (~$al2)\n";
    print "    $aj2 = 1'b0;\n";
    print "  else\n";
    print "    $aj2 = 1'b1;\n";
    print "end\n";
    print "assign $ak2 = ~$aj2;\n";
    ($ae2, $bd2, $af2) = &lookup("ae2", "bd2", "af2");
    print "DelayLine #(2000) m700ae2(dclk, $at2, $ae2);\n";
    die "$ae2 must not be 'wand'" if $wand{$ae2};
    print "DelayLine #(2000) m700bd2(dclk, $ae2, $bd2);\n";
    die "$bd2 must not be 'wand'" if $wand{$bd2};
    print "always @(posedge $ae2, posedge $bd2, negedge $al2) begin\n";
    print "  if (~$al2)\n";
    print "    $af2 = 1'b0;\n";
    print "  else if ($bd2)\n";
    print "    $af2 = 1'b0;\n";
    print "  else\n";
    print "    $af2 = 1'b1;\n";
    print "end\n";
    print "assign $ah2 = ~$af2;\n";
  }
  if ($sheet == $sheet{"${part}be2"}) {
    ($be2) = &lookup("be2");
  }
  if ($sheet == $sheet{"${part}bf2"}) {
    ($bf2) = &lookup("bf2");
  }
}

# Several of the M7xx modules implement a feature with
# sufficient modularity that nothing is gained by expanding 
# the logic inline.  For those, just invoke the specified 
# module name.
sub m7xx {
  return unless $sheet == $sheet{$part};
  $module = shift @_;
  @ifc = @_;
  foreach $partpad (sort keys %signal) {
    next unless $signal{$partpad};
    next unless $partpad =~ /^$part/;
    next if $partpad eq "${part}a2"; # Skip vcc
    next if $partpad eq "${part}aa2"; # Skip vcc
    next if $partpad eq "${part}ba2"; # Skip vcc
    next if $partpad eq "${part}c2"; # Skip vcc
    next if $partpad eq "${part}ac2"; # Skip vcc
    next if $partpad eq "${part}bc2"; # Skip vcc
#print "partpad: $partpad\n";
    $pad = $partpad; $pad =~ s/^$part//;
    push(@ifc, ".$pad("."$signal{$partpad})");
  }
  # Invoke the module
  print "$module $part$dev(", join(", ", @ifc), ");\n";
}

sub m701 {
  &m7xx("DisplayControl");
}

sub pass1_m703 {
  ($r2) = &lookup("r2");
  $reg{$r2} = 1;
}
sub m703 {
  #&m7xx("PowerFail");
  return unless $sheet == $sheet{$part};
  ($d2, $e2, $f2, $h2, $j2, $k2, $l2, $m2)
    = &lookup("d2", "e2", "f2", "h2", "j2", "k2", "l2", "m2");
  ($n2, $p2, $r2, $s2, $t1, $t2, $u1, $u2)
    = &lookup("n2", "p2", "r2", "s2", "t1", "t2", "u1", "u2");
  if (!$t2) {
    $t2 = $r2;
    $t2 =~ s/_$//;
  }
  print "always @(negedge $s2, negedge $u2) begin\n";
  print "  if (~$s2)\n";
  print "    $r2 <= 1;\n";
  print "  else\n";
  print "    $r2 <= 0;\n";
  print "end\n";
  print "assign $t2 = ~$r2;\n" if $t2;
  print "assign $l2 = ~($d2 & $e2 & $f2 & $h2 & $j2 & $k2 & $m2 & $t2);\n";
  print "Monostable #(1000000) ${part}a(dclk, $u2, $p2);\n";
  print "// TODO: kp8i_enable should be a switch, which would require\n";
  print "//       an input pin.\n";
  print "`ifdef kp8i_enable\n";
  print "Monostable #(200000000) ${part}b(dclk, $p2 & $u2, ${part}c1);\n";
  print "`else\n";
  print "assign ${part}c1 = 1'b0;\n";
  print "`endif\n";
  print "Monostable #(1000000) ${part}c(dclk, ${part}c1, $n2);\n";
  print "assign $u1 = ~$n2;\n";
}

sub m704 {
  &m7xx("PlotterControl", ".dclk(dclk)");
}

sub m705 {
  &m7xx("ReaderControl");
}

sub m706 {
  &m7xx("TTYReceiver");
}

sub m707 {
  &m7xx("TTYTransmitter");
}

sub m708 {
  &m7xx("ClockControl");
}

sub m709 {
  &m7xx("ClockCounter", ".dclk(dclk)");
}

sub m710 {
  &m7xx("PunchControl", ".dclk(dclk)");
}

sub m714 {
  &m7xx("CardReaderControl");
}

sub m715 {
  &m7xx("ReaderClock", ".dclk(dclk)");
}

sub m716 {
  &m7xx("CardReaderBuffer", ".dclk(dclk)");
}

sub m720 {
  if ($sheet == $sheet{"${part}d2"}) {
    ($d2, $e2, $j2, $v2) = &lookup("d2", "e2", "j2", "v2");
    print "Monostable #(35000) ${part}e2(dclk, $j2 & $v2, ${e2}__);\n";
    # GROT: Messy work-around for inability to connect "reg" output of
    # Monostable directly to a "wand" output pin.
    print "assign $e2 = ${e2}__;\n";
    print "Monostable #(40000) ${part}d2(dclk, $j2 & $v2, $d2);\n";
  }
  &nand("u2", "s2", "t2");
}

sub m900 {
  # The M900 is essentially a connector, which we dealt with at
  # interface time.  The buffering behavior can't really be
  # implemented here
}

sub w011 {
  # The W011 is essentially a connector, which we dealt with at
  # interface time.
}

sub w023 {
  # The W023 is essentially a connector, which we dealt with at
  # interface time.
}

sub w025 {
  # The W025 is essentially a connector to the core plane, which
  # isn't implemented here.
}

sub w076 {
  # The W076 is essentially a connector, which we dealt with at
  # interface time.
}

sub w077 {
  # The W077 is essentially a connector, which we dealt with at
  # interface time.
}

sub w991 {
  # The W991 is essentially a connector, which we dealt with at
  # interface time.
}
