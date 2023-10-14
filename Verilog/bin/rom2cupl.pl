#!/usr/bin/perl

#
# Expect 32 octal numbers (or "xxx"), one per line.
# Ignore blank lines.
#
# Extract formulae for each bit.  These formulae 
# should be compiled, then the optimized expressions 
# should be used for the corresponding bits.

# Set all 8 bit expressions initially empty.
@mb0 = @mb1 = ("", "", "", "", "", "", "", "");
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
    if ($value) {
      $mb1[$index] .= " + A:'b'" . unpack("B8", $found-1);
    } else {
      $mb0[$index] .= " + A:'b'" . unpack("B8", $found-1);
    }
  }
}
die "Expected 32 bytes, got $found" unless $found == 32;

# Now fix up and output the expressions.
for ($index = 0; $index < 8; $index++) {
  $mb0[$index] =~ s/ [+] //;
  $mb1[$index] =~ s/ [+] //;
  # BUGBUG: Overspecifies conditions as needing to be zero, 
  # which don't!
  print "out[$index] = $mb1[$index];\n";
}

exit 0;
