#!/usr/bin/perl

# Read CUPL source and emit equivalent Verilog.

#
# Edit History:
# 10/23/2021
#   Fixed a missing "&" in the operator check for whether negation
#   must include parenthesis around the negated subexpression.
#   Fixed a problem with input statements more than a single line long.
#   Introduced a regression, where bogus text is injected in the output,
#   related to the interaction of the searches for "*/" and ";".
# 10/22/2021
#   Fixed a missing assignment for "T" style flops which do not have
#   an asynchronous component.
# 10/15/2021
#   Fixed a missing "|" in the operator check for whether negation
#   must include parenthesis around the negated subexpression.
#
#$edebug = 1;
open(INPUT, $ARGV[0]) || die "$ARGV[0]: $!";

#
# First, a pass that looks for assignments.
# Note what's written, what's read, and which 
# sequential modifiers got used.
$l = "";
%isin = %isout = %islatch = ();
while (<INPUT>) {
  s/\r*//g;
  y/A-Z/a-z/; # Kludge monocase for now
  die "$_" if /[A-Z]/;
  $l .= $_;
  #
  # Maybe it is/has a comment.
  $ec = index($l, "*/");
  if ($ec) {
    # Locate the beginning of the comment.
    $sc = index($l, "/*");
    # For the first pass, elide the comment.
    substr($l, $sc, $ec-$sc+2, "");
  }
# BUGBUG: Doesn't work correctly if the comment contains things
# that look like statements, but the "*/" is on a later line.
  next unless $l =~ /;/;
  # For now, just ignore compiler directives.
  $l =~ s/^\n*[\$].*//;
  # Look for a CUPL statement.
  while ($l =~ s/^([^;]*);//) {
    $s = $1;
    $s =~ s/\n/ /g;
    $s =~ s/^\s*//g;
    next unless $s;
    #
    # We have a whole statement.
    #
    # Parse pin designations, which otherwise look like
    # an assignment.  Just ignoring them for this pass.
    next if $s =~ s/pin\s+(\d*)\s*=\s*(\S*)\s*$//i;
    #
    # Maybe it's an assignment!
    if ($s =~ s/(\S+)\s+=\s*(.*)$//i) {
      ($lh, $rh) = ($1, $2);
      # Check $lh for inversion.
      $rh = "!($rh)" if $lh =~ s/^!//;
      # We use the expression rewrite code to
      # note which nets are read.
      $indent = "assign $lh = "; $indent =~ s/./ /g;
#warn "$lh: $rh" if $lh eq 'skip';
#warn "$lh: $rh" if $lh eq 'rx7';
      $rh = &expression($indent);
#warn "$lh: $rh" if $lh eq 'rx7';
#die "$lh: $rh" if $lh eq 'skip';
      # Check $lh for a qualifier.
      if ($lh =~ /^(.*)[.](.*)$/) {
        ($out, $in) = ($1, $2);
        $isout{$out} = 1;
        $ldone{$out} = 0;
        # Try not to remember constant zeroes for .ar and .ap
        next if ($in =~ /^a[pr]$/) && ($rh eq "1'b0");
        $islatch{$out} .= "$in ";
      } else {
        $isout{$lh} = 1;
      }
      # Remember all assignments in case ".oe" occurs later.
warn "assign{$lh} = $rh\n" if $lh =~ /^rx7/;
      $assign{$lh} = $rh;
    }
  }
}

