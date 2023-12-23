PB	= $(GLOB:*-pb)
BIN	= dta0.bin td8e.bin tmod.bin 8-367b.bin pl8a.bin
ALL	= dms.td8e

all:	$(ALL)

dms.df32: install.df32 $(PB)
	./install.df32

dms.rf08: install.rf08 $(PB)
	./install.rf08

dms.tu56: install.tu56 $(PB)
	./install.tu56

dms.td8e: install.td8e $(PB) $(BIN)
	./install.td8e

%.bin:	%.pal
	pal -d $< || rm $@
