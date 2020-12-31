#!/usr/bin/perl

#
# Read all the .txt files, and generate HTML for the 
# index, albums and images.

# First, the index prolog.
{
  open(IHTML, ">index.html") || die "index.html: $!";
  print IHTML "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n";
  print IHTML "  \"http://www.w3.org/TR/html4/loose.dtd\">\n";
  print IHTML "<STYLE type=\"text/css\">\n";
  print IHTML ".header { font-size:3em };\n";
  print IHTML "}\n</STYLE>\n";
  print IHTML "<STYLE type=\"text/css\">\n";
  print IHTML ".thumbnail {\n  max-width: 180px;\n  max-height: 180px;\n";
  print IHTML "  width: expression(this.width > 180 ? \"180px\" : true);\n";
  print IHTML "  height: expression(this.height > 180 ? \"180px\" : true);\n";
  print IHTML "}\n</STYLE>\n";
  print IHTML "<HTML>\n<HEAD>\n<TITLE>Photo Albums\n</TITLE></HEAD>\n<BODY>\n";
  # Emit thumbnails and links for each picture in the album.
  print IHTML "<TABLE>\n<CAPTION class=header>\n<P>Photo Albums\n</CAPTION>";
  $irow = 0;
}

# Each album has directories which enforce an order on the caption.txt files.
foreach (<*/.>) {
  $dir = $_; $dir =~ s/\r//g; $dir =~ s/..$//;
  die "$dir: $!" unless -d $dir;
# open(ALBUM, "$dir.txt") || die "$dir.txt: $!";
  open(ALBUM, "ls $dir/*/caption.txt $dir/*/*/caption.txt 2>/dev/null |")
    || die "ls $dir: $!";
# @album = (<$dir/*/caption.txt $dir/*/*/caption.txt>);
  open(AHTML, ">$dir.html") || die "$dir.html: $!";
  # Emit album prolog.
  print AHTML "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n";
  print AHTML "  \"http://www.w3.org/TR/html4/loose.dtd\">\n";
  print AHTML "<STYLE type=\"text/css\">\n";
  print AHTML ".header { font-size:3em };\n";
  print AHTML "}\n</STYLE>\n";
  print AHTML "<STYLE type=\"text/css\">\n";
  print AHTML ".thumbnail {\n  max-width: 180px;\n  max-height: 180px;\n";
  print AHTML "  width: expression(this.width > 180 ? \"180px\" : true);\n";
  print AHTML "  height: expression(this.height > 180 ? \"180px\" : true);\n";
  print AHTML "}\n</STYLE>\n";
  print AHTML "<HTML>\n<HEAD>\n<TITLE>$dir</TITLE></HEAD>\n<BODY>\n";
  if (open(INC, "$dir.inc")) {
    while (<INC>) {
      print AHTML $_;
    }
    close(INC);
  }
  # Emit thumbnails and links for each picture in the album.
  print AHTML "<TABLE>\n<CAPTION class=header>$dir<P>\n</CAPTION>\n";
  $idone = 0;
  $arow = 0;
  while (<ALBUM>) {
    s/\r//;
    chop;
    $txt = $_;
    open(TXT, $txt) || die "$txt: $!";
    $desc = <TXT>;
    $desc =~ s/\(<a .*<\/a>\)//;
#   $pic = $_; $pic =~ s/\.txt/.jpg/;
#   $pic =~ s:(/[^/]*)$:/thumbs\1:;
    $pic = $_; $pic =~ s/caption.txt$/thumb.jpg/;
    $pic =~ s/\.jpg/.gif/ unless -f $pic;
    $pic =~ s/\.gif/.jpg/ unless -f $pic;
    die "$pic: $!" unless -f $pic;
    # We have text and a picture. Emit them.
    # Assume each image also has a .html we can reference.
    if (++$arow > 5) {
      print AHTML "<TR>\n"; # Start a fresh row if needed.
      $arow = 1;
    }
    $html = $txt; $html =~ s/caption.txt$/page.html/;
    print AHTML "<TD><A href=$html><IMG class=thumbnail src=$pic></A>\n<br>$desc\n";
    if (!$idone) {
      # We have text and a picture. Emit them for the album index.
      if (++$irow > 5) {
        print IHTML "<TR>\n"; # Start a fresh row if needed.
        $irow = 1;
      }
      print IHTML "<TD><A href=$dir.html><IMG class=thumbnail src=$pic></A>\n<br>$dir\n";
      $idone = 1;
    }
    #
    # Emit the individual page, as well.
#   $pic =~ s:/thumbs/:/:;
    $pic =~ s:/thumb:/photo:;
    $pic =~ s:.*/::;
    $phtml = $txt; $phtml =~ s/caption.txt/page.html/;
    $up = $txt; $up =~ s/caption.txt$//; $up =~ s:[^/]*/:../:g;
    open(PHTML, ">$phtml") || die "$phtml: $!";
    print PHTML "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n";
    print PHTML "  \"http://www.w3.org/TR/html4/loose.dtd\">\n";
    print PHTML "<STYLE type=\"text/css\">\n";
    print PHTML ".header { font-size:3em };\n";
    print PHTML "</STYLE>\n";
    print PHTML "<STYLE type=\"text/css\">\n";
    print PHTML ".scaled {\n max-width: 100%;\n max-height: 80%;\n};\n";
    print PHTML "</STYLE>\n";
    print PHTML "<HTML>\n<HEAD>\n<TITLE>$desc</TITLE></HEAD>\n<BODY>\n";
    print PHTML "<P class=header>$desc<P>\n";
    print PHTML "<A href=$up$dir.html><IMG class=scaled src=$pic></A>\n<P>";
    while (<TXT>) {
      print PHTML $_;
    }
    close(TXT) || die "$txt: $!"
  }
  # Emit album epilog.
  print AHTML "</TABLE>\n";
}
# Emit index epilog.
print IHTML "</TABLE>\n";
