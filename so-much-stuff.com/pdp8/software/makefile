DEC = ../../../pdp8/src/dec
DECUS = ../../../pdp8/src/decus
MAINDEC = ../../../pdp8/src/maindec
ALL = dec.php decus.php maindec.php 

all:	$(ALL)

dec.php: .
	cd $(DEC); ./publish.pl
	(cd $(DEC); tar cf - $@) | tar xvf -

decus.php: .
	(cd $(DECUS); ./publish.pl) >decus.php

maindec.php: .
	cd $(MAINDEC); ./publish.pl
	(cd $(MAINDEC); tar cf - $@) | tar xvf -
