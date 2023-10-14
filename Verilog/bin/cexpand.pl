#!/usr/bin/perl

#
# Expand [x..y] macros in CUPL source.
#

sub expand {
  local($in) = @_;
  local($out) = "";
  return $in
    unless $in =~ /^(.*)\[\s*([_A-Za-z]*)(\d+)\s*[.][.]\s*(\d+)\s*\](.*)$/;
  ($front, $id, $i1, $i2, $back) = ($1, $2, $3, $4, $5);
warn "front:$front\n";
warn "id:$id\n";
warn "back:$back";
  ($i1, $i2) = ($i2, $i1) unless $i1 < $i2;
warn "range:$i1..$i2\n";
  for ($i = $i1; $i <= $i2; $i++) {
    $out .= "$front$id$i$back\n";
  }
  return $out;
  # Recurse here in case there are more?  Really?
# return &expand($out);
}

while (<STDIN>) {
# May need additional sophistication wrt statement boundaries.
print ":$_";
  print &expand($_);
}

exit 0;
