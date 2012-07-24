#!/usr/bin/perl

#
# Sort a list and make a table.
#

print "<HTML><HEAD>\n";
print "<STYLE type=\"text/css\">\n";
print "BODY { background-color: #000000 }\n";
print "BODY { color: #00c000 }\n";
print "</STYLE>\n";
print "<META http-equiv=Content-Type content=\"text/html; charset=iso-8859-1\">\n";
print "<META http-equiv=Expires content=0>\n";
print "<TITLE>PDP-8 Stuff</TITLE>\n";
print "</HEAD>\n";
print "<BODY vLink=#00c000 aLink=#00c000 link=#00ff00 bgColor=#000000>\n";


$keysep = ','; # Comma should be safe for input from a .csv
open(INPUT, "DECSubst.csv") || die "DECSubst.csv: $!";
while (<INPUT>) {
  s/\r//g;
  chop;
  $note = undef;
  ($part, $eia, $module, $note) = split(/,/, $_);
  next if $part eq 'DEC Part';
  $eia = ' ' if $eia eq '';
  $note = '&nbsp;' unless defined $note;
  $index = $part . $keysep . $eia . $keysep . $note;
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

sub bykey {
  @a = split(/$keysep/, $a);
  @b = split(/$keysep/, $b);
  $a[0] cmp $b[0] || $a[1] cmp $b[1] || $a[2] cmp $b[2];
}

print "<TABLE border=1>\n";
print "<TH>DEC Part<TH>EIA Part<TH>Note<TH>Modules<TR>\n";
foreach (sort bykey keys %module) {
  ($part, $eia) = split(/$keysep/, $_);
  $eia = '&nbsp;' if $eia eq ' ';
  print "<TD>$part<TD>$eia<TD>$note{$_}<TD>$module{$_}<TR>\n";
}
print "</TABLE>\n";
