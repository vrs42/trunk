.description
RF08 RANDOM TRACK TEST
.name
Images/diag-games-kermit.0/d5ebd.sv
.notes
This is exactly maindec-08-d5eb-pb, with the following patch applied:
3174: 5756 != 7440
The net effect of this change is to check that the DMAR not only did not
skip, but that it nonetheless did clear the AC.  (Failure to clear AC will
result in the same HLT as an erroneous skip.)
.group
maindec-08-d5e
.partnumber
maindec-08-d5eb-pb
