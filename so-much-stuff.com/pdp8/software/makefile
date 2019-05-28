AK = `/bin/pwd`/../../../pdp8/src/ak
DEC = `/bin/pwd`/../../../pdp8/src/dec
DECUS = `/bin/pwd`/../../../pdp8/src/decus
MAINDEC = `/bin/pwd`/../../../pdp8/src/maindec
SI = `/bin/pwd`/../../../pdp8/src/si
ALL = ak.php dec.php decus.php maindec.php si.php

all:	$(ALL)

ak.php: .
	cd $(AK); ./publish.pl
	(cd $(AK); tar cf - $@) | tar xvf -

dec.php: .
	cd $(DEC); ./publish.pl
	(cd $(DEC); tar cf - $@) | tar xvf -

decus.php: .
	(cd $(DECUS); ./publish.pl) >decus.php

maindec.php: .
	cd $(MAINDEC); ./publish.pl
	(cd $(MAINDEC); tar cf - $@) | tar xvf -

si.php: .
	cd $(SI); ./publish.pl
	(cd $(SI); tar cf - $@) | tar xvf -
