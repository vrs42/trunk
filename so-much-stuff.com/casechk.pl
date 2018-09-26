#!/usr/bin/perl

#
# This stuff is developed on Windows, which doesn't check the case
# of href references.  This bit of Perl code tries to hunt down
# href stuff that uses relative pathnames, but gets the case 
# wrong.

# Usage:
# find . -name "*.html" -o -name "*.php" -print | xargs ./casechk.pl

#
# We really walk the whole path for each href, in 
# case a directory name is mis-spelled.
sub namei {
  local($path) = @_;
  local($f, $found);
  local($dir) = "./";
  $path =~ s/\%20/ /g;
  $path =~ s/\%23/#/g;
  while ($path) {
#warn "namei: $dir $path\n";
    return 0 unless -d $dir;
    if ($path =~ s:([^/]*)/::) {
      $f = $1;
    } else {
      $f = $path;
      $path = "";
    }
    # Verify the existence of $f in $dir
    next unless $f; # Ignore redundant "/"
#warn "namei: $f in $dir?\n";
    opendir(DIR, $dir) || do {
      warn "$i: $!\n";
      next;
    };
    $found = 0;
    foreach (readdir(DIR)) {
      next unless $_ eq $f;
      $found = 1;
      last;
    }
warn "namei: failed '$f'\n" unless $found || !$debug;
    return 0 unless $found;
    # So far, so good.  Now confirm the rest of the path.
    $dir .= "$f/";
  }
#warn "namei: $dir returns 1\n";
  return 1;
}

# Testing
#&namei("/pdp8/8a/pdp8a-1.jpg");
#&namei("./pdp8/8a/pdp8a-2.jpg");
#exit 1;

$status = 0;
for $i (@ARGV) {
  next if $i =~ m:/oldstuff/:; # BUGBUG Obsolete
  next if $i =~ m:/Oldway/:; # BUGBUG Obsolete
  next if $i =~ m:/fdco/:; # BUGBUG Obsolete
  next if $i =~ m:/documents/:; # BUGBUG Not working yet
  next unless -f $i;
  next if $i =~ /\.pl$/; # Skip Perl files (including this one).
  $id = "./";
  $id = $1 if $i =~ m:^(.*/):;
  $id = ".$d" if $d =~ m:^/:;
  open(INPUT, $i) || do {
    warn "$i: $!\n";
    next;
  };
  #
  # Innocently assume each href fits on a single line, for now.
  foreach $txt (<INPUT>) {
    while ($txt =~ s/\b(href|src)=("[^"]*"|[^\s>]+)//) {
      $ref = $2;
      $ref =~ s/"([^"]*)"/\1/g;
      $ref =~ s/'([^']*)'/\1/g;
      next if $ref =~ /^(mailto|http):/;
      next if $ref =~ /\$/; # Skip variable references
      next if $ref =~ /\[/; # Skip variable references
      next if $ref =~ /^\#/; # Pound sign must be first.
      die "$i: Illegal character in '$ref'\n" if $ref =~ /\#/;
      $ref = $1 if $ref =~ /^"(.*)"$/;
        $d = "./";
        $d = $1 if $ref =~ s:^(.*/)::;
        if ($d =~ m:^/:) {
          $d = ".$d";
        } else {
          $d = "$id$d";
        }
      &namei("$d$ref") || do {
        warn "$i: Didn't find $d$ref\n";
        $status = 1;
#$debug = 1;
      };
    }
  }
}
exit $status;
