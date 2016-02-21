EAGLE = ../../../Eagle
STL = ../../../3D

all: .
	# Do the work elsewhere so that this pickas up only committed changes.
	(cd $(EAGLE); svn update .)
	(cd $(EAGLE)/projects; ./publish.pl) > boards.php
	(cd $(STL); ./publish.pl) > 3d.php
