M207, PCB REV E, 6 J-K Flip-Flops With Clear

PINS
 1 I AA1 E1-2  CLEAR-N E1-12/13 E1-9/8 E2-12/13
 2 I AB1 E1-1  CLOCK   E1-12/13
 3 I AC1 E1-3  K       E1-12/13
 4 I AD1 E1-14 J       E1-12/13
 5 O AE1 E1-12 Q       E1-12/13
 6 O AF1 E1-13 Q-N     E1-12/13
 7 I AD2 E1-5  CLOCK            E1-9/8
 8 I AE2 E1-10 K                E1-9/8
 9 I AF2 E1-7  J                E1-9/8
10 O AH2 E1-9  Q                E1-9/8
11 O AJ2 E1-8  Q-N              E1-9/8
12 I AH1 E2-1  CLOCK                   E2-12/13
13 I AJ1 E2-3  K                       E2-12/13
14 I AK1 E2-14 J                       E2-12/13
15 O AL1 E2-12 Q                       E2-12/13
16 O AM1 E2-13 Q-N                     E2-12/13
17 I AK2 E2-6  CLEAR-N E2-9/8 E3-9/8 E3-12/13
18 I AL2 E2-5  CLOCK   E2-9/8
19 I AM2 E2-10 K       E2-9/8
20 I AN2 E2-7  J       E2-9/8
21 O AP2 E2-9  Q       E2-9/8
22 O AR2 E2-8  Q-N     E2-9/8
23 I AS2 E3-5  CLOCK          E3-9/8
24 I AT2 E3-10 K              E3-9/8
25 I AU2 E3-7  J              E3-9/8
26 O AV2 E3-9  Q              E3-9/8
27 O AV1 E3-8  Q-N            E3-9/8
28 I AN1 E3-1  CLOCK                 E3-12/13
29 I AP1 E3-3  K                     E3-12/13
30 I AR1 E3-14 J                     E3-12/13
31 O AS1 E3-12 Q                     E3-12/13
32 O AU1 E3-13 Q-N                   E3-12/13

IIIIOOIIIOOIIIOOIIIIOOIIIOOIIIOO
; Hold both CLEAR-N and all J & K low, all Q low & Q-N high
00000100001000010000010000100001
; Raise first CLEAR-N, no change in any Q & Q-N
1
; Test E1 12/13 outouts
; Raise E1-1 CLOCK, no change in E1-12 Q & E1-13 Q-N
 1
; Lower E1-1 CLOCK, no change in E1-12 Q & E1-13 Q-N
 0
; Raise J, no change in E1-12 Q & E1-13 Q-N
   1
; Raise E1-1 CLOCK, no change in E1-12 Q & E1-13 Q-N
 1
; Lower E1-1 CLOCK, E1-12 Q & E1-13 Q-N toggle
 0  10
; Lower J & Raise K, no change in E1-12 Q & E1-13 Q-N
  10
; Raise E1-1 CLOCK, no change in E1-12 Q & E1-13 Q-N
 1
; Lower E1-1 CLOCK, E1-12 Q & E1-13 Q-N toggle
 0  01
; Raise J, no change in E1-12 Q & E1-13 Q-N
   1
; Raise E1-1 CLOCK, no change in E1-12 Q & E1-13 Q-N
 1
; Lower E1-1 CLOCK, E1-12 Q & E1-13 Q-N toggle
 0  10
; Raise E1-1 CLOCK, no change in E1-12 Q & E1-13 Q-N
 1
; Lower E1-1 CLOCK, E1-12 Q & E1-13 Q-N toggle
 0  01
; Test E1 9/8 outouts
; Raise E1-5 CLOCK, no change in E1-9 Q & E1-8 Q-N
      1
; Lower E1-5 CLOCK, no change in E1-9 Q & E1-8 Q-N
      0
; Raise J, no change in E1-9 Q & E1-8 Q-N
        1
; Raise E1-5 CLOCK, no change in E1-9 Q & E1-8 Q-N
      1
; Lower E1-5 CLOCK, E1-9 Q & E1-8 Q-N toggle
      0  10
; Lower J & Raise K, no change in E1-9 Q & E1-8 Q-N
       10
; Raise E1-5 CLOCK, no change in E1-9 Q & E1-8 Q-N
      1
; Lower E1-5 CLOCK, E1-9 Q & E1-8 Q-N toggle
      0  01
; Raise J, no change in E1-9 Q & E1-8 Q-N
        1
; Raise E1-5 CLOCK, no change in E1-9 Q & E1-8 Q-N
      1
; Lower E1-5 CLOCK, E1-9 Q & E1-8 Q-N toggle
      0  10
; Raise E1-5 CLOCK, no change in E1-9 Q & E1-8 Q-N
      1
; Lower E1-5 CLOCK, E1-9 Q & E1-8 Q-N toggle
      0  01
; Test E2 12/13 outouts
; Raise E2-1 CLOCK, no change in E2-12 Q & E2-13 Q-N
           1
; Lower E2-1 CLOCK, no change in E2-12 Q & E2-13 Q-N
           0
; Raise J, no change in E2-12 Q & E2-13 Q-N
             1
; Raise E2-1 CLOCK, no change in E2-12 Q & E2-13 Q-N
           1
; Lower E2-1 CLOCK, E2-12 Q & E2-13 Q-N toggle
           0  10
; Lower J & Raise K, no change in E2-12 Q & E2-13 Q-N
            10
; Raise E2-1 CLOCK, no change in E2-12 Q & E2-13 Q-N
           1
; Lower E2-1 CLOCK, E2-12 Q & E2-13 Q-N toggle
           0  01
; Raise J, no change in E2-12 Q & E2-13 Q-N
             1
