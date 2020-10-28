#
# Edit DECParts.xls, then 'make' to refresh.
# DECSubst.csv is essentially sheet 2, exported to .csv format.
# The file foo.txt is an old copy, no longer maintained.
#
# It is possible to annotate wrt the substitution in each different
# flipchip context by editing the appropriate line in sheet 2.
#
# The "make" will refresh the .zip, the .csv, and the .html.
# (The .php will include the .html.)
#
# Do NOT edit the .csv using Excel -- it severely mangles stuff that it
# mistakes for dates.
#
all: DECSubst.html DECParts.zip dec-std.html

DECSubst.html: sorttab.pl DECSubst.csv
	./sorttab.pl >DECSubst.html

DECParts.zip: DECParts.xls
	zip $@ $<

DECSubst.csv: DECParts.xls
	./mkcsv.pl -2 $< >$@

dec-std.html: dec-std
	./dec-std >$@
