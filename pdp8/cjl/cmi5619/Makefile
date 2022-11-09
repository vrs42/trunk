menu8.bin: menu8.pa
	pal -e -j $<
#	@bincmp boot.bin foo.bin |grep -v "!= XXXX" || (rm $@; exit 1)

#
# This creates a boot.bin that can be compared to menu8.bin.
# It should be missing initialization stuff assembled into fields 1 and 2.
#
boot.bin: boot.txt
	pal -e -j $<
