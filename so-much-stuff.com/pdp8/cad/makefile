EAGLE = `/bin/pwd`/../../../Eagle
STL = `/bin/pwd`/../../../3D

# When this was maintained with SVN, updates were performed here.
# Git maintains a workspace with the repo, so that's not needed.
# The updates are thus commented out with "#svn".

all: .
	# Do the work elsewhere so that this picks up only committed changes.
#svn	(cd $(EAGLE); svn update .)
	(cd $(EAGLE)/projects; ./publish.pl) > boards.php
#svn	(cd $(EAGLE)/projects; ./chk_mime.sh)
#svn	(cd $(STL); svn update .)
	(cd $(STL); ./publish.pl) > 3d.php
