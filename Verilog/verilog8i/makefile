all: pdp8i.v

pdp8i.v: ./toverilog.pl pdp8i.prt pdp8i.pin pdp8i.net
	./toverilog.pl >$@

pdp8i.prt: partlist.txt
	cp $? $@

pdp8i.pin: pinlist.txt
	cp $? $@

pdp8i.net: netlist.txt
	cp $? $@
