$JOB Scope rubouts for F4
/This modifies the Fortran run-time system to
/do screen erasures when rubouts are typed.
/Submit "UNSCOP.BI" for normal rubouts.
/This patch uses 8 LPT buffer locations.
.R FUTIL
FILE FRTS
SET MODE SAVE
3072/5673
3073/7400
7371/7411
7400/4607
7401/10
7402/4607
7403/40
7404/4607
7405/10
7406/5610
7407/3136
7410/3074
WR
EX
$END
