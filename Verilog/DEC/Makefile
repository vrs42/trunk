BIN	= ~/Verilog/bin
EAGLE	= ~/Eagle
DIRS	= M1703C M216X M220C M221D M706O M707X M8340E M8341D M837cc \
	M8650D+cpld+ M869D M8830Cpld M885E VC8E WAR war-in # M216C
FAILS	= lbrtst M8416C M8416P M8416V1

all:	$(DIRS)
	for i in $?; do (cd $$i; make -f ../Makefile $$i.v); done

# These two rules are failing because only one % is expanded per dependency.
# Which is wrong anyway -- the parent directory omits the version.
%pins.txt: $(EAGLE)/projects/DEC/Mxxx/%/%.sch $(BIN)/pinlst
	$(BIN)/pinlst $<

%prts.txt: $(EAGLE)/projects/DEC/Mxxx/%/%.sch $(BIN)/pinlst
	$(BIN)/pinlst $<

%.PLD: %pins.txt %prts.txt $(BIN)/topld.pl
	$(BIN)/topld.pl $(@:.PLD=)

%E.PLD: %.PLD
	cp $< $@

%X.PLD: %.PLD $(BIN)/smaller.pl
	$(BIN)/smaller.pl $< >vv || (rm vv; exit 1)
	$(BIN)/smaller.pl vv >$@ || (rm $@; exit 1)

%.v: %X.PLD $(BIN)/cupl2v.pl
	$(BIN)/cupl2v.pl $< >vv || (rm vv; exit 1)
	mv vv $@
