.SUFFIXES:: .htm .html

DIRS	!= echo */.
MISC	!= echo */*.htm
ALL	= top.html index.html $(MISC:.htm=.html)

all: $(ALL)

clean:
	rm -f $(ALL)

.htm.html:
	cpp -I. -P $< >$@

top.htm: mktop.sh $(DIRS)
	./mktop.sh

touch:
	touch $(ALL:.html=.htm)
