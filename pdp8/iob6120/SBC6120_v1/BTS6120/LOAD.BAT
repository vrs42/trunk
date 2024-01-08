palx %1
pdp2hex -s20000 -c0200 %1 low high
eeload -v low high
