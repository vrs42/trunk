7453 4 WIDE AND-OR-INVERT

REMOVE JUMPERS:
  AA1
  AC1
  AA2
  AC2
  AH2
  AT2
CONNECT:
  AA1 tester to AA2 UUT 
  AC1 tester to AC2 UUT
  AH2 UUT to GROUND
  AT2 UUT to +5V

DOES NOT TEST EXPANDER INPUTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PINS
 1 I AA1 E1-1   7453 pin 1  A
 2 I AS2 E1-15  7453 pin 13 B
 3 I AB2 E1-2   7453 pin 2  C
 4 I AC1 E1-3   7453 pin 3  D
 5 I AD2 E1-4   7453 pin 4  E
 6 I AE2 E1-5   7453 pin 5  F
 7 I AM2 E1-11  7453 pin 9  G
 8 I AN2 E1-12  7453 pin 10 H
 9 O AL2 E1-10  7453 pin 8  Y = (A AND B) NOR (C AND D) NOR (E AND F) NOR (G AND H) (X,X-N EXPANDER)
10 I AF2 E1-6   7453 pin 6  n.c.
11 O AP2 E1-13  7450 pin 11 X   (EXPANDER)
12 O AR2 E1-14  7450 pin 12 X-N (EXPANDER)
13 I AH2 E1-7   7453 pin 7 GROUND
14 I AJ2 E1-8   (UNUSED PIN OF 16-PIN SOCKET)
15 I AK2 E1-9   (UNUSED PIN OF 16-PIN SOCKET)
16 I AT2 E1-16  7453 pin 14 VCC

IIIIIIIIOIOOIIII

; START WITH ALL INPUTS ZERO
0000000010XX0000

; ALL INPUTS HI
111111110

; WITH ALL OTHER INPUTS HI, GRAY CODE EACH GATE
10      0
00      0
01      0
11      0
  10    0
  00    0
  01    0
  11    0
    10  0
    00  0
    01  0
    11  0
      100
      000
      010
      110

; ALL INPUTS LO
000000001

; WITH ALL OTHER INPUTS LO, GRAY CODE EACH GATE
01      1
11      0
10      1
00      1
  01    1
  11    0
  10    1
  00    1
    01  1
    11  0
    10  1
    00  1

;****************************
; SHOULD TEST ALL 256 PATTERNS
;****************************


END
