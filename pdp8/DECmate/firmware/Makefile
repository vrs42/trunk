#
# 358360.pal is the source for the DECmate II ROM set
# consisting of 358E2, 359E2, and 360E2. 
PAL	= 358360.pal 390392.pal 330E4.pal 399401.pal
BIN	= $(PAL:.pal=.bin)
LST	= $(PAL:.pal=.lst)
ROMS	= 358E2 359E2 360E2 390E2 391E2 392E2 330E4 399E2 400E2 401E2

all:	$(BIN) $(ROMS)

%.bin:	%.pal .force
	pal -d -e $<

%.lst:	%.pal
	pal -d -e $<

358E2 359E2 360E2: 358360.bin DECmateII
	./DECmateII $< 358E2 359E2 360E2

390E2 391E2 392E2: 390392.bin DECmateII
	./DECmateII $< 390E2 391E2 392E2

399E2 400E2 401E2: 399401.bin DECmateII
	./DECmateII $< 399E2 400E2 401E2

330E4: 330E4.bin DECmateIII
	./DECmateIII $<

force:
	touch .force
	@make
