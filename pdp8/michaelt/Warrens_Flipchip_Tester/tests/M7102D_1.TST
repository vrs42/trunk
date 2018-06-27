M7102, PCB REV D, Positive I/O Bus Converter (DW08E)

PART 1    Tests Posibus driving Omnibus DATA BUS.     
          (See PART 2 for Omnibus driving Posibus.

(Two parts are necessary due to the Omnibus DATA00:02-N is a bidirectional bus).

Needs 3.3k ohm pullups to +5v on pin:
  BK2   Omnibus DATA00 (bidirectional, input + open collector output)  
  BL2   Omnibus DATA01 (bidirectional, input + open collector output)
  BM2   Omnibus DATA02 (bidirectional, input + open collector output)

PINS
 1 I AN1 E6-9	    INPUT 1
 2 P BF2 E13-8	    OUTPUT A-N		(7416 OPEN COLLECTOR OUTPUT)
 3 I AP1 E6-6	    INPUT 2
 4 P BH2 E13-7	    OUTPUT 2-N 		(7416 OPEN COLLECTOR OUTPUT)
 5 I AR1 E6-5	    INPUT 3
 6 P BJ2 E13-6	    OUTPUT 3-N 		(7416 OPEN COLLECTOR OUTPUT)
 7 I AK2 E9-11	    INPUT 4
 8 O AN2 E9-13	    OUTPUT 4 		(384 OUTPUT)
 9 I AL2 E9-9	    INPUT 5
10 O AM2 E9-14	    OUTPUT 5 		(384 OUTPUT)
11 I AP2 E9-6	    INPUT 6
12 O AT2 E9-2	    OUTPUT 6 		(384 OUTPUT)
13 O BB1 E11-6	    OUTPUT 6-N 		(74H04 OUTPUT)
14 I AR2 E9-5	    INPUT 7
15 O AS2 E9-3	    OUTPUT 7		(384 OUTPUT)
16 O BA1 E11-10	    OUTPUT 7-N		(74H04 OUTPUT)
17 I BD1 E11-1	    INPUT 8
18 P BV2 E13-12	    OUTPUT 8		(7416 OPEN COLLECTOR OUTPUT)
19 O BC1 E11-2	    OUTPUT 8-N		(74H04 OUTPUT)
20 I AV1 E11-13     INPUT 9
21 O AU1 E11-12	    OUTPUT 9-N		(74H04 OUTPUT)
22 I BL1 E12-4      INPUT 10A
23 I BK1 E12-5	    INPUT 10B
24 O BM1 E12-3	    OUTPUT 10 = INPUT 10A NOR INPUT 10B	(380 OUTPUT)
25 I BJ1 E12-9	    INPUT 11A
26 I BH1 E12-10	    INPUT 11B
27 O BF1 E12-14	    OUTPUT 11 = INPUT 11A NOR INPUT 11B	(M380 OUTPUT)
28 I BR1 E15-12	    INPUT 12A
29 I BS1 E15-11     INPUT 12B
30 O BP1 E15-?	    OUTPUT 12 = INPUT 12A NAND INPUT 12B (8881 OPEN COLLECTOR OUTPUT WITH 3.3K PULLUP)
31 I BN2 E10-6,7    INPUT 13
32 P AD1 E1-3	    OUTPUT 13		(75452 OPEN COLLECTOR OUTPUT)
33 I BP2 E14-11,12  INPUT 14
34 P AE1 E2-3	    OUTPUT 14		(75452 OPEN COLLECTOR OUTPUT)
35 I BR2 E14-9,10   INPUT 15
36 P AD2 E5-5       OUTPUT 15		(75452 OPEN COLLECTOR OUTPUT)
37 I BS2 E14-6,7    INPUT 16
38 P AE2 E4-5	    OUTPUT 16		(75452 OPEN COLLECTOR OUTPUT)
39 I BU1 E14-4,5    INPUT 17
40 P AB1 E4-5	    OUTPUT 17		(75452 OPEN COLLECTOR OUTPUT)
41 O BU2 E14-3      OUTPUT 17-N         (380 OUTPUT)
42 I BV1 E2-6,7     INPUT 18
43 P AA1 E2-5       OUTPUT 18-N		(75452 OPEN COLLECTOR OUTPUT)
44 I BD2 E11-3	    OMNIBUS DATA TO I/O DATA-N  (LOW ALSO DISABLES BAC <> OMNIBUS)
45 O BE1 E11-4      OMNIBUS DATA TO I/O DATA		(74H04 OUTPUT)
46 I BE2 E12-12     INPUT OUT-N			(L -> BAC TO OMNIBUS, H -> OMNIBUS TO BAC)
47 I AK1 E3-6	    INPUT BAC0	    (DATA FROM I/O BUS)
48 I AL1 E3-5       INPUT BAC1      (DATA FROM I/O BUS)
49 I AM1 E6-11      INPUT BAC2      (DATA FROM I/O BUS)
50 O BK2 E15-1      OUTPUT DATA00-N (OMNIBUS DATA00)  	(8881 OPEN COLLECTOR OUTPUT)
51 O BL2 E15-4      OUTPUT DATA01-N (OMNIBUS DATA01)  	(8881 OPEN COLLECTOR OUTPUT)
52 O BM2 E15-10     OUTPUT DATA02-N (OMNIBUS DATA02)  	(8881 OPEN COLLECTOR OUTPUT)
53 P AF1 E4-3       OUTPUT I/O BUS ACIN0-N		(75452 OPEN COLLECTOR OUTPUT)		
54 P AH1 E5-3       OUTPUT I/O BUS ACIN1-N		(75452 OPEN COLLECTOR OUTPUT)		
55 P AJ1 E8-5       OUTPUT I/O BUS ACIN2-N		(75452 OPEN COLLECTOR OUTPUT)		
56 P AF2 E7-5       OUTPUT I/O BUS DATA0-N		(75452 OPEN COLLECTOR OUTPUT)		
57 P AH2 E3-3       OUTPUT I/O BUS DATA1-N		(75452 OPEN COLLECTOR OUTPUT)		
58 P AJ2 E7-3       OUTPUT I/O BUS DATA2-N		(75452 OPEN COLLECTOR OUTPUT)		

IPIPIPIOIOIOOIOOIPOIOIIOIIOIIOIPIPIPIPIPOIPIOIIIIOOOPPPPPP
0101010000001001001010010010010000000000101010000111111111



; test with most inputs LOW



; INPUT 1 -> OUTPUT 1-N
10
01

; INPUT 2 -> OUTPUT 2-N
  10
  01

; INPUT 3 -> OUTPUT 3-N
    10
    01

; INPUT 4 -> OUTPUT 4
      11
      00

; INPUT 5 -> OUTPUT 5
        11
        00

; INPUT 6 -> OUTPUT 6, OUTPUT 6-N
          110
          001

; INPUT 7 -> OUTPUT 7, OUTPUT 7-N
             110
             001

; INPUT 8 -> OUTPUT 8, OUTPUT 8-N
                110
                001

; INPUT 9 -> OOUTPUT 9-N
                   10
                   01

; INPUT 10A NOR INPUT 10B -> OUTPUT 10 
                     010
                     110
                     100
                     001

; INPUT 11A NOR INPUT 11B -> OUTPUT 11
                        010
                        110
                        100
                        001

; INPUT 12A NAND INPUT 12B -> OUTPUT 12
                           011
                           110
                           101
                           001

; INPUT 13 -> OUTPUT 13
                              11
                              00

; INPUT 14 -> OUTPUT 14
                                11
                                00

; INPUT 15 -> OUTPUT 15
                                  11
                                  00

; INPUT 16 -> OUTPUT 16
                                    11
                                    00

; INPUT 17 -> OUTPUT 17, OUTPUT 17-N
                                      110
                                      001

; INPUT 18 -> OUTPUT 18-N
                                         10
                                         01

; (no change)
0101010000001001001010010010010000000000101010000111111111



; PART 1 unique tests (Posibus BAC0:2 driving Omnibus DATA00:02-N). 

; (See PART 2 for Omnibus DATA00:02-N driving).



; Select Omnibus DATA00:02-N -> Posibus DATA0:2-N

;   OMNIBUS DATA TO I/O DATA-N LO, OUT-N HI; OMNIBUS DATA TO I/O DATA -> HI
                                           011
; (no change)
                                              000111111111

; All BAC0:2 patterns (Omnibus DATA00:02-N, Posibus ACIN0:2-N, Posibus DATA0:2-N always HI).
;   (Omnibus DATA00:02-N always high due to pullups and no drivers in PART 1 tests)
                                              001
                                              011
                                              010
                                              110
                                              111
                                              101
                                              100
                                              000



; Select Omnibus DATA00:02-N -> PosiBus ACIN0:2-N

;   OMNIBUS DATA TO I/O DATA-N HI, OUT-N HI; OMNIBUS DATA TO I/O DATA -> LO
                                           101
; (no change)
                                              000111111111

; All BAC0:2 patterns (Omnibus DATA00:02-N, Posibus ACIN0:2-N, Posibus DATA0:2-N always HI).
;   (Omnibus DATA00:02-N always high due to pullups and no drivers in PART 1 tests)
                                              001
                                              011
                                              010
                                              110
                                              111
                                              101
                                              100
                                              000



; Select Posibus BAC0:2 -> Omnibus DATA00:02-N  

;   OMNIBUS DATA TO I/O DATA-N HI, OUT-N LO; OMNIBUS DATA TO I/O DATA -> LO
                                           100
; (no change)
                                              000111111111

; All BAC0:2 patterns (PosibusACIN0:2-N and Posibus DATA0:2-N always HI).
                                              001110
                                              011100
                                              010101
                                              110001
                                              111000
                                              101010
                                              100011
                                              000111



; Select Omnibus DATA00:02-N -> Posibus DATA0:2-N

;   OMNIBUS DATA TO I/O DATA-N LO, OUT-N LO; OMNIBUS DATA TO I/O DATA -> HI
                                           010
; (no change)
                                              000111111111

; All BAC0:2 patterns (Omnibus DATA00:02-N, Posibus ACIN0:2-N, Posibus DATA0:2-N always HI).
;   (Omnibus DATA00:02-N always high due to pullups and no drivers in PART 1 tests)
                                              001
                                              011
                                              010
                                              110
                                              111
                                              101
                                              100
                                              000
 
; (no change)
0101010000001001001010010010010000000000101010000111111111




; test with most inputs HIGH



; change inputs to HIGH

10
  10
    10
      11
        11
          110
             110
                110
                   10
                     010
                     110
                        010
                        110
                           011
                           110
                              11
                                11
                                  11
                                    11
                                      110
                                         10
                                           011
                                           101
                                              100
                                              110
                                              111

; (no change)
1010101111110110110101101101101111111111010101111111111111

; INPUT 1 -> OUTPUT 1-N
01
10

; INPUT 2 -> OUTPUT 2-N
  01
  10

; INPUT 3 -> OUTPUT 3-N
    01
    10

; INPUT 4 -> OUTPUT 4
      00
      11

; INPUT 5 -> OUTPUT 5
        00
        11

; INPUT 6 -> OUTPUT 6, OUTPUT 6-N
          001
          110

; INPUT 7 -> OUTPUT 7, OUTPUT 7-N
             001
             110

; INPUT 8 -> OUTPUT 8, OUTPUT 8-N
                001
                110

; INPUT 9 -> OOUTPUT 9-N
                   01
                   10

; INPUT 10A NOR INPUT 10B -> OUTPUT 10 
                     100
                     001
                     010
                     110

; INPUT 11A NOR INPUT 11B -> OUTPUT 11
                        100
                        001
                        010
                        110

; INPUT 12A NAND INPUT 12B -> OUTPUT 12
                           101
                           001
                           011
                           110

; INPUT 13 -> OUTPUT 13
                              00
                              11

; INPUT 14 -> OUTPUT 14
                                00
                                11

; INPUT 15 -> OUTPUT 15
                                  00
                                  11

; INPUT 16 -> OUTPUT 16
                                    00
                                    11

; INPUT 17 -> OUTPUT 17, OUTPUT 17-N
                                      001
                                      110

; INPUT 18 -> OUTPUT 18-N
                                         01
                                         10

; (no change)
1010101111110110110101101101101111111111010101111111111111



; PART 1 unique tests (Posibus BAC0:2 driving Omnibus DATA00:02-N). 

; (See PART 2 for Omnibus DATA00:02-N driving).



; Select Posibus BAC0:2 -> Omnibus DATA00:02-N  

;   OMNIBUS DATA TO I/O DATA-N HI, OUT-N LO; OMNIBUS DATA TO I/O DATA -> LO
                                           100   000
; (no change)
                                              111000111111

; All BAC0:2 patterns (PosibusACIN0:2-N and Posibus DATA0:2-N always HI).
                                              101010
                                              100011
                                              000111
                                              001110
                                              011100
                                              010101
                                              110001
                                              111000



; Select Omnibus DATA00:02-N -> Posibus DATA0:2-N

;   OMNIBUS DATA TO I/O DATA-N LO, OUT-N LO; OMNIBUS DATA TO I/O DATA -> HI
                                           010   111
; (no change)
                                              111111111111

; All BAC0:2 patterns (Omnibus DATA00:02-N, Posibus ACIN0:2-N, Posibus DATA0:2-N always HI).
;   (Omnibus DATA00:02-N always high due to pullups and no drivers in PART 1 tests)
                                              101
                                              100
                                              000
                                              001
                                              011
                                              010
                                              110
                                              111
 
; Select Omnibus DATA00:02-N -> Posibus DATA0:2-N

;   OMNIBUS DATA TO I/O DATA-N LO, OUT-N HI; OMNIBUS DATA TO I/O DATA -> HI
                                           011
; (no change)
                                              111111111111

; All BAC0:2 patterns (Omnibus DATA00:02-N, Posibus ACIN0:2-N, Posibus DATA0:2-N always HI).
;   (Omnibus DATA00:02-N always high due to pullups and no drivers in PART 1 tests)
                                              101
                                              100
                                              000
                                              001
                                              011
                                              010
                                              110
                                              111



; Select Omnibus DATA00:02-N -> PosiBus ACIN0:2-N

;   OMNIBUS DATA TO I/O DATA-N HI, OUT-N HI; OMNIBUS DATA TO I/O DATA -> LO
                                           101
; (no change)
                                              111111111111

; All BAC0:2 patterns (Omnibus DATA00:02-N, Posibus ACIN0:2-N, Posibus DATA0:2-N always HI).
;   (Omnibus DATA00:02-N always high due to pullups and no drivers in PART 1 tests)
                                              101
                                              100
                                              000
                                              001
                                              011
                                              010
                                              110
                                              111



; (no change)
1010101111110110110101101101101111111111010101111111111111


; change inputs to LOW
01
  01
    01
      00
        00
          001
             001
                001
                   01
                     100
                     001
                        100
                        001
                           101
                           001
                              00
                                00
                                  00
                                    00
                                      001
                                         01
                                           100   000
                                           010   111
                                              011
                                              001
                                              000

; (no change)
0101010000001001001010010010010000000000101010000111111111
END
