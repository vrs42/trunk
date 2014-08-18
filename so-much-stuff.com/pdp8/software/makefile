MAINDEC = ../../../pdp8/src/maindec
ALL = maindec.php

$(ALL): .
	cd $(MAINDEC); ./publish.pl
	(cd $(MAINDEC); tar cf - $(ALL)) | tar xvf -
