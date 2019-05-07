$JOB    < Generate FTNLIB.RL Library >
$MSG    Please mount RX8-9   'FTNLIB Library' in FLIP:
$MSG    Please mount RX8-4   'FORTRAN II System' in FLOP:
.RUN FLOP LIBSET
*FTNLIB<
*FLIP:RANGEN
*FLIP:INTFS
*FLIP:MISC1
*FLIP:OCTA4
*FLIP:STDEV
*FLIP:ISWR
*FLIP:LEX
*FLIP:DATE
*FLIP:DIR
*FLIP:ZFILL
*FLIP:CONVRT
*FLIP:CHAR
*FLIP:NUMB
/*FLIP:IOFILE    (Anyone using these routines?)
/*FLIP:KIND      (Anyone using this routine?)
/*FLIP:RDNUM     (Anyone using this routine?)
/*FLIP:SORT      (Anyone using this routine?)
*FLIP:VTSUB
*FLIP:DYN
*FLIP:CAL
*FLIP:IFCHN
*FLIP:CCL
*FLIP:UEXIT
*FLIP:INVAL
*$
.COPY FLOP:<FTNLIB.RL
.RUN FLOP LIBCAT
*CRT:<FTNLIB
$END    < FTNLIB.RL Library Generation Complete >
