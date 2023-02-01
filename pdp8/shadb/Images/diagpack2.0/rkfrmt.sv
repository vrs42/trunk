.name
Images/diagpack2.0/rkfrmt.sv
.alias
ak-6394d-pb
.description
RK8E Disk Formatter
.group
maindec-08-dhrkd
.partnumber
maindec-08-dhrkd-d-pb
.notes
This is exactly maindec-08-dhrkd-d-pb , with the following patch:
0207: 4777 != 7000
which has the effect of always using the same IOT instructions, regardless
of the switch register settings.
