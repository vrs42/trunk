#!/usr/bin/perl

# Scan for images.  For each image, ensure that a 
# smaller version of the file is available in the 
# corresponding 'thumbs' directory.  Calling the 
# output a thumbnail is a bit of a strecth, as it 
# is still fairly large, but the idea is to load a 
# little faster, not to be really tiny.

foreach $d (<*/.>) {
  &mkthumbs;
}

# Process a directory, searching for images.  Create 
# thumbnails if needed. 
#
sub mkthumbs {
  $d =~ s:/.$::;
  return if $d eq "images";
print "$d\n";
  # First, make sure the thumbnail directory exists.
  mkdir "$d/thumbs" unless -d "$d/thumbs";
  # Let's find the images.
  foreach $f (<$d/*>) {
    next unless $f =~ /[.](jpg|gif)$/i;
    $t = $f; $t =~ s:(/[^/]*)$:/thumbs\1:;
    if (!-f $t) {
      # A thumbnail is missing, create it.
      #print "$f: $t\n";
      print "jpegtopnm \"$f\" | pamscale -xysize 640 640 | pnmtojpeg >\"$t\"\n";
      system "jpegtopnm \"$f\" 2>/dev/null | pamscale -xysize 640 640 | pnmtojpeg >\"$t\"\n";
    }
  }
}
