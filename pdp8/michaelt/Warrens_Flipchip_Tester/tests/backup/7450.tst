7450 TRIPLE 3-INPUT NAND

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
1  I AA1 E1-1   7450 pin 1  1A
2  I AS2 E1-15  7450 pin 13 1B
3  I AM2 E1-11  7450 pin 9  1C
4  I AN2 E1-12  7450 pin 10 1D
5  O AL2 E1-10  7450 pin 8  1Y = (1A AND 1B) NOR (1C AND 1D) NOR (X,X-N EXPANDER)
6  I AB2 E1-2   7450 pin 2  2A
7  I AC1 E1-3   7450 pin 3  2B
8  I AD2 E1-4   7450 pin 4  2C
9  I AE2 E1-5   7450 pin 5  2D
10 O AF2 E1-6   7450 pin 6  2Y = (2A AND 2B) NOR (2C AND 2D)
11 O AP2 E1-13  7450 pin 11 X   (EXPANDER)
12 O AR2 E1-14  7450 pin 12 X-N (EXPANDER)
13 I AH2 E1-7   7450 pin 7 GROUND
14 I AJ2 E1-8   (UNUSED PIN OF 16-PIN SOCKET)
15 I AK2 E1-9   (UNUSED PIN OF 16-PIN SOCKET)
16 I AT2 E1-16  7450 pin 14 VCC

IIIIOIIIIOOOIIII

; START WITH ALL INPUTS ZERO
0000100001XX0000

; ALL INPUTS HI
1111011110

; WITH ALL OTHER INPUTS HI, GRAY CODE EACH GATE
01  0
00  0
10  0
11  0
  010
  000
  100
  110
     01  0
     00  0
     10  0
     11  0
       010
       000
       100
       110

; ALL INPUTS LO
0000100001

; WITH ALL OTHER INPUTS LO, GRAY CODE EACH GATE
01  1
11  0
10  1
00  1
  011
  110
  101
  001
     01  1
     11  0
     10  1
     00  1
       011
       110
       101
       001

;****************************
; SHOULD TEST ALL 256 PATTERNS
;****************************


END