#
# Now begin translation in earnest.
seek(INPUT, 0, 0) || die "$ARGV[0]: $!";
$l = "";
@iface = ();
@nodes = ();
while (<INPUT>) {
  s/\r*//g;
  y/A-Z/a-z/; # Kludge monocase for now
  die "$_" if /[A-Z]/;
  $l .= $_;
  #
  # Maybe it is/has a comment.
  $ec = index($l, "*/");
  if ($ec != -1) {
    # Locate the beginning of the comment.
    $sc = index($l, "/*");
    # Rewrite the comment and output it
    $c = substr($l, $sc, $ec-$sc+2, "");
    $c =~ s?\n?\n//?g;
    $c =~ s?/[*]?//?;
    $c =~ s?[*]/??;
    print "$c\n";
  }
# BUGBUG: Doesn't work correctly if the comment contains things
# that look like statements, but the "*/" is on a later line.
  next unless $l =~ /;/;
#warn "$l" if $l =~ /rx_div/;
  # For now, just ignore compiler directives.
  $l =~ s/^\n+[\$].*//;
  # Look for a CUPL statement.
  while ($l =~ s/^([^;]*);//) {
    $s = $1;
    $s =~ s/\n/ /g;
    $s =~ s/^\s*//g;
    next unless $s;
#warn "s:$s\n";
    #
    # We have a whole statement.
    #
    # Remember the module name.
    if ($s =~ s/Name\s+(\S+)\s*$//i) {
      $module = $1;
      open(PINMAP, ">$module.pins") || die "$madule.pins: $!";
      next;
    }
    #
    # Ignore various other fluff.
    # It might be better to convert these to comments?
    next if $s =~ s/PartNo\s+(\S+)\s*$//i;
    next if $s =~ s/Date\s+(\S+)\s*$//i;
    next if $s =~ s/Revision\s+(\S+)\s*$//i;
    next if $s =~ s/Designer\s+(.+)$//i;
    next if $s =~ s/Company\s+(.+)$//i;
    next if $s =~ s/Assembly\s+(\S+)\s*$//i;
    next if $s =~ s/Location\s+(\S+)\s*$//i;
    next if $s =~ s/Device\s+(\S+)\s*$//i;
    next if $s =~ s/property\s+(.+)$//i;
    #
    # Parse pin designations, for the interface list.
    if ($s =~ s/pin\s+(\d*)\s*=\s*(\S*)\s*$//i) {
      # BUGBUG: For now, we toss the pin number, but we 
      # really should output it to a constraints file.
      ($pad, $net) = ($1, $2);
      push(@iface, $net);
      # M8340.pins:
      #   set_location_assignment PIN_$pad -to $net
      print PINMAP "set_location_assignment PIN_$pad -to $net\n" || die "PINMAP";
      next;
    }
    #
    # Parse node designations.  The first node also 
    # triggers output of the module declaration.
    if ($s =~ s/node\s+(\S*)\s*$//i) {
      $node = $1;
      push(@nodes, $1);
      if (@iface) {
        print "module $module (", join(", ", @iface), ");\n";
        foreach $pin (@iface) {
          $isreg = "";
          if (defined $islatch{$pin}) {
            $isreg = " reg" unless $islatch{$pin} eq "oe ";
          }
          if (defined $isin{$pin}) {
            if (defined $isout{$pin}) {
              print "inout$isreg $pin;\n";
            } else {
              print "input $pin;\n";
            }
          } else {
            print "output$isreg $pin;\n";
          }
        }
        print "\n";
        foreach $out (sort keys %islatch) {
           print "reg ${out}_m;\n" if (defined $assign{"$out.ap"}) || (defined $assign{"$out.ar"});
        }
        print "\n";
        # Clear @iface to prevent repitition.
        @iface = ();
      }
      # Finally, output a wire declaration.
      push(@nodes, $node);
      if (defined $islatch{$node}) {
        print "reg $node;\n";
      } else {
        print "wire $node;\n";
      }
      next;
    }
    #
    # Maybe it's an assignment!
#warn "as:$s\n";
    if ($s =~ s/(\S+)\s+=\s*(.*)$//i) {
      ($lh, $rh) = ($1, $2);
#warn "Got $lh = $rh";
      # Check $lh for inversion.
      $rh = "!($rh)" if $lh =~ s/^!//;
      # Check $lh for a qualifier.
      if ($lh =~ /^(.*)[.](.*)$/) {
        ($out, $in) = ($1, $2);
        next if $ldone{$out};
        # To map a qualified assignment, it is necessary to know 
        # which qualifiers were actually used.  These were all 
        # remembered in the previous pass.
        if (defined $assign{"$out.oe"}) {
          # Output enables are relatively easy.  We assume here 
          # that the output is otherwise unqualified.  (That is, the
          # qualifiers are exactly "oe ".)
          die "OE qualifier on FF output $out" unless $islatch{$out} eq "oe ";
          $t1 = "~($assign{$lh})"; $t1 =~ s/\s*//g;
          $t2 = $assign{$out}; $t2 =~ s/\s*//g;
#         warn "$out: !($assign{$lh}) ne $assign{$out}" unless $t1 eq $t2;
#         warn "$out: .oe not caused by OC" unless $t1 eq $t2;
          $assign{$out} = "1'b0" if $t1 eq $t2;
          $indent = "assign $out = "; $indent =~ s/./ /g;
          $rh = &expression($indent);
          $rh =~ s/\b$out\b/($assign{$out})/g;
          print "assign $out = $rh? $assign{$out}: 1'bz;\n";
        } elsif ((defined $assign{"$out.ar"}) || (defined $assign{"$out.ap"})) {
          # It's a FF with async preset, clear, or both.
          # Model it as master-slave latches:
          #   if out.ar then out_m = 0 else
          #   if out.ap then out_m = 1 else
          #   if !out.ck then out_m = out.d;
          #   if out.ar then out = 0 else
          #   if out.ap then out = 1 else
          #   if out.ck then out = out_m;
          next if $ldone{$out};
          $events = $assign{"$out.ck"};
          $events .= " " . $assign{"$out.ar"} if defined $assign{"$out.ar"};
          $events .= " " . $assign{"$out.ap"} if defined $assign{"$out.ap"};
          $events .= " " . $assign{"$out.d"} if defined $assign{"$out.d"};
          $events .= " " . $assign{"$out.j"} if defined $assign{"$out.j"};
          $events .= " " . $assign{"$out.k"} if defined $assign{"$out.k"};
          $events .= " $out" if defined $assign{"$out.j"};
          $events .= " $out" if defined $assign{"$out.t"};
#warn "($events)\n";
          $events =~ s/\d+'b[01]+\s//g;
          $events =~ s/[()&|^~]//g;
          $events =~ s/\s+$//g;
          $events =~ s/\s+/, /g;
#warn "229 ($events)\n";
          print "always @($events)\n";
          if (defined $assign{"$out.ar"}) {
            print "  if (", $assign{"$out.ar"}, ") begin\n";
            print "    ${out}_m <= 1'b0;\n";
            print "  end else\n";
          }
          if (defined $assign{"$out.ap"}) {
            print "  if (", $assign{"$out.ap"}, ") begin\n";
            print "    ${out}_m <= 1'b1;\n";
            print "  end else\n";
          }
          print "  if (~(", $assign{"$out.ck"}, ")) begin\n";
          # j-k, t, or d?
          if (defined $assign{"$out.d"}) {
            $dexp = $assign{"$out.d"};
            die "$out.j" if defined $assign{"$out.j"};
            die "$out.k" if defined $assign{"$out.k"};
            die "$out.t" if defined $assign{"$out.k"};
          } elsif (defined $assign{"$out.t"}) {
            $dexp = $assign{"$out.t"} . " == 1'b1? ~$out: $out";
            # Optimize a common case for readability.
            $dexp = "~$out" if ($assign{"$out.t"} eq "1'b1");
            die "$out.j" if defined $assign{"$out.j"};
            die "$out.k" if defined $assign{"$out.k"};
          } else {
            die "no $out.j" unless defined $assign{"$out.j"};
            die "no $out.k" unless defined $assign{"$out.k"};
            $dexp = $assign{"$out.j"} . "? (" . $assign{"$out.k"} . "? ~$out: 1'b1) : (" . $assign{"$out.k"} . "? 1'b0: $out)";
          }
          print "    ${out}_m <= ", $dexp, ";\n";
          print "  end\n";
          $events = $assign{"$out.ck"};
          $events .= " " . $assign{"$out.ar"} if defined $assign{"$out.ar"};
          $events .= " " . $assign{"$out.ap"} if defined $assign{"$out.ap"};
          $events .= " ${out}_m";
#warn "($events)\n";
          $events =~ s/\d+'b[01]+\s//g;
          $events =~ s/[()&|^~]//g;
          $events =~ s/\s+$//g;
          $events =~ s/\s+/, /g;
#warn "270 $out ($events)\n";
          print "always @($events)\n";
          if (defined $assign{"$out.ar"}) {
            print "  if (", $assign{"$out.ar"}, ") begin\n";
            print "    ${out} <= 1'b0;\n";
            print "  end else\n";
          }
          if (defined $assign{"$out.ap"}) {
            print "  if (", $assign{"$out.ap"}, ") begin\n";
            print "    ${out} <= 1'b1;\n";
            print "  end else\n";
          }
          print "  if (", $assign{"$out.ck"}, ") begin\n";
          print "    ${out} <= ${out}_m;\n";
          print "  end\n";
          $ldone{$out} = 1;
        } else {
          # It's a FF without async component.
          #   always @(posedge out.ck) out = out.d;
          next if $ldone{$out};
          $events = "posedge " . $assign{"$out.ck"};
          $events =~ s/posedge/negedge/ if $events =~ s/[~]//;
#warn "292 $out ($events)\n";
          print "always @($events)\n";
          print "  if (", $assign{"$out.ck"}, ") begin\n";
          $dexp = $assign{"$out.d"};
          $dexp = "$assign{\"$out.t\"}? ~$out : $out"
            if defined $assign{"$out.t"};
          $dexp = "~$out" if ($assign{"$out.t"} eq "1'b1");
          print "    $out <= ", $dexp, ";\n";
          print "  end\n";
          $ldone{$out} = 1;
        }
        $ldone{$out} = 1;
      } else {
        # Simple assignment.  Rewrite $rh
        # and emit an assignment.
        next if defined $islatch{$lh};
        $indent = "assign $lh = "; $indent =~ s/./ /g;
        $rh = &expression($indent);
        print "assign $lh = $rh;\n";
      }
      next;
    }
  }
}
print "endmodule\n";

