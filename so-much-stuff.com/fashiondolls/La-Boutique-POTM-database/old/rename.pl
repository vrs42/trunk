#!/usr/bin/perl

#
# Renames are a pain.  Each image has many related files:
# <yyyy><mm><tote><month><LongRunTogetherDescription>.jpg
#    Each file starts with a four digit year and a 2 digit
#    month, an optional "tote" designator, and the text 
#    month name.  This is then followed by the run-together
#    description. (The description is stripped of blanks
#    and illegal characters to find the image.)
# captions
#    Contains a line for each image. The thumbnails and 
#    descriptions are displayed in the order given, which 
#    is why every line has <yyyy><mm><tote> before the 
#    first blank.  (This also facilitates reconstructing 
#    the list, should that ever be necessary.)  After the 
#    space is the description, followed by ".jpg".
# thumbs/<yyyy><mm><tote><month><LongRunTogetherDescription>.jpg
#    This is the script genarated thumbnail for the associated image.
# <yyyy><mm><tote><month><LongRunTogetherDescription>.txt
#    This is the script generated description, which is the 
#    description from the "captions" file, with the year added 
#    after the first word (which is assumed to be the month).
# <yyyy><mm><tote><month><LongRunTogetherDescription>.html
#    This is the script generated HTML that displays that 
#    image full size on a page of it's own.
#
# In addition, references to these files are generated one 
# level up, to tie these files into the general album structure.
# Hopefully those scripts will take care of themselves, if things 
# are in order here.
#
# Renaming a file, then, is actually a bit of a misnomer.  What 
# we are actually doing is setting up for an add, and doing the 
# complicated bit of removing the old files.
#
($oldname, $newname) = @ARGV;
die "$oldname: $!" unless -f $oldname;
die "newname: argument missing" unless defined $newname;
die "$newname: unchanged!" if $oldname eq $newname;

#
# First up, try to find the correct line in "captions".
# We cheat a bit here, by using the name of the .jpg to find the 
# .txt, then read that for the full description.
$txt = $oldname; $txt =~ s/.jpg$/.txt/;
die "$txt: no .jpg!" if $txt eq $oldname;
open(TXT, "$txt") || die "$txt: $!";
$odesc = <TXT> || die "$txt read: $!";
$odesc =~ s/\r$//; $odesc =~ s/\n$//;
$odesc =~ s/ 20\d\d / / || die "$odesc: no year!";
$odesc .= ".jpg";
close(TXT);
# Copy "captions", with attention to lines that end with $odesc.
open(INPUT, "captions") || die "captions: $!";
open(OUTPUT, ">captions+") || die "captions+: $!";
$matched = 0; # Need exactly one match
#warn "Looking for '$odesc'\n";
while (<INPUT>) {
  if (/$odesc/) {
    $matched++;
    next;
  }
  print OUTPUT $_;
}
die "captions: $matched matches!" unless $matched == 1;

print STDERR "Please execute the following commands:\n";
print "  mv captions+ captions\n";
print "  mv $oldname $newname\n";
print "  mv thumbs/$oldname thumbs/$newname\n";
print "  svn -delete $oldname\n";
print "  svn -delete thumbs/$oldname\n";
$oldname =~ s/.jpg$/.txt/;
print "  svn -delete $oldname\n";
$oldname =~ s/.txt$/.html/;
print "  svn -delete $oldname\n";
print STDERR "and then add $newname to the captions file.\n";
exit 0
