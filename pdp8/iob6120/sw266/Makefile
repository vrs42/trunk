TOOLS	= ../tools

archived:
	@echo "This is an archive; you aren't meant to re-make it."
	@echo "(The date and time in the binary would be wrong.)"

all:	low high

low high: BTS6120.bin
	$(TOOLS)/pdp2hex -s20000 -c0200 $< low high

clean:
	rm -f BTS6120.bin

%.bin:	%.plx
	$(TOOLS)/palx $<
