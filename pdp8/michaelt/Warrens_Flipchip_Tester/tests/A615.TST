A615 DIGITAL-TO-ANALOG CONVERTER

PINS
 1 I BS2 E6-12	        SPARE FF DATA IN
 2 I BT2 E6-13        	SPARE FF CLOCK IN
 3 O BU2 E6-9        	SPARE FF Q OUTPUT
 4 O BV2 E6-8           SPARE FF Q-N OUTPUT 
 5 I BP2 E6-1           TOGGLE WEIGHT '004' SET-N
 6 I BL2 E6-4           TOGGLE WEIGHT '004' CLEAR-N
 7 I BM2 E6-3           TOGGLE WEIGHT '004' CLOCK
 8 O BN2 E6-6           TOGGLE WEIGHT '004' Q OUTPUT
 9 I BH2 E5-13          TOGGLE WEIGHT '002' SET-N
10 I BK2 E5-10          TOGGLE WEIGHT '002' CLEAR-N
11 I BJ2 E5-11          TOGGLE WEIGHT '002' CLOCK
12 O BF2 E5-8           TOGGLE WEIGHT '002' Q OUTPUT
13 I BK1 E3-10,E4-4+++  CLEAR-N; CLEARS WEIGHT '001' THRU '010'
14 I AV2 E3-4           WEIGHT '020' CLEAR-N (BIT 7)
15 I BD2 E5-3,E4-11+++	LOAD (CLOCKS WEIGHT '001' THRU WEIGHT '400' FLIP FLOPS
16 I BE2 E5-2           WEIGHT '001' DATA IN (BIT 11 LSB)
17 I BL1 E4-12          WEIGHT '002' DATA IN (BIT 10)
18 I BJ1 E4-2           WEIGHT '004' DATA IN (BIT 9)
19 I BE1 E3-12          WEIGHT '010' DATA IN (BIT 8)
20 I AU2 E3-2           WEIGHT '020' DATA IN (BIT 7)
21 I AV1 E2-12          WEIGHT '040' DATA IN (BIT 6)
22 I AU1 E2-2           WEIGHT '100' DATA IN (BIT 5)
23 I AP1 E1-12          WEIGHT '200' DATA IN (BIT 4)
24 I AN2 E1-2           WEIGHT '400' DATA IN (BIT 3)
25 O BH1 E3-8		WEIGHT '010' Q   OUTPUT (BIT 8)
26 O BF1 E3-9           WEIGHT '010' Q-N OUTPUT (BIT 8)
27 O AS2 E3-6		WEIGHT '020' Q   OUTPUT (BIT 7)
28 O AT2 E3-5           WEIGHT '020' Q-N OUTPUT (BIT 7)

IIOOIIIOIIIOIIIIIIIIIIIIOOOO

; ALL INPUTS LOW/NEUTRAL
00XX110X110X110000000000XXXX

; TEST SPARE FF
 101
 0
1
 110
 0
0
 101

; TEST TOGGLE WEIGTH '04' FLIP FLOP

    0  1
    1
     0 0
     1
      11
      0
      10
      0

; TEST TOGGLE WEIGTH '02' FLIP FLOP

        0  1
        1
         0 0
         1
          11
          0
          10
          0

; CLEAR WEIGHTS '001' THRU '010'
            0           01
            1

; CLEAR WEIGHT '020'
             0            01
             1

; LOAD WEIGHTS '001' THRU '400' WITH 0
               000000000
              1         1010
              0
; LOAD WEIGHTS '001' THRU '400' WITH 1S
               111111111
              1         0101

; CLEAR WEIGHTS '001' THRU '010'
            0           01
            1

; LOAD WEIGHTS '001' THRU '400' WITH 1S
               111111111
              1         0101

; CLEAR WEIGHT '020'
             0            01
             1


; WALK A ONE '001' THRU '400'


; LOAD WEIGHTS '001' THRU '400' WITH 0
               000000000
              1
              0
               1
              1         1010
              0
               0
              1
              0
                1
              1
              0
                0
              1
              0
                 1
              1
              0
                 0
              1
              0
                  1
              1         01
              0
                  0
              1         10
              0
                   1
              1           01
              0
                   0
              1           10
              0
                    1
              1
              0
                    0
              1
              0
                     1
              1
              0
                     0
              1
              0
                      1
              1
              0
                      0
              1
              0
                       1
              1
              0
                       0
              1
              0
END
