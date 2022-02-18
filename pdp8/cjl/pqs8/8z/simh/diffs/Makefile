DOT	= .batch .bbuffer .bcode .binget .bonce .boot .brecovr .cat .change \
	.dir .dollar .dump .ecp .edit .ehcode .ehinit .euc .handlers .hdir \
	.iblock .iohtrap .kbm .odt .percent .pzero .reserved .run .scratch \
	.slurp .system .tty
SD	= ALLCAT.sd BATCH.sd BIN.sd BLKCPY.sd BLKODT.sd BSAVE.sd CHANGE.sd \
	CONSOL.sd CORE.sd DATE.sd DIRECT.sd DT4MAT.sd DTCOPY.sd DUMP.sd \
	FILMAN.sd FIND.sd FOCAL.sd GET.sd MAP.sd ODT.sd OS8CON.sd PAL.sd \
	PRINT.sd RK4MAT.sd SET.sd START.sd SYSTAT.sd
CAT	= README TCBOOT
FILES = $(DOT) $(SD) $(CAT)
BADF	= $(FILES:=.bad)
OKF	= $(FILES:=.ok)
OK	= ../pqs8_tc08.0
BAD	= ../dt0.0

all:	$(BADF) $(OKF)
	for i in $(FILES); do cmp $$i.bad $$i.ok; done

$(BAD)/* $(BAD)/.[a-z]*: ../dt0.dt
	dt2dk ../dt0.dt && mv ../dt0.dt.dsk ../dt0.dsk
	../pqs8xplode ../dt0.dsk

%.bad:	$(BAD)/%
	sixbit $< >$@

%.ok:	$(OK)/%
	sixbit $< >$@
