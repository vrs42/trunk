EAGLE = ../../../Eagle
STL = ../../../3D

all: .
	# Do the work elsewhere so that this picks up only committed changes.
	(cd $(EAGLE); svn update .)
	(cd $(EAGLE)/projects; ./publish.pl) > boards.php
	(cd $(EAGLE)/projects; ./chk_mime.sh)
	(cd $(STL); ./publish.pl) > 3d.php
