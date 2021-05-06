#
# Ensure that if there's a .mot file in ../dumps, we directly convert
# it to a ROM image.  Also ensure that each generated ROM image in
# ../firmware continues to be identical to the imaged one.
#MOT	= 330E4.mot 331E4.mot 390392.mot
#ROM	= $(MOT:.mot=)
MOT	= $(wildcard ../dumps/*.mot)
ROM	= $(patsubst ../dumps/%.mot,%,$(MOT))

all: sums.txt
	: set -e; \
	for i in $(ROM); do \
	  cmp -s $$i ../firmware/$$i || (echo $$i is bad; exit 1); \
	done

sums.txt: $(ROM)
	sum $(ROM) | tee $@

# BUGBUG:  Files like 390392.mot contain dumps of multiple related ROMs.
# We need a way to notice that, and extract the relevant ROM images, not
# the combined image.

%: ../dumps/%.mot ./motorola
	./motorola $@
