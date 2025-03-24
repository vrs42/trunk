PACKS	= diagpack2.rk05 os8.rk05 tekrk0.rk05
FILES0	= $(wildcard *.0/*)
FILES1	= $(wildcard *.1/*)
FILES	= $(FILES0) $(FILES1)

all:	$(PACKS)

%.0:	demos/*.bn
	cp $? $@

%.1:	demos/*.pa
	cp $? $@

%.xml+: %.0 %.1 %.0/* %.1/*
	touch $(@:.xml+=.0) $(@:.xml+=.1)
	os8implode $(@:.xml+=)

%.new:	%.xml+
	mkdsk $<

%.rk05:	%.new
	./RK05Simh2Bin -n $(@:.rk05=) -d tektronix $< $@+
	mv $@+ $@
