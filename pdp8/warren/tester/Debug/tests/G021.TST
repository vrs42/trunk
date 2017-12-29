G021 REV K SCHEMATIC    REV H PCB    SENSE AMP

NOTE:  Install 8.2K resistors on 8 inputs.  If not installed,
       test will work, but the 8 inputs will fail (always LOW).


NOTES: disconnect AB2 from tester and attach -15V to UUT.
       "P" for PULLUP OUTPUTS on the open collector outputs;


PINS
 1 I AD1  STROBE FIELD 0
 2 I AR1  STROBE FIELD 1
 3 I AD2  E1-4  INPUT 1 BIT 0 FIELD 0  
 4 I AE2  E1-3  INPUT 2 BIT 0 FIELD 0
 5 I AF2  E2-4  INPUT 1 BIT 0 FIELD 1
 6 I AH2  E2-3  INPUT 2 BIT 0 FIELD 1
 7 I AL1  E4-4  INPUT 1 BIT 1 FIELD 0
 8 I AM1  E4-3  INPUT 2 BIT 1 FIELD 0
 9 I AN1  E5-4  INPUT 1 BIT 1 FIELD 1
10 I AP1  E5-3  INPUT 2 BIT 1 FIELD 1
11 I AB1  CLEAR-N
12 I AT2  ENABLE
13 O AC1  BIT 0-N
14 P AA1  OUTPUT 0-N
15 O AS1  BIT 1-N
16 P AU2  OUTPUT 1-N

IIIIIIIIIIIIOPOP
0000000000001111
; remove CLEAR-N
          1
; ENABLE on
           1 0 0
; turn on BIT 0
  1
1 1         01
0 1          
; check ENABLE
           0 1 1
           1 1 0
; check CLEAR-N
          0  0
          1
           0 1 1
; turn on BIT 1
      1
 1    1       01
              1
; check ENABLE
           0 1 1
           1 0 1
; check CLEAR-N
          0    0
          1
           0 1 1
; turn on BIT 0 and BIT 1
  1
      1
1           01
 1          0101
0             1
 1          1
; check ENABLE
           0 1 1
           1 1 1
; check CLEAR-N
          0  0 0
          1
           0 1 1
END
