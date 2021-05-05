#
# 358360.pal is the source for the DECmate II ROM set
# consisting of 358E2, 359E2, and 360E2. 
PAL	= 358360.pal 390392.pal
BIN	= $(PAL:.pal=.bin)
LST	= $(PAL:.pal=.lst)
ROMS	= 358E2 359E2 360E2 390E2 391E2 392E2

all:	$(ROMS)

%.bin:	%.pal .force
	pal -d -e $<

%.lst:	%.pal
	pal -e $<

358E2 359E2 360E2: 358360.bin
	./DECmateII $< 358E2 359E2 360E2

390E2 391E2 392E2: 390392.bin
	./DECmateII $< 390E2 391E2 392E2

force:
	touch .force
	@make
