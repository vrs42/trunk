#!/usr/bin/perl

# Sync files that should be the same in the top level and 
# the sub-directories.

# You must run this from each sub-directory.

$dir = `pwd`; chop $dir;
die "$dir: Must run from sub-directory" unless -f "../R.asy";

if (!-f "myparts.lib") {
  print `cp ../myparts.lib .`;
}
@files =  (<*.asy>);
foreach $f ("myparts.lib", @files) {
  # If there's a version in the parent directory, 
  # consider it the definitive version.
  if (-f "../$f") {
    next unless `cmp ./$f ../$f`;
    print "cp ../$f .\n";
    `cp ../$f .`;
  } else {
    print "cp $f ..\n";
    `cp $f ..`;
  }
}
