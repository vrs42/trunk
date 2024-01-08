
all: low.hex high.hex

BTS6120.bin: BTS6120.PLX
	..\..\palx\palx bts6120

low.hex high.hex: BTS6120.bin
	..\..\pdp2hex\pdp2hex -o0 -s30000 -c0200 bts6120 low high

27256set.hex: low.hex high.hex
	cat o0000.hex >27256set.hex
	head --lines=512 low.hex >>27256set.hex
	cat o8000.hex >>27256set.hex
	cat high.hex >>27256set.hex

27512set.hex: low.hex high.hex
	cat o8000.hex >27512set.hex
	head --lines=512 low.hex >>27512set.hex
	cat o18000.hex >>27512set.hex
	cat high.hex >>27512set.hex

dl: low.hex high.hex
	..\..\..\eeprom\sw\eeload\eeload -pffe8 -v low high
