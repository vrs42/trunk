#!/usr/bin/perl

# Scan for images.  For each image, ensure that a 
# descriptive .txt file also exists.

foreach $d (<*/.>) {
  &mktxt;
}

# Process a directory by first reading the album list.
# Then, search for images, create .txt files if needed, 
# and add them to the album if they aren't already there.
#
sub mktxt {
  $d =~ s:/.$::;
  return if $d eq "images";
print "$d\n";
  @album = ();
  $modified = 0;
  if (open(ALBUM, "$d.txt")) {
    while (<ALBUM>) {
      s:\n$::;
      s:\r*$::;
      push(@album, $_);
    }
  } else {
    $modified = 1;
  }
  # We read the album list.  Let's find the images.
  foreach $f (<$d/*>) {
    next unless $f =~ /[.](jpg|gif)$/i;
    $t = $f; $t =~ s:....$:.txt:;
    $t =~ s:\n$::;
    $t =~ s:\r*$::;
    if (!-f $t) {
      # A .txt file is missing, create one.
      $exif = `exiftool -S -Title $f`;
      $exif =~ s/.*: //;
      $exif = `basename $f` unless $exif;
#     warn "$t: missing, got $exif\n";
      open(TXT, ">$t") || die "$t: T!";
      print TXT "$exif\n";
    }
    # Found a .txt file.  Is it listed in the album?
    $found = 0;
    foreach $i (@album) {
      next unless $i eq $t;
      $found = 1;
      last;
    }
    if (!$found) {
      # It's missing -- add it.
      print "$d: adding $t\n";
      push(@album, $t);
      $modified = 1;
    }
  }
  # Write the new album list, if needed.
  if ($modified && @album) {
    open(ALBUM, ">$d.txt") || die "$d.txt: $!";
    foreach $i (@album) {
      print ALBUM "$i\n";
    }
  }
}
