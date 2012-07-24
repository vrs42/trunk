#
# Ideally, you'd fix DECParts.xls, then refresh DECParts.zip.
# DECSubst.csv is essentially sheet 2, exported to .csv format.
# The file foo.txt is a copy read by sorttab.pl to create the HTML table.
#
# Also edit the table in "foo.txt", for now.  It is possible to annotate
# wrt the substitution in each different flipchip context.
#
# Then "make" the HTML.  (The .php will include the .html.)
#
# Do NOT edit the .csv using Excel -- it severely mangles stuff that it
# mistakes for dates.
#
all: DECSubst.html DECParts.zip

DECSubst.html: sorttab.pl foo.txt
	./sorttab.pl >DECSubst.html

DECParts.zip: DECParts.xls
	zip $@ $<
