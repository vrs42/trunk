PAL	= focal76.pal
BIN	= $(PAL:.pal=.bin)

all:	$(BIN)
	bincmp focal76.bin focal76.bn

%.bin:	%.pal
	pal -d $^ || (rm $@ && exit 1)
