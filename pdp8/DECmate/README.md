There are several directories here.  Some of them pertain to imaging of
the various ROM devices found in DECmates:

dumps:
  Contains dumps of DECmate ROMs, usually in Motorola format (for no
particular reason).  An attempt is made to interpret the contents, up
to and including disassembly of the associated PDP-8 code.

firmware:
  Contains source for various DECmate ROMs, and recipes to build them
and re-create the ROM images.  (Often the source is just a disassembly 
copied over from "dumps".)

roms:
  Collects raw images of the ROMs, usually generated from the Motorola
dumps in "dumps".  It is considered an error if these differ from those
built from source in "firmware".

vt78:
vt278:
pc278:
pc238:
pc24p:
  These directories are for files specific to the particular DECmate models,
but not necessarily directly related to the forensic work to reconstruct
the ROMs.
