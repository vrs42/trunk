BIN  = ./bin
RK05 = $(wildcard *.rk05)
RX01 = $(wildcard *.rx01)
RX02 = $(wildcard *.rx02)
TU56 = $(wildcard *.tu56)
TRPL = $(wildcard *.3p)
OS8P = $(wildcard *.os8p)
DSK  = $(wildcard *.dsk)
MDSK = $(RK05:.rk05=.dsk) $(RX01:.rx01=.dsk) $(RX02:.rx02=.dsk) \
       $(OS8P:.os8p=.dsk) $(TRPL:.3p=.dsk) $(TU56:.tu56=.dsk)
XML  = $(MDSK:.dsk=.xml) $(DSK:.dsk=.xml)
DIR  = $(XML:.xml=.dir.txt)

all: $(MDSK) $(XML) $(DIR)

%.dsk: %.rk05
	rm -f $@; ln $< $@

%.dsk: %.3p
	$(BIN)/3p2dk.pl $<

%.dsk: %.os8p
	$(BIN)/os8p2dk.pl $<

%.dsk: %.rx01
	$(BIN)/rx2dk.pl $<

%.dsk: %.rx02
	$(BIN)/rx2dk.pl $<

%.dsk: %.tu56
	$(BIN)/dt2dk.pl $<

%.dir.txt: %.dsk
	$(BIN)/os8dir.pl $< >$@

%.xml: %.dsk
	@rm -f $@.bad
	$(BIN)/os8xplode.pl $< || (mv $@ $@.bad; exit 1)

clobber:
	rm -fr $(XML) $(MDSK) *.0 *.1
