#!/usr/bin/perl

#
# Sort a list and make a table.

open(INPUT, "foo.txt") || die "foo.txt: $!";
while (<INPUT>) {
  s/\r//g;
  chop;
  $note = undef;
  ($part, $eia, $module, $note) = split(/,/, $_);
  next if $part eq 'DEC Part';
  $index = $part . ';' . $eia;
  if (defined($module{$index})) {
    $module{$index} .= ", $module";
  } else {
    $module{$index} .= $module;
  }
  if (defined($note)) {
    if (defined($note{$index})) {
     die "Notes: $note vs $note{$index}" unless $note eq $note{$index};
    } else {
     $note{$index} = $note;
    }
  }
}

print "<TABLE border=1>\n";
print "<TH>DEC Part<TH>EIA Part<TH>Note<TH>Modules<TR>\n";
foreach (sort keys %module) {
  ($part, $eia) = split(/;/, $_);
  $eia = '&nbsp;' unless $eia ne '';
  $note{$_} = '&nbsp;' unless defined $note{$_};
  print "<TD>$part<TD>$eia<TD>$note{$_}<TD>$module{$_}<TR>\n";
}
print "</TABLE>\n" if $opart;
