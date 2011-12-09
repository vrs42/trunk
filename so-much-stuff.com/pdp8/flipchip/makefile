EPROJECTS = ../../../Eagle/projects/DEC
ALL = Gxxx.htm Mxxx.htm Rxxx.htm Wxxx.htm modules.txt modules.htm

$(ALL): .
	cd $(EPROJECTS); ./boardtbl.pl
	(cd $(EPROJECTS); tar cf - $(ALL)) | tar xvf -
