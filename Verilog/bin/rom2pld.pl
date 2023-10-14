#!/usr/bin/perl

#
# Generate the logic expressions for an IM5600 ROM.
# Since the IM5600 is an open collector part, we'll 
# keep track of when it should pull outputs low, and 
# let them default high/high impedance.
#
# Expect 32 octal numbers (or "xxx"), one per line.
# Ignore blank lines.
#
# Extract formulae for each bit.  These formulae 
# should be compiled, then the optimized expressions 
# should be used for the corresponding bits.

# Set all 8 bit expressions initially empty.
@mb0 = ("", "", "", "", "", "", "", "");
$found = 0;
# Read the file.
while (<STDIN>) {
  s/\r*$//;
  s/^\s*//;
  next if /^$/;
  $found++;
  next if /^x*$/;
  # At this point an octal representation of the 
  # new constraint has been read.
  $bits = oct($_);
  die "Value too large: $_" if $bits >= (1<<8);
  for ($mask = 1, $index = 0; $index < 8; $mask <<= 1, $index++) {
    $value = !!($bits & $mask);
    # Add to the expressions for this bit.
    if (!$value) {
      $bits = unpack("B8", chr($found-1));
      $bits =~ s/^...//;
#print "bit $index found @ ", $found-1, ": $bits\n";
      $mb0[$index] .= " " . $bits;
    }
  }
}
die "Expected 32 bytes, got $found" unless $found == 32;
#print "@mb0\n";

#
# At this point, we have which addresses should clear
# any given bit.  Run over the bits, optimizing the 
# address expressions by noting dont-care bits.
sub optimize {
  local(@a) = @_;
  local($i, $j);
#print "optimize a: @a, max = $#a\n";
  for ($i = 0; $i <= $#a; $i++) {
    for ($j = $i+1; $j <= $#a; $j++) {
      # Do the addresses differ by exactly one bit?
      $count = 0;
      for ($bit = 0; $bit < 5; $bit++) {
        next if substr($a[$i], $bit, 1) eq substr($a[$j], $bit, 1);
        $count++;
        $pos = $bit if $count == 1;
      }
#print "count for $a[$i] and $a[$j] was $count\n";
      next unless $count == 1;
      # If so, change that bit to an "x", and elide 
      # the extra copy.
#print "$a[$i] and $a[$j] share $pos, making 'x'.\n";
      substr($a[$i], $pos, 1, 'x');
#print " got $a[$i].\n";
      $a[$j] = $a[$#a];
      splice(@a, -1);
#print "new a: @a, i == $i, j == $j, max = $#a\n";
      last;
    }
  }
  # No remaining improvement, so return the list.
  return @a;
}

@apin = ('$pad{10}', '$pad{11}', '$pad{12}', '$pad{13}', '$pad{14}');
@dpin = ('$pad{1}', '$pad{2}', '$pad{3}', '$pad{4}', '$pad{5}', '$pad{6}', '$pad{7}', '$pad{9}');
# Now fix up and output the expressions.
%assigned = ();
for ($index = 0; $index < 8; $index++) {
  $mb0[$index] =~ s/\s+//;
# print "# Bit $index: $mb0[$index]\n";
  @a = &optimize(split(/\s+/, $mb0[$index]));
  print "# Bit $index: @a\n";
  print "  \$oc{$dpin[$index]} = 1 if defined $dpin[$index];\n";
  foreach $a (@a) {
    #
    # There is an issue with the generated code containing 
    # lines too long for the compiler.  Generate names for 
    # the address expressions here, so the emitted code 
    # will be simpler and clearer.
    next if defined $assigned{$a};
    print "  print \"\${part}_$a = ";
    @bits = unpack("c5", $a);
    $b = 0;
    $toprint = "";
    foreach $bit (@bits) {
      $toprint .= "&!$apin[$b]" if ($bit eq 48);
      $toprint .= "& $apin[$b]" if ($bit eq 49);
      $b++;
    }
    $toprint =~ s/[&]/(/;
    print "$toprint;\" if defined $dpin[$index];\n";
    $assigned{$a} = 1;
  }
  # ANDing in CS forces high impedance for all bits if the 
  # chip is not selected.
  # BUGBUG: Falls over if an output is constantly zero.
  $toprint = "  &ocassign($dpin[$index], \"!\$pad{15} & (";
  foreach $a (@a) {
    $toprint .= "#\${part}_$a";
  }
  $toprint =~ s/[(][#]/(/;
  print "$toprint)\") if defined $dpin[$index];\n";
}

exit 0;