#
# Expression parser/translator follows.
# We also do simple constant folding here.
#

# BUGBUG:  What is the Verilog XOR operator?

$edebug = 0;
sub term {
  local($indent) = @_;
  local($term);
  # The term is a number, identifier or a parenthesised expression.
  if ($rh =~ s/^\s*[(]//) {
    $term = &expression("$indent ");
    warn "term: expression returned: ($term)\n" if $edebug;
    # If there are no operators, skip the parentheses.
# BUGBUG: Fix this with an official operator list!
    if ($term =~ /[|&~*^+]/) {
      $term = "($term)";
    }
    $rh =~ s/^[)]//;
  } else {
    $rh =~ s/^\s*([^!&#\$)\s;]+)\s*//;
    $term = $1;
    $term = length($1) . "'b$1" if $term =~ /^'b'(.*)$/;
    $isin{$term} = 1;
#warn "input: $term\n";
  }
  return $term;
}

sub nterm {
  local($indent) = @_;
  # The nterm is a term or a negated nterm.
  if ($rh =~ s/^\s*[!]\s*//) {
    local($nterm) = "~" . &nterm("$indent ");
    $nterm =~ s/^~~//;
    $nterm =~ s/^~1'b0\b/1'b1/;
    $nterm =~ s/^~1'b1\b/1'b0/;
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
    if ($lo eq "1'b0") {
      # $ro does not affect the result.
    } elsif ($lo eq "1'b1") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($ro eq "1'b0") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($ro eq "1'b1") {
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
    if ($lo eq "1'b0") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($lo eq "1'b1") {
      # $ro does not affect the result.
    } elsif ($ro eq "1'b0") {
      # $ro does not affect the result.
    } elsif ($ro eq "1'b1") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($ro eq $lo) {
      # $ro does not affect the result.
    } else {
      # Both $lo and $ro affect the result.
      $lo .= "\n$indent | $ro";
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
    if ($lo eq "1'b0") {
      # $ro is the result.
      $lo = $ro;
    } elsif ($lo eq "1'b1") {
      # !$ro is the result.
      $lo = "~$ro";
    } elsif ($ro eq "1'b0") {
      # $ro does not affect the result.
    } elsif ($ro eq "1'b1") {
      # !$lo is the result.
      $lo = "~$lo";
    } else {
      # Both $lo and $ro affect the result.
      $lo .= "\n$indent ^ $ro";
    }
  }
  return $lo;
}
