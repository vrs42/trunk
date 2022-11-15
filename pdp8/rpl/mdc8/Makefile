RX1	= rpl001.rx01 rpl010.rx01 rpl014.rx01 rpl015b.rx01 rpl015.rx01 \
	  rpl016.rx01 rpl017.rx01 rpl018.rx01
P3	= rpl002.3p rpl003.3p rpl004.3p rpl005.3p rpl006.3p rpl007.3p \
	  rpl008.3p rpl009.3p rpl011.3p rpl012.3p rpl013.3p
UNK	= rpl006.rx1 rpl007.rx1 \
DSK	= $(RX1:.rx01=.dsk) $(P3:.p3=.dsk)
DIR	= $(DSK:.dsk=.dir)

all:	$(DIR)

%.dsk:	%.rx01
	rx2dk $<

%.dsk:	%.3p
	3p2dk $<

%.dir:	%.dsk
	os8dir $< >$@ || rm $@
