.alias
ak-6575a-pb
maindec-08-dirfa-a-pb
.description
RF08 Disk Data Test
.name
Images/diag-games-kermit.0/dirfaa.sv
.notes
This is exactly maindec-08-d5eb-pb with one word changed:
3174: 5756 != 7440
despite claiming to be dirfa-a.  This has the effect of not checking
whether the DMAR IOT cleared AC, but rather assuming it did so.
.group
maindec-08-d5e
.partnumber
maindec-08-d5eb-pb
