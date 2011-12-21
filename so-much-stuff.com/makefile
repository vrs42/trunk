
#
# Bring everything up to date
all: .
	cd pdp8; make
	@make test
	@echo "BE SURE TO COMMIT YOUR CHANGES before exporting!"
#
# This rule checks that href and src references files that are
# valid, exist, and are spelled with the correct upper and 
# lower case.
test:
	@find . -name "*.htm" -print | xargs ./casechk.pl
	@find . -name "*.html" -print | xargs ./casechk.pl
	@find . -name "*.shtml" -print | xargs ./casechk.pl
	@find . -name "*.php" -print | xargs ./casechk.pl
