IMAGE	= $(wildcard *.rk05)

all:	update $(IMAGE) $(IMAGE:.rk05=.new)

update:
	cd build; make

$(IMAGE): build/$(IMAGE)
	cp $< .

$(IMAGE:.rk05=.new): build/$(IMAGE:.rk05=.new)
	cp $< .
