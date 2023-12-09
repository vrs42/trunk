First, the original reference material is the code extracted from
the builder paper tape images, dec-db-sba[cdef]-pb, and the RF08 patch
to sbae, dec-db-sba1-pb.  These are listed here:
2200	Code extracted from location 2200 of sbaf.  This is the AF version
	of the DF32 driver.
2400	Code extracted from location 2400 of sbaf.  This is the AF version
	of the RF08 driver.
2600	Code extracted from location 2600 of sbaf.  This is the AF version
	of the TC08 driver.
5200	Code extracted from location 5200 of sba[cde].  These three versions
	contain the same DF32 driver at this address, and it is the standard
	driver installed on non-8/S systems.
5600	Code extracted from location 5600 of sba[cde].  These three versions
	contain the same DF32 driver at this address, and it is the driver
	installed on 8/S systems.
6000-ac	Code extracted from location 6000 of sbac.  This is the AC version
	of the TC08 driver.
6000-ad	Code extracted from location 6000 of sbac.  This is the AE version
	of the TC08 driver.
6000-ae	Code extracted from location 6000 of sbac.  This is the AE version
	of the TC08 driver.
Each of these contain 3 files which are the octal dumps converted to syntax
acceptable to PAL, and the .lst and .bin files created by their assembly.

From these, a set of matching disassemblies have been created:
2200	df32-af
2400	rf08-af
2600	tc08-af
5200	df32-cde
5600	df8s-cde
6000-ac	tc08-ac
6000-ad	tc08-ad
6000-ae	tc08-ae

The Makefile will assemble these as needed, and then compare all the
generated binaries with the originals.

The AF versions of the DF32 and RF08 drivers need more work to clean up
the disassembled source and make it more clear how they work.

	Vince
