BIN  = ./bin
RX01 = $(wildcard *.rx01)
TU56 = $(wildcard *.tu56)
DSK  = $(wildcard *.dsk)
MDSK = $(RX01:.rx01=.dsk) $(TU56:.tu56=.dsk) $(DSK)
XML  = $(MDSK:.dsk=.xml) $(DSK:.dsk=.xml)

all: $(XML)

%.dsk: %.tu56
	$(BIN)/dt2dk.pl $<

%.dsk: %.rx01
	$(BIN)/rx2dk.pl $<

%.xml: %.dsk
	$(BIN)/os8xplode.pl $<
