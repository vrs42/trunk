RK05	= diagpack2.rk05 os8.rk05 tekrk0.rk05
RKE	= diagpack2.rke  os8.rke  tekrk0.rke 
PACKS	= $(RK05) $(RKE)
FILES0	= $(wildcard *.0/*)
FILES1	= $(wildcard *.1/*)
FILES	= $(FILES0) $(FILES1)
TOOLS	= ./8tools
.PRECIOUS: $(RKE:.rke=.new)

all:	$(PACKS)

%.0:	demos/*.bn demos/*.tx
	cp $? $@

%.1:	demos/*.pa
	cp $? $@

os8.0:	demos/*.pa
	cp $? $@

os8.1:	demos/*.bn demos/*.tx
	cp $? $@

%.xml+: %.0 %.1 %.0/* %.1/*
	touch $(@:.xml+=.0) $(@:.xml+=.1)
	$(TOOLS)/os8implode $(@:.xml+=)

%.new:	%.xml+
	$(TOOLS)/mkdsk $<

%.rk05:	%.new
	./RK05Simh2Bin -n $(@:.rk05=) -d vintagetek $< $@+
	mv $@+ $@

%.rke:	%.new
	$(TOOLS)/dsk2rke $<
	mv $<.rke $@
