; M141   PCB REV C   SCHEMATIC REV B   AND/NOR GATES
;
; E1        = 7420 DUAL 4-INPUT NAND
; E2,E3,EE4 = 7401 QUAD 2-INPUT NAND WITH OPEN COLLECTOR OUTPUTS
; EQUATION: OUT = (IN_1A NAND IN_1B) WIRE OR (IN_2A NAND IN_2B) WIRE OR ...
;
; HEADER:        OUTPUTS:           A        B     C  D    E    F 
;                AND/NOR TERMS:  2-2-2-2  2-2-2-2  1  1  2-2-2  2       

PINS
 1 I AC1 E2-12         IN_A_1A   1-x-x-x
 2 I AD1 E2-11         IN_A_1B   1-x-x-x
 3 I AE1 E2-9          IN_A_2A   x-1-x-x
 4 I AF1 E2-8          IN_A_2B   x-1-x-x
 5 I AH1 E2-3          IN_A_3A   x-x-1-x
 6 I AJ1 E2-2          IN_A_3B   x-x-1-x
 7 I AJ2 E2-6          IN_A_4A   x-x-x-1
 8 I AK2 E2-5          IN_A_4B   x-x-x-1
 9 O AB1 E2-13,10,1,4           OUT_A
10 I AN2 E3-9          IN_B_1A            1-x-x-x
11 I AP2 E3-8          IN_B_1B            1-x-x-x
12 I AN1 E3-12         IN_B_2A            x-1-x-x
13 I AP1 E3-11         IN_B_2B            x-1-x-x
14 I AR2 E3-6          IN_B_3A            x-x-1-x
15 I AS2 E3-5          IN_B_3B            x-x-1-x
16 I AR1 E3-3          IN_B_4A            x-x-x-1
17 I AS1 E3-1          IN_B_4B            x-x-x-1
18 O AA1 E3-10,13,4,1                    OUT_B
19 I AD2 E1-13                                     1
20 O AF2 E1-8                                     OUT_C
21 I AE2 E1-5                                         1
22 O AH2 E1-6                                        OUT_D
23 I AL1 E4-9          IN_E_1A                           1-x-x
24 I AM1 E4-8          IN_E_1B                           1-x-x
25 I AL2 E4-12         IN_E_2A                           x-1-x
26 I AM2 E4-11         IN_E_2B                           x-1-x
27 I AU1 E4-3          IN_E_3A                           x-x-1
28 I AV1 E4-2          IN_E_3B                           x-x-1
29 O AK1 E4-10,13,1                                     OUT_E
30 I AU2 E4-6          IN_F_1A                                  1
31 I AV2 E4-5          IN_F_1B                                  1
32 O AT2 E4-4                                                  OUT_F

IIIIIIIIOIIIIIIIIOIOIOIIIIIIOIIO
00000000100000000101010000001001

; TEST EACH NAND GATE WITH ALL OTHER INPUTS OFF

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
      011
      110
      101
      001
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
               011
               110
               101
               001
                  10
                  01
                    10
                    01
                      01    1
                      11    0
                      10    1
                      00    1
                        01  1
                        11  0
                        10  1
                        00  1
                          011
                          110
                          101
                          001
                             011
                             110
                             101
                             001


; TURN ON ALL INPUTS

10      1
11      0
  10    0
  11    0
    10  0
    11  0
      100
      110
         10      1
         11      0
           10    0
           11    0
             10  0
             11  0
               100
               110
                  10
                    10
                      10    1
                      11    0
                        10  0
                        11  0
                          100
                          110
                             101
                             110
; NO CHANGE
11111111011111111010101111110110

; TEST EACH NAND GATE WITH ALL OTHER INPUTS ON
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
                  01
                  10
                    01
                    10
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
                             101
                             001
                             011
                             110

; NO CHANGE
11111111011111111010101111110110

; TURN OFF ALL INPUTS
01      0
00      0
  01    0
  00    0
    01  0
    00  0
      011
      001
         01      0
         00      0
           01    0
           00    0
             01  0
             00  0
               011
               001
                  01
                    01
                      01    0
                      00    0
                        01  0
                        00  0
                          011
                          001
                             011
                             001

; NO CHANGE
00000000100000000101010000001001
END
