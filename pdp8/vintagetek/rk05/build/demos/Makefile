PAL	= devcpy.pa donet.pa kaleid.pa life.pa mvc8ts.pa noeae.pa \
	rks8es.pa spacex.pa spcwr3.pa vc8tst.pa # tank.pa 
BIN	= $(PAL:.pa=.bn)
.PRECIOUS: .bin

all:	$(BIN)

%.bin:	%.pa
	pal -d -e $< || (rm -f $@; exit 1)

%.bn:	%.bin
	bin2bn $< >$@ || (rm -f $@; exit 1)
