#!/usr/bin/perl

# Read in the image
open(STDIN, "4kImage.txt") || die "4kImage.txt: $!";
@core = ();
for ($i = 0; $i < 4096; $i++) {
  $_ = <STDIN> || die "STDIN: $!";
  push(@core, oct($_));
}

# We also need the parity bit for each word.
@parity = ();
foreach (@core) {
  $p = 0;
  $t = $_;
  while ($t) {
    $t = $t & ($t-1);
    $p = !$p;
  }
  push(@parity, $p);
}

#Dump the high 4 bits of every word in Verilog.
for ($seg = 0; $seg < 64; $seg++) {
  $s = sprintf("%02X", $seg);
  $index = $seg*64 + 63; # Count down to get the ordering right.
  $h = "";
  for ($i = 0; $i < 64; $i++, $index--) { 
     $h .= sprintf("%1x",  $core[$index] >> 8);
  }
  printf ".INIT_$s(256'h$h),\n";
}
printf "\n";
# Dump low byte of high memory.
for ($seg = 0; $seg < 64; $seg++) {
  $s = sprintf("%02X", $seg);
  $index = 04000 + $seg*32 + 31; # Count down to get the ordering right.
  $h = "";
  for ($i = 0; $i < 32; $i++, $index--) { 
     $h .= sprintf("%02x",  $core[$index] & 0xFF);
  }
  printf ".INIT_$s(256'h$h),\n";
}
printf "\n";
# Now the parity bits for high memory.
for ($seg = 0; $seg < 8; $seg++) {
  $s = sprintf("%02X", $seg);
  $index = 04000 + $seg*256 + 255; # Count down to get the ordering right.
  $h = "";
  for ($i = 0; $i < 256; $i+=4) { 
     $p = 0;
     for ($j = $i; $j < $i+4; $j++, $index--) {
       $p += $p + $parity[$index];
     }
     $h .= sprintf("%1x",  $p);
  }
  printf ".INITP_$s(256'h$h),\n";
}
printf "\n";
for ($seg = 0; $seg < 64; $seg++) {
  # Dump low byte of low memory.
  $s = sprintf("%02X", $seg);
  $index = 00000 + $seg*32 + 31; # Count down to get the ordering right.
  $h = "";
  for ($i = 0; $i < 32; $i++, $index--) { 
     $h .= sprintf("%02x",  $core[$index] & 0xFF);
  }
  printf ".INIT_$s(256'h$h),\n";
}
printf "\n";
# Now the parity bits for low memory.
for ($seg = 0; $seg < 8; $seg++) {
  $s = sprintf("%02X", $seg);
  $index = 00000 + $seg*256 + 255; # Count down to get the ordering right.
  $h = "";
  for ($i = 0; $i < 256; $i+=4) { 
     $p = 0;
     for ($j = $i; $j < $i+4; $j++, $index--) {
       $p += $p + $parity[$index];
     }
     $h .= sprintf("%1x",  $p);
  }
  printf ".INITP_$s(256'h$h),\n";
}
