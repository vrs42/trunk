#!/usr/bin/perl

$dir = <<'!';
bsave.sv 	0007	17	17-jun-75
asmblr.sv	0030	33	17-jun-75
map.sv   	0071	17	17-jun-75
blkodt.sv	0112	17	17-jun-75
set.sv   	0133	17	17-jun-75
core.sv  	0154	17	17-jun-75
date.sv  	0175	17	17-jun-75
print.sv 	0216	17	17-jun-75
filman.sv	0237	17	17-jun-75
allcat.sv	0260	17	17-jun-75
consol.sv	0301	17	17-jun-75
focpqs.sv	0322	33	17-jun-75
os8con.sv	0363	17	17-jun-75
systat.sv	0404	17	17-jun-75
direct.sv	0425	17	17-jun-75
blkcpy.sv	0446	17	17-jun-75
syshnd.sv	0467	17	17-jun-75
dtahnd.sv	0510	17	17-jun-75
rxahnd.sv	0531	17	17-jun-75
rkahnd.sv	0552	17	17-jun-75
ltahnd.sv	0573	17	17-jun-75
dsuhnd.sv	0614	17	17-jun-75
linhnd.sv	0635	17	17-jun-75
ltdhnd.sv	0656	17	17-jun-75
lidhnd.sv	0677	17	17-jun-75
rxutil.sv	0720	17	17-jun-75
rk4mat.sv	0741	17	17-jun-75
mark12.sv	0762	17	17-jun-75
tc12f.sv 	1003	17	17-jun-75
l6dcon.sv	1024	17	17-jun-75
ltbodt.sv	1045	17	17-jun-75
ltdump.sv	1066	17	17-jun-75
dt4mat.sv	1107	17	17-jun-75
dtcopy.sv	1130	17	17-jun-75
flphnd.sv	1151	17	17-jun-75
<empty>  	1172	2614	
!

$count = 0;
while ($dir =~ s/(\S+)\s+(\d+)\s+(\d+).*//) {
  ($name[$count], $first[$count], $size[$count]) = ($1, 2*oct($2), 2*oct($3));
  $count++;
}

foreach $f (@ARGV) {
  # Read a ".du" format file, and extract the relevant info.
  open(INPUT, $f) || die "$f: $!";
  while (<INPUT>) {
    if (/^TR\s+\d:(\d+)/) {
      $first = oct($1);
      $s = <INPUT>;
      die unless $s =~ /^\s+(\d+)/;
      $size = oct($1);
      $s = <INPUT>;
      die unless $s =~ /^\s+\d:(\d+)/;
      $output = oct($1);
      # At this point, we know which blocks and their destination.
      # Locate the correct input file.
      for ($index = 0; $index < $count; $index++) {
        last unless $first[$index] <= $first;
      }
      $index--;
      $name = $name[$index];
      # Form an offset into the file.
      $offset = $first - $first[$index] - 1;
      # TODO: Translate the offset/size information into an address range.
      # Open the relevant ".sv" file and read the control block.
      open(SV, "$name") || die "$name: $!";
      read(SV, $buf, 384);
      @buf = unpack("C*", $buf);
      # Convert 128 word pairs packed $buf to unpacked $dsk.
      for ($i = 0; $i < 128; $i += 2) {
         $dsk[$i*2] = $buf[$i*3] + (($buf[$i*3+2]&0xF0)<<4);
         $dsk[$i*2+1] = $buf[$i*3+1] + (($buf[$i*3+2]&0xF)<<8);
      }
      # Extract the starting address.
      $nseg = 010000 - $dsk[0];
      $sa = (($dsk[1]&070)<<01000) + $dsk[2];
      $jsw = $dsk[3];
      # Use the segment table to translate the block numbers into an 
      # address range.
      for ($i = 0; $i < $nseg; $i++) {
        # Is the block number within the segment?
        # ($first is conveniently in page-sized blocks.)
        $np = $dsk[4+$i*2+1]>>6;
        last if $offset < $np;
        $offset -= $np;
      }
      # At this point, $offset has been decremented to fit inside the segment.
      # Offset by the segment origin to recover the first address.
      $offset = $dsk[4+$i*2] + $offset*128;
      $offset += $dsk[4+$i*2+1] << 01000; # Include the starting field
      # Convert size to an ending address.
# BUGBUG: Worry about the case where size exceeds the segment size!
      $end = $size*128 + $offset;
# Worry about the case where this file name is the same as the last.
      printf "../bin/transfer $name 0%04o 0%04o 0%04o\n", $offset, $end, $output;
    }
  }
}
