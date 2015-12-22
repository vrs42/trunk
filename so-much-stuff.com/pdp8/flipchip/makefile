EPROJECTS = ../../../Eagle/projects/DEC
ALL = Axxx.htm Bxxx.htm Gxxx.htm Hxxx.htm Kxxx.htm Mxxx.htm \
	Rxxx.htm Sxxx.htm Wxxx.htm modules.txt modules.htm

$(ALL): .
	cd $(EPROJECTS); ./boardtbl.pl
	(cd $(EPROJECTS); tar cf - $(ALL)) | tar xvf -
