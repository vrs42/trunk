M160A     3 AND-OR TREES (4-2-2-2-3;4-2-2-4;2-2) 

Edit History:
  2-Nov-2022, M160A corrects a bad vector that is in the original M160 file.
  The corrected vector is noted in the vectors below with a comment.
  Original vector misses a fault in E2 pin 6 that was faulty in my PDP-8/L

PINS
 1 I AA1 E2-1    4-x-x-x-x
 2 I AB1 E2-2    4-x-x-x-x
 3 I AC1 E2-3    4-x-x-x-x
 4 I AD1 E2-13   4-x-x-x-x
 5 I AE1 E1-13   x-2-x-x-x
 6 I AF1 E1-1    x-2-x-x-x
 7 I AH1 E1-2    x-x-2-x-x
 8 I AJ1 E1-3    x-x-2-x-x
 9 I AK1 E1-5    x-x-x-2-x
10 I AL1 E1-4    x-x-x-2-x
11 I AM1 E2-6    x-x-x-x-3
12 I AN1 E2-5    x-x-x-x-3
13 I AP1 E2-4    x-x-x-x-3
14 O AR1 E1-8       ouput
15 I AD2 E4-3              4-x-x-x
16 I AE2 E4-2              4-x-x-x
17 I AF2 E4-1              4-x-x-x
18 I AH2 E4-13             4-x-x-x
19 I AJ2 E3-1              x-2-x-x
20 I AK2 E3-13             x-2-x-x
21 I AL2 E3-10             x-x-2-x
22 I AM2 E3-9              x-x-2-x
23 I AN2 E4-8              x-x-x-4
24 I AP2 E4-5              x-x-x-4
25 I AR2 E4-6              x-x-x-4
26 I AS2 E4-4              x-x-x-4
27 O AT2 E3-8              output
28 I AS1 E3-5                      2-x
29 I AU1 E3-4                      2-x
30 I AV1 E3-2                      x-2
31 I AU2 E3-3                      x-2
32 O AV2 E3-6                      output

IIIIIIIIIIIIIOIIIIIIIIIIIIOIIIIO
00000000000001000000000000100001
0001         1
0011         1
0010         1
0110         1
0111         1
0101         1
0100         1
1100         1
1101         1
1111         0
1110         1
1010         1
1011         1
1001         1
1000         1
00000000000001000000000000100001
    01       1
    10       1
    11       0
    01       1
00000000000001000000000000100001
      01     1
      10     1
      11     0
      01     1
00000000000001000000000000100001
        01   1
        10   1
        11   0
        01   1
00000000000001000000000000100001
          0011
          0111
          0101
;         0101 original bad line, corrected line is below
          1101
          1110
          1011
          1001
00000000000001000000000000100001
              0001        1
              0011        1
              0010        1
              0110        1
              0111        1
              0101        1
              0100        1
              1100        1
              1101        1
              1111        0
              1110        1
              1010        1
              1011        1
              1001        1
              1000        1
00000000000001000000000000100001
                  01      1
                  10      1
                  11      0
                  01      1
00000000000001000000000000100001
                    01    1
                    10    1
                    11    0
                    01    1
00000000000001000000000000100001
                      00011
                      00111
                      00101
                      01101
                      01111
                      01011
                      01001
                      11001
                      11011
                      11110
                      11101
                      10101
                      10111
                      10011
                      10001
00000000000001000000000000100001
                           01  1
                           10  1
                           11  0
                           01  1
00000000000001000000000000100001
                             011
                             101
                             110
                             011
00000000000001000000000000100001
END
