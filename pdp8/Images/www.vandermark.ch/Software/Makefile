M43	= $(shell find . -name "*.m43")
PXG	= $(shell find . -name "*.pxg")
DT	= $(PXG:.pxg=.dt)
DSK	= $(PXG:.pxg=.dsk) $(M43:.m43=.dsk)
LST	= $(DSK:.dsk=.lst)
TOOLS	= $(HOME)/pdp8/8tools

all:	$(DT) $(DSK) $(LST)

%.dt:	%.pxg $(TOOLS)/pxg2dt
	rm -f $@ && $(TOOLS)/pxg2dt $<

%.dsk:	%.dt $(TOOLS)/dt2dk
	rm -f $@ && $(TOOLS)/dt2dk $< && mv $<.dsk $@

%.dsk:	%.m43 $(TOOLS)/m43dk
	rm -f $@ && $(TOOLS)/m43dk $<

%.lst:	%.dsk $(TOOLS)/os8dir
#	-$(TOOLS)/os8dir $< >$@ || (rm -f $@; exit 1)
	-$(TOOLS)/os8dir $< >$@

clean:
	rm -f $(LST)
	rm -f $(DT)
	rm -f $(DSK)

what:
	echo $(DT) $(DSK) $(LST)
