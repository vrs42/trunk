
#
# Attempt to allocate signals to PLAs.
#

@m113 = (
    "c1 a1 b1", "f1 d1 e1", "f2 d2 e2", "k1 h1 j1", "k2 h2 j2",
    "n1 l1 m1", "n2 l2 m2", "s1 p1 r1", "s2 p2 r2", "v2 t2 u2"
);

@m115 = (
    "d1 a1 b1 c1", "j1 e1 f1 h1", "n1 k1 l1 m1", "u1 p1 r1 s1",
    "h2 d2 e2 f2", "m2 j2 k2 l2", "s2 n2 p2 r2", "v1 t2 u2 v2"
);

@m117 = (
    "e1 a1 b1 c1 d1", "l1 f1 h1 j1 k1", "s1 m1 n1 p1 r1",
    "j2 d2 e2 f2 h2", "p2 k2 l2 m2 n2", "v2 r2 s2 t2 u2"
);

@m119 = (
    "j2 a1 b1 c1 d1 d2 e2 f2 h2",
    "p2 f1 h1 j1 k1 k2 l2 m2 n2",
    "v2 m1 n1 p1 r1 r2 s2 t2 u2"
);

@required = (@m113, @m115, @m117, @m119);

#
# Merge the required input sets for each output.
#
%inputs = ();
foreach $s (@required) {
    @inputs = split(/ /, $s);
    $output = shift @inputs;
    if (defined($inputs{$output})) {
	$inputs{$output} .= " " . join(" ", @inputs);
    } else {
	$inputs{$output} = join(" ", @inputs);
    }
}

# c1: a1 b1
# d1: a1 b1 c1
# e1: a1 b1 c1 d1
# f1: d1 e1
# f2: d2 e2
# h2: d2 e2 f2
# j1: e1 f1 h1
# j2: a1 b1 c1 d1 d2 e2 f2 h2
# k1: h1 j1
# k2: h2 j2
# l1: f1 h1 j1 k1
# m2: j2 k2 l2
# n1: k1 l1 m1
# n2: l2 m2
# p2: f1 h1 j1 k1 k2 l2 m2 n2
# s1: m1 n1 p1 r1
# s2: n2 p2 r2
# u1: p1 r1 s1
# v1: t2 u2 v2
# v2: m1 n1 p1 r1 r2 s2 t2 u2

# u1, v1 are output only!

# Dump the requirement array
foreach $output (sort keys %inputs) {
    print "$output: $inputs{$output}\n";
}

$chips = 3; # Number of chips to use.
$pinsperchip = 20;
@pins = (); # Records signal allocations
@inputpins  = (1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 18, 17, 16, 15, 14, 13); # In order we want them allocated.
@outputpins = (18, 17, 16, 15, 14, 13, 19, 12); # In order we want them allocated.
#
# Now, for each output, allocate it to an output pin, if one is available and the inputs
# can also be mapped onto the chip.
#
foreach $output (sort keys %inputs) {
    # Remember where to restart if things don't work out.
    @restart = @pins;
    # Find a free output pin
    foreach ($chip = $chipoffset = 0; $chip < $chips; $chip++, $chipOffset+=$pinsperchip) {
	foreach (@outputpins) {
	    $opin = $_;
	    last unless defined $pins[$chipOffset + $opin];
	}
	next if defined $pins[$chipOffset + $opin];
	# Try to allocate $output at pin $opin of $chip.
	# If we fail, no further attempts will be made on this chip.
        $pins[$chipOffset + $opin] = $output; # Tentative.
	# Now to see if the input requirements can be met.
	foreach $input (split(/ /, $inputs{$output})) {
	    # Look for $input on $chip.
	    foreach (@inputpins) {
		$ipin = $_;
		last if $pins[$chipOffset + $ipin] eq $input;
	    }
	    if ($pins[$chipOffset + $ipin] ne $input) {
		# Input not found, assign it to an unassigned pin, if any.
		foreach (@inputpins) {
		    $ipin = $_;
		    last unless defined $pins[$chipOffset + $ipin];
		}
		$pins[$chipOffset+$ipin] = $input unless defined $pins[$chipOffset+$ipin];
	    }
	    # Did we find it?
	    next if $pins[$chipOffset+$ipin] eq $input;
	    # Failed for this chip -- reset, and skip processing of the rest of the inputs.
	    @pins = @restart;
	    last;
	}
	# Now check to see if the allocation succeeded.  If so, terminate chip loop.
	last if $pins[$chipOffset + $opin] eq $output;
    }
    # Now check to see if the allocation succeeded (on any chip).
    next if $pins[$chipOffset + $opin] eq $output;
    warn "Can't meet requirements for output pin $output";
}

foreach ($chip = $chipOffset = 0; $chip < $chips; $chip++, $chipOffset+=$pinsperchip) {
    print "Chip $chip:\n";
    $pins[$chipOffset+10] = "gnd";
    $pins[$chipOffset+20] = "vcc";
    foreach ($pin = 1; $pin <= $pinsperchip; $pin++) {
	print "$pin:$pins[$chipOffset+$pin] ";
    }
    print "\n";
}