; Raise E2-1 CLOCK, no change in E2-12 Q & E2-13 Q-N
           1
; Lower E2-1 CLOCK, E2-12 Q & E2-13 Q-N toggle
           0  10
; Raise E2-1 CLOCK, no change in E2-12 Q & E2-13 Q-N
           1
; Lower E2-1 CLOCK, E2-12 Q & E2-13 Q-N toggle
           0  01
; Raise second CLEAR-N, no change in any Q & Q-N
                1
; Test E2 9/8 outouts
; Raise E2-5 CLOCK, no change in E2-9 Q & E2-8 Q-N
                 1
; Lower E2-5 CLOCK, no change in E2-9 Q & E2-8 Q-N
                 0
; Raise J, no change in E2-9 Q & E2-8 Q-N
                   1
; Raise E2-5 CLOCK, no change in E2-9 Q & E2-8 Q-N
                 1
; Lower E2-5 CLOCK, E2-9 Q & E2-8 Q-N toggle
                 0  10
; Lower J & Raise K, no change in E2-9 Q & E2-8 Q-N
                  10
; Raise E2-5 CLOCK, no change in E2-9 Q & E2-8 Q-N
                 1
; Lower E2-5 CLOCK, E2-9 Q & E2-8 Q-N toggle
                 0  01
; Raise J, no change in E2-9 Q & E2-8 Q-N
                   1
; Raise E2-5 CLOCK, no change in E2-9 Q & E2-8 Q-N
                 1
; Lower E2-5 CLOCK, E2-9 Q & E2-8 Q-N toggle
                 0  10
; Raise E2-5 CLOCK, no change in E2-9 Q & E2-8 Q-N
                 1
; Lower E2-5 CLOCK, E2-9 Q & E2-8 Q-N toggle
                 0  01
; Test E3 9/8 outouts
; Raise E3-5 CLOCK, no change in E3-9 Q & E3-8 Q-N
                      1
; Lower E3-5 CLOCK, no change in E3-9 Q & E3-8 Q-N
                      0
; Raise J, no change in E3-9 Q & E3-8 Q-N
                        1
; Raise E3-5 CLOCK, no change in E3-9 Q & E3-8 Q-N
                      1
; Lower E3-5 CLOCK, E3-9 Q & E3-8 Q-N toggle
                      0  10
; Lower J & Raise K, no change in E3-9 Q & E3-8 Q-N
                       10
; Raise E3-5 CLOCK, no change in E3-9 Q & E3-8 Q-N
                      1
; Lower E3-5 CLOCK, E3-9 Q & E3-8 Q-N toggle
                      0  01
; Raise J, no change in E3-9 Q & E3-8 Q-N
                        1
; Raise E3-5 CLOCK, no change in E3-9 Q & E3-8 Q-N
                      1
; Lower E3-5 CLOCK, E3-9 Q & E3-8 Q-N toggle
                      0  10
; Raise E3-5 CLOCK, no change in E3-9 Q & E3-8 Q-N
                      1
; Lower E3-5 CLOCK, E3-9 Q & E3-8 Q-N toggle
                      0  01
; Test E3 12/13 outouts
; Raise E3-1 CLOCK, no change in E3-12 Q & E3-13 Q-N
                           1
; Lower E3-1 CLOCK, no change in E3-12 Q & E3-13 Q-N
                           0
; Raise J, no change in E3-12 Q & E3-13 Q-N
                             1
; Raise E3-1 CLOCK, no change in E3-12 Q & E3-13 Q-N
                           1
; Lower E3-1 CLOCK, E3-12 Q & E3-13 Q-N toggle
                           0  10
; Lower J & Raise K, no change in E3-12 Q & E3-13 Q-N
                            10
; Raise E3-1 CLOCK, no change in E3-12 Q & E3-13 Q-N
                           1
; Lower E3-1 CLOCK, E3-12 Q & E3-13 Q-N toggle
                           0  01
; Raise J, no change in E3-12 Q & E3-13 Q-N
                             1
; Raise E3-1 CLOCK, no change in E3-12 Q & E3-13 Q-N
                           1
; Lower E3-1 CLOCK, E3-12 Q & E3-13 Q-N toggle
                           0  10
; Raise E3-1 CLOCK, no change in E3-12 Q & E3-13 Q-N
                           1
; Lower E3-1 CLOCK, E3-12 Q & E3-13 Q-N toggle
                           0  01
; Wiggle all 6x flip-flops at the same time
; Hold both CLEAR-N and all J & K low, all Q low & Q-N high
00000100001000010000010000100001
; Raise both CLEAR-N, no change in any Q & Q-N
1               1
; Raise CLOCK, no change in Q & Q-N
 1    1    1     1    1    1
; Lower CLOCK, no change in Q & Q-N
 0    0    0     0    0    0
; Raise J, no change in Q & Q-N
   1    1    1     1    1    1
; Raise CLOCK, no change in Q & Q-N
 1    1    1     1    1    1
; Lower CLOCK, Q & Q-N toggle
 0  100  100  10 0  100  100  10
; Lower J & Raise K, no change in Q & Q-N
  10   10   10    10   10   10
; Raise CLOCK, no change in Q & Q-N
 1    1    1     1    1    1
; Lower CLOCK, Q & Q-N toggle
 0  010  010  01 0  010  010  01
; Raise J, no change in Q & Q-N
   1    1    1     1    1    1
; Raise CLOCK, no change in Q & Q-N
 1    1    1     1    1    1
; Lower CLOCK, Q & Q-N toggle
 0  100  100  10 0  100  100  10
; Raise CLOCK, no change in Q & Q-N
 1    1    1     1    1    1
; Lower CLOCK, Q & Q-N toggle
 0  010  010  01 0  010  010  01
END
