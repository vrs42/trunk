#!/usr/bin/perl

# Perl script to read the partlist and pinlist from Eagle and 
# output CUPL to instantiate the parts.

#
# Known bugs:
#  Signal names are sometimes generated to provide access to
#  values on pins that weren't explicitly used in the Eagle
#  model.  Things will currently fail if there are more than 
#  32 of these.
#
$edebug = 0;
sub term {
  local($indent) = @_;
  local($term);
  # The term is an identifier or a parenthesised expression.
  if ($rh =~ s/^\s*[(]//) {
    $term = &expression("$indent ");
warn "term: expression returned: ($term)\n" if $edebug;
    # If there are no operators, skip the parentheses.
    if ($term =~ /[!&\$#]/) {
      $term = "($term)";
    }
    $rh =~ s/^[)]//;
  } else {
    $rh =~ s/^\s*([^!&#\$)\s;]+)\s*//;
    $term = $1;
  }
  return $term;
}

sub nterm {
  local($indent) = @_;
  # The nterm is a term or a negated nterm.
  if ($rh =~ s/^\s*[!]\s*//) {
    local($nterm) = "!" . &nterm("$indent ");
    $nterm =~ s/^!!//;
    $nterm =~ s/^!'b'0\b/'b'1/;
    $nterm =~ s/^!'b'1\b/'b'0/;
    return $nterm;
  } else {
    return &term($indent);
 }
}

sub pterm {
  local($indent) = @_;
  local($lo) = &nterm($indent);
  local($ro);
  # A pterm is an nterm possibly followed by "&" and more nterms.
  while ($rh =~ s/^\s*[&]\s*//) {
    # Since we don't newline, must adjust indentation.
    $tindent = $lo; $tindent =~ s/./ /g;
    $ro = &nterm("$indent   $tindent");
warn "pterm: lo: $lo, ro: $ro\n" if $edebug;
    if ($lo eq "'b'0") {
      # $ro does not affect the result.
    } elsif ($lo eq "'b'1") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($ro eq "'b'0") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($ro eq "'b'1") {
      # $ro does not affect the result.
    } elsif ($ro eq $lo) {
      # $ro does not affect the result.
    } else {
      # Both $lo and $ro affect the result.
      $lo .= " & $ro";
    }
  }
  return $lo;
}

sub orterm {
  local($indent) = @_;
  local($lo) = &pterm($indent);
  local($ro);
  # A orterm is an pterm possibly followed by "#" and more pterms.
  while ($rh =~ s/^\s*[#]\s*//) {
    $ro = &pterm("$indent  ");
warn "orterm: lo: $lo, ro: $ro\n" if $edebug;
    if ($lo eq "'b'0") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($lo eq "'b'1") {
      # $ro does not affect the result.
    } elsif ($ro eq "'b'0") {
      # $ro does not affect the result.
    } elsif ($ro eq "'b'1") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($ro eq $lo) {
      # $ro does not affect the result.
    } else {
      # Both $lo and $ro affect the result.
      $lo .= "\n$indent # $ro";
    }
  }
  return $lo;
}

sub expression {
  local($indent) = @_;
  local($lo) = &orterm($indent);
  local($ro);
  # An expression is an orterm possibly followed by "$" and more orterms.
  while ($rh =~ s/^\s*\$\s*//) {
    $ro = &orterm("$indent  ");
warn "expression: lo: $lo, ro: $ro\n" if $edebug;
    if ($lo eq "'b'0") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($lo eq "'b'1") {
      # !$ro is the result.
      $lo = "!$ro";
    } elsif ($ro eq "'b'0") {
      # $ro does not affect the result.
    } elsif ($ro eq "'b'1") {
      # !$lo is the result.
      $lo = "!$lo";
    } else {
      # Both $lo and $ro affect the result.
      $lo .= "\n$indent \$ $ro";
    }
  }
  return $lo;
}

$qcode = "";
sub qcode {
  local($code) = @_;
  local($lh, $rh);
  # Simple peep-hole optimizations.
  if (($lh, $rh) = $code =~ /^(.*=)\s*(.*)\r*$/) {
    $indent = $lh; $indent =~ s/./ /g; $indent =~ s/  $//;
    $rh = &expression($indent);
    $code = "$lh $rh;\n";
  }
  $code =~ s/\r$//g;
  $code =~ s/\n/\r\n/g;
  $qcode .= $code;
}

#Tests for expression optimizer.
#&qcode("uf.d = 'b'0&'b'0 # tp_ba1&renamed0&!'b'0 # uf&!renamed0&!'b'0;\n");
#&qcode("uf.d = tp_ba1&renamed0 # uf&!renamed0;\n");
#exit 1;

sub pinnode {
  local($signal) = @_;
  return if defined $con{$signal};
  print "node $signal;\r\n";
  $pinnode{$signal} = 1;
}

#
# These functions emit equations equivalent to their function.
# The %pad is initialized with the signals associated with each
# pad of the device instantiation.
#
require "lbr.pl" if -f "lbr.pl";

sub sn7400 {
  &qcode("$pad{3} = !($pad{1} & $pad{2});\n") if defined $pad{3};
  &qcode("$pad{6} = !($pad{4} & $pad{5});\n") if defined $pad{6};
  &qcode("$pad{8} = !($pad{9} & $pad{10});\n") if defined $pad{8};
  &qcode("$pad{11} = !($pad{12} & $pad{13});\n") if defined $pad{11};
}
$hidden{'sn7400'} = 0;

sub sn74h00 {
  &sn7400;
}
$hidden{'sn74h00'} = 0;

sub sn7401 {
  &ocassign($pad{1}, "$pad{2} & $pad{3}") if defined $pad{1};
  &ocassign($pad{4}, "$pad{5} & $pad{6}") if defined $pad{4};
  &ocassign($pad{10}, "$pad{8} & $pad{9}") if defined $pad{10};
  &ocassign($pad{13}, "$pad{11} & $pad{12}") if defined $pad{13};
}
$hidden{'sn7401'} = 0;

sub sn97401 {
  &sn7401;
}
$hidden{'sn97401'} = 0;

sub sn97401n {
  &sn7401;
}
$hidden{'sn97401n'} = 0;

sub sn7402 {
  &qcode("$pad{1} = !($pad{2} # $pad{3});\n") if defined $pad{1};
  &qcode("$pad{4} = !($pad{5} # $pad{6});\n") if defined $pad{4};
  &qcode("$pad{10} = !($pad{8} # $pad{9});\n") if defined $pad{10};
  &qcode("$pad{13} = !($pad{11} # $pad{12});\n") if defined $pad{13};
}
$hidden{'sn7402'} = 0;

sub sn74hct02 {
  &sn7402;
}
$hidden{'sn74hct02'} = 0;

sub sn7404 {
  &qcode("$pad{2} = !$pad{1};\n") if defined $pad{2};
  &qcode("$pad{4} = !$pad{3};\n") if defined $pad{4};
  &qcode("$pad{6} = !$pad{5};\n") if defined $pad{6};
  &qcode("$pad{8} = !$pad{9};\n") if defined $pad{8};
  &qcode("$pad{10} = !$pad{11};\n") if defined $pad{10};
  &qcode("$pad{12} = !$pad{13};\n") if defined $pad{12};
}
$hidden{'sn7404'} = 0;

sub sn74h04 {
  &sn7404;
}
$hidden{'sn74h04'} = 0;

sub sn7406 {
  &ocassign($pad{2}, $pad{1}) if defined $pad{2};
  &ocassign($pad{4}, $pad{3}) if defined $pad{4};
  &ocassign($pad{6}, $pad{5}) if defined $pad{6};
  &ocassign($pad{8}, $pad{9}) if defined $pad{8};
  &ocassign($pad{10}, $pad{11}) if defined $pad{10};
  &ocassign($pad{12}, $pad{13}) if defined $pad{12};
}
$hidden{'sn7406'} = 0;

sub sn7407 {
  &ocassign($pad{2}, !$pad{1}) if defined $pad{2};
  &ocassign($pad{4}, !$pad{3}) if defined $pad{4};
  &ocassign($pad{6}, !$pad{5}) if defined $pad{6};
  &ocassign($pad{8}, !$pad{9}) if defined $pad{8};
  &ocassign($pad{10}, !$pad{11}) if defined $pad{10};
  &ocassign($pad{12}, !$pad{13}) if defined $pad{12};
}
$hidden{'sn7407'} = 0;

sub sn7408 {
  &qcode("$pad{3} = ($pad{1} & $pad{2});\n") if defined $pad{3};
  &qcode("$pad{6} = ($pad{4} & $pad{5});\n") if defined $pad{6};
  &qcode("$pad{8} = ($pad{9} & $pad{10});\n") if defined $pad{8};
  &qcode("$pad{11} = ($pad{12} & $pad{13});\n") if defined $pad{11};
}
$hidden{'sn7408'} = 0;

sub sn7410 {
  &qcode("$pad{12} = !($pad{1} & $pad{2} & $pad{13});\n") if defined $pad{12};
  &qcode("$pad{ 6} = !($pad{3} & $pad{4} & $pad{5});\n") if defined $pad{6};
  &qcode("$pad{ 8} = !($pad{9} & $pad{10} & $pad{11});\n") if defined $pad{8};
}
$hidden{'sn7410'} = 0;

sub sn74h10 {
  &sn7410;
}
$hidden{'sn74h10'} = 0;

sub sn7411 {
  &qcode("$pad{12} = $pad{1} & $pad{2} & $pad{13};\n") if defined $pad{12};
  &qcode("$pad{ 6} = $pad{3} & $pad{4} & $pad{5};\n") if defined $pad{6};
  &qcode("$pad{ 8} = $pad{9} & $pad{10} & $pad{11};\n") if defined $pad{8};
}
$hidden{'sn7411'} = 0;

sub sn74h11 {
  &sn7411;
}
$hidden{'sn74h11'} = 0;

sub sn7412 {
  &ocassign($pad{12}, "$pad{1} & $pad{2} & $pad{13}") if defined $pad{12};
  &ocassign($pad{ 6}, "$pad{3} & $pad{4} & $pad{5}") if defined $pad{6};
  &ocassign($pad{ 8}, "$pad{9} & $pad{10} & $pad{11}") if defined $pad{8};
}
$hidden{'sn7412'} = 0;

sub sn7416 {
  &sn7406;
}
$hidden{'sn7416'} = 0;

sub sn7417 {
  &sn7407;
}
$hidden{'sn7417'} = 0;

sub sn7420 {
  &qcode("$pad{6} = !($pad{1} & $pad{2} & $pad{4} & $pad{5});\n")
    if defined $pad{6};
  &qcode("$pad{8} = !($pad{9} & $pad{10} & $pad{12} & $pad{13});\n")
    if defined $pad{8};
}
$hidden{'sn7420'} = 0;

sub sn7420n {
  &sn7420;
}
$hidden{'sn7420n'} = 0;

sub sn74h20 {
  &sn7420;
}
$hidden{'sn74h20'} = 0;

sub sn7421 {
  &qcode("$pad{6} = $pad{1} & $pad{2} & $pad{4} & $pad{5};\n")
    if defined $pad{6};
  &qcode("$pad{8} = $pad{9} & $pad{10} & $pad{12} & $pad{13};\n")
    if defined $pad{8};
}
$hidden{'sn7421'} = 0;

sub sn74h21 {
  &sn7421;
}
$hidden{'sn74h21'} = 0;

sub sn7427 {
  &qcode("$pad{12} = !($pad{1} # $pad{2} # $pad{13});\n") if defined $pad{12};
  &qcode("$pad{ 6} = !($pad{3} # $pad{4} # $pad{5});\n") if defined $pad{6};
  &qcode("$pad{ 8} = !($pad{9} # $pad{10} # $pad{11});\n") if defined $pad{8};
}
$hidden{'sn7427'} = 0;

sub sn7430 {
  &qcode("$pad{8} = !($pad{1} & $pad{2} & $pad{3} & $pad{4} & $pad{5} & $pad{6} & $pad{11} & $pad{12});\n");
}
$hidden{'sn7430'} = 0;

sub sn74h30 {
  &sn7430;
}
$hidden{'sn74h30'} = 0;


sub sn7432n {
  &qcode("$pad{3} = $pad{1} # $pad{2};\n") if defined $pad{3};
  &qcode("$pad{6} = $pad{4} # $pad{5};\n") if defined $pad{6};
  &qcode("$pad{8} = $pad{9} # $pad{10};\n") if defined $pad{8};
  &qcode("$pad{11} = $pad{12} # $pad{13};\n") if defined $pad{11};
}
$hidden{'sn7432n'} = 0;

sub sn74hct32 {
  &sn7432n;
}
$hidden{'sn74hct32'} = 0;

sub sn7437 {
  &sn7400;
}
$hidden{'sn7437'} = 0;

sub sn7438 {
  &ocassign($pad{3}, "$pad{1} & $pad{2}") if defined $pad{3};
  &ocassign($pad{6}, "$pad{4} & $pad{5}") if defined $pad{6};
  &ocassign($pad{8}, "$pad{9} & $pad{10}") if defined $pad{8};
  &ocassign($pad{11}, "$pad{12} & $pad{13}") if defined $pad{11};
}
$hidden{'sn7438'} = 0;

sub sn7440 {
  &sn7420;
}
$hidden{'sn7440'} = 0;

sub sn7442 {
  &qcode("!$pad{1} = !$pad{12} & !$pad{13} & !$pad{14} & !$pad{15};\n") if defined $pad{1};
  &qcode("!$pad{2} = !$pad{12} & !$pad{13} & !$pad{14} & $pad{15};\n") if defined $pad{2};
  &qcode("!$pad{3} = !$pad{12} & !$pad{13} & $pad{14} & !$pad{15};\n") if defined $pad{3};
  &qcode("!$pad{4} = !$pad{12} & !$pad{13} & $pad{14} & $pad{15};\n") if defined $pad{4};
  &qcode("!$pad{5} = !$pad{12} & $pad{13} & !$pad{14} & !$pad{15};\n") if defined $pad{5};
  &qcode("!$pad{6} = !$pad{12} & $pad{13} & !$pad{14} & $pad{15};\n") if defined $pad{6};
  &qcode("!$pad{7} = !$pad{12} & $pad{13} & $pad{14} & !$pad{15};\n") if defined $pad{7};
  &qcode("!$pad{9} = !$pad{12} & $pad{13} & $pad{14} & $pad{15};\n") if defined $pad{9};
  &qcode("!$pad{10} = $pad{12} & !$pad{13} & !$pad{14} & !$pad{15};\n") if defined $pad{10};
  &qcode("!$pad{11} = $pad{12} & !$pad{13} & !$pad{14} & $pad{15};\n") if defined $pad{11};
}
$hidden{'sn7442'} = 0;

sub sn7450 {
  # BUGBUG: Doesn't handle expander for pins 11 and 12.
die "Unimplemented expander feature used in sn7450" if defined $pad{11};
die "Unimplemented expander feature used in sn7450" if defined $pad{12};
  &qcode("!$pad{8} = $pad{1}&$pad{13} # $pad{9}&$pad{10};\n") if defined $pad{8};
  &qcode("!$pad{6} = $pad{2}&$pad{3} # $pad{4}&$pad{5};\n") if defined $pad{6};
}
$hidden{'sn7450'} = 0;

sub sn74h52n {
  # X and is frequently NC, but we'll need a name.
  $pad{9} = &gnext unless defined $pad{9};
  $oc{$pad{9}} = 1;
  &qcode("$pad{8} = $pad{1}&$pad{2} # $pad{3}&$pad{4}&$pad{5} # $pad{10}&$pad{11} # $pad{12}&$pad{13}");
}
$hidden{'sn74h52n'} = 0;

sub sn7453 {
  # X and X\ are frequently NC, but we'll need a name.
  $pad{11} = &gnext unless defined $pad{11};
  $pad{12} = &gnext unless defined $pad{12};
  $oc{$pad{11}} = 1;
  $oc{$pad{12}} = 1;
  &ocassign($pad{11}, "$pad{1}&$pad{13} # $pad{2}&$pad{3} # $pad{4}&$pad{5} # $pad{9}&$pad{10}");
  &ocassign($pad{12}, $pad{11});
  &qcode("$pad{8} = $pad{11};\n");
}
$hidden{'sn7453'} = 0;

sub sn74h53 {
  # X and X\ are frequently NC, but we'll need a name.
  $pad{11} = &gnext unless defined $pad{11};
  $pad{12} = &gnext unless defined $pad{12};
  $oc{$pad{11}} = 1;
  $oc{$pad{12}} = 1;
  &ocassign($pad{11}, "$pad{1}&$pad{13} # $pad{2}&$pad{3} # $pad{4}&$pad{5}&$pad{6} # $pad{9}&$pad{10}");
  &ocassign($pad{12}, $pad{11});
  &qcode("$pad{8} = $pad{11};\n");
}
$hidden{'sn74h53'} = 0;

sub sn7460 {
  # X and X\ are frequently NC, but we'll need a name.
  $pad{11} = &gnext unless defined $pad{11};
  $pad{12} = &gnext unless defined $pad{12};
  $oc{$pad{11}} = 1;
  $oc{$pad{12}} = 1;
  &ocassign($pad{11}, "$pad{1}&$pad{2}&$pad{3}&$pad{13}");
  &ocassign($pad{12}, $pad{11});
  $pad{10} = &gnext unless defined $pad{10};
  $pad{9} = &gnext unless defined $pad{9};
  $oc{$pad{10}} = 1;
  $oc{$pad{9}} = 1;
  &ocassign($pad{10}, "$pad{4}&$pad{5}&$pad{6}&$pad{8}");
  &ocassign($pad{9}, $pad{10});
}
$hidden{'sn7460'} = 0;

sub sn7473 {
  if (defined $pad{13} && !defined $pad{12}) {
    &pinnode($pad{13});
    &qcode("$pad{13}.ap = !$pad{2};\n") if defined $pad{2};
    &qcode("$pad{13}.ck = $pad{1};\n");
    &qcode("$pad{13}.j = $pad{3};\n");
    &qcode("$pad{13}.k = $pad{14};\n");
  } elsif (defined $pad{12}) {
    &pinnode($pad{12});
    &qcode("$pad{12}.ar = !$pad{2};\n") if defined $pad{2};
    &qcode("$pad{12}.j = $pad{14};\n");
    &qcode("$pad{12}.k = $pad{3};\n");
    &qcode("$pad{12}.ck = $pad{1};\n");
    &qcode("$pad{13} = !$pad{12};\n") if defined $pad{13};
  }
  if (defined $pad{8} && !defined $pad{9}) {
    &pinnode($pad{8});
    &qcode("$pad{8}.ap = !$pad{6};\n") if defined $pad{6};
    &qcode("$pad{8}.ck = $pad{5};\n");
    &qcode("$pad{8}.j = $pad{10};\n");
    &qcode("$pad{8}.k = $pad{7};\n");
  } elsif (defined $pad{9}) {
    &pinnode($pad{9});
    &qcode("$pad{9}.ar = !$pad{6};\n") if defined $pad{6};
    &qcode("$pad{9}.j = $pad{7};\n");
    &qcode("$pad{9}.k = $pad{10};\n");
    &qcode("$pad{9}.ck = $pad{5};\n");
    &qcode("$pad{8} = !$pad{9};\n") if defined $pad{8};
  }
}
$hidden{'sn7473'} = 0;

sub sn7474 {
  if (defined $pad{6} && !defined $pad{5}) {
    &pinnode($pad{6});
    &qcode("$pad{6}.ap = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{6}.d = !$pad{2};\n") if defined $pad{2};
    &qcode("$pad{6}.ck = $pad{3};\n");
    &qcode("$pad{6}.ar = !$pad{4};\n") if defined $pad{4};
  } elsif (defined $pad{5}) {
    &pinnode($pad{5});
    &qcode("$pad{5}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{5}.d = $pad{2};\n") if defined $pad{2};
    &qcode("$pad{5}.ck = $pad{3};\n");
    &qcode("$pad{5}.ap = !$pad{4};\n") if defined $pad{4};
    &qcode("$pad{6} = !$pad{5};\n") if defined $pad{6};
  }
  if (defined $pad{8} && !defined $pad{9}) {
    &pinnode($pad{8});
    &qcode("$pad{8}.ap = !$pad{13};\n") if defined $pad{13};
    &qcode("$pad{8}.d = !$pad{12};\n") if defined $pad{12};
    &qcode("$pad{8}.ck = $pad{11};\n");
    &qcode("$pad{8}.ar = !$pad{10};\n") if defined $pad{10};
  } elsif (defined $pad{9}) {
    &pinnode($pad{9});
    &qcode("$pad{9}.ar = !$pad{13};\n") if defined $pad{13};
    &qcode("$pad{9}.d = $pad{12};\n") if defined $pad{12};
    &qcode("$pad{9}.ck = $pad{11};\n");
    &qcode("$pad{9}.ap = !$pad{10};\n") if defined $pad{10};
    &qcode("$pad{8} = !$pad{9};\n") if defined $pad{8};
  }
}
$hidden{'sn7474'} = 0;

sub sn74h74 {
  &sn7474;
}
$hidden{'sn74h74'} = 0;

sub sn7475 {
  # We need Qa..Qd even if their pads are NC.
  $pad{16} = &gnext unless defined $pad{16};
  $pad{15} = &gnext unless defined $pad{15};
  $pad{10} = &gnext unless defined $pad{10};
  $pad{9} = &gnext unless defined $pad{9};
  # These are registers.
  &pinnode($pad{16});
  &pinnode($pad{15});
  &pinnode($pad{10});
  &pinnode($pad{9});
  # Now the hair
  &qcode("$pad{16}.ap = $pad{13} &  $pad{2};\n") if defined $pad{2};
  &qcode("$pad{16}.ar = $pad{13} & !$pad{2};\n") if defined $pad{2};
  &qcode("$pad{16}.ck = 'b'0;\n");
  &qcode("$pad{16}.d = 'b'0;\n");
  &qcode("$pad{15}.ap = $pad{13} &  $pad{3};\n") if defined $pad{3};
  &qcode("$pad{15}.ar = $pad{13} & !$pad{3};\n") if defined $pad{3};
  &qcode("$pad{15}.ck = 'b'0;\n");
  &qcode("$pad{15}.d = 'b'0;\n");
  &qcode("$pad{10}.ap = $pad{4} &  $pad{6};\n") if defined $pad{6};
  &qcode("$pad{10}.ar = $pad{4} & !$pad{6};\n") if defined $pad{6};
  &qcode("$pad{10}.ck = 'b'0;\n");
  &qcode("$pad{10}.d = 'b'0;\n");
  &qcode("$pad{9}.ap = $pad{4} &  $pad{7};\n") if defined $pad{7};
  &qcode("$pad{9}.ar = $pad{4} & !$pad{7};\n") if defined $pad{7};
  &qcode("$pad{9}.ck = 'b'0;\n");
  &qcode("$pad{9}.d = 'b'0;\n");
  &qcode("$pad{1} = !$pad{16};\n") if defined $pad{1};
  &qcode("$pad{14} = !$pad{15};\n") if defined $pad{14};
  &qcode("$pad{11} = !$pad{10};\n") if defined $pad{11};
  &qcode("$pad{8} = !$pad{9};\n") if defined $pad{8};
}
$hidden{'sn7475'} = 0;

sub sn7476 {
  if (defined $pad{14} && !defined $pad{15}) {
    &pinnode($pad{14});
    &qcode("$pad{14}.ap = !$pad{3};\n") if defined $pad{3};
    &qcode("$pad{14}.k = $pad{4};\n");
    &qcode("$pad{14}.j = $pad{16};\n");
    &qcode("$pad{14}.ck = $pad{1};\n");
    &qcode("$pad{14}.ar = !$pad{2};\n") if defined $pad{2};
  } elsif (defined $pad{15}) {
    &pinnode($pad{15});
    &qcode("$pad{15}.ar = !$pad{3};\n") if defined $pad{3};
    &qcode("$pad{15}.j = $pad{4};\n");
    &qcode("$pad{15}.k = $pad{16};\n");
    &qcode("$pad{15}.ck = $pad{1};\n");
    &qcode("$pad{15}.ap = !$pad{2};\n") if defined $pad{2};
    &qcode("$pad{14} = !$pad{15};\n") if defined $pad{14};
  }
  if (defined $pad{10} && !defined $pad{11}) {
    &pinnode($pad{10});
    &qcode("$pad{10}.ap = !$pad{8};\n") if defined $pad{8};
    &qcode("$pad{10}.k = $pad{9};\n");
    &qcode("$pad{10}.j = $pad{12};\n");
    &qcode("$pad{10}.ck = $pad{6};\n");
    &qcode("$pad{10}.ar = !$pad{7};\n") if defined $pad{7};
  } elsif (defined $pad{11}) {
    &pinnode($pad{11});
    &qcode("$pad{11}.ar = !$pad{8};\n") if defined $pad{8};
    &qcode("$pad{11}.j = $pad{9};\n");
    &qcode("$pad{11}.k = $pad{12};\n");
    &qcode("$pad{11}.ck = $pad{6};\n");
    &qcode("$pad{11}.ap = !$pad{7};\n") if defined $pad{7};
    &qcode("$pad{10} = !$pad{11};\n") if defined $pad{10};
  }
}
$hidden{'sn7476'} = 0;

sub sn7482 {
  $temp = &gnext;
  &qcode("$pad{1} = $pad{5} \$ $pad{2} \$ $pad{3};\n");
  &qcode("$temp = $pad{5}&$pad{2} # $pad{2}&$pad{3} # $pad{5}&$pad{3};\n");
  &qcode("$pad{12} = $pad{13} \$ $pad{14} \$ $temp;\n");
  &qcode("$pad{10} = $temp&$pad{13} # $pad{13}&$pad{14} # $pad{14}&$temp;\n");
}
$hidden{'sn7482'} = 0;

sub sn7485 {
  ($n3e, $n2e, $n1e, $n0e) = (&gnext, &gnext, &gnext, &gnext);
  print "node $n3e, $n2e, $n1e, $n0e;\r\n";
  &qcode("$n3e = $pad{1}&!$pad{15} # !$pad{1}&$pad{15};\n");
  &qcode("$n2e = $pad{14}&!$pad{13} # !$pad{14}&$pad{13};\n");
  &qcode("$n1e = $pad{11}&!$pad{12} # !$pad{11}&$pad{12};\n");
  &qcode("$n0e = $pad{9}&!$pad{10} # !$pad{9}&$pad{10};\n");
  &qcode("$pad{6} = $pad{3} & !$n3e & !$n2e & !$n1e & !$n0e;\n")
    if defined $pad{6};
  &qcode("$pad{5} = !$pad{3} & !$pad{2} & !$n3e & !$n2e & !$n1e & !$n0e  # !$pad{9} & !$n3e & !$n2e & !$n1e & $n0e  # !$pad{11} & !$n3e & !$n2e & $n1e  # !$pad{14} & !$n3e & $n2e  # !$pad{1} & $n3e;\n") if defined $pad{5};
  &qcode("$pad{7} = !$pad{3} & !$pad{4} & !$n3e & !$n2e & !$n1e & !$n0e  # $pad{9} & !$n3e & !$n2e & !$n1e & $n0e  # $pad{11} & !$n3e & !$n2e & $n1e  # $pad{14} & !$n3e & $n2e  # $pad{1} & $n3e;\n") if defined $pad{7};
}
$hidden{'sn7485'} = 0;

sub sn7486 {
  &qcode("$pad{3} = $pad{1} \$ $pad{2};\n") if defined $pad{3};
  &qcode("$pad{6} = $pad{4} \$ $pad{5};\n") if defined $pad{6};
  &qcode("$pad{8} = $pad{9} \$ $pad{10};\n") if defined $pad{8};
  &qcode("$pad{11} = $pad{12} \$ $pad{13};\n") if defined $pad{11};
}
$hidden{'sn7486'} = 0;

# Note: Negative going clock transition!
sub sn7493 {
  # We need Qa..Qd even if their pads are NC.
  $pad{12} = &gnext unless defined $pad{12};
  $pad{9} = &gnext unless defined $pad{9};
  $pad{8} = &gnext unless defined $pad{8};
  $pad{11} = &gnext unless defined $pad{11};
  # These are registers.
  &pinnode($pad{12});
  &pinnode($pad{9});
  &pinnode($pad{8});
  &pinnode($pad{11});
  # Now the hair
  &qcode("$pad{12}.ck = !$pad{14};\n");
  &qcode("$pad{12}.t = 'b'1;\n");
  &qcode("$pad{12}.ar = $pad{2} & $pad{3};\n");
  &qcode("$pad{9}.ck = !$pad{1};\n");
  &qcode("$pad{9}.t = 'b'1;\n");
  &qcode("$pad{9}.ar = $pad{2} & $pad{3};\n");
  &qcode("$pad{8}.ck = !$pad{9};\n");
  &qcode("$pad{8}.t = 'b'1;\n");
  &qcode("$pad{8}.ar = $pad{2} & $pad{3};\n");
  &qcode("$pad{11}.ck = !$pad{8};\n");
  &qcode("$pad{11}.t = 'b'1;\n");
  &qcode("$pad{11}.ar = $pad{2} & $pad{3};\n");
}
$hidden{'sn7493'} = 0;

sub sn7495 {
  # We need Qa..Qd even if their pads are NC.
  $pad{13} = &gnext unless defined $pad{13};
  $pad{12} = &gnext unless defined $pad{12};
  $pad{11} = &gnext unless defined $pad{11};
  $pad{10} = &gnext unless defined $pad{10};
  # These are registers.
  &pinnode($pad{13});
  &pinnode($pad{12});
  &pinnode($pad{11});
  &pinnode($pad{10});
  # Now the hair
  &qcode("$pad{13}.ck = !($pad{9}&!$pad{6} # $pad{8}&$pad{6});\n");
  &qcode("$pad{13}.d  = $pad{2}&$pad{6} # $pad{1}&!$pad{6};\n");
  &qcode("$pad{12}.ck = !($pad{9}&!$pad{6} # $pad{8}&$pad{6});\n");
  &qcode("$pad{12}.d  = $pad{3}&$pad{6} # $pad{13}&!$pad{6};\n");
  &qcode("$pad{11}.ck = !($pad{9}&!$pad{6} # $pad{8}&$pad{6});\n");
  &qcode("$pad{11}.d  = $pad{4}&$pad{6} # $pad{12}&!$pad{6};\n");
  &qcode("$pad{10}.ck = !($pad{9}&!$pad{6} # $pad{8}&$pad{6});\n");
  &qcode("$pad{10}.d  = $pad{5}&$pad{6} # $pad{11}&!$pad{6};\n");
}
$hidden{'sn7495'} = 0;

sub sn7496 {
  # We need Qa..Qe even if their pads are NC.
  $pad{15} = &gnext unless defined $pad{15};
  $pad{14} = &gnext unless defined $pad{14};
  $pad{13} = &gnext unless defined $pad{13};
  $pad{11} = &gnext unless defined $pad{11};
  $pad{10} = &gnext unless defined $pad{10};
  # These are registers.
  &pinnode($pad{15});
  &pinnode($pad{14});
  &pinnode($pad{13});
  &pinnode($pad{11});
  &pinnode($pad{10});
  # Now the hair
  &qcode("$pad{15}.ck = $pad{1};\n");
  &qcode("$pad{15}.d  = $pad{9};\n");
  &qcode("$pad{15}.ap = $pad{8}&$pad{2};\n");
  &qcode("$pad{15}.ar = !$pad{8}&!$pad{16};\n");
  &qcode("$pad{14}.ck = $pad{1};\n");
  &qcode("$pad{14}.d  = $pad{15};\n");
  &qcode("$pad{14}.ap = $pad{8}&$pad{3};\n");
  &qcode("$pad{14}.ar = !$pad{8}&!$pad{16};\n");
  &qcode("$pad{13}.ck = $pad{1};\n");
  &qcode("$pad{13}.d  = $pad{14};\n");
  &qcode("$pad{13}.ap = $pad{8}&$pad{4};\n");
  &qcode("$pad{13}.ar = !$pad{8}&!$pad{16};\n");
  &qcode("$pad{11}.ck = $pad{1};\n");
  &qcode("$pad{11}.d  = $pad{13};\n");
  &qcode("$pad{11}.ap = $pad{8}&$pad{6};\n");
  &qcode("$pad{11}.ar = !$pad{8}&!$pad{16};\n");
  &qcode("$pad{10}.ck = $pad{1};\n");
  &qcode("$pad{10}.d  = $pad{11};\n");
  &qcode("$pad{10}.ap = $pad{8}&$pad{7};\n");
  &qcode("$pad{10}.ar = !$pad{8}&!$pad{16};\n");
}
$hidden{'sn7496'} = 0;

sub sn74106 {
  &sn7476;
}
$hidden{'sn74106'} = 0;

sub sn74h106 {
  &sn7476;
}
$hidden{'sn74h106'} = 0;

sub sn74125 {
  &qcode("$pad{3} = $pad{2};\n") if defined $pad{3};
  &qcode("$pad{3}.oe = !$pad{1};\n") if defined $pad{3};
  &qcode("$pad{6} = $pad{5};\n") if defined $pad{6};
  &qcode("$pad{6}.oe = !$pad{4};\n") if defined $pad{6};
  &qcode("$pad{8} = $pad{9};\n") if defined $pad{8};
  &qcode("$pad{8}.oe = !$pad{10};\n") if defined $pad{8};
  &qcode("$pad{11} = $pad{12};\n") if defined $pad{11};
  &qcode("$pad{11}.oe = !$pad{13};\n") if defined $pad{11};
}
$hidden{'sn74125'} = 0;

sub dm8093 {
  &sn74125;
}
$hidden{'dm8093'} = 0;

sub sn74138 {
  &qcode("!$pad{15} = !$pad{3} & !$pad{2} & !$pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{15};
  &qcode("!$pad{14} = !$pad{3} & !$pad{2} &  $pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{14};
  &qcode("!$pad{13} = !$pad{3} &  $pad{2} & !$pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{13};
  &qcode("!$pad{12} = !$pad{3} &  $pad{2} &  $pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{12};
  &qcode("!$pad{11} =  $pad{3} & !$pad{2} & !$pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{11};
  &qcode("!$pad{10} =  $pad{3} & !$pad{2} &  $pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{10};
  &qcode("!$pad{ 9} =  $pad{3} &  $pad{2} & !$pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{9};
  &qcode("!$pad{ 7} =  $pad{3} &  $pad{2} &  $pad{1} & !$pad{4} & !$pad{5} & $pad{6};\n") if defined $pad{7};
}
$hidden{'sn74138'} = 0;

sub sn74139 {
  &qcode("!$pad{4} = !$pad{1}&[$pad{2},$pad{3}]:'b'00;\n") if defined $pad{4};
  &qcode("!$pad{5} = !$pad{1}&[$pad{2},$pad{3}]:'b'01;\n") if defined $pad{5};
  &qcode("!$pad{6} = !$pad{1}&[$pad{2},$pad{3}]:'b'10;\n") if defined $pad{6};
  &qcode("!$pad{7} = !$pad{1}&[$pad{2},$pad{3}]:'b'11;\n") if defined $pad{7};
  &qcode("!$pad{12} = !$pad{15}&[$pad{14},$pad{13}]:'b'00;\n") if defined $pad{12};
  &qcode("!$pad{11} = !$pad{15}&[$pad{14},$pad{13}]:'b'01;\n") if defined $pad{11};
  &qcode("!$pad{10} = !$pad{15}&[$pad{14},$pad{13}]:'b'10;\n") if defined $pad{10};
  &qcode("!$pad{9} = !$pad{15}&[$pad{14},$pad{13}]:'b'11;\n") if defined $pad{9};
}
$hidden{'sn74139'} = 0;

sub sn74148 {
  &qcode("$pad{9} = !(!$pad{5}&!$pad{13}&$pad{1}&$pad{2}&$pad{3}&$pad{4}   #!$pad{5}&!$pad{11}&$pad{12}&$pad{1}&$pad{3}   #!$pad{5}&!$pad{2}&$pad{3}   #!$pad{5}&!$pad{4});\n") if defined $pad{9};
  &qcode("$pad{7} = !(!$pad{5}&$pad{12}&!$pad{13}&$pad{1}&$pad{2}&$pad{3}&$pad{4}   #!$pad{5}&!$pad{12}&$pad{1}&$pad{2}   #!$pad{5}&!$pad{3}   #!$pad{5}&!$pad{4});\n") if defined $pad{7};
  &qcode("$pad{6} = !(!$pad{5}&!$pad{2}&$pad{3}   #!$pad{5}&!$pad{1}   #!$pad{5}&!$pad{3}   #!$pad{5}&!$pad{4});\n") if defined $pad{6};
  &qcode("$pad{15} = !(!$pad{5}&$pad{10}&$pad{11}&$pad{12}&$pad{13}&$pad{1}&$pad{2}&$pad{3}&$pad{4});\n") if defined $pad{15};
  &qcode("$pad{14} = !(!$pad{5}&!$pad{13}&$pad{1}&$pad{2}&$pad{3}&$pad{4}   #!$pad{5}&!$pad{11}&$pad{12}&$pad{1}&$pad{3}   #!$pad{5}&!$pad{12}&$pad{1}&$pad{2}   #!$pad{5}&!$pad{2}&$pad{3}   #!$pad{5}&!$pad{1}   #!$pad{5}&!$pad{3}   #!$pad{5}&!$pad{4}   #!$pad{5}&!$pad{10});\n") if defined $pad{14};
}
$hidden{"sn74148"} = 0;

sub sn74151 {
  $result = $pad{5} if defined $pad{5};
  $result = "!$pad{6}" if !defined $pad{5};
  $result .= " = $pad{4} & !$pad{7} & !$pad{9} & !$pad{10} & !$pad{11}\n"; 
  $result .= "    # $pad{3}  & !$pad{7} & !$pad{9} & !$pad{10} &  $pad{11}\n"; 
  $result .= "    # $pad{2}  & !$pad{7} & !$pad{9} &  $pad{10} & !$pad{11}\n"; 
  $result .= "    # $pad{1}  & !$pad{7} & !$pad{9} &  $pad{10} &  $pad{11}\n"; 
  $result .= "    # $pad{15} & !$pad{7} &  $pad{9} & !$pad{10} & !$pad{11}\n"; 
  $result .= "    # $pad{14} & !$pad{7} &  $pad{9} & !$pad{10} &  $pad{11}\n"; 
  $result .= "    # $pad{13} & !$pad{7} &  $pad{9} &  $pad{10} & !$pad{11}\n"; 
  $result .= "    # $pad{12} & !$pad{7} &  $pad{9} &  $pad{10} &  $pad{11};\n"; 
  &qcode($result);
# &qcode("$result = $pad{4} & !$pad{7} & !$pad{11} & !$pad{10} & !$pad{9}\n"); 
# &qcode("    # $pad{3}  & !$pad{7} & !$pad{9} & !$pad{10} &  $pad{11}\n"); 
# &qcode("    # $pad{2}  & !$pad{7} & !$pad{9} &  $pad{10} & !$pad{11}\n"); 
# &qcode("    # $pad{1}  & !$pad{7} & !$pad{9} &  $pad{10} &  $pad{11}\n"); 
# &qcode("    # $pad{15} & !$pad{7} &  $pad{9} & !$pad{10} & !$pad{11}\n"); 
# &qcode("    # $pad{14} & !$pad{7} &  $pad{9} & !$pad{10} &  $pad{11}\n"); 
# &qcode("    # $pad{13} & !$pad{7} &  $pad{9} &  $pad{10} & !$pad{11}\n"); 
# &qcode("    # $pad{12} & !$pad{7} &  $pad{9} &  $pad{10} &  $pad{11};\n"); 
  &qcode("$pad{6} = !$pad{5};\n") if defined $pad{5} && defined $pad{6};
}
$hidden{'sn74151'} = 0;

sub sn74154 {
  &qcode("$pad{1} = $pad{18}#$pad{19}#!(!$pad{20} & !$pad{21} & !$pad{22} & !$pad{23});\n") if defined $pad{1};
  &qcode("$pad{2} = $pad{18}#$pad{19}#!(!$pad{20} & !$pad{21} & !$pad{22} &  $pad{23});\n") if defined $pad{2};
  &qcode("$pad{3} = $pad{18}#$pad{19}#!(!$pad{20} & !$pad{21} &  $pad{22} & !$pad{23});\n") if defined $pad{3};
  &qcode("$pad{4} = $pad{18}#$pad{19}#!(!$pad{20} & !$pad{21} &  $pad{22} &  $pad{23});\n") if defined $pad{4};
  &qcode("$pad{5} = $pad{18}#$pad{19}#!(!$pad{20} &  $pad{21} & !$pad{22} & !$pad{23});\n") if defined $pad{5};
  &qcode("$pad{6} = $pad{18}#$pad{19}#!(!$pad{20} &  $pad{21} & !$pad{22} &  $pad{23});\n") if defined $pad{6};
  &qcode("$pad{7} = $pad{18}#$pad{19}#!(!$pad{20} &  $pad{21} &  $pad{22} & !$pad{23});\n") if defined $pad{7};
  &qcode("$pad{8} = $pad{18}#$pad{19}#!(!$pad{20} &  $pad{21} &  $pad{22} &  $pad{23});\n") if defined $pad{8};
  &qcode("$pad{9} = $pad{18}#$pad{19}#!( $pad{20} & !$pad{21} & !$pad{22} & !$pad{23});\n") if defined $pad{9};
  &qcode("$pad{10} = $pad{18}#$pad{19}#!( $pad{20} & !$pad{21} & !$pad{22} &  $pad{23});\n") if defined $pad{10};
  &qcode("$pad{11} = $pad{18}#$pad{19}#!( $pad{20} & !$pad{21} &  $pad{22} & !$pad{23});\n") if defined $pad{11};
  &qcode("$pad{13} = $pad{18}#$pad{19}#!( $pad{20} & !$pad{21} &  $pad{22} &  $pad{23});\n") if defined $pad{13};
  &qcode("$pad{14} = $pad{18}#$pad{19}#!( $pad{20} &  $pad{21} & !$pad{22} & !$pad{23});\n") if defined $pad{14};
  &qcode("$pad{15} = $pad{18}#$pad{19}#!( $pad{20} &  $pad{21} & !$pad{22} &  $pad{23});\n") if defined $pad{15};
  &qcode("$pad{16} = $pad{18}#$pad{19}#!( $pad{20} &  $pad{21} &  $pad{22} & !$pad{23});\n") if defined $pad{16};
  &qcode("$pad{17} = $pad{18}#$pad{19}#!( $pad{20} &  $pad{21} &  $pad{22} &  $pad{23});\n") if defined $pad{17};
}
$hidden{'sn74154'} = 0;

sub sn74155 {
  &qcode("$pad{7} = !(!$pad{3} & !$pad{13} & !$pad{2} & $pad{1});\n") if defined $pad{7};
  &qcode("$pad{6} = !(!$pad{3} &  $pad{13} & !$pad{2} & $pad{1});\n") if defined $pad{7};
  &qcode("$pad{5} = !( $pad{3} & !$pad{13} & !$pad{2} & $pad{1});\n") if defined $pad{5};
  &qcode("$pad{4} = !( $pad{3} &  $pad{13} & !$pad{2} & $pad{1});\n") if defined $pad{4};
  &qcode("$pad{9} = !(!$pad{3} &  $pad{13} & !$pad{15} & !$pad{14});\n") if defined $pad{9};
  &qcode("$pad{10} = !(!$pad{3} & !$pad{13} & !$pad{15} & !$pad{14});\n") if defined $pad{10};
  &qcode("$pad{11} = !( $pad{3} &  $pad{13} & !$pad{15} & !$pad{14});\n") if defined $pad{11};
  &qcode("$pad{12} = !( $pad{3} & !$pad{13} & !$pad{15} & !$pad{14});\n") if defined $pad{12};
}
$hidden{'sn74155'} = 0;

sub sn74157 {
  &qcode("$pad{4} = !$pad{15}&($pad{2}&!$pad{1} # $pad{3}&$pad{1});\n") if defined $pad{4};
  &qcode("$pad{7} = !$pad{15}&($pad{5}&!$pad{1} # $pad{6}&$pad{1});\n") if defined $pad{7};
  &qcode("$pad{9} = !$pad{15}&($pad{11}&!$pad{1} # $pad{10}&$pad{1});\n") if defined $pad{9};
  &qcode("$pad{12} = !$pad{15}&($pad{14}&!$pad{1} # $pad{13}&$pad{1});\n") if defined $pad{12};
}
$hidden{'sn74157'} = 0;

sub sn74161 {
  # We need Qa..Qd even if their pads are NC.
  $pad{14} = &gnext unless defined $pad{14};
  $pad{13} = &gnext unless defined $pad{13};
  $pad{12} = &gnext unless defined $pad{12};
  $pad{11} = &gnext unless defined $pad{11};
  # These are registers.
  &pinnode($pad{14});
  &pinnode($pad{13});
  &pinnode($pad{12});
  &pinnode($pad{11});
  # Now the hair
  &qcode("$pad{14}.ar = !$pad{1};\n");
  &qcode("$pad{14}.ck = !$pad{2};\n");
  &qcode("$pad{14}.j = !(!$pad{3} & !$pad{9}) & (($pad{7} & $pad{10}) # !$pad{9});\n");
  &qcode("$pad{14}.k = !( $pad{3} & !$pad{9}) & (($pad{7} & $pad{10}) # !$pad{9});\n");
  &qcode("$pad{13}.ar = !$pad{1};\n");
  &qcode("$pad{13}.ck = !$pad{2};\n");
  &qcode("$pad{13}.j = !(!$pad{4} & !$pad{9}) & (($pad{7} & $pad{10} & $pad{14}) # !$pad{9});\n");
  &qcode("$pad{13}.k = !( $pad{4} & !$pad{9}) & (($pad{7} & $pad{10} & $pad{14}) # !$pad{9});\n");
  &qcode("$pad{12}.ar = !$pad{1};\n");
  &qcode("$pad{12}.ck = !$pad{2};\n");
  &qcode("$pad{12}.j = !(!$pad{5} & !$pad{9}) & (($pad{7} & $pad{10} & $pad{14} & $pad{13}) # !$pad{9});\n");
  &qcode("$pad{12}.k = !( $pad{5} & !$pad{9}) & (($pad{7} & $pad{10} & $pad{14} & $pad{13}) # !$pad{9});\n");
  &qcode("$pad{11}.ar = !$pad{1};\n");
  &qcode("$pad{11}.ck = !$pad{2};\n");
  &qcode("$pad{11}.j = !(!$pad{6} & !$pad{9}) & (($pad{7} & $pad{10} & $pad{14} & $pad{13} & $pad{12}) # !$pad{9});\n");
  &qcode("$pad{11}.k = !( $pad{6} & !$pad{9}) & (($pad{7} & $pad{10} & $pad{14} & $pad{13} & $pad{12}) # !$pad{9});\n");
  &qcode("$pad{15} = $pad{10} & $pad{11} & $pad{12} & $pad{13} & $pad{14};\n") if defined $pad{15};
}
$hidden{'sn74161'} = 0;

sub sn74173 {
  if (defined $pad{3}) {
    $tmp = &gnext;
    &pinnode($tmp);
    &qcode("$tmp.ar = $pad{15};\n") if defined $pad{15};
    &qcode("$tmp.ck = $pad{7};\n");
    &qcode("$tmp.ce = !$pad{9} & !$pad{10};\n") if defined $pad{9};
    &qcode("$tmp.d = $pad{14};\n");
    &qcode("$tmp.oe = !$pad{1} & !$pad{2};\n");
    # This should be a tri-state assign, but use ocassign for now.
    $oc{$pad{3}} = 1;
    &ocassign($pad{3}, "!$tmp & !$pad{1} & !$pad{2}");
  }
  if (defined $pad{4}) {
    $tmp = &gnext;
    &pinnode($tmp);
    &qcode("$tmp.ar = $pad{15};\n") if defined $pad{15};
    &qcode("$tmp.ck = $pad{7};\n");
    &qcode("$tmp.ce = !$pad{9} & !$pad{10};\n") if defined $pad{9};
    &qcode("$tmp.d = $pad{13};\n");
    &qcode("$tmp.oe = !$pad{1} & !$pad{2};\n");
    # This should be a tri-state assign, but use ocassign for now.
    $oc{$pad{4}} = 1;
    &ocassign($pad{4}, "!$tmp & !$pad{1} & !$pad{2}");
  }
  if (defined $pad{5}) {
    $tmp = &gnext;
    &pinnode($tmp);
    &qcode("$tmp.ar = $pad{15};\n") if defined $pad{15};
    &qcode("$tmp.ck = $pad{7};\n");
    &qcode("$tmp.ce = !$pad{9} & !$pad{10};\n") if defined $pad{9};
    &qcode("$tmp.d = $pad{12};\n");
    &qcode("$tmp.oe = !$pad{1} & !$pad{2};\n");
    # This should be a tri-state assign, but use ocassign for now.
    $oc{$pad{5}} = 1;
    &ocassign($pad{5}, "!$tmp & !$pad{1} & !$pad{2}");
  }
  if (defined $pad{6}) {
    $tmp = &gnext;
    &pinnode($tmp);
    &qcode("$tmp.ar = $pad{15};\n") if defined $pad{15};
    &qcode("$tmp.ck = $pad{7};\n");
    &qcode("$tmp.ce = !$pad{9} & !$pad{10};\n") if defined $pad{9};
    &qcode("$tmp.d = $pad{11};\n");
    &qcode("$tmp.oe = !$pad{1} & !$pad{2};\n");
    # This should be a tri-state assign, but use ocassign for now.
    $oc{$pad{6}} = 1;
    &ocassign($pad{6}, "!$tmp & !$pad{1} & !$pad{2}");
  }
}
$hidden{'sn74173'} = 0;

sub sn74174 {
  if (defined $pad{2}) {
    &pinnode($pad{2});
    &qcode("$pad{2}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{2}.ck = $pad{9};\n");
    &qcode("$pad{2}.d = $pad{3};\n");
  }
  if (defined $pad{5}) {
    &pinnode($pad{5});
    &qcode("$pad{5}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{5}.ck = $pad{9};\n");
    &qcode("$pad{5}.d = $pad{4};\n");
  }
  if (defined $pad{7}) {
    &pinnode($pad{7});
    &qcode("$pad{7}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{7}.ck = $pad{9};\n");
    &qcode("$pad{7}.d = $pad{6};\n");
  }
  if (defined $pad{10}) {
    &pinnode($pad{10});
    &qcode("$pad{10}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{10}.ck = $pad{9};\n");
    &qcode("$pad{10}.d = $pad{11};\n");
  }
  if (defined $pad{12}) {
    &pinnode($pad{12});
    &qcode("$pad{12}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{12}.ck = $pad{9};\n");
    &qcode("$pad{12}.d = $pad{13};\n");
  }
  if (defined $pad{15}) {
    &pinnode($pad{15});
    &qcode("$pad{15}.ar = !$pad{1};\n") if defined $pad{1};
    &qcode("$pad{15}.ck = $pad{9};\n");
    &qcode("$pad{15}.d = $pad{14};\n");
  }
}
$hidden{'sn74174'} = 0;

sub sn74175 {
  if (defined($pad{2}) || defined($pad{3})) {
    $pad{2} = &gnext unless defined $pad{2};
    &pinnode($pad{2});
    &qcode("$pad{2}.d = $pad{4};\n");
    &qcode("$pad{2}.ck = $pad{9};\n");
    &qcode("$pad{2}.ar = !$pad{1};\n") if defined $pad{9};
    &qcode("$pad{3} = !$pad{2};\n") if defined $pad{3};
  }
  if (defined($pad{7}) || defined($pad{6})) {
    $pad{7} = &gnext unless defined $pad{7};
    &pinnode($pad{7});
    &qcode("$pad{7}.d = $pad{5};\n");
    &qcode("$pad{7}.ck = $pad{9};\n");
    &qcode("$pad{7}.ar = !$pad{1};\n") if defined $pad{9};
    &qcode("$pad{6} = !$pad{7};\n") if defined $pad{6};
  }
  if (defined($pad{10}) || defined($pad{11})) {
    $pad{10} = &gnext unless defined $pad{10};
    &pinnode($pad{10});
    &qcode("$pad{10}.d = $pad{12};\n");
    &qcode("$pad{10}.ck = $pad{9};\n");
    &qcode("$pad{10}.ar = !$pad{1};\n") if defined $pad{9};
    &qcode("$pad{11} = !$pad{10};\n") if defined $pad{11};
  }
  if (defined($pad{15}) || defined($pad{14})) {
    $pad{15} = &gnext unless defined $pad{15};
    &pinnode($pad{15});
    &qcode("$pad{15}.d = $pad{13};\n");
    &qcode("$pad{15}.ck = $pad{9};\n");
    &qcode("$pad{15}.ar = !$pad{1};\n") if defined $pad{9};
    &qcode("$pad{14} = !$pad{15};\n") if defined $pad{14};
  }
}
$hidden{'sn74175'} = 0;

sub sn74179 {
  # We need Qa..Qd even if their pads are NC.
  $pad{5} = &gnext unless defined $pad{5};
  $pad{7} = &gnext unless defined $pad{7};
  $pad{9} = &gnext unless defined $pad{9};
  $pad{11} = &gnext unless defined $pad{11};
  # These are registers.
  &pinnode($pad{5});
  &pinnode($pad{7});
  &pinnode($pad{9});
  &pinnode($pad{11});
  # Now the hair
  &qcode("$pad{5}.ar = !$pad{1};\n");
  &qcode("$pad{5}.ck = !$pad{6};\n");
  &qcode("$pad{5}.d = $pad{4} & $pad{13} # $pad{3} & !$pad{13} & $pad{10} # $pad{5} & !$pad{13} & !$pad{10};\n");
  &qcode("$pad{7}.ar = !$pad{1};\n");
  &qcode("$pad{7}.ck = !$pad{6};\n");
  &qcode("$pad{7}.d = $pad{5} & $pad{13} # $pad{2} & !$pad{13} & $pad{10} # $pad{7} & !$pad{13} & !$pad{10};\n");
  &qcode("$pad{9}.ar = !$pad{1};\n");
  &qcode("$pad{9}.ck = !$pad{6};\n");
  &qcode("$pad{9}.d = $pad{7} & $pad{13} # $pad{15} & !$pad{13} & $pad{10} # $pad{9} & !$pad{13} & !$pad{10};\n");
  &qcode("$pad{11}.ar = !$pad{1};\n");
  &qcode("$pad{11}.ck = !$pad{6};\n");
  &qcode("$pad{11}.d = $pad{9} & $pad{13} # $pad{14} & !$pad{13} & $pad{10} # $pad{11} & !$pad{13} & !$pad{10};\n");
  &qcode("$pad{12} = !$pad{11};\n") if defined $pad{12};
}
$hidden{'sn74179'} = 0;

sub sn74180 {
  &qcode("$pad{5} = (!$pad{3} & !$pad{4}) # !($pad{3}&$pad{4})&($pad{8} \$ $pad{9} \$ $pad{10} \$ $pad{11} \$ $pad{12} \$ $pad{13} \$ $pad{1} \$ $pad{2} \$ $pad{3});\n") if defined $pad{5};
  &qcode("$pad{6} = (!$pad{3} & !$pad{4}) # !($pad{3}&$pad{4})&($pad{8} \$ $pad{9} \$ $pad{10} \$ $pad{11} \$ $pad{12} \$ $pad{13} \$ $pad{1} \$ $pad{2} \$ $pad{4});\n") if defined $pad{6};
}
$hidden{'sn74180'} = 0;

sub sn74189 {
  $oc{$pad{5}} = 1 if defined $pad{5};
  ($ra1, $rb1, $rc1, $rd1, $re1, $rf1, $rg1, $rh1)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{5};
  ($ri1, $rj1, $rk1, $rl1, $rm1, $rn1, $ro1, $rp1)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{5};
  print "node $ra1, $rb1, $rc1, $rd1, $re1, $rf1, $rg1, $rh1;\r\n"
    if defined $pad{5};
  print "node $ri1, $rj1, $rk1, $rl1, $rm1, $rn1, $ro1, $rp1;\r\n"
    if defined $pad{5};
  &ocassign($pad{5}, "$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$rp1   #!$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$ro1   #$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rn1   #!$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rm1   #$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rl1   #!$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rk1   #$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$rj1   #!$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$ri1   #$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rh1   #!$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rg1   #$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$rf1   #!$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$re1   #$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rd1   #!$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rc1   #$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$rb1   #!$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$ra1") if defined $pad{5};
  $oc{$pad{7}} = 1 if defined $pad{7};
  ($ra2, $rb2, $rc2, $rd2, $re2, $rf2, $rg2, $rh2)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{7};
  ($ri2, $rj2, $rk2, $rl2, $rm2, $rn2, $ro2, $rp2)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{7};
  print "node $ra2, $rb2, $rc2, $rd2, $re2, $rf2, $rg2, $rh2;\r\n"
    if defined $pad{7};
  print "node $ri2, $rj2, $rk2, $rl2, $rm2, $rn2, $ro2, $rp2;\r\n"
    if defined $pad{7};
  &ocassign($pad{7}, "$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$rp2   #!$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$ro2   #$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rn2   #!$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rm2   #$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rl2   #!$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rk2   #$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$rj2   #!$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$ri2   #$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rh2   #!$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rg2   #$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$rf2   #!$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$re2   #$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rd2   #!$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rc2   #$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$rb2   #!$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$ra2") if defined $pad{7};
  $oc{$pad{9}} = 1 if defined $pad{9};
  ($ra3, $rb3, $rc3, $rd3, $re3, $rf3, $rg3, $rh3)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{9};
  ($ri3, $rj3, $rk3, $rl3, $rm3, $rn3, $ro3, $rp3)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{9};
  print "node $ra3, $rb3, $rc3, $rd3, $re3, $rf3, $rg3, $rh3;\r\n"
    if defined $pad{9};
  print "node $ri3, $rj3, $rk3, $rl3, $rm3, $rn3, $ro3, $rp3;\r\n"
    if defined $pad{9};
  &ocassign($pad{9}, "$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$rp3   #!$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$ro3   #$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rn3   #!$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rm3   #$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rl3   #!$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rk3   #$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$rj3   #!$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$ri3   #$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rh3   #!$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rg3   #$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$rf3   #!$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$re3   #$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rd3   #!$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rc3   #$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$rb3   #!$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$ra3") if defined $pad{9};
  $oc{$pad{11}} = 1 if defined $pad{11};
  ($ra4, $rb4, $rc4, $rd4, $re4, $rf4, $rg4, $rh4)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{11};
  ($ri4, $rj4, $rk4, $rl4, $rm4, $rn4, $ro4, $rp4)
    = (&gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext, &gnext)
      if defined $pad{11};
  print "node $ra4, $rb4, $rc4, $rd4, $re4, $rf4, $rg4, $rh4;\r\n"
    if defined $pad{11};
  print "node $ri4, $rj4, $rk4, $rl4, $rm4, $rn4, $ro4, $rp4;\r\n"
    if defined $pad{11};
  &ocassign($pad{11}, "$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$rp4   #!$pad{1}&$pad{15}&$pad{14}&$pad{13}&!$ro4   #$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rn4   #!$pad{1}&!$pad{15}&$pad{14}&$pad{13}&!$rm4   #$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rl4   #!$pad{1}&$pad{15}&!$pad{14}&$pad{13}&!$rk4   #$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$rj4   #!$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&!$ri4   #$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rh4   #!$pad{1}&$pad{15}&$pad{14}&!$pad{13}&!$rg4   #$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$rf4   #!$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&!$re4   #$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rd4   #!$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&!$rc4   #$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$rb4   #!$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&!$ra4") if defined $pad{11};
  &qcode("$ra1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$ra1.le = !$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$ra2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$ra2.le = !$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$ra3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$ra3.le = !$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$ra4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$ra4.le = !$pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rb1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rb1.le = $pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rb2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rb2.le = $pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rb3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rb3.le = $pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rb4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rb4.le = $pad{1}&!$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rc1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rc1.le = !$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rc2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rc2.le = !$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rc3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rc3.le = !$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rc4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rc4.le = !$pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rd1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rd1.le = $pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rd2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rd2.le = $pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rd3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rd3.le = $pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rd4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rd4.le = $pad{1}&$pad{15}&!$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$re1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$re1.le = !$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$re2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$re2.le = !$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$re3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$re3.le = !$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$re4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$re4.le = !$pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rf1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rf1.le = $pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rf2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rf2.le = $pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rf3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rf3.le = $pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rf4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rf4.le = $pad{1}&!$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rg1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rg1.le = !$pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rg2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rg2.le = !$pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rg3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rg3.le = !$pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rg4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rg4.le = !$pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rh1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rh1.le = $pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rh2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rh2.le = $pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rh3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rh3.le = $pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rh4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rh4.le = $pad{1}&$pad{15}&$pad{14}&!$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$ri1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$ri1.le = !$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$ri2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$ri2.le = !$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$ri3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$ri3.le = !$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$ri4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$ri4.le = !$pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rj1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rj1.le = $pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rj2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rj2.le = $pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rj3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rj3.le = $pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rj4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rj4.le = $pad{1}&!$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rk1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rk1.le = !$pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rk2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rk2.le = !$pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rk3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rk3.le = !$pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rk4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rk4.le = !$pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rl1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rl1.le = $pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rl2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rl2.le = $pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rl3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rl3.le = $pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rl4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rl4.le = $pad{1}&$pad{15}&!$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rm1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rm1.le = !$pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rm2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rm2.le = !$pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rm3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rm3.le = !$pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rm4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rm4.le = !$pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rn1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rn1.le = $pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rn2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rn2.le = $pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rn3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rn3.le = $pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rn4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rn4.le = $pad{1}&!$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$ro1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$ro1.le = !$pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$ro2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$ro2.le = !$pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$ro3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$ro3.le = !$pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$ro4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$ro4.le = !$pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
  &qcode("$rp1.l = $pad{4};\n") if defined $pad{4};
  &qcode("$rp1.le = $pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{4};
  &qcode("$rp2.l = $pad{6};\n") if defined $pad{6};
  &qcode("$rp2.le = $pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{6};
  &qcode("$rp3.l = $pad{10};\n") if defined $pad{10};
  &qcode("$rp3.le = $pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{10};
  &qcode("$rp4.l = $pad{12};\n") if defined $pad{12};
  &qcode("$rp4.le = $pad{1}&$pad{15}&$pad{14}&$pad{13}&$pad{2}&$pad{3};\n") if defined $pad{12};
}
$hidden{"sn74189"} = 0;

sub sn74193 {
  # We need Qa..Qd even if their pads are NC.
  $pad{3} = &gnext unless defined $pad{3};
  $pad{2} = &gnext unless defined $pad{2};
  $pad{6} = &gnext unless defined $pad{6};
  $pad{7} = &gnext unless defined $pad{7};
  &pinnode($pad{3});
  &pinnode($pad{2});
  &pinnode($pad{6});
  &pinnode($pad{7});
  # Bottom bit toggles for either up or down
  &qcode("$pad{3}.ap = !$pad{11}&$pad{15};\n");
  &qcode("$pad{3}.ar = $pad{14} # !$pad{11}&!$pad{15};\n");
  &qcode("$pad{3}.t = 'b'1;\n");
  &qcode("$pad{3}.ck = !(!$pad{4} # !$pad{5});\n");
  &qcode("$pad{2}.ap = !$pad{11}&$pad{1};\n");
  &qcode("$pad{2}.ar = $pad{14} # !$pad{11}&!$pad{1};\n");
  &qcode("$pad{2}.t = 'b'1;\n");
  &qcode("$pad{2}.ck = !(!$pad{4}&!$pad{3} # !$pad{5}&$pad{3});\n");
  &qcode("$pad{6}.ap = !$pad{11}&$pad{10};\n");
  &qcode("$pad{6}.ar = $pad{14} # !$pad{11}&!$pad{10};\n");
  &qcode("$pad{6}.t = 'b'1;\n");
  &qcode("$pad{6}.ck = !(!$pad{4}&!$pad{3}&!$pad{2} # !$pad{5}&$pad{3}&$pad{2});\n");
  &qcode("$pad{7}.ap = !$pad{11}&$pad{9};\n");
  &qcode("$pad{7}.ar = $pad{14} # !$pad{11}&!$pad{9};\n");
  &qcode("$pad{7}.t = 'b'1;\n");
  &qcode("$pad{7}.ck = !(!$pad{4}&!$pad{6}&!$pad{3}&!$pad{2} # !$pad{5}&$pad{6}&$pad{3}&$pad{2});\n");
  &qcode("$pad{12} = $pad{3}&$pad{2}&$pad{6}&$pad{7};\n") if defined $pad{12};
  &qcode("$pad{13} = !$pad{3}&!$pad{2}&!$pad{6}&!$pad{7};\n") if defined $pad{13};
}
$hidden{'sn74193'} = 0;

sub sn74195 {
  # We need Qa..Qd even if their pads are NC.
  $pad{12} = &gnext unless defined $pad{12};
  $pad{13} = &gnext unless defined $pad{13};
  $pad{14} = &gnext unless defined $pad{14};
  $pad{15} = &gnext unless defined $pad{15};
  # These are registers.
  &pinnode($pad{12});
  &pinnode($pad{13});
  &pinnode($pad{14});
  &pinnode($pad{15});
  # Now the hair
  &qcode("$pad{12}.ar = !$pad{1};\n");
  &qcode("$pad{12}.ck = $pad{10} & !$pad{1};\n");
  &qcode("$pad{12}.d = !($pad{7}&!$pad{9} # $pad{13}&$pad{9});\n");
  &qcode("$pad{13}.ar = !$pad{1};\n");
  &qcode("$pad{13}.ck = $pad{10} & !$pad{1};\n");
  &qcode("$pad{13}.d = !($pad{6}&!$pad{9} # $pad{14}&$pad{9});\n");
  &qcode("$pad{14}.ar = !$pad{1};\n");
  &qcode("$pad{14}.ck = $pad{10} & !$pad{1};\n");
  &qcode("$pad{14}.d = !($pad{5}&!$pad{9} # $pad{15}&$pad{9});\n");
  &qcode("$pad{15}.ar = !$pad{1};\n");
  &qcode("$pad{15}.ck = $pad{10} & !$pad{1};\n");
  &qcode("$pad{15}.d = !($pad{4}&!$pad{9} # $pad{2}&!$pad{15}&$pad{9} # $pad{3}&$pad{15}&$pad{9});\n");
  &qcode("$pad{11} = !$pad{12};\n") if defined $pad{11};
}
$hidden{'sn74195'} = 0;

sub sn74240 {
  &qcode("$pad{18} = !$pad{2};\n") if defined $pad{18};
  &qcode("$pad{18}.oe = !$pad{1};\n") if defined $pad{18};
  &qcode("$pad{16} = !$pad{4};\n") if defined $pad{16};
  &qcode("$pad{16}.oe = !$pad{1};\n") if defined $pad{16};
  &qcode("$pad{14} = !$pad{6};\n") if defined $pad{14};
  &qcode("$pad{14}.oe = !$pad{1};\n") if defined $pad{14};
  &qcode("$pad{12} = !$pad{8};\n") if defined $pad{12};
  &qcode("$pad{12}.oe = !$pad{1};\n") if defined $pad{12};
  &qcode("$pad{9} = !$pad{11};\n") if defined $pad{9};
  &qcode("$pad{9}.oe = !$pad{19};\n") if defined $pad{9};
  &qcode("$pad{7} = !$pad{13};\n") if defined $pad{7};
  &qcode("$pad{7}.oe = !$pad{19};\n") if defined $pad{7};
  &qcode("$pad{5} = !$pad{15};\n") if defined $pad{5};
  &qcode("$pad{5}.oe = !$pad{19};\n") if defined $pad{5};
  &qcode("$pad{3} = !$pad{17};\n") if defined $pad{3};
  &qcode("$pad{3}.oe = !$pad{19};\n") if defined $pad{3};
}
$hidden{'sn74240'} = 0;

sub sn74244 {
  &qcode("$pad{18} = $pad{2};\n") if defined $pad{18};
  &qcode("$pad{18}.oe = !$pad{1};\n") if defined $pad{18};
  &qcode("$pad{16} = $pad{4};\n") if defined $pad{16};
  &qcode("$pad{16}.oe = !$pad{1};\n") if defined $pad{16};
  &qcode("$pad{14} = $pad{6};\n") if defined $pad{14};
  &qcode("$pad{14}.oe = !$pad{1};\n") if defined $pad{14};
  &qcode("$pad{12} = $pad{8};\n") if defined $pad{12};
  &qcode("$pad{12}.oe = !$pad{1};\n") if defined $pad{12};
  &qcode("$pad{9} = $pad{11};\n") if defined $pad{9};
  &qcode("$pad{9}.oe = !$pad{19};\n") if defined $pad{9};
  &qcode("$pad{7} = $pad{13};\n") if defined $pad{7};
  &qcode("$pad{7}.oe = !$pad{19};\n") if defined $pad{7};
  &qcode("$pad{5} = $pad{15};\n") if defined $pad{5};
  &qcode("$pad{5}.oe = !$pad{19};\n") if defined $pad{5};
  &qcode("$pad{3} = $pad{17};\n") if defined $pad{3};
  &qcode("$pad{3}.oe = !$pad{19};\n") if defined $pad{3};
}
$hidden{'sn74244'} = 0;

sub sn74258 {
  $oc{$pad{4}} = 1 if defined $pad{4};
  $oc{$pad{7}} = 1 if defined $pad{7};
  $oc{$pad{9}} = 1 if defined $pad{9};
  $oc{$pad{12}} = 1 if defined $pad{12};
  &ocassign($pad{4}, "!$pad{15}&($pad{1}&!$pad{3}#!$pad{1}&!$pad{2})") if defined $pad{4};
  &ocassign($pad{7}, "!$pad{15}&($pad{1}&!$pad{6}#!$pad{1}&!$pad{5})") if defined $pad{7};
  &ocassign($pad{9}, "!$pad{15}&($pad{1}&!$pad{10}#!$pad{1}&!$pad{11})") if defined $pad{9};
  &ocassign($pad{12}, "!$pad{15}&($pad{1}&!$pad{13}#!$pad{1}&!$pad{14})") if defined $pad{12};
}
$hidden{'sn74258'} = 0;

sub sn74367 {
  $oc{$pad{3}} = 1 if defined $pad{3};
  $oc{$pad{5}} = 1 if defined $pad{5};
  $oc{$pad{7}} = 1 if defined $pad{7};
  $oc{$pad{9}} = 1 if defined $pad{9};
  $oc{$pad{11}} = 1 if defined $pad{11};
  $oc{$pad{13}} = 1 if defined $pad{13};
  &ocassign($pad{3}, "!$pad{1}&!$pad{2}") if defined $pad{3};
  &ocassign($pad{5}, "!$pad{1}&!$pad{4}") if defined $pad{5};
  &ocassign($pad{7}, "!$pad{1}&!$pad{6}") if defined $pad{7};
  &ocassign($pad{9}, "!$pad{1}&!$pad{10}") if defined $pad{9};
  &ocassign($pad{11}, "!$pad{15}&!$pad{12}") if defined $pad{11};
  &ocassign($pad{13}, "!$pad{15}&!$pad{14}") if defined $pad{13};
}
$hidden{'sn74367'} = 0;

sub sn74368 {
  $oc{$pad{3}} = 1 if defined $pad{3};
  $oc{$pad{5}} = 1 if defined $pad{5};
  $oc{$pad{7}} = 1 if defined $pad{7};
  $oc{$pad{9}} = 1 if defined $pad{9};
  $oc{$pad{11}} = 1 if defined $pad{11};
  $oc{$pad{13}} = 1 if defined $pad{13};
  &ocassign($pad{3}, "!$pad{1}&$pad{2}") if defined $pad{3};
  &ocassign($pad{5}, "!$pad{1}&$pad{4}") if defined $pad{5};
  &ocassign($pad{7}, "!$pad{1}&$pad{6}") if defined $pad{7};
  &ocassign($pad{9}, "!$pad{1}&$pad{10}") if defined $pad{9};
  &ocassign($pad{11}, "!$pad{15}&$pad{12}") if defined $pad{11};
  &ocassign($pad{13}, "!$pad{15}&$pad{14}") if defined $pad{13};
}
$hidden{'sn74368'} = 0;

sub dec8235 {
  &ocassign($pad{3}, "!$pad{2}&!$pad{9} # $pad{1}&!$pad{7}") if defined $pad{3};
  &ocassign($pad{4}, "!$pad{5}&!$pad{9} # $pad{6}&!$pad{7}") if defined $pad{4};
  &ocassign($pad{12}, "!$pad{11}&!$pad{9} # $pad{10}&!$pad{7}") if defined $pad{12};
  &ocassign($pad{13}, "!$pad{14}&!$pad{9} # $pad{15}&!$pad{7}") if defined $pad{13};
}
$hidden{'dec8235'} = 0;

sub dec8242 {
  &ocassign($pad{3}, "!$pad{1}&!$pad{2} # $pad{1}&$pad{2}") if defined $pad{3};
  &ocassign($pad{4}, "!$pad{5}&!$pad{6} # $pad{5}&$pad{6}") if defined $pad{4};
  &ocassign($pad{10}, "!$pad{8}&!$pad{9} # $pad{8}&$pad{9}") if defined $pad{10};
  &ocassign($pad{11}, "!$pad{12}&!$pad{13} # $pad{12}&$pad{13}") if defined $pad{11};
}
$hidden{'dec8242'} = 0;

sub dec8251 {
  &qcode("!$pad{13} = !$pad{2} & !$pad{1} & !$pad{14} & !$pad{15};\n") if defined $pad{13};
  &qcode("!$pad{12} = !$pad{2} & !$pad{1} & !$pad{14} & $pad{15};\n") if defined $pad{12};
  &qcode("!$pad{11} = !$pad{2} & !$pad{1} & $pad{14} & !$pad{15};\n") if defined $pad{11};
  &qcode("!$pad{10} = !$pad{2} & !$pad{1} & $pad{14} & $pad{15};\n") if defined $pad{10};
  &qcode("!$pad{9} = !$pad{2} & $pad{1} & !$pad{14} & !$pad{15};\n") if defined $pad{9};
  &qcode("!$pad{3} = !$pad{2} & $pad{1} & !$pad{14} & $pad{15};\n") if defined $pad{3};
  &qcode("!$pad{4} = !$pad{2} & $pad{1} & $pad{14} & !$pad{15};\n") if defined $pad{9};
  &qcode("!$pad{5} = !$pad{2} & $pad{1} & $pad{14} & $pad{15};\n") if defined $pad{5};
  &qcode("!$pad{6} = $pad{2} & !$pad{1} & !$pad{14} & !$pad{15};\n") if defined $pad{6};
  &qcode("!$pad{7} = $pad{2} & !$pad{1} & !$pad{14} & $pad{15};\n") if defined $pad{7};
}
$hidden{'dec8251'} = 0;

sub dec8271 {
  &mc8271;
}
$hidden{'dec8271'} = 0;

sub dec23001a1 {
# Bit 0: 10x01 1011x
  $oc{$pad{1}} = 1 if defined $pad{1};
  &qcode("${part}_10x01 = ( $pad{10}&!$pad{11}&!$pad{13}& $pad{14});\n") if defined $pad{1};
  &qcode("${part}_1011x = ( $pad{10}&!$pad{11}& $pad{12}& $pad{13});\n") if defined $pad{1};
  &ocassign($pad{1}, "!$pad{15} & (${part}_10x01#${part}_1011x)") if defined $pad{1};
# Bit 1: 00x10 x1001 0x111 10x01 01101 01110 10011
  $oc{$pad{2}} = 1 if defined $pad{2};
  &qcode("${part}_00x10 = (!$pad{10}&!$pad{11}& $pad{13}&!$pad{14});\n") if defined $pad{2};
  &qcode("${part}_x1001 = ( $pad{11}&!$pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{2};
  &qcode("${part}_0x111 = (!$pad{10}& $pad{12}& $pad{13}& $pad{14});\n") if defined $pad{2};
  &qcode("${part}_01101 = (!$pad{10}& $pad{11}& $pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{2};
  &qcode("${part}_01110 = (!$pad{10}& $pad{11}& $pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{2};
  &qcode("${part}_10011 = ( $pad{10}&!$pad{11}&!$pad{12}& $pad{13}& $pad{14});\n") if defined $pad{2};
  &ocassign($pad{2}, "!$pad{15} & (${part}_00x10#${part}_x1001#${part}_0x111#${part}_10x01#${part}_01101#${part}_01110#${part}_10011)") if defined $pad{2};
# Bit 2: 00010 00100 x1001 100x1
  $oc{$pad{3}} = 1 if defined $pad{3};
  &qcode("${part}_00010 = (!$pad{10}&!$pad{11}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{3};
  &qcode("${part}_00100 = (!$pad{10}&!$pad{11}& $pad{12}&!$pad{13}&!$pad{14});\n") if defined $pad{3};
  &qcode("${part}_100x1 = ( $pad{10}&!$pad{11}&!$pad{12}& $pad{14});\n") if defined $pad{3};
  &ocassign($pad{3}, "!$pad{15} & (${part}_00010#${part}_00100#${part}_x1001#${part}_100x1)") if defined $pad{3};
# Bit 3: 00100 0111x 10x01 10010
  $oc{$pad{4}} = 1 if defined $pad{4};
  &qcode("${part}_0111x = (!$pad{10}& $pad{11}& $pad{12}& $pad{13});\n") if defined $pad{4};
  &qcode("${part}_10010 = ( $pad{10}&!$pad{11}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{4};
  &ocassign($pad{4}, "!$pad{15} & (${part}_00100#${part}_0111x#${part}_10x01#${part}_10010)") if defined $pad{4};
# Bit 4: 00x10 00100 01x01 00111
  $oc{$pad{5}} = 1 if defined $pad{5};
  &qcode("${part}_01x01 = (!$pad{10}& $pad{11}&!$pad{13}& $pad{14});\n") if defined $pad{5};
  &qcode("${part}_00111 = (!$pad{10}&!$pad{11}& $pad{12}& $pad{13}& $pad{14});\n") if defined $pad{5};
  &ocassign($pad{5}, "!$pad{15} & (${part}_00x10#${part}_00100#${part}_01x01#${part}_00111)") if defined $pad{5};
# Bit 5: x0010 011x1 01110 100x1
  $oc{$pad{6}} = 1 if defined $pad{6};
  &qcode("${part}_x0010 = (!$pad{11}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{6};
  &qcode("${part}_011x1 = (!$pad{10}& $pad{11}& $pad{12}& $pad{14});\n") if defined $pad{6};
  &ocassign($pad{6}, "!$pad{15} & (${part}_x0010#${part}_011x1#${part}_01110#${part}_100x1)") if defined $pad{6};
# Bit 6: x0010 100x1
  $oc{$pad{7}} = 1 if defined $pad{7};
  &ocassign($pad{7}, "!$pad{15} & (${part}_x0010#${part}_100x1)") if defined $pad{7};
# Bit 7: 00x10 00100 x0111 10x10 011x1 01110 100x1 10101
  $oc{$pad{9}} = 1 if defined $pad{9};
  &qcode("${part}_x0111 = (!$pad{11}& $pad{12}& $pad{13}& $pad{14});\n") if defined $pad{9};
  &qcode("${part}_10x10 = ( $pad{10}&!$pad{11}& $pad{13}&!$pad{14});\n") if defined $pad{9};
  &qcode("${part}_10101 = ( $pad{10}&!$pad{11}& $pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{9};
  &ocassign($pad{9}, "!$pad{15} & (${part}_00x10#${part}_00100#${part}_x0111#${part}_10x10#${part}_011x1#${part}_01110#${part}_100x1#${part}_10101)") if defined $pad{9};
}
$hidden{'dec23001a1'} = 0;

sub dec23002a1 {
# Bit 0: 001x1 x0110 1111x 100x1 1x010 110x1 1x101 10111
  $oc{$pad{1}} = 1 if defined $pad{1};
  &qcode("${part}_001x1 = (!$pad{10}&!$pad{11}& $pad{12}& $pad{14});\n") if defined $pad{1};
  &qcode("${part}_x0110 = (!$pad{11}& $pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{1};
  &qcode("${part}_1111x = ( $pad{10}& $pad{11}& $pad{12}& $pad{13});\n") if defined $pad{1};
  &qcode("${part}_100x1 = ( $pad{10}&!$pad{11}&!$pad{12}& $pad{14});\n") if defined $pad{1};
  &qcode("${part}_1x010 = ( $pad{10}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{1};
  &qcode("${part}_110x1 = ( $pad{10}& $pad{11}&!$pad{12}& $pad{14});\n") if defined $pad{1};
  &qcode("${part}_1x101 = ( $pad{10}& $pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{1};
  &qcode("${part}_10111 = ( $pad{10}&!$pad{11}& $pad{12}& $pad{13}& $pad{14});\n") if defined $pad{1};
  &ocassign($pad{1}, "!$pad{15} & (${part}_001x1#${part}_x0110#${part}_1111x#${part}_100x1#${part}_1x010#${part}_110x1#${part}_1x101#${part}_10111)") if defined $pad{1};
# Bit 1: 0001x 1x101 00101 x1001 01010 10001
  $oc{$pad{2}} = 1 if defined $pad{2};
  &qcode("${part}_0001x = (!$pad{10}&!$pad{11}&!$pad{12}& $pad{13});\n") if defined $pad{2};
  &qcode("${part}_00101 = (!$pad{10}&!$pad{11}& $pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{2};
  &qcode("${part}_x1001 = ( $pad{11}&!$pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{2};
  &qcode("${part}_01010 = (!$pad{10}& $pad{11}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{2};
  &qcode("${part}_10001 = ( $pad{10}&!$pad{11}&!$pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{2};
  &ocassign($pad{2}, "!$pad{15} & (${part}_0001x#${part}_1x101#${part}_00101#${part}_x1001#${part}_01010#${part}_10001)") if defined $pad{2};
# Bit 2: 0001x 1x011 x1001 x1010 10001 10010
  $oc{$pad{3}} = 1 if defined $pad{3};
  &qcode("${part}_1x011 = ( $pad{10}&!$pad{12}& $pad{13}& $pad{14});\n") if defined $pad{3};
  &qcode("${part}_x1010 = ( $pad{11}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{3};
  &qcode("${part}_10010 = ( $pad{10}&!$pad{11}&!$pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{3};
  &ocassign($pad{3}, "!$pad{15} & (${part}_0001x#${part}_1x011#${part}_x1001#${part}_x1010#${part}_10001#${part}_10010)") if defined $pad{3};
# Bit 3: x0101 010x0 1111x 10001 11x00 1101x
  $oc{$pad{4}} = 1 if defined $pad{4};
  &qcode("${part}_x0101 = (!$pad{11}& $pad{12}&!$pad{13}& $pad{14});\n") if defined $pad{4};
  &qcode("${part}_010x0 = (!$pad{10}& $pad{11}&!$pad{12}&!$pad{14});\n") if defined $pad{4};
  &qcode("${part}_11x00 = ( $pad{10}& $pad{11}&!$pad{13}&!$pad{14});\n") if defined $pad{4};
  &qcode("${part}_1101x = ( $pad{10}& $pad{11}&!$pad{12}& $pad{13});\n") if defined $pad{4};
  &ocassign($pad{4}, "!$pad{15} & (${part}_x0101#${part}_010x0#${part}_1111x#${part}_10001#${part}_11x00#${part}_1101x)") if defined $pad{4};
# Bit 4: 0001x 11x11 001x1 00110 11x10 0100x 01100
  $oc{$pad{5}} = 1 if defined $pad{5};
  &qcode("${part}_11x11 = ( $pad{10}& $pad{11}& $pad{13}& $pad{14});\n") if defined $pad{5};
  &qcode("${part}_00110 = (!$pad{10}&!$pad{11}& $pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{5};
  &qcode("${part}_11x10 = ( $pad{10}& $pad{11}& $pad{13}&!$pad{14});\n") if defined $pad{5};
  &qcode("${part}_0100x = (!$pad{10}& $pad{11}&!$pad{12}&!$pad{13});\n") if defined $pad{5};
  &qcode("${part}_01100 = (!$pad{10}& $pad{11}& $pad{12}&!$pad{13}&!$pad{14});\n") if defined $pad{5};
  &ocassign($pad{5}, "!$pad{15} & (${part}_0001x#${part}_11x11#${part}_001x1#${part}_00110#${part}_11x10#${part}_0100x#${part}_01100)") if defined $pad{5};
# Bit 5: 0001x 1110x 0x100 1x011 10001 1x010 10100
  $oc{$pad{6}} = 1 if defined $pad{6};
  &qcode("${part}_1110x = ( $pad{10}& $pad{11}& $pad{12}&!$pad{13});\n") if defined $pad{6};
  &qcode("${part}_0x100 = (!$pad{10}& $pad{12}&!$pad{13}&!$pad{14});\n") if defined $pad{6};
  &qcode("${part}_10100 = ( $pad{10}&!$pad{11}& $pad{12}&!$pad{13}&!$pad{14});\n") if defined $pad{6};
  &ocassign($pad{6}, "!$pad{15} & (${part}_0001x#${part}_1110x#${part}_0x100#${part}_1x011#${part}_10001#${part}_1x010#${part}_10100)") if defined $pad{6};
# Bit 6: 0001x 1x011 011x1 01110 1x010 10001
  $oc{$pad{7}} = 1 if defined $pad{7};
  &qcode("${part}_011x1 = (!$pad{10}& $pad{11}& $pad{12}& $pad{14});\n") if defined $pad{7};
  &qcode("${part}_01110 = (!$pad{10}& $pad{11}& $pad{12}& $pad{13}&!$pad{14});\n") if defined $pad{7};
  &ocassign($pad{7}, "!$pad{15} & (${part}_0001x#${part}_1x011#${part}_011x1#${part}_01110#${part}_1x010#${part}_10001)") if defined $pad{7};
# Bit 7: 000x1 00x10 1111x 0010x 1110x 1x011 0x111 0110x 1011x 01110 10x01 10100 1x010
  $oc{$pad{9}} = 1 if defined $pad{9};
  &qcode("${part}_000x1 = (!$pad{10}&!$pad{11}&!$pad{12}& $pad{14});\n") if defined $pad{9};
  &qcode("${part}_00x10 = (!$pad{10}&!$pad{11}& $pad{13}&!$pad{14});\n") if defined $pad{9};
  &qcode("${part}_0010x = (!$pad{10}&!$pad{11}& $pad{12}&!$pad{13});\n") if defined $pad{9};
  &qcode("${part}_0x111 = (!$pad{10}& $pad{12}& $pad{13}& $pad{14});\n") if defined $pad{9};
  &qcode("${part}_0110x = (!$pad{10}& $pad{11}& $pad{12}&!$pad{13});\n") if defined $pad{9};
  &qcode("${part}_1011x = ( $pad{10}&!$pad{11}& $pad{12}& $pad{13});\n") if defined $pad{9};
  &qcode("${part}_10x01 = ( $pad{10}&!$pad{11}&!$pad{13}& $pad{14});\n") if defined $pad{9};
  &ocassign($pad{9}, "!$pad{15} & (${part}_000x1#${part}_00x10#${part}_1111x#${part}_0010x#${part}_1110x#${part}_1x011#${part}_0x111#${part}_0110x#${part}_1011x#${part}_01110#${part}_10x01#${part}_10100#${part}_1x010)") if defined $pad{9};
}
$hidden{'dec23002a1'} = 0;

sub mc8266 {
  &qcode("$pad{3} = !(!$pad{2}&!$pad{9} # $pad{1}&$pad{9}&!$pad{7});\n") if defined $pad{3};
  &qcode("$pad{4} = !(!$pad{5}&!$pad{9} # $pad{6}&$pad{9}&!$pad{7});\n") if defined $pad{4};
  &qcode("$pad{12} = !(!$pad{11}&!$pad{9} # $pad{10}&$pad{9}&!$pad{7});\n") if defined $pad{12};
  &qcode("$pad{13} = !(!$pad{14}&!$pad{9} # $pad{15}&$pad{9}&!$pad{7});\n") if defined $pad{13};
}
$hidden{'mc8266'} = 0;

# Note: Negative going clock transition!
sub mc8271 {
  # We need Qa..Qd even if their pads are NC.
  $pad{5} = &gnext unless defined $pad{5};
  $pad{7} = &gnext unless defined $pad{7};
  $pad{9} = &gnext unless defined $pad{9};
  $pad{11} = &gnext unless defined $pad{11};
  &pinnode($pad{5});
  &pinnode($pad{7});
  &pinnode($pad{9});
  &pinnode($pad{11});
  &qcode("$pad{5}.ar = !$pad{1};\n");
  &qcode("$pad{5}.d = $pad{4}&$pad{13} # $pad{3}&$pad{10}&!$pad{13} # $pad{5}&!$pad{10}&!$pad{13};\n");
  &qcode("$pad{5}.ck = !$pad{6};\n");
  &qcode("$pad{7}.ar = !$pad{1};\n");
  &qcode("$pad{7}.d = $pad{5}&$pad{13} # $pad{2}&$pad{10}&!$pad{13} # $pad{7}&!$pad{10}&!$pad{13};\n");
  &qcode("$pad{7}.ck = !$pad{6};\n");
  &qcode("$pad{9}.ar = !$pad{1};\n");
  &qcode("$pad{9}.d = $pad{7}&$pad{13} # $pad{15}&$pad{10}&!$pad{13} # $pad{9}&!$pad{10}&!$pad{13};\n");
  &qcode("$pad{9}.ck = !$pad{6};\n");
  &qcode("$pad{11}.ar = !$pad{1};\n");
  &qcode("$pad{11}.d = $pad{9}&$pad{13} # $pad{14}&$pad{10}&!$pad{13} # $pad{11}&!$pad{10}&!$pad{13};\n");
  &qcode("$pad{11}.ck = !$pad{6};\n");
  &qcode("$pad{12} = !$pad{11};\n") if defined $pad{12};
}
$hidden{'mc8271'} = 0;

sub ds75451n {
  &ocassign($pad{3}, "($pad{1} & $pad{2})") if defined $pad{3};
  &ocassign($pad{5}, "($pad{6} & $pad{7})") if defined $pad{5};
}
$hidden{'ds75451n'} = 0;

sub ds75452n {
  &ocassign($pad{3}, "!($pad{1} & $pad{2})") if defined $pad{3};
  &ocassign($pad{5}, "!($pad{6} & $pad{7})") if defined $pad{5};
}
$hidden{'ds75452n'} = 0;

sub ds8640n {
  &qcode("$pad{3} = !($pad{4} # $pad{5});\n") if defined $pad{3};
  &qcode("$pad{2} = !($pad{6} # $pad{7});\n") if defined $pad{2};
  &qcode("$pad{14} = !($pad{9} # $pad{10});\n") if defined $pad{14};
  &qcode("$pad{13} = !($pad{11} # $pad{12});\n") if defined $pad{13};
}
$hidden{'ds8640n'} = 0;

sub ds8641n {
  if (defined $pad{1}) {
    $oc{$pad{1}} = 1;
    &qcode("$pad{3} = !$pad{1};\n") if defined $pad{3};
    &ocassign($pad{1}, "$pad{2}&$pad{7}&$pad{9}");
  }
  if (defined $pad{4}) {
    $oc{$pad{4}} = 1;
    &qcode("$pad{6} = !$pad{4};\n") if defined $pad{6};
    &ocassign($pad{4}, "$pad{5}&$pad{7}&$pad{9}");
  }
  if (defined $pad{12}) {
    $oc{$pad{12}} = 1;
    &qcode("$pad{10} = !$pad{12};\n") if defined $pad{10};
    &ocassign($pad{12}, "$pad{11}&$pad{7}&$pad{9}");
  }
  if (defined $pad{15}) {
    $oc{$pad{15}} = 1;
    &qcode("$pad{13} = !$pad{15};\n") if defined $pad{13};
    &ocassign($pad{15}, "$pad{14}&$pad{7}&$pad{9}");
  }
}
$hidden{'ds8641n'} = 0;

sub n8815 {
  &qcode("!$pad{6} = $pad{1} # $pad{2} # $pad{4} # $pad{5};\n") if defined $pad{6};
  &qcode("!$pad{8} = $pad{9} # $pad{10} # $pad{12} # $pad{13};\n") if defined $pad{8};
}
$hidden{'n8815'} = 0;

sub ds8837n {
  &qcode("$pad{2} = !$pad{1} & !$pad{7};\n") if defined $pad{2};
  &qcode("$pad{4} = !$pad{3} & !$pad{7};\n") if defined $pad{4};
  &qcode("$pad{6} = !$pad{5} & !$pad{7};\n") if defined $pad{6};
  &qcode("$pad{10} = !$pad{11} & !$pad{9};\n") if defined $pad{10};
  &qcode("$pad{12} = !$pad{13} & !$pad{9};\n") if defined $pad{12};
  &qcode("$pad{14} = !$pad{15} & !$pad{9};\n") if defined $pad{14};
}
$hidden{'ds8837n'} = 0;

sub ds8881 {
  &ocassign($pad{1}, "$pad{2} & $pad{3}") if defined $pad{1};
  &ocassign($pad{4}, "$pad{5} & $pad{6}") if defined $pad{4};
  &ocassign($pad{10}, "$pad{8} & $pad{9}") if defined $pad{10};
  &ocassign($pad{13}, "$pad{11} & $pad{12}") if defined $pad{13};
}
$hidden{'ds8881'} = 0;

sub ds8881n {
  &ds8881;
}
$hidden{'ds8881n'} = 0;

sub n8881n {
  &ds8881;
}
$hidden{'n8881n'} = 0;

sub sp314 {
  &qcode("!$pad{3} = $pad{4} # $pad{5} # $pad{6} # $pad{9} # $pad{10} # $pad{11} # $pad{12};\n");
}
$hidden{'sp314'} = 0;

sub sp314n {
  &sp314;
}
$hidden{'sp314n'} = 0;

sub sp380 {
  &qcode("!$pad{3} = $pad{4} # $pad{5};\n") if defined $pad{3};
  &qcode("!$pad{2} = $pad{6} # $pad{7};\n") if defined $pad{2};
  &qcode("!$pad{14} = $pad{9} # $pad{10};\n") if defined $pad{14};
  &qcode("!$pad{13} = $pad{11} # $pad{12};\n") if defined $pad{13};
}
$hidden{'sp380'} = 0;

sub sp380n {
  &sp380;
}
$hidden{'sp380n'} = 0;

sub sp384 {
  &qcode("$pad{3} = $pad{4} # $pad{5};\n") if defined $pad{3};
  &qcode("$pad{2} = $pad{6} # $pad{7};\n") if defined $pad{2};
  &qcode("$pad{14} = $pad{9} # $pad{10};\n") if defined $pad{14};
  &qcode("$pad{13} = $pad{11} # $pad{12};\n") if defined $pad{13};
}
$hidden{'sp384'} = 0;

sub sp384n {
  &sp384;
}
$hidden{'sp384n'} = 0;

#
# Experimental section for dec-m module descriptions.
#
sub g792 {
  # The power connector has no logic function.
}
$hidden{'g792'} = 0;

sub g826 {
}

sub m113 {
  &qcode("$pad{'c1'} = !($pad{'a1'} & $pad{'b1'});\n") if defined $pad{'c1'};
  &qcode("$pad{'f1'} = !($pad{'d1'} & $pad{'e1'});\n") if defined $pad{'f1'};
  &qcode("$pad{'f2'} = !($pad{'d2'} & $pad{'e2'});\n") if defined $pad{'f2'};
  &qcode("$pad{'k1'} = !($pad{'h1'} & $pad{'j1'});\n") if defined $pad{'k1'};
  &qcode("$pad{'k2'} = !($pad{'h2'} & $pad{'j2'});\n") if defined $pad{'k2'};
  &qcode("$pad{'n1'} = !($pad{'l1'} & $pad{'m1'});\n") if defined $pad{'n1'};
  &qcode("$pad{'n2'} = !($pad{'l2'} & $pad{'m2'});\n") if defined $pad{'n2'};
  &qcode("$pad{'s1'} = !($pad{'p1'} & $pad{'r1'});\n") if defined $pad{'s1'};
  &qcode("$pad{'s2'} = !($pad{'p2'} & $pad{'r2'});\n") if defined $pad{'s2'};
  &qcode("$pad{'v2'} = !($pad{'t2'} & $pad{'u2'});\n") if defined $pad{'v2'};
  &qcode("$pad{'u1'} = 'b'1;\n") if defined $pad{'u1'};
  &qcode("$pad{'v1'} = 'b'1;\n") if defined $pad{'v1'};
}
$hidden{'m113'} = 0;

sub m115 {
  &qcode("$pad{'d1'} = !($pad{'a1'} & $pad{'b1'}) & $pad{'c1'});\n")
	if defined $pad{'d1'};
  &qcode("$pad{'j1'} = !($pad{'e1'} & $pad{'f1'}) & $pad{'h1'});\n")
	if defined $pad{'j1'};
  &qcode("$pad{'n1'} = !($pad{'k1'} & $pad{'l1'}) & $pad{'m1'});\n")
	if defined $pad{'n1'};
  &qcode("$pad{'u1'} = !($pad{'p1'} & $pad{'r1'}) & $pad{'s1'});\n")
	if defined $pad{'u1'};
  &qcode("$pad{'h2'} = !($pad{'d2'} & $pad{'e2'}) & $pad{'f2'});\n")
	if defined $pad{'h2'};
  &qcode("$pad{'m2'} = !($pad{'j2'} & $pad{'k2'}) & $pad{'l2'});\n")
	if defined $pad{'m2'};
  &qcode("$pad{'s2'} = !($pad{'n2'} & $pad{'p2'}) & $pad{'r2'});\n")
	if defined $pad{'s2'};
  &qcode("$pad{'v1'} = !($pad{'t2'} & $pad{'u2'}) & $pad{'v2'});\n")
	if defined $pad{'v1'};
}
$hidden{'m115'} = 0;

sub m117 {
  &qcode("$pad{'e1'} = !($pad{'a1'} & $pad{'b1'}) & $pad{'c1'}) & $pad{'d1'});\n") if defined $pad{'e1'};
  &qcode("$pad{'l1'} = !($pad{'f1'} & $pad{'j1'}) & $pad{'j1'}) & $pad{'k1'});\n") if defined $pad{'l1'};
  &qcode("$pad{'s1'} = !($pad{'m1'} & $pad{'n1'}) & $pad{'p1'}) & $pad{'r1'});\n") if defined $pad{'s1'};
  &qcode("$pad{'j2'} = !($pad{'d2'} & $pad{'e2'}) & $pad{'f2'}) & $pad{'h2'});\n") if defined $pad{'j2'};
  &qcode("$pad{'p2'} = !($pad{'k2'} & $pad{'l2'}) & $pad{'m2'}) & $pad{'n2'});\n") if defined $pad{'p2'};
  &qcode("$pad{'v2'} = !($pad{'r2'} & $pad{'s2'}) & $pad{'t2'}) & $pad{'u2'});\n") if defined $pad{'v2'};
  &qcode("$pad{'u1'} = 'b'1;\n") if defined $pad{'u1'};
  &qcode("$pad{'v1'} = 'b'1;\n") if defined $pad{'v1'};
}
$hidden{'m117'} = 0;

sub m119 {
  &qcode("$pad{'j2'} = !($pad{'a1'} & $pad{'b1'}) & $pad{'c1'}) & $pad{'d1'} & $pad{'d2'} & $pad{'e2'}) & $pad{'f2'}) & $pad{'h2'});\n") if defined $pad{'j2'};
  &qcode("$pad{'p2'} = !($pad{'f1'} & $pad{'h1'}) & $pad{'j1'}) & $pad{'k1'} & $pad{'k2'} & $pad{'l2'}) & $pad{'m2'}) & $pad{'n2'});\n") if defined $pad{'p2'};
  &qcode("$pad{'v2'} = !($pad{'m1'} & $pad{'n1'}) & $pad{'p1'}) & $pad{'r1'} & $pad{'r2'} & $pad{'s2'}) & $pad{'t2'}) & $pad{'u2'});\n") if defined $pad{'v2'};
  &qcode("$pad{'u1'} = 'b'1;\n") if defined $pad{'u1'};
  &qcode("$pad{'v1'} = 'b'1;\n") if defined $pad{'v1'};
}
$hidden{'m119'} = 0;

sub m160 {
  # And-or-invert gates
  if (defined $pad{'r1'}) {
    &qcode("$pad{'r1'} = !($pad{'a1'}&$pad{'b1'}&$pad{'c1'}&$pad{'d1'}\n");
    &qcode("              #$pad{'e1'}&$pad{'f1'}\n");
    &qcode("              #$pad{'h1'}&$pad{'j1'}\n");
    &qcode("              #$pad{'l1'}&$pad{'k1'}\n");
    &qcode("              #$pad{'m1'}&$pad{'n1'}&$pad{'p1'};\n");
  }
  if (defined $pad{'t2'}) {
    &qcode("$pad{'t2'} = !($pad{'d2'}&$pad{'e2'}&$pad{'f2'}&$pad{'h2'}\n");
    &qcode("              #$pad{'j2'}&$pad{'k2'}\n");
    &qcode("              #$pad{'l2'}&$pad{'m2'}\n");
    &qcode("              #$pad{'n2'}&$pad{'p2'}&$pad{'r2'}&$pad{'s2'};\n");
  }
  if (defined $pad{'v2'}) {
    &qcode("$pad{'v2'} = !($pad{'s1'}&$pad{'u1'}\n");
    &qcode("              #$pad{'v1'}&$pad{'u2'};\n");
  }
}
$hidden{'m160'} = 0;

sub m162 {
}

sub m216 {
  if (defined $pad{'f1'} && !defined $pad{'e1'}) {
    &pinnode($pad{'f1'});
    &qcode("$pad{'f1'}.ap = !$pad{'a1'};\n") if defined $pad{'a1'};
    &qcode("$pad{'f1'}.d = !$pad{'c1'};\n") if defined $pad{'c1'};
    &qcode("$pad{'f1'}.ck = $pad{'b1'};\n");
    &qcode("$pad{'f1'}.ar = !$pad{'d1'};\n") if defined $pad{'d1'};
  } elsif (defined $pad{'e1'}) {
    &pinnode($pad{'e1'});
    &qcode("$pad{'e1'}.ar = !$pad{'a1'};\n") if defined $pad{'a1'};
    &qcode("$pad{'e1'}.d = $pad{'c1'};\n") if defined $pad{'c1'};
    &qcode("$pad{'e1'}.ck = $pad{'b1'};\n");
    &qcode("$pad{'e1'}.ap = !$pad{'d1'};\n") if defined $pad{'d1'};
    &qcode("$pad{'f1'} = !$pad{'e1'};\n") if defined $pad{'f1'};
  }
  if (defined $pad{'j2'} && !defined $pad{'h2'}) {
    &pinnode($pad{'j2'});
    &qcode("$pad{'j2'}.ap = !$pad{'a1'};\n") if defined $pad{'a1'};
    &qcode("$pad{'j2'}.d = !$pad{'e2'};\n") if defined $pad{'e2'};
    &qcode("$pad{'j2'}.ck = $pad{'d2'};\n");
    &qcode("$pad{'j2'}.ar = !$pad{'f2'};\n") if defined $pad{'f2'};
  } elsif (defined $pad{'h2'}) {
    &pinnode($pad{'h2'});
    &qcode("$pad{'h2'}.ar = !$pad{'a1'};\n") if defined $pad{'a1'};
    &qcode("$pad{'h2'}.d = $pad{'e2'};\n") if defined $pad{'e2'};
    &qcode("$pad{'h2'}.ck = $pad{'d2'};\n");
    &qcode("$pad{'h2'}.ap = !$pad{'f2'};\n") if defined $pad{'f2'};
    &qcode("$pad{'j2'} = !$pad{'h2'};\n") if defined $pad{'j2'};
  }
  if (defined $pad{'m1'} && !defined $pad{'l1'}) {
    &pinnode($pad{'m1'});
    &qcode("$pad{'m1'}.ap = !$pad{'a1'};\n") if defined $pad{'a1'};
    &qcode("$pad{'m1'}.d = !$pad{'j1'};\n") if defined $pad{'j1'};
    &qcode("$pad{'m1'}.ck = $pad{'h1'};\n");
    &qcode("$pad{'m1'}.ar = !$pad{'k1'};\n") if defined $pad{'k1'};
  } elsif (defined $pad{'l1'}) {
    &pinnode($pad{'l1'});
    &qcode("$pad{'l1'}.ar = !$pad{'a1'};\n") if defined $pad{'a1'};
    &qcode("$pad{'l1'}.d = $pad{'j1'};\n") if defined $pad{'j1'};
    &qcode("$pad{'l1'}.ck = $pad{'h1'};\n");
    &qcode("$pad{'l1'}.ap = !$pad{'k1'};\n") if defined $pad{'k1'};
    &qcode("$pad{'m1'} = !$pad{'l1'};\n") if defined $pad{'m1'};
  }
  if (defined $pad{'r2'} && !defined $pad{'p2'}) {
    &pinnode($pad{'r2'});
    &qcode("$pad{'r2'}.ap = !$pad{'k2'};\n") if defined $pad{'k2'};
    &qcode("$pad{'r2'}.d = !$pad{'m2'};\n") if defined $pad{'m2'};
    &qcode("$pad{'r2'}.ck = $pad{'l2'};\n");
    &qcode("$pad{'r2'}.ar = !$pad{'n2'};\n") if defined $pad{'n2'};
  } elsif (defined $pad{'p2'}) {
    &pinnode($pad{'p2'});
    &qcode("$pad{'p2'}.ar = !$pad{'k2'};\n") if defined $pad{'k2'};
    &qcode("$pad{'p2'}.d = $pad{'m2'};\n") if defined $pad{'m2'};
    &qcode("$pad{'p2'}.ck = $pad{'l2'};\n");
    &qcode("$pad{'p2'}.ap = !$pad{'n2'};\n") if defined $pad{'n2'};
    &qcode("$pad{'r2'} = !$pad{'p2'};\n") if defined $pad{'r2'};
  }
  if (defined $pad{'u1'} && !defined $pad{'s1'}) {
    &pinnode($pad{'u1'});
    &qcode("$pad{'u1'}.ap = !$pad{'k2'};\n") if defined $pad{'k2'};
    &qcode("$pad{'u1'}.d = !$pad{'p1'};\n") if defined $pad{'p1'};
    &qcode("$pad{'u1'}.ck = $pad{'n1'};\n");
    &qcode("$pad{'u1'}.ar = !$pad{'r1'};\n") if defined $pad{'r1'};
  } elsif (defined $pad{'s1'}) {
    &pinnode($pad{'s1'});
    &qcode("$pad{'s1'}.ar = !$pad{'k2'};\n") if defined $pad{'k2'};
    &qcode("$pad{'s1'}.d = $pad{'p1'};\n") if defined $pad{'p1'};
    &qcode("$pad{'s1'}.ck = $pad{'n1'};\n");
    &qcode("$pad{'s1'}.ap = !$pad{'r1'};\n") if defined $pad{'r1'};
    &qcode("$pad{'u1'} = !$pad{'s1'};\n") if defined $pad{'u1'};
  }
  if (defined $pad{'v1'} && !defined $pad{'v2'}) {
    &pinnode($pad{'v1'});
    &qcode("$pad{'v1'}.ap = !$pad{'k2'};\n") if defined $pad{'k2'};
    &qcode("$pad{'v1'}.d = !$pad{'t2'};\n") if defined $pad{'t2'};
    &qcode("$pad{'v1'}.ck = $pad{'s2'};\n");
    &qcode("$pad{'v1'}.ar = !$pad{'u2'};\n") if defined $pad{'u2'};
  } elsif (defined $pad{'v2'}) {
    &pinnode($pad{'v2'});
    &qcode("$pad{'v2'}.ar = !$pad{'k2'};\n") if defined $pad{'k2'};
    &qcode("$pad{'v2'}.d = $pad{'t2'};\n") if defined $pad{'t2'};
    &qcode("$pad{'v2'}.ck = $pad{'s2'};\n");
    &qcode("$pad{'v2'}.ap = !$pad{'u2'};\n") if defined $pad{'u2'};
    &qcode("$pad{'v1'} = !$pad{'v2'};\n") if defined $pad{'v1'};
  }
}
$hidden{'m216'} = 0;

sub m220 {
  # Get some local nodes
  $t1x = &gnext;
  $t5x = &gnext;
  $t8x = &gnext;
  $t12x = &gnext;
  $t14x = &gnext;
  # KLUDGE: Make a name for aj1 and ak2, if one is lacking.
  if (!defined $pad{'aj1'}) {
    $pad{'aj1'} = $pad{'ae2'}; $pad{'aj1'} =~ s/adder/reg_bus/;
  }
  if (!defined $pad{'ak2'}) {
    $pad{'ak2'} = $pad{'af1'}; $pad{'ak2'} =~ s/adder/reg_bus/;
  }
  # Emit some code
  &qcode("!$pad{'aj1'} = $pad{'ad2'}&$pad{'ac1'} # $pad{'ae1'}&$pad{'ae2'} # $pad{'af1'}&$pad{'af2'} # $pad{'ad1'}&$pad{'ab1'} # $pad{'au2'}&$pad{'aa1'} # $pad{'ah2'}&$pad{'ah1'} # $pad{'bb2'}&!$pad{'ab2'};\n");
  &qcode("!$pad{'ak2'} = $pad{'ah2'}&$pad{'af2'} # $pad{'af1'}&$pad{'ae1'} # $pad{'ae2'}&$pad{'ad2'} # $pad{'ad1'}&$pad{'ac1'} # $pad{'as1'}&$pad{'aa1'} # $pad{'aj2'}&$pad{'ah1'} # $pad{'af1'}&!$pad{'ab2'};\n");
  # KLUDGE: Make a name for am2 and al2, if it is missing.
  if (!defined $pad{'am2'}) {
    $pad{'am2'} = $pad{'am1'}; $pad{'am2'} =~ s/_l$//;
    &pinnode($pad{'am2'});
  }
  if (!defined $pad{'al2'}) {
    $pad{'al2'} = $pad{'al1'}; $pad{'al2'} =~ s/_l$//;
    &pinnode($pad{'al2'});
  }
  # KLUDGE: Make a name for ap1 and an1, if it is missing.
  if (!defined $pad{'ap1'}) {
    $pad{'ap1'} = $pad{'ar2'}; $pad{'ap1'} =~ s/_l$//;
    &pinnode($pad{'ap1'});
  }
  if (!defined $pad{'an1'}) {
    $pad{'an1'} = $pad{'ap2'}; $pad{'an1'} =~ s/_l$//;
    &pinnode($pad{'an1'});
  }
  &qcode("$pad{'am2'}.d = $pad{'aj1'};\n");
  &qcode("$pad{'am2'}.ck = $pad{'ak1'};\n");
  &qcode("$pad{'am1'} = !$pad{'am2'};\n");
  &qcode("$pad{'al2'}.d = $pad{'ak2'};\n");
  &qcode("$pad{'al2'}.ck = $pad{'ak1'};\n");
  &qcode("$pad{'al1'} = !$pad{'al2'};\n");
  &qcode("$pad{'at2'}.d = $pad{'aj1'};\n");
  &qcode("$pad{'at2'}.ck = $pad{'ar1'};\n");
  &qcode("$pad{'au2'} = !$pad{'at2'};\n");
  &qcode("$pad{'as2'}.d = $pad{'ak2'};\n");
  &qcode("$pad{'as2'}.ck = $pad{'ar1'};\n");
  &qcode("$pad{'as1'} = !$pad{'as2'};\n");
  &qcode("$pad{'ap1'}.d = $pad{'aj1'};\n");
  &qcode("$pad{'ap1'}.ck = $pad{'an2'};\n");
  &qcode("$pad{'ar2'} = !$pad{'ap1'};\n");
  &qcode("$pad{'an1'}.d = $pad{'ak2'};\n");
  &qcode("$pad{'an1'}.ck = $pad{'an2'};\n");
  &qcode("$pad{'ap2'} = !$pad{'an1'};\n");
  &qcode("$pad{'ba1'}.d = $pad{'aj1'};\n");
  &qcode("$pad{'ba1'}.ck = $pad{'au1'};\n");
  &qcode("$pad{'bb1'} = !$pad{'ba1'};\n");
  &qcode("$pad{'av1'}.d = $pad{'ak2'};\n");
  &qcode("$pad{'av1'}.ck = $pad{'au1'};\n");
  &qcode("$pad{'av2'} = !$pad{'av1'};\n");
  &qcode("!$t8x = $pad{'be2'} # $pad{'av1'}&$pad{'bh2'} # $pad{'av2'}&$pad{'bj2'} # $pad{'bn2'}&$pad{'bf1'} # $pad{'bc1'}&$pad{'bd2'} # $pad{'bn1'}&$pad{'bf2'} # $pad{'bp2'}&$pad{'bl1'} # $pad{'bm1'}&$pad{'bl2'};\n");
  &qcode("$pad{'af1'} = $pad{'bj1'} $ $t8x $ $t14x;\n");
  &qcode("$t1x = $pad{'bj1'}&$t8x # $t8x&$t14x # $pad{'bj1'}&$t14x;\n");
  &qcode("$pad{'ae2'} = $t12x $ $t5x $ $t1x;\n");
  &qcode("$pad{'bk2'} = $t1x&$t12x # $t12x&$t5x # $t5x&$t1x;\n");
  &qcode("!$t5x = $pad{'bc1'}&$pad{'be1'} # $pad{'bd1'}&$pad{'bf2'} # $pad{'bm2'}&$pad{'bl1'} # $pad{'bk1'}&$pad{'bl2'} # $pad{'ba1'}&$pad{'bh2'} # $pad{'bb1'}&$pad{'bj2'} # $pad{'bh1'}&$pad{'bf1'};\n");
  &qcode("!$t12x = $pad{'bp1'}&$pad{'am2'} # $pad{'ap1'}&$pad{'bs2'} # $pad{'br1'}&$pad{'bu2'} # $pad{'bs1'}&$pad{'bt2'};\n");
  &qcode("!$t14x = $pad{'br2'}&$pad{'al2'} # $pad{'an1'}&$pad{'bs2'} # $pad{'bv2'}&$pad{'bv1'} # $pag{'bu1'}&$pad{'bt2'};\n");
}
$hidden{'m220'} = 0;

sub m310 {
}

sub m516 {
  &qcode("$pad{'e1'} = !(!$pad{'a1'} & $pad{'b1'} & $pad{'c1'} & $pad{'d1'});\n")
    if defined $pad{'e1'};
  &qcode("$pad{'l1'} = !(!$pad{'f1'} & $pad{'h1'} & $pad{'j1'} & $pad{'k1'});\n")
    if defined $pad{'l1'};
  &qcode("$pad{'s1'} = !(!$pad{'m1'} & $pad{'n1'} & $pad{'p1'} & $pad{'r1'});\n")
    if defined $pad{'s1'};
  &qcode("$pad{'j2'} = !(!$pad{'d2'} & $pad{'e2'} & $pad{'f2'} & $pad{'h2'});\n")
    if defined $pad{'j2'};
  &qcode("$pad{'p2'} = !(!$pad{'k2'} & $pad{'l2'} & $pad{'m2'} & $pad{'n2'});\n")
    if defined $pad{'p2'};
  &qcode("$pad{'v2'} = !(!$pad{'r2'} & $pad{'s2'} & $pad{'t2'} & $pad{'u2'});\n")
    if defined $pad{'v2'};
  # BUGBUG: The hard bit of these are modeling the input pull-ups.
  # We cheat here, and pull them up if they are un-named signals.
  # Named signals are marked input..
  $con{$pad{'b1'}} = 1 if $pad{'b1'} !~ /^n_t_/;
  $con{$pad{'h1'}} = 1 if $pad{'h1'} !~ /^n_t_/;
  $con{$pad{'n1'}} = 1 if $pad{'n1'} !~ /^n_t_/;
  $con{$pad{'e2'}} = 1 if $pad{'e2'} !~ /^n_t_/;
  $con{$pad{'l2'}} = 1 if $pad{'l2'} !~ /^n_t_/;
  $con{$pad{'s2'}} = 1 if $pad{'s2'} !~ /^n_t_/;
  $in{$pad{'b1'}} = 1 if $pad{'b1'} !~ /^n_t_/;
  $in{$pad{'h1'}} = 1 if $pad{'h1'} !~ /^n_t_/;
  $in{$pad{'n1'}} = 1 if $pad{'n1'} !~ /^n_t_/;
  $in{$pad{'e2'}} = 1 if $pad{'e2'} !~ /^n_t_/;
  $in{$pad{'l2'}} = 1 if $pad{'l2'} !~ /^n_t_/;
  $in{$pad{'s2'}} = 1 if $pad{'s2'} !~ /^n_t_/;
  $signals{$pad{'b1'}} = 1 if $pad{'b1'} !~ /^n_t_/;
  $signals{$pad{'h1'}} = 1 if $pad{'h1'} !~ /^n_t_/;
  $signals{$pad{'n1'}} = 1 if $pad{'n1'} !~ /^n_t_/;
  $signals{$pad{'e2'}} = 1 if $pad{'e2'} !~ /^n_t_/;
  $signals{$pad{'l2'}} = 1 if $pad{'l2'} !~ /^n_t_/;
  $signals{$pad{'s2'}} = 1 if $pad{'s2'} !~ /^n_t_/;
  &qcode("$pad{'b1'} = 'b'1;\n") if $pad{'b1'} =~ /^n_t_/;
  &qcode("$pad{'h1'} = 'b'1;\n") if $pad{'h1'} =~ /^n_t_/;
  &qcode("$pad{'n1'} = 'b'1;\n") if $pad{'n1'} =~ /^n_t_/;
  &qcode("$pad{'e2'} = 'b'1;\n") if $pad{'e2'} =~ /^n_t_/;
  &qcode("$pad{'l2'} = 'b'1;\n") if $pad{'l2'} =~ /^n_t_/;
  &qcode("$pad{'s2'} = 'b'1;\n") if $pad{'s2'} =~ /^n_t_/;
}
$hidden{'m516'} = 0;
sub m506 {
  # BUGBUG: No negative logic!!
  &m516; # Silently substitute an m516.
}
$hidden{'m506'} = 0;

sub m617 {
  &qcode("$pad{'e1'} = $pad{'a1'} & $pad{'b1'} & $pad{'c1'} & $pad{'d1'};\n")
    if defined $pad{'e1'};
  &qcode("$pad{'l1'} = $pad{'f1'} & $pad{'h1'} & $pad{'j1'} & $pad{'k1'};\n")
    if defined $pad{'l1'};
  &qcode("$pad{'s1'} = $pad{'m1'} & $pad{'n1'} & $pad{'p1'} & $pad{'r1'};\n")
    if defined $pad{'s1'};
  &qcode("$pad{'j2'} = $pad{'d2'} & $pad{'e2'} & $pad{'f2'} & $pad{'h2'};\n")
    if defined $pad{'j2'};
  &qcode("$pad{'p2'} = $pad{'k2'} & $pad{'l2'} & $pad{'m2'} & $pad{'n2'};\n")
    if defined $pad{'p2'};
  &qcode("$pad{'v2'} = $pad{'r2'} & $pad{'s2'} & $pad{'t2'} & $pad{'u2'};\n")
    if defined $pad{'v2'};
  &qcode("$pad{'u1'} = 'b'1;\n") if defined $pad{'u1'};
  &qcode("$pad{'v1'} = 'b'1;\n") if defined $pad{'v1'};
}
$hidden{'m617'} = 0;

sub m660 {
  &qcode("$pad{'d2'} = !($pad{'h2'} & $pad{'j2'});\n") if defined $pad{'d2'};
  &qcode("$pad{'k2'} = !($pad{'n2'} & $pad{'p2'});\n") if defined $pad{'k2'};
  &qcode("$pad{'s2'} = !($pad{'u2'} & $pad{'v2'});\n") if defined $pad{'s2'};
}
$hidden{'m660'} = 0;

sub m661 {
  &qcode("$pad{'d2'} = !$pad{'f2'} & $pad{'h2'} & $pad{'j2'};\n")
    if defined $pad{'d2'};
  &qcode("$pad{'k2'} = !$pad{'m2'} & $pad{'n2'} & $pad{'p2'};\n")
    if defined $pad{'k2'};
  &qcode("$pad{'s2'} = !$pad{'t2'} & $pad{'u2'} & $pad{'v2'};\n")
    if defined $pad{'s2'};
}
$hidden{'m661'} = 0;
sub m650 {
  # BUGBUG: No negative logic!!
  &m661; # Silently substitute an m661.
}
$hidden{'m650'} = 0;

sub empty {
}
$hidden{'empty'} = 0;


# Capacitors generate warnings unless connected across supplies.
sub c_us {
  warn "warning: non-bypass capacitor deleted: $part\n"
    unless $pad{'1'} =~ /'/ && $pad{'2'} =~ /'/;
}
$hidden{'c_us'} = 0;

sub cpol_use {
  warn "warning: non-bypass capacitor deleted: $part\n"
    unless $pad{'+'} =~ /'/ && $pad{'-'} =~ /'/;
}
$hidden{'cpol_use'} = 0;

# Resistors generate a warning unless one of their pins is 
# a supply pin.
sub r_us_ {
  local($tmp) = $pad{1};
  $tmp = $pad{2} unless $tmp =~ /'/;
  warn "warning: non-pullup resistor deleted: $part\n" unless $tmp =~ /'/;
  return unless $tmp =~ /'/;
  $tmp = $pad{1};
  $tmp = $pad{2} if $tmp =~ /'/;
  &qcode("$tmp = 'b'1;\n") if !$out{$tmp} && !defined $con{$tmp};
}
$hidden{'r_us_'} = 0;

#
# Assignments for OC pins are required to be of the form:
# !$lh = $rh;
# Since it is illegal in CUPL to assign a symbol more than 
# once, we pool these here, and ultimately generate:
# $lh = 'b'0;
# $lh.oe = ($rh1) # ... # ($rhn);
# to get open collector behavior.
#
%ocassign = ();
sub ocassign {
  local($lh, $rh) = @_;

  local($_) = $rh; s/\r*\n//g;
  local($indent) = $lh; $indent =~ s/./ /g;
#warn "info: edebug is $edebug\n";
  $rh = &expression($indent);
  warn "unexpected OC output: $lh" unless $oc{$lh};
  &qcode("/* $lh = !($rh);");
  $qcode =~ s/\r*\n$//;
  &qcode(" */\n");
  if (defined $ocassign{$lh}) {
    $ocassign{$lh} .= "\n$indent # ($rh)";
  } else {
    $ocassign{$lh} = "($rh)";
  }
}

#
# The argument is the basename for the project.
#
$stem = $ARGV[0] || die "usage: $0 <project>";

#
# Read the Part List.  Remember the part's device/value, 
# and whether it is a connector.
# Also assemble a list of devices used.
#
 
%partlist = %connector = ();
%used = ();

open(INPUT, "${stem}prts.txt") || die "${stem}prts.txt (partlist): $!";
while (<INPUT>) {
  last if /^Part\s/;
}
while (<INPUT>) {
  y/A-Z/a-z/;
  if (/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/) {
    ($part, $value, $device, $pack, $lib, $foo) = ($1, $2, $3, $4, $5, $6);
    ($device, $pack, $lib) = ($pack, $lib, $foo) if $device =~ /[%]/;
  } else {
    next unless /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
    ($part, $value, $device, $pack, $lib) = ($1, $2, $3, $4, $5);
  }
  if (($lib eq "rcl") || $device eq "c-us") {
    # Value is set, but not needed.  Also, numeric part of the
    # device name encodes the package size, which is not needed.
    $device =~ s/\d.*//;
    $value = $device;
  }
#print STDERR "'$part' '$value' '$device' '$pack' '$lib'\n" if $part eq 'r35';
  $part =~ s/-/_/g;
  $value =~ s/-/_/g;
  $device =~ s/-/_/g;
# next if $value =~ /^sw_dip/;
  $device = $value if $value =~ /^ma\d+_\d/;
  next unless $part =~ /\w+/;
  next unless $value =~ /\w+/;
  next unless $device =~ /\w+/;
  $device =~ s/x$//;
  $device =~ s/-array$//;
  $value = 'cpol_use' if $device =~ /^cpol/;
  $value = $device if $device eq 'r';
  $value = $device if $device =~ /^r-us/;
  warn "info: $value ne $device\n" unless $value eq $device;
  next if $value eq "spare";
  $value =~ s:/.*::;
  $value =~ s/^74s/74/;
  $value =~ s/^74ls/74/;
  $value =~ s/^lm(.*)n/lm\1/;
  $value =~ s/^74(.*)n/sn74\1/;
  $value =~ s/^(\d*74\d*)$/sn\1/;
  $value =~ s/^(\d*88\d*)$/ds\1/;
  $value =~ s/^74(.*)/sn74\1n/;
  $partlist{$part} = $value;
  #
  # This is probably made redundant by the assumption that, if we
  # don't have code for it, it should be made a connector.
  #
  $connector{$part} = ($pack =~ /^con-/);
  $connector{$part} = 1 if $pack =~ /^wirepad$/;
  $connector{$part} = 1 if $pack =~ /^do35-/;
  $connector{$part} = 1 if $pack =~ /^to5$/;
  $connector{$part} = 1 if $device =~ /^edg/;
  $connector{$part} = 1 if $pack =~ /^edg/;
  $connector{$part} = 1 if $device =~ /^j5mm/;
  $connector{$part} = 1 if $device =~ /^j10mm/;
  $connector{$part} = 1 if $device =~ /^jumper4/;
  $connector{$part} = 1 if $device =~ /^dec40pin/;
  $connector{$part} = 1 if $device =~ /^b3f/;
  $connector{$part} = 1 if $device =~ /^0r2/;
  $connector{$part} = 1 if $device =~ /^275p$/;
  $connector{$part} = 1 if $device =~ /^g09r/;
# $connector{$part} = 1 if $device =~ /^74123/; # BUGBUG vrs kludge
# $connector{$part} = 1 if $device =~ /^9601/; # BUGBUG vrs kludge
# $connector{$part} = 1 if $device =~ /^m916$/;
# $connector{$part} = 1 if $device =~ /^m708$/; # BUGBUG vrs kludge
# $connector{$part} = 1 if $device =~ /^m709$/; # BUGBUG vrs kludge
  $connector{$part} = 1 if $device =~ /^w\d\d\d$/;
  # If we will be unable to translate it later, mark it a connector now.
  warn "warning: making $part/$value/$hidden{$value} a connector\n"
    unless defined $hidden{$value};
  $connector{$part} = 1 unless defined $hidden{$value};
  $used{$value} = 1;
}

#
# Sometimes, we need to generate a signal name that 
# wasn't in the Eagle model.  Do that here.
$gnext = 0;
sub gnext {
  return "gdollar_" . $gnext++;
}

#
# Map a signal name from Eagle to something legal 
# in  CUPL.
#
$renamed = 0;
%eagle2pld = ();
sub eagle2pld {
  local($eagle) = @_;
  return $eagle2pld{$eagle} if defined $eagle2pld{$eagle};

  local($signal) = $eagle;
  # Fix up signal name.
  $signal = "'b'1" if $signal eq "vcc";
  $signal = "'b'0" if $signal eq "gnd";
  $signal =~ s/^[\+]//;
  $signal =~ s/_$/_l/;
  $signal =~ s/_low$/_l/;
  $signal =~ s/[.]/_/;
  $signal =~ s/[\(]/_lp_/g;
  $signal =~ s/[\)]/_rp_/g;
  $signal =~ s/[\[]/_lb_/g;
  $signal =~ s/[\]]/_rb_/g;
  $signal =~ s/[\\]/_l/g;
  $signal =~ s/^!(.*)/\1_l/g;
  $signal =~ s/[\+]/_or_/g;
  $signal =~ s/[\*]/_and_/g unless $signal =~ /^[*]/;
  $signal =~ s/[\-@\/]/_/g;
  $signal =~ s/[\$]/_t_/;
  $signal =~ s/^(n_t_\d+)$/\1x/;
  $signal =~ s/\\$/_l/;
  $signal =~ s/__+/_/g;
  $signal =~ s/^_//;
  $signal =~ s/_$//;
  $signal = 'and_h' if $signal eq 'and';
  $signal = 'end_h' if $signal eq 'end';
  $signal =~ s/^/n/ if $signal =~ /^\d/;
  # CUPL symbol names are limited to about 60 characters.
  if (length($signal) > 60) {
    &qcode("/* Converted name $signal is too long. */\n");
    $signal = "renamed" . $renamed++;
    &qcode("/* ... using name $signal instead. */\n");
  }
  $eagle2pld{$eagle} = $signal;
  return $signal;
}

#
# Scan the pin file, keeping track of which pin directions
# are used for which signals.
#
%in = %out = %con = ();
open(INPUT, "${stem}pins.txt") || die "${stem}pins.txt (pinlist): $!";
while (<INPUT>) {
  last if /^Part/;
}
undef $part;
while (<INPUT>) {
  chop;
  s/\r$//;
  y/A-Z/a-z/;
  if (/^$/) {
    undef $part;
    next;
  }
  if (/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/) {
    # Some parts are in the board, but not the schematic.
    # (Ignore them).
    ($p, $pad, $pin, $dir, $signal) = ($1, $2, $3, $4, $5);
    $p =~ s/-/_/g;
    next unless defined $partlist{$p};
    $part = $p;
    undef %pin;
  } else {
    die "$_" unless /^\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
    ($pad, $pin, $dir, $signal) = ($1, $2, $3, $4);
    next unless $part;
  }
  $signal = &eagle2pld($signal); # Fix up signal name.
  if ($connector{$part}) {
    # Just make a note of signals that go to a connector pin.
    $con{$signal} = 1;
#   next;
  }
  # Fix numeric pad names.
  $pad =~ s/^/p/ if $pad =~ /^\d/;
  # Fix numeric pin names.
  $pin =~ s/^/y/ if $pin =~ /^\d/;
  # Kludge to use pin name (but make it unique).
  $pin{$pin} = 0 unless defined $pin{$pin};
  # Kludge for distant 'g' and 'a' pins on sn74240.
  $pin{$pin} = !$pin{$pin} if $partlist{$part} =~ /sn7424./ && $pin eq 'g';
  $pin{$pin} = !$pin{$pin} if $partlist{$part} =~ /sn7424./ && $pin =~ /^a/;
#VRS
# $pad = "${pin}_$pin{$pin}";
# $pad = $pin unless $pin{$pin};
  $pin{$pin}++;
  $pad =~ s/[\\]/_not/;
  # Ignore passive and power pins
  # Direction may be NC | IN | OUT | I/O | OC | HIZ | SUP | PAS | PWR | SUP
  next if $dir eq 'pas';
  next if $dir eq 'pwr';
  # Ignore unconnected pins.
  next if $signal =~ /^[\*]/;
  next if $signal =~ /^nc$/;
  # Make note of which signals are read and written.
  $in{$signal} = 1 if $dir eq 'in';
  $out{$signal} = 1 if $dir eq 'out';
  $out{$signal} = 1 if $dir eq 'i/o';
  $out{$signal} = 1 if $dir eq 'io';
  $oc{$signal} = 1 if $dir eq 'oc';
  $out{$signal} = 1 if $dir eq 'oc';
  $out{$signal} = 1 if $dir eq 'hiz';
  $signals{$signal} = 1;
}

#
# Create the output file and output the pin descriptions.
#
open(STDOUT, ">$stem.PLD") || die "$stem.PLD: $!";

($_, $_, $_, $mday, $month, $year, $_) = localtime(time);
$month++;
$year += 1900;

print "/* This file is generated by topld.pl!! */\r\n";
print "/* Please don't edit it. */\r\n\r\n";
print <<HERE;
Name     $stem ;\r
PartNo   cpld ;\r
Date     $month/$mday/$year ;\r
Revision 01 ;\r
Designer  ;\r
Company   ;\r
Assembly None ;\r
Location E1 ;\r
Device   f1508isptqfp100;\r
HERE
print "\r\n\$DEFINE OPTIMIZE\r\n";
print "\r\n\$UNDEF  OPTIMIZE\r\n";
print "\r\n";
print "/* Input Pins */\r\n";
foreach (sort keys %signals) {
  next if $_ eq "'b'1";
  next if $_ eq "'b'0";
  if (defined($con{$_})) {
    print "pin = $_;\r\n" if defined $in{$_} && !defined $out{$_};
  }
}
print "\r\n";
print "/* Output Pins */\r\n";
foreach (sort keys %signals) {
  next if $_ eq "'b'1";
  next if $_ eq "'b'0";
  if (defined($con{$_})) {
    print "pin = $_;\r\n" if defined $out{$_};
  }
}

#
# Scan the pin file again, instantiating various devices.
#
&qcode("\n/* Equations */\r\n");
open(INPUT, "${stem}pins.txt") || die "${stem}pins.txt (pinlist): $!";
while (<INPUT>) {
  last if /^Part/;
}
undef $part;
while (<INPUT>) {
  chop;
  s/\r$//;
  y/A-Z/a-z/;
  if (/^$/) {
    if ($part && !$connector{$part}) {
      &qcode("\n/* $part: $partlist{$part} */\n");
      if (defined $hidden{$partlist{$part}}) {
        eval "&"."$partlist{$part}" if defined $hidden{$partlist{$part}};
      } else {
        # Unknown parts will have to be emulated externally, so make them
        # connectors above.
        warn "error: No definition for $part: $partlist{$part}\n";
      }
    }
    undef $part; # Don't keep warning over and over.
    next;
  }
  if (/^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/) {
    # Some parts are in the board, but not the schematic.
    # (Ignore them).
    ($p, $pad, $pin, $dir, $signal) = ($1, $2, $3, $4, $5);
    $p =~ s/-/_/g;
    next unless defined $partlist{$p};
    $part = $p;
    # No formulae for connectors.
    next if $connector{$part};
    undef %pad;
  } else {
    die "$_" unless /^\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;
    ($pad, $pin, $dir, $signal) = ($1, $2, $3, $4);
    next unless $part;
  }
  $signal = &eagle2pld($signal); # Fix up signal name.
  next if $connector{$part};
  # Ignore passive and power pins
  # Direction may be NC | IN | OUT | I/O | OC | HIZ | SUP | PAS | PWR | SUP
  # next if $dir eq 'pas';
  next if $dir eq 'pwr';
  # Ignore unconnected pins.
  next if $signal =~ /^[\*]/;
  $signal = "'b'1" if $signal eq 'nc'; # vrs
  next if $signal =~ /^nc$/;
  $pad{$pad} = $signal;
}

print "\r\n";
print "/* Internal nodes */\r\n";
print "\$IFNDEF OPTIMIZE\r\n";
foreach (sort keys %signals) {
  next if defined $con{$_};
  next if $pinnode{$_};
  print "node $_;\r\n";
}
print "\$ENDIF\r\n";
print "\r\n/* Code nodes */\r\n";

&qcode("\n/* Open collector 'wire-or's */\n");
foreach $lh (sort keys %ocassign) {
  # WinCUPL needs this.
  &qcode("property atmel {open_collector=$lh};\n") if $con{$lh};
  # Use qcode to get peep-hole optimization.
  &qcode("!$lh = $ocassign{$lh};\n");
  &qcode("$lh.oe = $ocassign{$lh};\n") if $con{$lh};
}

# Dump all the saved up code.
print $qcode;

exit 0;
