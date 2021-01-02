#!/usr/bin/perl

# Scan for photos.  For each photo, ensure that a 
# smaller version of the file is available as the 
# corresponding thumb.jpg.  Calling the output 
# a thumbnail is a bit of a stretch, as it is still
# fairly large, but the idea is to load a little
# faster, not to be really tiny.

# Process a directory, searching for images.  Create 
# thumbnails if needed. 
#
sub mkthumb {
  $d = $f; $d =~ s:/photo.jpg$::;
  return if -f "$d/thumb.jpg";
  return if -f "$d/thumb.gif";
print "$d\n";
  # A thumbnail is missing, create it.
  $t = "$d/thumb.jpg";
  #print "$f: $t\n";
  print "jpegtopnm \"$f\" | pnmscale -xysize 640 640 | pnmtojpeg >\"$t\"\n";
  system "jpegtopnm \"$f\" 2>/dev/null | pnmscale -xysize 640 640 | pnmtojpeg >\"$t\"\n";
}

foreach $f (<*/*/photo.jpg */*/photo.gif>) {
  &mkthumb;
}
