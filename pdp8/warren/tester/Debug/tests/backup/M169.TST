; M169    PCB REV B   SCHEMATIC REV A   
; 4 AND-OR TREES (2-2-2-2) WITH 2 SETS OF ENABLES; EXTRA OR ON OUTPUT.

; PINS HEADER
; PIN HEADER                      A1A2A3A4 B1B2B3B4 C1C2C3C4 D1D2D3D4
; EX EQUATION:  A = A5-N OR (EN_A1B1 AND A1) 
;                        OR (EN_A2B2 AND A2)
;                        OR (EN_A3B3 AND A3)
;                        OR (EN_A4B4 AND A4)

PINS
 1 I AC1 E1-13,E2-13  EN_A1B1  1-x-x-x  1-x-x-x 
 2 I AD1 E1-1         A1       1-x-x-x
 3 I AD2 E1-10,E2-10  EN_A2B2  x-1-x-x  x-1-x-x
 4 I AE1 E1-9         A2       x-1-x-x
 5 I AE2 E1-4,E2-4    EN_A3B3  x-x-1-x  x-x-1-x
 6 I AF1 E1-5         A3       x-x-1-x
 7 I AF2 E1-2,E2-2    EN_A4B4  x-x-x-1  x-x-x-1
 8 I AH1 E1-3         A4       x-x-x-1
 9 I AB1 E3-12                  A5-N
10 O AA1 E3-11        OUTPUT      A
11 I AH2 E2-1         B1                1-x-x-x
12 I AJ2 E2-9         B2                x-1-x-x
13 I AK2 E2-5         B3                x-x-1-x
14 I AL2 E2-3         B4                x-x-x-1
15 I AJ1 E3-9                            B5-N
16 O AK1 E3-8         OUTPUT               B
17 I AM2 E5-13,E4-13  EN_C1D1                    1-x-x-x  1-x-x-x 
18 I AN1 E5-1         C1                         1-x-x-x
19 I AN2 E5-10,E4-10  EN_C2D2                    x-1-x-x  x-1-x-x
20 I AP1 E5-9         C2                         x-1-x-x
21 I AP2 E5-4,E4-4    EN_C3D3                    x-x-1-x  x-x-1-x
22 I AR1 E5-5         C3                         x-x-1-x
23 I AR2 E5-2,E4-2    EN_C4D4                    x-x-x-1  x-x-x-1
24 I AS1 E1-3         C4                         x-x-x-1
25 I AL1 E3-5                                     C5-N
26 O AM1 E3-6         OUTPUT                        C
27 I AS2 E4-1         D1                                  1-x-x-x
28 I AT2 E4-9         D2                                  x-1-x-x
29 I AU1 E4-5         D3                                  x-x-1-x
30 I AV1 E4-3         D4                                  x-x-x-1
31 I AU2 E3-1                                              D5-N
32 O AV2 E3-3         OUTPUT                                 D

IIIIIIIIIOIIIIIOIIIIIIIIIOIIIIIO
00000000100000100000000010000010

; TEST OUTPUT A TURNING ON
01       0
11       1
10       0
00       0
  01     0
  11     1
  10     0
  00     0
    01   0
    11   1
    10   0
    00   0
      01 0
      11 1
      10 0
      00 0
        01
      11 1
      00 1
        10
00000000100000100000000010000010
; TEST OUTPUT A NOT TURNING ON
 1       0
   1     0
     1   0
       1 0
       0 0
     0   0
   0     0
 0       0
1        0
0        0
00000000100000100000000010000010
;TEST OUTPUT B TURNING ON
0         1    0
1         1    1
1         0    0
0         0    0
  0        1   0
  1        1   1
  1        0   0
  0        0   0

    0       1  0
    1       1  1
    1       0  0
    0       0  0

      0      1 0
      1      1 1
      1      0 0
      0      0 0
              01
      1      1 1
      0      0 1
              10
00000000100000100000000010000010
; TEST OUTPUT B NOT TURNING ON
          1    0
           1   0
            1  0
             1 0
             0 0
            0  0
           0   0
          0    0
1              0
0              0
00000000100000100000000010000010
; TEST EN_A1B1
10       00    0
11       10    0
11       11    1
01       01    0
11       11    1
10       01    1
10       00    0
00       00    0 
00000000100000100000000010000010
; TEST EN_A2B2
  10     0 0   0
  11     1 0   0
  11     1 1   1
  01     0 1   0
  11     1 1   1
  10     0 1   1
  10     0 0   0
  00     0 0   0 
00000000100000100000000010000010
; TEST EN_A3B3
    10   0  0  0
    11   1  0  0
    11   1  1  1
    01   0  1  0
    11   1  1  1
    10   0  1  1
    10   0  0  0
    00   0  0  0 
00000000100000100000000010000010
; TEST EN_A4B4
      10 0   0 0
      11 1   0 0
      11 1   1 1
      01 0   1 0
      11 1   1 1
      10 0   1 1
      10 0   0 0
      00 0   0 0 
00000000100000100000000010000010
; TEST OUTPUT C TURNING ON
                01       0
                11       1
                10       0
                00       0
                  01     0
                  11     1
                  10     0
                  00     0
                    01   0
                    11   1
                    10   0
                    00   0
                      01 0
                      11 1
                      10 0
                      00 0
                        01
                      11 1
                      00 1
                        10
00000000100000100000000010000010
; TEST OUTPUT C NOT TURNING ON
                 1       0
                   1     0
                     1   0
                       1 0
                       0 0
                     0   0
                   0     0
                 0       0
                1        0
                0        0
00000000100000100000000010000010
; TEST OUTPUT D TURNING ON
                0         1    0
                1         1    1
                1         0    0
                0         0    0
                  0        1   0
                  1        1   1
                  1        0   0
                  0        0   0
                    0       1  0
                    1       1  1
                    1       0  0
                    0       0  0
                      0      1 0
                      1      1 1
                      1      0 0
                      0      0 0
                              01
                      1      1 1
                      0      0 1
                              10
00000000100000100000000010000010
; TEST OUTPUT D NOT TURNING ON
                          1    0
                           1   0
                            1  0
                             1 0
                             0 0
                            0  0
                           0   0
                          0    0
                1              0
                0              0
00000000100000100000000010000010
; TEST EN_C1D1
                10       00    0
                11       10    0
                11       11    1
                01       01    0
                11       11    1
                10       01    1
                10       00    0
                00       00    0
00000000100000100000000010000010
; TEST EN_C2D2
                  10     0 0   0
                  11     1 0   0
                  11     1 1   1
                  01     0 1   0
                  11     1 1   1
                  10     0 1   1
                  10     0 0   0
                  00     0 0   0
00000000100000100000000010000010
; TEST EN_C3D3
                    10   0  0  0
                    11   1  0  0
                    11   1  1  1
                    01   0  1  0
                    11   1  1  1
                    10   0  1  1
                    10   0  0  0
                    00   0  0  0
00000000100000100000000010000010
; TEST EN_C4D4
                      10 0   0 0
                      11 1   0 0
                      11 1   1 1
                      01 0   1 0
                      11 1   1 1
                      10 0   1 1
                      10 0   0 0
                      00 0   0 0
00000000100000100000000010000010
END
