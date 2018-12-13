M205    5 FLIP FLOPS

PINS
 1 I AD2 E1-1  CLEAR-N E1-5/6
 2 I AE2 E1-3  CLOCK   E1-5/6
 3 I AF2 E1-2  DATA    E1-5/6
 4 I AH2 E1-4  SET-N   E1-5/6
 5 O AJ2 E1-5  Q       E1-5/6
 6 O AK2 E1-6  Q-N     E1-5/6
 7 I AA1 E1-13 CLEAR-N        E1-8/9
 8 I AB1 E1-11 CLOCK          E1-8/9
 9 I AC1 E1-12 DATA           E1-8/9
10 I AD1 E1-10 SET-N          E1-8/9
11 O AE1 E1-9  Q              E1-8/9
12 O AF1 E1-8  Q-N            E1-8/9
13 I AL2 E2-1  CLEAR-N               E2-5/6
14 I AM2 E2-3  CLOCK                 E2-5/6
15 I AN2 E2-2  DATA                  E2-5/6
16 I AP2 E2-4  SET-N                 E2-5/6
17 O AR2 E2-5  Q                     E2-5/6
18 O AS2 E2-6  Q-N                   E2-5/6
19 I AH1 E2-13 CLEAR-N                      E2-8/9
20 I AJ1 E2-11 CLOCK                        E2-8/9
21 I AK1 E2-12 DATA                         E2-8/9
22 I AL1 E2-10 SET-N                        E2-8/9
23 O AM1 E2-9  Q                            E2-8/9
24 O AN1 E2-8  Q-N                          E2-8/9
25 I AP1 E3-1  CLEAR-N                             E3-5/6
26 I AR1 E3-3  CLOCK                               E3-5/6
27 I AS1 E3-2  DATA                                E3-5/6
28 I AT2 E3-4  SET-N                               E3-5/6
29 O AU2 E3-5  Q                                   E3-5/6
30 O AV2 E3-6  Q-N                                 E3-5/6

IIIIOOIIIIOOIIIIOOIIIIOOIIIIOO
; Lower Clear-N and Set-N, expect Q and Q-N
000011000011000011000011000011
; Raise Clear-N and expect Q
100010
; Raise Set-N, no output change
100110
; Raise Clock, expect Q-N
110101
; Raise Data, no output change
111101
; Lower Clock, no output change
101101
; Raise Clock, expect Q
111110
; Lower Data, no output change
110110
; Lower Clock, no output change
100110
; Lower Clear-N, expect Q-N
000101
; Raise Clear-N, no output change
100101
; Lower Set-N, expect Q
100010
; Assert Clear-N amd Set-N, expect Q and Q-N
000011000011000011000011000011
; Release Reset and excercise a flop
      100010
      100110
      110101
      111101
      101101
      111110
      110110
      100110
      000101
      100101
      100010
; Assert Clear-N amd Set-N, expect Q and Q-N
000011000011000011000011000011
; Release Reset and excercise a flop
            100010
            100110
            110101
            111101
            101101
            111110
            110110
            100110
            000101
            100101
            100010
; Assert Clear-N amd Set-N, expect Q and Q-N
000011000011000011000011000011
; Release Reset and excercise a flop
                  100010
                  100110
                  110101
                  111101
                  101101
                  111110
                  110110
                  100110
                  000101
                  100101
                  100010
; Assert Clear-N amd Set-N, expect Q and Q-N
000011000011000011000011000011
; Release Reset and excercise a flop
                        100010
                        100110
                        110101
                        111101
                        101101
                        111110
                        110110
                        100110
                        000101
                        100101
                        100010
000011000011000011000011000011
END
