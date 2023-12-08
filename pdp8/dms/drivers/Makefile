PAL	= df32-af.pal rf08-af.pal tc08-af.pal
BIN	= $(PAL:.pal=.bin)

all:	$(BIN)
	bincmp 2200.bin df32-af.bin
	bincmp 2400.bin rf08-af.bin
	bincmp 2600.bin tc08-af.bin

%.bin:	%.pal
	pal -d $< || rm -f $@
#	bincmp $@ $(<:.pal=.ok) || rm -f $@
