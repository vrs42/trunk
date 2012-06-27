cver +test=../tests/bin/MAINDEX-08-D1GB.mem +pc=0200 test_pdp8.v
exit 0

#!/bin/sh

for t in `seq 1 12`; do
 echo TEST $t:
 lf=test$t.log
 tf=test$t.mem
 cver +loadvpi=../pli/ide/pli_ide.so:vpi_compat_bootstrap +test=$tf run.v >$lf
done
exit 0
