#!/usr/bin/perl

#
# Look for Symbols used in .asc files, whose 
# value does not correspond with a model in 
# the .lib file.

$generic{"BREAKER"} = 1;
$generic{"C-US"} = 1;
$generic{"CPOL-US"} = 1;
$generic{"DINA3_L"} = 1;
$generic{"DOCFIELD"} = 1;
$generic{"EDGE-LEFT"} = 1;
$generic{"EDGE-RIGHT"} = 1;
$generic{"L"} = 1;
$generic{"L-US"} = 1;
$generic{"LETTER_L"} = 1;
$generic{"M"} = 1;
$generic{"MA01-1"} = 1;
$generic{"MV"} = 1;
$generic{"PAD"} = 1;
$generic{"PIN"} = 1;
$generic{"POT_US-"} = 1;
$generic{"R"} = 1;
$generic{"R-US"} = 1;
$generic{"R-US_"} = 1;
$generic{"TABL_L"} = 1;
$generic{"TRIMPOT"} = 1;
$generic{"VOLTAGE"} = 1;

%vals = ();
for $f (<*/*.asc>) {
  open(INPUT, $f) || die "$f: $!";
  while (<INPUT>) {
    $_ =~ y/a-z/A-Z/;
    $symbol = $1 if /^SYMBOL (\S+)/;
    next if $generic{$symbol};
    $vals{"$symbol $1"} = $f if /^SYMATTR VALUE (\S+)/;
  }
}

%models = ();
$models{"1N914"} = 1;
$models{"2N2222"} = 1;
$models{"2N3906"} = 1;
$models{"DGL-3V"} = 1;
$models{"FLIPCHIP"} = 1;
$models{"MCR649"} = 1;
$models{"OUTLINE-DOUBLE"} = 1;
$models{"OUTLINE-SINGLE"} = 1;
$models{"OUTLINE-SINGLE-R"} = 1;

open(INPUT, "myparts.lib") || die "myparts.lib: $!";
while (<INPUT>) {
  $_ =~ y/a-z/A-Z/;
  $models{$1} = 1 if /^.MODEL (\S+)/;
}

sub byname { $a cmp $b }

$count = 0;
foreach $k (sort byname keys %vals) {
  $f = $vals{$k};
  ($symbol, $value) = split(/ /, $k);
  next if defined $models{$value};
  warn "$symbol $value: no model ($f)\n";
  $count++;
}
print "  $count models are missing\n";
