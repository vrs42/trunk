#!/usr/bin/perl

#
# This stuff is developed on Windows, which doesn't check the case
# of href references.  This bit of Perl code tries to hunt down
# href stuff that uses relative pathnames, but gets the case 
# wrong.

#
# We really walk the whole path for each href, in 
# case a directory name is mis-spelled.
sub namei {
  local($path) = @_;
  local($f, $found);
  local($dir) = "./";
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
#warn "namei: failed '$f'\n" unless $found;
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
opendir(INPUT, ".") || die ".: $!";
for $i (readdir(INPUT)) {
  next unless -d $i;
  next if $i =~ /^\./;
  next unless -f "$i/$i.php";
  next if &namei("$i/$i.php");
  warn "$i/$i.php: Wrong upper/lower case!\n";
  $status = 1;
}
exit $status;
