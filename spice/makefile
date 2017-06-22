#
# Create spice models for various Eagle drawings.

EAGLE = /cygdrive/c/Users/Vince/Documents/eagle
DRAWINGS = $(EAGLE)/projects/DEC
SUBDIR = Bxxx Gxxx Rxxx Sxxx
#SUBDIR = Gxxx 

nomodel: sync
	./nomodel.pl

sync:   all
	for i in G824A $(SUBDIR); do (cd $$i; ../sync-up.pl); done

all:
	for i in $(SUBDIR); do (cd $$i; ../sch2asc.pl $(DRAWINGS)/$$i/*/*X.sch); done
