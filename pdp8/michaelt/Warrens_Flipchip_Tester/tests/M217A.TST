M217, PCB REV A, 4-BIT CLOCK REGISTER WITH BUFFER REGISTER

8 FLIP-FLOPS:  CNT0 (MSB) THRU CNT3 (LSB), BUF0 (MSB) THRU BUF3 (LSB)
CNT CAN BE INCREMENTED, CLEARED, JAMMED FROM BUF
BUF CAN BE CLEARED, LOAD FROM CNT, JAMS FROM PINS (AC)
BUF OUTPUTS CAN BE GATED TO PINS (INTERNAL BUS, OC OUTPUTS)


PINS
 1 I AS2 E5-13,E5-1,E6-13,E6-1	CLR_BUF-N	CLEARS BUF3 THRU BUF0
 2 I AE1 E1-10,E1-13,E1-1,E1-4  AC_TO_BUF	JAMS PINS (AC3 THRU AC0) TO BUF3 THRU BUF0
 3 I AD2 E1-9                   AC3
 4 I AD1 E1-12                  AC2
 5 I AF1 E1-2                   AC1
 6 I AH1 E1-5                   AC0
 7 I AN2 E5-11,E5-3,E6-11,E6-3  CNT_TO_BUF  CNT3 THRU CNT0 -> BUF3 THRU BUF0 (RISING)
 8 O AJ2 E5-9                   BUF3
 9 O AH2 E5-8                   BUF3-N
10 O AK1 E5-5                   BUF2
11 O AA1 E5-6                   BUF2-N
12 O AM2 E6-9                   BUF1
13 O AP1 E6-8                   BUF1-N
14 O AR1 E6-5                   BUF0
15 O AS1 E6-6                   BUF0-N
16 I AM1 E3-9                   BUF_TO_AC  ENABLE OUTPUT PINS INT_BUS3 THRU INT_BUS0 (AC)
17 P AK2 E3-10                  INT_BUS3-N (AC3-N) (7401 OPEN COLLECTOR OUTPUT)
18 P AJ1 E3-13                  INT_BUS2-N (AC2-N) (7401 OPEN COLLECTOR OUTPUT)
19 P AL1 E3-4                   INT_BUS1-N (AC1-N) (7401 OPEN COLLECTOR OUTPUT)
20 P AN1 E3-1                   INT_BUS0-N (AC0-N) (7401 OPEN COLLECTOR OUTPUT)
21 I AV2 E2-13,E2-1,E7-13,E7-1  CLR_CNT-N        CLEARS CNT3 THRU CNT0
22 I AL2 E4-10,E4-12,E4-5,E4-2  BUF_TO_CNT       JAMS BUF3 THRU BUF0 TO CNT3 THRU CNT0
23 I AV1 E7-3                   CLOCK_CNT        INCREMENTS CNT3 THRU CNT0 (RISING EDGE)
24 O AB1 E2-9                   CNT3
25 O AC1 E2-8                   CNT3-N
26 O AF2 E2-5                   CNT2
27 O AE2 E2-6                   CNT2-N
28 O AP2 E7-9                   CNT1
29 O AR2 E7-8                   CNT1-N
30 O AT2 E7-5                   CNT0
31 O AU2 E7-6                   CNT0-N

IIIIIIIOOOOOOOOIPPPPIIIOOOOOOOO
1000000XXXXXXXX01111100XXXXXXXX
; CLEAR BUF
0      01010101
1
; CLEAR CNT
                    0  01010101
                    1

1000000010101010111110001010101

; LOAD ALL 16 VALUES (GRAY CODE) INTO BUF

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0001
 1     01010110
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0011
 1     01011010
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0010
 1     01011001
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0110
 1     01101001
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0111
 1     01101010
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0101
 1     01100110
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0100
 1     01100101
 0

0      01010101
1
  1100
 1     10100101
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1101
 1     10100110
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1111
 1     10101010
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1110
 1     10101001
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1010
 1     10011001
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1011
 1     10011010
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1001
 1     10010110
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1000
 1     10010101
 0

; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0000
 1     01010101
 0

1000000010101010111110001010101


; LOAD ALL 16 VALUES (GRAY CODE) INTO BUF, CLEAR CNT, JAM BUF INTO CNT


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0001
 1     01010110
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01010110
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0011
 1     01011010
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01011010
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0010
 1     01011001
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01011001
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0110
 1     01101001
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01101001
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0111
 1     01101010
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01101010
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0101
 1     01100110
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01100110
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0100
 1     01100101
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01100101
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1100
 1     10100101
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10100101
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1101
 1     10100110
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10100110
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1111
 1     10101010
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10101010
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1110
 1     10101001
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10101001
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1010
 1     10011001
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10011001
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1011
 1     10011010
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10011010
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1001
 1     10010110
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10010110
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  1000
 1     10010101
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 10010101
                     0


