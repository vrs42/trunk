#!/usr/bin/perl

#
# Convert the existing database to something easier to maintain.

#
# The stuff we are trying to has a .txt file named after the
# current directory.  That has a list of .txt files, with the
# captions of our images, and listed in the correct order.
#
# Our job is to move these to sub-folders, with easy to
# maintain names.
#
# For example:
#2010-For-Sale-album/P10200124742.txt
#2010-For-Sale-album/P1010991776c.txt
#2010-For-Sale-album/P10107409a72.txt
#
# The corresponding photo has the same name, and extension .jpg.
# The corresponding thumbnail has the same name as the .jpg, but 
# lives in thumbs/.
#
# We'll encode the sequencing information by naming sub-directories
# numerically (counting by 10).
#
# That directory will have a caption.txt, photo.jpg, and thumb.jpg.
open(LIST, "$ARGV[0]") || die "$ARGV[0]: $!";
$album = $ARGV[0]; $album =~ s/[.]txt$//;
die "$album: $!" unless -d $album;

#
# Start past existing subdirectories.
$subdir = 10;
$d = sprintf("%04d", $subdir);
while (-d "$album/$d") {
  $subdir += 10;
  $d = sprintf("%04d", $subdir);
}

#
# Make new subdirectories for the content.
foreach $f (<LIST>) {
  $f =~ s/\r//g; chop $f;
  # The .txt file must exist!
  die "$f: $!" unless -f $f;
  # The .jpg file must also exist!
  $j = $f; $j =~ s/[.]txt$/.jpg/;
  $j =~ s/[.]jpg/.gif/ unless -f $j; # Permit GIF
  die "$j: $!" unless -f $j;
  # Moreover, the thumbnail must exist!
  $t = $j; $t =~ s:/:/thumbs/:;
  die "$t: $!" unless -f "$t";
  # Create a directory based on the sequence number.
  # (Let's hope 4 digits are enough.)
  $d = sprintf("%04d", $subdir);
  $subdir += 10;
  # Make sure the sub-directory exists.
  print "mkdir $album/$d\n" unless -d "$album/$d";
  # Now move the files to where they go.
  print "mv \"$f\" $album/$d/caption.txt\n";
  print "mv \"$j\" $album/$d/photo.jpg\n";
  print "mv \"$t\" $album/$d/thumb.jpg\n";
}
