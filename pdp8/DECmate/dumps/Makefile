#
# Convert the dumped ROMs to .bin, then disassemble them.
#
MOT	= 390392.mot 399401.mot 330E4.mot
BIN	= $(MOT:.mot=.bin) 358360.bin
PAL	= $(BIN:.bin=.pal)

all:	$(PAL)

330E4.bin: 330E4.mot ./DECmateIII
	./DECmateIII $<

390392.bin: 390E2.mot 391E2.mot 392E2.mot ./DECmateII
	./DECmateII $@ $^

399401.bin: 399E2.mot 400E2.mot 401E2.mot ./DECmateII
	./DECmateII $@ $^

%.pal:	%.bin %.bin.syms
	bin2pal $<
	pal -d foo.pal && bincmp foo.bin $<
	mv foo.pal $@
	mv foo.lst $(@:.pal=.lst)