; CLEAR BUF, JAM BUF FROM PINS (AC)

0      01010101
1
  0000
 1     01010101
 0

; CLEAR CNT, JAM BUF INTO CNT
                    0  01010101
                    1
                     1 01010101
                     0

1000000010101010111110001010101


; CLEAR CNT
                    0  01010101
                    1
1000000010101010111110001010101

; INCREMENT CNT 0000 TO 1111 TO 0000

                      101010110
                      0
                      101011001
                      0
                      101011010
                      0 
                      101100101
                      0
                      101100110
                      0
                      101101001
                      0
                      101101010
                      0
                      110010101
                      0
                      110010110
                      0
                      110011001
                      0
                      110011010
                      0
                      110100101
                      0
                      110100110
                      0
                      110101001
                      0
                      110101010
                      0
                      101010101
                      0

1000000010101010111110001010101

; CLEAR CNT
                    0  01010101
                    1
1000000010101010111110001010101

; INCREMENT CNT 0000 TO 1111 TO 0000, LOAD INTO BUF



                      101010110
                      0
      101010110
      0
                      101011001
                      0
      101011001
      0
                      101011010
                      0 
      101011010
      0
                      101100101
                      0
      101100101
      0
                      101100110
                      0
      101100110
      0
                      101101001
                      0
      101101001
      0
                      101101010
                      0
      101101010
      0
                      110010101
                      0
      110010101
      0
                      110010110
                      0
      110010110
      0
                      110011001
                      0
      110011001
      0
                      110011010
                      0
      110011010
      0
                      110100101
                      0
      110100101
      0
                      110100110
                      0
      110100110
      0
                      110101001
                      0
      110101001
      0
                      110101010
                      0
      110101010
      0
                      101010101
                      0
      101010101
      0

1000000010101010111110001010101

; CLEAR CNT
                    0  01010101
                    1
1000000010101010111110001010101

; INCREMENT CNT 0000 TO 1111 TO 0000, LOAD INTO BUF, ENABLE INT_BUS-N PINS


; INCREMENT TO 0001
                      101010110
                      0
; LOAD INTO BUF
      101010110
      0
; ENABLE INT_BUS-N PINS
               11110
               01111


; INCREMENT TO 0010
                      101011001
                      0
; LOAD INTO BUF
      101011001
      0
; ENABLE INT_BUS-N PINS
               11101
               01111


; INCREMENT TO 0011
                      101011010
                      0 
; LOAD INTO BUF
      101011010
      0
; ENABLE INT_BUS-N PINS
               11100
               01111


; INCREMENT TO 0100
                      101100101
                      0
; LOAD INTO BUF
      101100101
      0
; ENABLE INT_BUS-N PINS
               11011
               01111


; INCREMENT TO 0101
                      101100110
                      0
; LOAD INTO BUF
      101100110
      0
; ENABLE INT_BUS-N PINS
               11010
               01111


; INCREMENT TO 0110
                      101101001
                      0
; LOAD INTO BUF
      101101001
      0
; ENABLE INT_BUS-N PINS
               11001
               01111


; INCREMENT TO 0111
                      101101010
                      0
; LOAD INTO BUF
      101101010
      0
; ENABLE INT_BUS-N PINS
               11000
               01111


; INCREMENT TO 1000
                      110010101
                      0
; LOAD INTO BUF
      110010101
      0
; ENABLE INT_BUS-N PINS
               10111
               01111


; INCREMENT TO 1001
                      110010110
                      0
; LOAD INTO BUF
      110010110
      0

; INCREMENT TO 1010
                      110011001
                      0
; LOAD INTO BUF
      110011001
      0
; ENABLE INT_BUS-N PINS
               10101
               01111


; INCREMENT TO 1011
                      110011010
                      0
; LOAD INTO BUF
      110011010
      0
; ENABLE INT_BUS-N PINS
               10100
               01111


; INCREMENT TO 1100
                      110100101
                      0
; LOAD INTO BUF
      110100101
      0
; ENABLE INT_BUS-N PINS
               10011
               01111


; INCREMENT TO 1101
                      110100110
                      0
; LOAD INTO BUF
      110100110
      0
; ENABLE INT_BUS-N PINS
               10010
               01111


; INCREMENT TO 1110
                      110101001
                      0
; LOAD INTO BUF
      110101001
      0
; ENABLE INT_BUS-N PINS
               10001
               01111


; INCREMENT TO 1111
                      110101010
                      0
; LOAD INTO BUF
      110101010
      0
; ENABLE INT_BUS-N PINS
               10000
               01111


; INCREMENT TO 0000
                      101010101
                      0
; LOAD INTO BUF
      101010101
      0
; ENABLE INT_BUS-N PINS
               11111
               01111


1000000010101010111110001010101

END
