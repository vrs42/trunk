.SUFFIXES:: .htm .html

ALL	= index.html $(MISC) $(Y2005) $(Y2004) $(Y2003)
MISC	= ttycrd.html pics.html todo.html bulbs.html cadlib.html
Y2005	= y2005.html 03-05.html 02-05.html 01-05.html
Y2004	= y2004.html \
	  12-04.html 11-05.html 10-04.html 09-04.html 08-04.html 07-04.html \
	  06-04.html 02-05.html 04-04.html 03-04.html 02-04.html 01-04.html
Y2003	= y2003.html 12-03.html 11-03.html

all: $(ALL)

clean:
	rm -f $(ALL)

.htm.html:
	cpp -P $< >$@

touch:
	touch $(ALL:.html=.htm)
