
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
	@find . -name "*.htm" -print0 | xargs -0 ./casechk.pl
	@find . -name "*.html" -print0 | xargs -0 ./casechk.pl
	@find . -name "*.shtml" -print0 | xargs -0 ./casechk.pl
	@find . -name "*.php" -print0 | xargs -0 ./casechk.pl
