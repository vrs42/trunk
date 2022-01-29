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
  open(INPUT, $f) || die "$f: $!";
  while (<INPUT>) {
    next unless /^TR\s+\d:(\d+)/;
    $first = oct($1);
    $s = <INPUT>;
    die unless $s =~ /^\s+(\d+)/;
    $size = oct($1);
    $s = <INPUT>;
    die unless $s =~ /^\s+\d:(\d+)/;
    $output = oct($1);
    # Locate the correct input file.
    for ($index = 0; $index < $count; $index++) {
      last unless $first[$index] <= $first;
    }
    $index--;
    $name = $name[$index];
#   $name =~ s/sv$/sd/;
    $offset = $first - $first[$index] - 1;
    printf "../bin/transfer $name %d %d 0%o\n", $offset, $size, $output;
  }
}
