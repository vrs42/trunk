$dirs{'misc'} = *misc;
$dirs{'dec'} = *dec;
$dirs{'decus'} = *decus;
$dirs{'digital'} = *digital;
$dirs{'maindec'} = *maindec;

open(INPUT, "labels.txt") || die "labels.txt: $!";
while (<INPUT>) {
    $filename = $_;
    $desc = '';
    $filename =~ s/\r*\n//;
    $dir = "misc";
    $dir = "dec" if $filename =~ /^ak-/;
    $dir = "dec" if $filename =~ /^dec-/;
    $dir = "decus" if $filename =~ /^decus-/;
    $dir = "digital" if $filename =~ /^digital-/;
    $dir = "maindec" if $filename =~ /^maindec-/;
    *a = $dirs{$dir};
    while (<INPUT>) {
	last if /^\.\r*$/;
	$desc .= $_;
    }
    $a{$filename} = $desc;
    
}

open(OUTPUT, ">index.html") || die "index.html: $!";
print OUTPUT "<BODY>\n";
print OUTPUT "<P>Hello, and welcome to my tape archive.\n";
print OUTPUT "<P>The various sub-directories have various tape images in them,";
print OUTPUT "using what I hope is a fairly obvious system.\n";
print OUTPUT "<P>The actual tape images themselves come as a set of related";
print OUTPUT "files:\n";
print OUTPUT "<DL>\n";
print OUTPUT "<DT><DD>The tape image itself generally has no extension.\n";
print OUTPUT "File names that end in \"-pb\" should be in BIN format,\n";
print OUTPUT "\"-pm\" is for RIM format, \"-pa\" is for PAL source code,\n";
print OUTPUT "and \"-ft\" is for FORTRAN source code.\n";
print OUTPUT "<DT>.od<DD>There will always be a .od for every tape image,\n";
print OUTPUT "which contains a human readable octal dump of the tape image.\n";
#print OUTPUT "<DT>.lbl<DD>The .lbl file contains the file name of the\n";
#print OUTPUT "associated binary,followed by the text from the label of the\n";
#print OUTPUT "tape.  The last line of a .lbl file has a lone \".\" on it\n";
#print OUTPUT "(for use as a separator).  The file \"labels.txt\" contains \n";
#print OUTPUT "the concatenated information for the collection.\n";
print OUTPUT "<DT>.txt<DD>If the file looks like it most likely contains\n";
print OUTPUT "text, there will be a .txt file, which contains the ASCII\n";
print OUTPUT "text, with nulls stripped out, and the eighth bit forced off,\n";
print OUTPUT "which is usually necessary for the text to display properly\n";
print OUTPUT "with modern equipment.\n";
print OUTPUT "</DL>\n";
print OUTPUT "<P><P>Vince Slyngstad\n";
print OUTPUT "<P><P><UL>\n";
foreach $dir (sort keys %dirs) {
    print OUTPUT "<LI><A href=$dir.html>$dir</A>\n";
}
print OUTPUT "</UL>\n";
close(OUTPUT);


foreach $dir (keys %dirs) {
    *a = $dirs{$dir};
    open(OUTPUT, ">$dir.html") || die "$dir.html: $!";
    print OUTPUT "<BODY>\n";
    print OUTPUT "<TABLE>\n";
    $green = 0;
    foreach $filename (sort keys %a) {
	if ($green) {
	    print OUTPUT "<TR bgcolor=#80ff80>\n";
	} else {
	    print OUTPUT "<TR bgcolor=#ffffff>\n";
	}
        $green = !$green;
	print OUTPUT "<TD valign=top>\n";
	print OUTPUT "<PRE>\n";
	print OUTPUT "<A href='$dir/$filename'>$filename</A>\n";
	print OUTPUT "<A href='$dir/$filename.od'>$filename.od</A>\n";
	print OUTPUT "<A href='$dir/$filename.txt'>$filename.txt</A>\n"
	    if -f "$dir/$filename.txt";
	print OUTPUT "<TD valign=top>\n";
	print OUTPUT "<PRE>\n";
	print OUTPUT $a{$filename};
	print OUTPUT "</TR>\n";
    }
    print OUTPUT "</TABLE>\n";
    close(OUTPUT);
}

exit 0;
