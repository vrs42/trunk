#
all:
# The current year must be included in blog.php
	grep `date +%Y` blog.php >/dev/null
	./dologs
	./mkrss >rss.xml

