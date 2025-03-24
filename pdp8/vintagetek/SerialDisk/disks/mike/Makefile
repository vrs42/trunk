SDSK	= Mike_PDP-12.0/sdskns.bn Mike_PDP-12.0/sdskns.ls \
	Mike_PDP-12.0/sdskns.pa Mike_PDP-12.0/sdsksy.bn \
	Mike_PDP-12.0/sdsksy.ls Mike_PDP-12.0/sdsksy.pa

Mike_PDP-12.new: Mike_PDP-12.xml+
	mkdsk $<

Mike_PDP-12.xml+: *.0/* *.1/*
	os8implode Mike_PDP-12

Mike_PDP-12.0/%.bn: %.bin
	bin2bn $< >$@

Mike_PDP-12.0/%.ls: %.lst
	cp $< $@

Mike_PDP-12.0/%.pa: %.pal
	cp $< $@

%.bin:	%.pal
	pal -d $<
