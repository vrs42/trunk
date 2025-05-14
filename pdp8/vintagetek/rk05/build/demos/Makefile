PAL	= devcpy.pa donet.pa kaleid.pa life.pa mvc8ts.pa noeae.pa \
	rks8es.pa spacex.pa spcwr3.pa vc8tst.pa tank.pa 
BIN	= $(PAL:.pa=.bn)
.PRECIOUS: .bin

all:	$(BIN)

%.bin:	%.pa
	pal -d -e $< || (rm -f $@; exit 1)

%.bn:	%.bin
	bin2bn $< >$@ || (rm -f $@; exit 1)

install:
	for i in ../*.0; do cp *.bn $$i; done
	for i in ../*.0; do cp *.tx $$i; done
	for i in ../*.1; do cp *.pa $$i; done
