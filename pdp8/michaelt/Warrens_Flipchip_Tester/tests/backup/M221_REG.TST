M221   PCB REV D   SCHEMATIC REV B   MAIN REGISTER 

Just tests the registers



PINS
1  I AE1 E2-1 E6-13    ENABLE ROT RIGHT 1
2  I AJ2 E2-4 E6-9     ENABLE NO ROT
3  I AC1 E2-10 E6-4    ENABLE LSW
4  I AF1 E2-2 E6-3     ENABLE ROT LEFT
5  I AN2 E9-12,13      LSW2
6  I AM2 E9-9,10       LSW3
7  O AD1 E2-8          REG BUS 2
8  O AV2 E6-8          REG BUS 3
9  I BF2 E17-11 E17-3  LOAD MA
10  O BV1 E17-8         (MA2 Q-N)
11 O AS1 E17-9         (MA2 Q)
12 O BK2 E17-6         (MA3 Q-N)
13 O BN2 E17-5         (MA3 Q)
14 I BA1 E14-11 E14-3  LOAD PC
15 O BB1 E14-8         (PC2 Q-N)
16 O BE2 E14-6         (PC3 Q-N)
17 I BC1 E11-11 E11-3  LOAD MB
18 O BS1 E21-11	       OUTPUT MB2(0) (BUFFERED)
19 O BF1 E21-8	       OUTPUT MB2(1) (BUFFERED)
20 O BR1 E21-3         OUTPUT MB3(0) (BUFFERED)
21 O BR2 E21-6         OUTPUT MB3(1) (BUFFERED)
22 I AU2 E8-11 E8-3    LOAD AC
23 O BU1 E18-6         OUTPUT AC2(0) (BUFFERED)
24 O AB2 E18-11        OUTPUT AC2(1) (BUFFERED)
25 O BD2 E18-8         OUTPUT AC3(0) (BUFFERED)
26 O BJ2 E18-3         OUTPUT AC3(1) (BUFFERED)

IIIIIIOOIOOOOIOOIOOOOIOOOO

; all registers are unknown
; with no ENABLES, BUS2,BUS3 is 11
000000110XXXX0XX0XXXX0XXXX

;
; test all registers using ENABLE LSW path
;
; use ENABLE LSW, LSW2, LSW3 To setup BUS2,BUS3
  1 0000
; set all registers to 00
        110101111101011010
        0    0  0    0
; set all registers to 01
  1 010101
        110011101100111001
        0    0  0    0
; set all registers to 11
  1 1111
        101011001010110101
        0    0  0    0
; set all registers to 01
  1 0101
        110011101100111001
        0    0  0    0
; set all registers to 00
  1 0000
        110101111101011010
        0    0  0    0
; remove ENABLE LSW, LSW2, LSW3
  0 0011
; all registers are 00
00000011010100110101001010

; with all registers 0, walk a one

; all registers are 00
00000011010100110101001010

  1 0101
        1  01
        0
  1 0000
        1  10
        0
  1 0101
             1 0
             0
  1 0000
             1 1
             0
  1 0101
                1  01
                0
  1 0000
                1  10
                0
  1 0101
                     1  01
                     0
  1 0000
                     1  10
                     0
  1 1010
        101
        0
  1 0000
        110
        0
  1 1010
             10
             0
  1 0000
             11
             0
  1 1010
                101
                0
  1 0000
                110
                0
  1 1010
                     101
                     0
  1 0000
                     110
                     0

; all registers are 00
00100000010100110101001010

; with all registers 1, walk a ZERO

; set all registers to 11
  1 1111
        101011001010110101
        0    0  0    0

; walk a ZERO

  1 1010
        1  10
        0
  1 1111
        1  01
        0
  1 1010
             1 1
             0
  1 1111
             1 0
             0
  1 1010
                1  10
                0
  1 1111
                1  01
                0
  1 1010
                     1  10
                     0
  1 1111
                     1  01
                     0
  1 0101
        110
        0
  1 1111
        101
        0
  1 0101
             11
             0
  1 1111
             10
             0
  1 0101
                110
                0
  1 1111
                101
                0
  1 0101
                     110
                     0
  1 1111
                     101
                     0

; all registers are 11
  1 1111101011001010110101
        0    0  0    0

; set all registers to 00
  1 0000
        110101111101011010
        0    0  0    0
; remove ENABLE LSW, LSW2, LSW3
  0 0011

; all registers are 00
00000011010100110101001010

END
