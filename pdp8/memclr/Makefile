PAL	= absclr.pal abshlt.pal clear.pal clear2.pal clear3.pal clear4.pal \
	memclr.pal memclr2.pal memclr3.pal memclr4.pal
BIN	= $(PAL:.pal=.bin)

all:	$(BIN) junk.bin
	pdp8 tests

%.bin:	%.pal
	pal -d $<
