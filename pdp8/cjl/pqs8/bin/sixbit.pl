#!/usr/bin/perl

# Dump the media in octal and sixbit.

# Pick a block size (in words!)
$bsize = 128;
$upack = "S$bsize";

# Open the file
open(INPUT, $ARGV[0]) || die "$ARGV[0]: $!";
binmode(INPUT);

#
# Read each block and print it.
for ($block = 0; ; $block++) {
    seek(INPUT, $block*2*$bsize, 0) || die "$ARGV[0] file seek: $!";
    read(INPUT, $buf, 2*$bsize) || die "$ARGV[0] file read: $!";
    @buf = unpack($upack, $buf);
    $sixbit = "";
    for ($offset = 0; $offset < $bsize; $offset++) {
        if ($offset%8 == 0) {
            printf "%s\r\n%04o %03o)", $sixbit, $block, $offset;
            $sixbit = "";
        }
        printf "%04o ", $buf[$offset];
   	@c = ($buf[$offset]>>6, $buf[$offset]&077);
    	grep($_ = ($_ > 040? $_ : $_ + 0100), @c);
    	$sixbit .= pack('CC', @c);
    }
    printf "%s\r\n", $sixbit;
}
