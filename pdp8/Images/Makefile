BIN  = ~/pdp8/8tools
RK05 = $(wildcard *.rk05)
RX01 = $(wildcard *.rx01)
RX02 = $(wildcard *.rx02)
TU56 = $(wildcard *.tu56)
TRPL = $(wildcard *.3p)
OS8P = $(wildcard *.os8p)
DSK  = $(wildcard *.dsk)
TSS  = $(wildcard *.tss)
COS  = $(wildcard *.cos)
# "Made DSK": .dsk files made from other stuff.
MDSK = $(RK05:.rk05=.dsk) $(RX01:.rx01=.dsk) $(RX02:.rx02=.dsk) \
       $(OS8P:.os8p=.dsk) $(TRPL:.3p=.dsk) $(TU56:.tu56=.dsk) $(COS:.cos=.dsk)
XML  = $(MDSK:.dsk=.xml) $(DSK:.dsk=.xml) $(TSS:.tss=.xml)
DIR  = $(XML:.xml=.dir.txt)
AS   = $(wildcard */*.as)
DA   = $(wildcard */*.da)
DB   = $(wildcard */*.db)
# COS files, converted to ASCII.
CTXT = $(AS:.as=.as.txt) $(DB:.db=.db.txt)
DATX = $(DA:.da=.da.txt)

all: $(MDSK) $(XML) $(DIR) $(CTXT) $(DATX)

%.dsk: %.rk05
	rm -f $@; ln $< $@

%.dsk: %.3p
	$(BIN)/3p2dk $<

%.dsk: %.os8p
	$(BIN)/os8p2dk $<

%.dsk: %.rx01
	$(BIN)/rx2dk $<

%.dsk: %.rx02
	$(BIN)/rx2dk $<

%.dsk: %.tu56
	$(BIN)/dt2dk $<

%.dsk: %.cos
	$(BIN)/cos2dk $<

%.dir.txt: %.dsk
	$(BIN)/os8dir $< >$@

%.xml: %.dsk
	@rm -f $@.bad
	$(BIN)/os8xplode $< || (mv $@ $@.bad; exit 1)

%.dir.txt: %.tss
	$(BIN)/tss8dir $< >$@

%.xml: %.tss
	@rm -f $@.bad
	$(BIN)/tss8xplode $< || (mv $@ $@.bad; exit 1)

%.as.txt: %.as
	$(BIN)/cos2txt $<

%.db.txt: %.db
	$(BIN)/cos2txt $<

%.da.txt: %.da
	$(BIN)/2asc $< >$@

clobber:
	rm -fr $(XML) $(MDSK) *.0 *.1
