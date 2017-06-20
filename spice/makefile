#
# Create spice models for various Eagle drawings.

EAGLE = /cygdrive/c/Users/Vince/Documents/eagle
DRAWINGS = $(EAGLE)/projects/DEC
SUBDIR = Bxxx Gxxx Rxxx Sxxx

all:    synced
	for i in $(SUBDIR); do (cd $$i; ../sch2asc.pl $(DRAWINGS)/$$i/*/*X.sch); done

synced:
	for i in G824A $(SUBDIR); do (cd $$i; ../sync-up.pl); done
