#!/usr/bin/perl

#
# Convert the POTM database to something easier to maintain.

#
# The stuff we are trying to convert typically looks like this:
#   201910OctLVDoctor'sbagandLVKimonobag.html
#   201910OctLVDoctor'sbagandLVKimonobag.jpg
#   201910OctLVDoctor'sbagandLVKimonobag.txt
#   201910tOctLVPetiteLogototeset.html
#   201910tOctLVPetiteLogototeset.jpg
#   201910tOctLVPetiteLogototeset.txt
#   201910tOctLVRosesShoppertoteset.html
#   201910tOctLVRosesShoppertoteset.jpg
#   201910tOctLVRosesShoppertoteset.txt
#   201910tOctMousetoteset.html
#   201910tOctMousetoteset.jpg
#   201910tOctMousetoteset.txt
#   201910xOctMouseBackpack.html
#   201910xOctMouseBackpack.jpg
#   201910xOctMouseBackpack.txt
# with corresponding thumbnails in "thumbs".

#
# The format I have in mind will have a directory named after the date:
#   2019-10/.
# That directory will have a set of directories for the tags:
#   'p/.', 't/.', and 'x/.'.
# Each such tag directory should contain a .jpg, and a .txt.  (The .txt
# will become the caption.)
#
# Unlike the previous database, the file names for the jpg and caption,
# are not required to match the item description/caption.

%months = {
  1, "Jan",
  2, "Feb",
  3, "Mar",
  4, "Apr",
  5, "May",
  6, "Jun",
  7, "Jul",
  8, "Aug",
  9, "Sep",
  10, "Oct",
  11, "Nov",
  12, "Dec",
}; 
foreach $f (<*.*>) {
  next if $f =~ /.html/; # Skip output file
  next unless $f =~ /(\d\d\d\d)(\d\d)(\w?)([A-Z][a-z][a-z])(.*)[.](.*)$/;
  ($year, $month, $tag, $_, $desc, $ext) = ($1, $2, $3, $4, $5, $6);
  # Default tag if absent.
  $tag = 'p' unless $tag;
  # Make sure the directory "$year-$month" exists.
  print "mkdir $year-$month\n" unless -d "$year-$month";
  # Make sure the directory "$year-$month/$tag" exists.
  print "mkdir $year-$month/$tag\n" unless -d "$year-$month/$tag";
  # Now copy this file to where it goes.
  print "mv \"$f\" $year-$month/$tag/photo.jpg\n" if $ext eq 'jpg';
  print "mv \"$f\" $year-$month/$tag/caption.txt\n" if $ext eq 'txt';
  # Later, the publish script will make a "thumb.jpg" and a "page.html" for
  # each tag directory (updating them if they are out of date).
}
