8/I FRONT PANEL DRIVER, C AND D CABLES (LEFT, RIGHT CONNECTORS)

; Declare the pins in the order we would like to light them.
PINS
 1 I AJ2 DF0
 2 I AS1 DF1
 3 I AP2 DF2
 4 I AN1 IF0
 5 I AC1 IF1
 6 I AD1 IF2
 7 I AB1 LINK
 8 I AS2 SC0
 9 I AM2 SC1
10 I AN2 SC2
11 I AL2 SC3
12 I AF1 SC4
13 I BM2 AND
14 I BT2 TAD
15 I BP1 ISZ
16 I BR2 DCA
17 I BS1 JMS
18 I BL2 JMP
19 I BH2 IOT
20 I BD2 OPR
21 I BN1 FETCH
22 I BH1 EXECUTE
23 I BB1 DEFER
24 I BA1 WORD_COUNT
25 I BE1 CURRENT_ADDRESS
26 I BE2 BREAK
27 I BD1 ION
28 I BM1 PAUSE
29 I BF1 RUN

IIIIIIIIIIIIIIIIIIIIIIIIIIIII
11111111111111111111111111111
; All lights on -- smoke test
00000000000000000000000000000
; All lights off
11111111111111111111111111111
; DF0
0
; DF1
10
; DF2
 10
; IF0
  10
; IF1
   10
; IF2
    10
; LINK
     10
; SC0
      10
; SC1
       10
; SC2
        10
; SC3
         10
; SC4
          10
; AND
           10
; TAD
            10
; ISZ
             10
; DCA
              10
; JMS
               10
; JMP
                10
; IOT
                 10
; OPR
                  10
; FETCH
                   10
; EXECUTE
                    10
; DEFER
                     10
; WORD COUNT
                      10
; CURRENT ADDRESS
                       10
; BREAK
                        10
; ION
                         10
; PAUSE
                          10
; RUN
                           10
11111111111111111111111111111
END
