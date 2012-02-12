EPROJECTS = ../../../Eagle/projects/DEC
ALL = Bxxx.htm Gxxx.htm Mxxx.htm Rxxx.htm Sxxx.htm Wxxx.htm \
	modules.txt modules.htm

$(ALL): .
	cd $(EPROJECTS); ./boardtbl.pl
	(cd $(EPROJECTS); tar cf - $(ALL)) | tar xvf -
