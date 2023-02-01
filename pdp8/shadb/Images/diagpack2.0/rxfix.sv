.name
Images/diagpack2.0/rxfix.sv
.description
RXFIX Boot Block Format Toggle
.notes
RXFIX toggles the data in the boot block between 8 and 12 bit formats.
8 bit format is needed so that BUILD, etc. can access the boot block
with the COS compatible drivers.  12 bit format is needed to make the
media actually bootable with standard bootstraps.
