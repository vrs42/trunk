RKE	= $(wildcard *.rke)
RK05	= $(RKE:.rke=.rk05)
DSK	= $(RKE:.rke=.new)
IMAGE	= $(RK05) $(RKE)

all:	update $(RK05) $(RKE) $(DSK)

update:
	cd build; make

%.rk05:	build/%.rk05
	cp $< .

%.rke:	build/%.rke
	cp $< .

%.new:	build/%.new
	cp $< .
