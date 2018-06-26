M101, PCB REV A, BUS DATA INTERFACE, NEGATIVE-CLAMPED INPUTS TO 7400s
EQUATION IS OUT_A-N = IN NAND ENABLE

PINS
 1 I AC1        ENABLE   (ENABLES ALL INPUTS)
 2 I AA1 E1-2   IN_A
 3 O AB1 E1-3	OUT_A-N
 4 I AD1 E1-5   IN_B
 5 O AE1 E1-6   OUT_B-N
 6 I AF1 E1-9   IN_C
 7 O AH1 E1-8   OUT_C-N
 8 I AJ1 E2-2   IN_D
 9 O AK1 E2-3   OUT_D-N
10 I AL1 E2-9   IN_E
11 O AM1 E2-8   OUT_E-N
12 I AN1 E3-4   IN_F
13 O AP1 E3-6   OUT_F-N
14 I AR1 E3-9   IN_H
15 O AS1 E3-8   OUT_H-N
16 I AV1 E4-9   IN_J
17 O AU1 E4-8   OUT_J-N
18 I AE2 E1-12  IN_K
19 O AF2 E1-11  OUT_K-N
20 I AH2 E2-5   IN_L
21 O AJ2 E2-6   OUT_L-N
22 I AK2 E2-12  IN_M
23 O AL2 E2-11  OUT_M-N
24 I AM2 E3-1   IN_N
25 O AN2 E3-3   OUT_N-N
26 I AP2 E3-12  IN_P
27 O AR2 E3-11  OUT_P-N
28 I AS2 E4-5   IN_R
29 O AT2 E4-6   OUT_R-N
30 I AU2 E4-12  IN_S
31 O AV2 E4-11  OUT_S-N

IIOIOIOIOIOIOIOIOIOIOIOIOIOIOIO
0010101010101010101010101010101

; ENABLED TESTS

; TURN ON ENABLE
1

; WALK A ONE (TURNS ON OUTPUTS)
 10
 01
   10
   01
     10
     01
       10
       01
         10
         01
           10
           01
             10
             01
               10
               01
                 10
                 01
                   10
                   01
                     10
                     01
                       10
                       01
                         10
                         01
                           10
                           01
                             10
                             01

; SET ALL INPUTS (TURNS ON OUTPUTS)
 10
   10
     10
       10
         10
           10
             10
               10
                 10
                   10
                     10
                       10
                         10
                           10
                             10

; WALK A ZERO (TURNS OFF OUTPUTS)
 01
 10
   01
   10
     01
     10
       01
       10
         01
         10
           01
           10
             01
             10
               01
               10
                 01
                 10
                   01
                   10
                     01
                     10
                       01
                       10
                         01
                         10
                           01
                           10
                             01
                             10

; CLEAR ALL INPUTS (TURNS OFF OUTPUT)
 01
   01
     01
       01
         01
           01
             01
               01
                 01
                   01
                     01
                       01
                         01
                           01
                             01

; TEST NOT ENABLED

; TURN OFF ENABLE
0

; WALK A ONE (OUTPUTS OFF)

 1
 0
   1
   0
     1
     0
       1
       0
         1
         0
           1
           0
             1
             0
               1
               0
                 1
                 0
                   1
                   0
                     1
                     0
                       1
                       0
                         1
                         0
                           1
                           0
                             1
                             0

; SET ALL INPUTS (OUTPUTS OFF)

 1
   1
     1
       1
         1
           1
             1
               1
                 1
                   1
                     1
                       1
                         1
                           1
                             1

; WALK A ZERO (OUTPUTS OFF)
 0
 1
   0
   1
     0
     1
       0
       1
         0
         1
           0
           1
             0
             1
               0
               1
                 0
                 1
                   0
                   1
                     0
                     1
                       0
                       1
                         0
                         1
                           0
                           1
                             0
                             1

; CLEAR ALL INPUTS (OUTPUTS OFF)
 0
   0
     0
       0
         0
           0
             0
               0
                 0
                   0
                     0
                       0
                         0
                           0
                             0

; NO CHANGE
0010101010101010101010101010101
END
