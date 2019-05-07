BIN  = ./bin
RK05 = $(wildcard *.rk05)
RX01 = $(wildcard *.rx01)
RX02 = $(wildcard *.rx02)
TU56 = $(wildcard *.tu56)
DSK  = $(wildcard *.dsk)
MDSK = $(RK05:.rk05=.dsk) $(RX01:.rx01=.dsk) $(RX02:.rx02=.dsk) \
       $(TU56:.tu56=.dsk) $(DSK)
XML  = $(MDSK:.dsk=.xml) $(DSK:.dsk=.xml)

all: $(MDSK) $(XML)

%.dsk: %.rk05
	ln $< $@

%.dsk: %.rx01
	$(BIN)/rx2dk.pl $<

%.dsk: %.rx02
	$(BIN)/rx2dk.pl $<

%.dsk: %.tu56
	$(BIN)/dt2dk.pl $<

%.xml: %.dsk
	$(BIN)/os8xplode.pl $<
