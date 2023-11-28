PAL	= df32.pal rf08.pal
BIN	= $(PAL:.pal=.bin)

all:	$(BIN)

%.bin:	%.pal
	pal -d $< || rm -f $@
	bincmp $@ $(<:.pal=.ok) || rm -f $@
