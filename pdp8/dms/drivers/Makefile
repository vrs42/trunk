ACPAL	= df32-cde.pal tc08-ac.pal # rf08-ac.pal
ADPAL	= df32-cde.pal # rf08-ad.pal tc08-ad.pal
AEPAL	= df32-cde.pal tc08-ae.pal # rf08-ae.pal tc08-ae.pal
AFPAL	= df32-af.pal rf08-af.pal tc08-af.pal
PAL	= $(ACPAL) $(ADPAL) $(AEPAL) $(AFPAL)
BIN	= $(PAL:.pal=.bin)

all:	$(BIN)
	bincmp 5200.bin df32-cde.bin
#	bincmp 5600.bin df8s-ac.bin
	bincmp 6000-ac.bin tc08-ac.bin
	bincmp 5200.bin df32-cde.bin
#	bincmp 5600.bin df8s-ad.bin
#	bincmp 6000-ad.bin tc08-ad.bin
	bincmp 5200.bin df32-cde.bin
#	bincmp 5600.bin df8s-ae.bin
	bincmp 6000-ae.bin tc08-ae.bin
	bincmp 2200.bin df32-af.bin
	bincmp 2400.bin rf08-af.bin
	bincmp 2600.bin tc08-af.bin

%.bin:	%.pal
	pal -d $< || rm -f $@
#	bincmp $@ $(<:.pal=.ok) || rm -f $@
