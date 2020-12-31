TXT	= $(wildcard */*/caption.txt)
JPG	= $(TXT:caption.txt=photo.jpg)
THM	= $(TXT:caption.txt=thumb.jpg)
HTM	= $(TXT:caption.txt=page.html)

all:	$(JPG) $(THM) $(HTM)

$(THM):
	echo ./mkthumb $@

$(HTM): /tmp
	./mkhtml $@
