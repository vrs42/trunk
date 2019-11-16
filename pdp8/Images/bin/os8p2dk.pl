#!/usr/bin/perl

# Convert packed "os8p" to disk images.

# The bytes are packed.  Each sector is 128 (RX01) 
# or 256 (RX02) bytes.  There are 77 tracks and 
# 26 sectors/track.

# This gives a size of 128*77*26 = 256256 bytes 
# for RX01, and 512512 bytes for RX02.

# The RX8E (in 8 bit mode) just reads the 128
# byte sectors.  This means a 256 word OS/8
# block requires 3 sectors.

# Track 0 is not used, so 76*26/3 would give
# a theoretical capacity of 658 blocks.
# Note: 660 are reported in the DIR listings!
# 667 OS/8 blocks is the theoretical maximum
# for an RX01 in 8-bit mode.  660 free  data
# blocks is the maximim, since the directory
# segments occupy blocks 1-6.
# We work around this by offsetting track by 
# 1, then wrapping to use track 0 last.

foreach $flp (@ARGV) {
  open(INPUT, $flp) || die "$flp: $!";
  binmode(INPUT);
  $f = $flp; $f =~ s/[.]os8p$//;
  $f .= ".dsk";
  ($_, $_, $_, $_, $_, $_, $_, $size) = stat(INPUT);
  die "$flp: volume is not a floppy image" if $size % (77*16);
  $size /= 77 * 26; # Calculate sector size
  die "$flp: volume is not an RX01 image"
    unless ($size == 128);
  $ds = $size * 3 / 4;
  # Interleave is 2 for RX01, but 3 for RX02!
  $ileave = 2 + ($size > 128);

# die "$f: exists" if -f $f;
  open(OUTPUT, ">$f") || die "$f: $!";
  binmode(OUTPUT);

  # The tracks are in the right order.
  # Skip the first 06400 bytes!
  # RX01: 26*76 = 1976 sectors.  1976 sectors == 494 OS/8 blocks.
  # RX02: 26*76 = 1976 sectors.  1976 sectors == 988 OS/8 blocks.
  $mod3 = 0; # No block yet!
  for ($ltrack = 0; $ltrack < 77; $ltrack++) {
    $track = ($ltrack+1) % 77;
    $tpos = $track * 26 * $size;
    for ($lsect = 0; $lsect < 26; $lsect++) {
      # Note: Sector numbering is traditionally 1..26, not 0..25.
      # We use 0..25 here to make the match easier.
      # Sectors are interleaved within the track.
      $psect = ($lsect*2) % 26 + ($lsect > 12) if $ileave == 2;
      $psect = ($lsect*$ileave) % 26 unless $ileave == 2;
#print "$lsect: $psect\n";
      $spos = $tpos + $psect * $size;
      seek(INPUT, $spos, 0) || die "seek($flp): $!";
      $count = read(INPUT, $buf, $size);
      die "read($flp): $!" if $count < 0;
      last unless $count;
      die "read($flp): wrong count $!" if $count != $size;
      # 3 bytes doesn't divide the sector size of 128 bytes.
      # Collect @ buf for 3 sectors, to form an OS/8 block.
      push(@buf, unpack("C*", $buf));
      next if ++$mod3 % 3;
      # OK, we have enough to build an OS/8 block.
      while (@buf) {
        $b1 = shift @buf;
        $b2 = shift @buf;
        $b3 = shift @buf;
        # The bit ordering is OS8:
        # abcdefgh ijklmnop qrstuvwx
        # -> qrstabcdefgh uvwxijklmnop
        $word1 = $b1 + (($b3 >> 4)<<8);
        $word2 = $b2 + (($b3 & 017)<<8);
        print OUTPUT pack("SS", $word1, $word2);
      }
      $mod3 = 0;
    }
  }
}
exit 0;
