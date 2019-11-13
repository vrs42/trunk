$JOB Repairs FRTS
/
/This BATCH stream removes the patches to FRTS that cause
/scope mode rubouts.
/
/It simply replaces the old contents of the locations.
/
.R FUTIL
FILE FRTS.SV
SET MODE SAVE
3072/4336
3073/0134
7371/7400
7400/0;0;0;0;0;0;0;0;0
WRITE
EXIT
/
/Done!
/
$END
