M204, PCB REV D, Counter Buffer made from 4x SN7472

PINS
 1 I AB1 E1-2  CLEAR-N  E1-8/6 E2-8/6 E3-8/6 E4-8/6
 2 I AE1 E1-13 PRESET-N E1-8/6
 3 I AE2 E1-12 CLOCK    E1-8/6
 4 I AH2 E1-3  J1       E1-8/6
 5 I AK2 E1-4  J2       E1-8/6
 6 I AK1 E1-9  K1       E1-8/6
 7 O AT2 E1-8  Q        E1-8/6
 8 O AJ2 E1-6  Q-N      E1-8/6
 9 I AD1 E2-13 PRESET-N        E2-8/6
10 I AC1 E2-12 CLOCK           E2-8/6
11 I AH1 E2-5  J3              E2-8/6
12 I AJ1 E2-9  K1              E2-8/6
13 O AV2 E2-8  Q               E2-8/6
14 O AL2 E2-6  Q-N             E2-8/6
15 I AF1 E2-13 PRESET-N               E3-8/6
16 I AN1 E3-12 CLOCK                  E3-8/6
17 I AL1 E3-3  J1                     E3-8/6
18 I AM1 E3-4  J2                     E3-8/6
19 I AU1 E3-9  K1                     E3-8/6
20 I AS2 E3-10 K2                     E3-8/6
21 O AR2 E3-8  Q                      E3-8/6
22 O AF2 E3-6  Q-N                    E3-8/6
23 I AM2 E4-13 PRESET-N                      E4-8/6
24 I AP2 E4-12 CLOCK                         E4-8/6
25 I AP1 E4-3  J1                            E4-8/6
26 I AR1 E4-4  J2                            E4-8/6
27 I AA1 E4-5  J3                            E4-8/6
28 I AU2 E4-9  K1                            E4-8/6
29 I AS1 E4-10 K2                            E4-8/6
29 I AV1 E4-11 K3                            E4-8/6
30 O AN2 E4-8  Q                             E4-8/6
31 O AD2 E4-6  Q-N                           E4-8/6


IIIIIIOOIIIIOOIIIIIIOOIIIIIIIIOO

; Hold all CLEAR-N, PRESET-N, J & K low, all Q high & Q-N high
00000011000011000000110000000011
; Test E1 8/6 outouts
; CLEAR-N high & PRESET-N low, all Q high & Q-N low
1      0     0       0         0
; CLEAR-N low & PRESET-N high, E1 Q low & Q-N high
01    01     1       1         1
; CLEAR-N high & PRESET-N high, E1 Q low & Q-N high
11    01     0       0         0
; Raise E1 CLOCK, no change in E1 Q & Q-N
  1
; Lower E1 CLOCK, no change in E1 Q & Q-N
  0
; Raise J1, no change in E1 Q & Q-N
   1
; Raise E1 CLOCK, no change in E1 Q & Q-N
  1
; Lower E1 CLOCK, no change in E1 Q & Q-N
  0
; Raise J2, no change in E1 Q & Q-N
    1
; Raise E1 CLOCK, no change in E1 Q & Q-N
  1
; Lower E1 CLOCK, E1 Q low & Q-N high
  0   10
; Lower J1 & J2, Raise K1, no change in E1 Q & Q-N
   001
; Raise E1 CLOCK, no change in E1 Q & Q-N
  1
; Lower E1 CLOCK, E1 Q high & Q-N low
  0   01
; Raise J1 & J2, K1 high, no change in E1 Q & Q-N
   111
; Raise E1 CLOCK, no change in E1 Q & Q-N
  1
; Lower E1 CLOCK, E1 Q & Q-N toggle
  0   10
; Test E2 8/6 outouts, Test Vector 19
; CLEAR-N low & PRESET-N high, E2 Q low & Q-N high
0     011   01       1         1
; CLEAR-N high & PRESET-N high, E2 Q low & Q-N high
1     01    01       0         0
; Raise E2 CLOCK, no change in E2 Q & Q-N
         1
; Lower E2 CLOCK, no change in E2 Q & Q-N
         0
; Raise J3, no change in E2 Q & Q-N
          1
; Raise E2 CLOCK, no change in E2 Q & Q-N
         1
; Lower E2 CLOCK, E2 Q low & Q-N high
         0  10
; Lower J3, Raise K1, no change in E2 Q & Q-N
          01
; Raise E2 CLOCK, no change in E2 Q & Q-N
         1
; Lower E2 CLOCK, E2 Q high & Q-N low
         0  01
; Raise J3, K1 high, no change in E3 Q & Q-N
          1
; Raise E3 CLOCK, no change in E3 Q & Q-N
         1
; Lower E3 CLOCK, E3 Q & Q-N toggle
         0  10
; Test E3 8/6 outouts, Test Vector 32
; CLEAR-N low & PRESET-N high, E3 Q low & Q-N high
0           011     01         1
; CLEAR-N high & PRESET-N high, E3 Q low & Q-N high
1                              0
; Raise E3 CLOCK, no change in E3 Q & Q-N
               1
; Lower E3 CLOCK, no change in E3 Q & Q-N
               0
; Raise J1, no change in E3 Q & Q-N
                1
; Raise E3 CLOCK, no change in E3 Q & Q-N
               1
; Lower E3 CLOCK, no change in E3 Q & Q-N
               0
; Raise J2, no change in E3 Q & Q-N
                 1
; Raise E3 CLOCK, no change in E3 Q & Q-N
               1
; Lower E3 CLOCK, E3 Q low & Q-N high
               0    10
; Lower J1 & J2, Raise K1, no change in E3 Q & Q-N
                001
; Raise E3 CLOCK, no change in E3 Q & Q-N
               1
; Lower E3 CLOCK, no change in E3 Q & Q-N
               0
; Raise K2, no change in E3 Q & Q-N
                   1
; Raise E3 CLOCK, no change in E3 Q & Q-N
               1
; Lower E3 CLOCK, E3 Q high & Q-N low
               0    01
; Raise J1 & J2, K1 & K2 high, no change in E3 Q & Q-N
                11
; Raise E3 CLOCK, no change in E3 Q & Q-N
               1
; Lower E3 CLOCK, E3 Q & Q-N toggle
               0    10

; Test E4 8/6 outouts, Test Vector 51
; CLEAR-N low & PRESET-N high, E4 Q low & Q-N high
0           01      011       01
; CLEAR-N high & PRESET-N high, E4 Q low & Q-N high
1
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, no change in E4 Q & Q-N
                       0
; Raise J1, no change in E4 Q & Q-N
                        1
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, no change in E4 Q & Q-N
                       0
; Raise J2, no change in E4 Q & Q-N
                         1
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, no change in E4 Q & Q-N
                       0
; Raise J3, no change in E4 Q & Q-N
                          1
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, E3 Q low & Q-N high
                       0      10
; Lower J1, J2 & K3, Raise K1, no change in E4 Q & Q-N
                        0001
; Raise E4 CLOCK, no change in E2 Q & Q-N
                       1
; Lower E4 CLOCK, no change in E4 Q & Q-N
                       0
; Raise K2, no change in E4 Q & Q-N
                            1
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, no change in E4 Q & Q-N
                       0
; Raise K3, no change in E4 Q & Q-N
                             1
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, E4 Q high & Q-N low
                       0      01
; Raise J1, J2 & J3, K1, K2, & K3 high, no change in E4 Q & Q-N
                        111
; Raise E4 CLOCK, no change in E4 Q & Q-N
                       1
; Lower E4 CLOCK, E4 Q & Q-N toggle
                       0      10
END
