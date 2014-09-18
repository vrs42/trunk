DECUS = ../../../pdp8/src/decus
MAINDEC = ../../../pdp8/src/maindec
ALL = maindec.php

$(ALL): .
	(cd $(DECUS); ./publish.pl) >decus.php
	cd $(MAINDEC); ./publish.pl
	(cd $(MAINDEC); tar cf - $(ALL)) | tar xvf -
