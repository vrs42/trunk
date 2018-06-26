M707, PCB REV C, TELETYPE TRANSMITTER

ICs are HORIZONTAL on PCB REV C.

does not test AV2 20MA OUTPUT, use scope and pulldown

or use M707C_MA.TST to test 20MA OUTPUT (needs jumper)


PINS
 1 O BJ1  +3V
 2 I BF2  CLEAR FLAG 2-N  (normally 3v)
 3 I BE2  I/O CLEAR       (normally INITIALIZE)
 4 I BP2  2 X BAUD CLOCK INPUT
 5 I AE1  (DEVICE SELECTOR BMB IN) (nand)->(DEVICE SELECT-N) (normally MB04-N)
 6 I AE2  (DEVICE SELECTOR BMB IN) (nand)->(DEVICE SELECT-N) (normally MB03-N)
 7 I AF1  (DEVICE SELECTOR BMB IN) (nand)->(DEVICE SELECT-N) (normally MB06)
 8 I AF2  (DEVICE SELECTOR BMB IN) (nand)->(DEVICE SELECT-N) (normally MB05-N)
 9 I AH2  (DEVICE SELECTOR BMB IN) (nand)->(DEVICE SELECT-N) (normally MB08-N)
10 I AJ2  (DEVICE SELECTOR BMB IN) (nand)->(DEVICE SELECT-N) (normally MB07-N)
11 I AN1  (FORCE SELECT-N) (normally HI) nand(DEVICE SELECT-N)=(SELECTED)
12 I BH2  I/O SKP. STROBE (normally IOT 1)
13 O BJ2  I/O SKP.-N (NAND OF I/O SKP. STROBE, FLAG, DEV DECODE)
14 O BK2  P.I.REQ-N  (FLAG-N)
15 I BD2  CLEAR FLAG 1    (normally IOT 2)
16 I AS1  LOAD BUFFER     (normally IOT 4)
17 I AR1  LOAD BUFFER STROBE-N (nand SELECTED, LOAD BUFFER)
18 I BS2  WAIT-N (prolongs STOP bits)         (normally 3v)
19 O BR2  STOP 1-N
20 O BP1  STOP 1.5-N
21 O BN1  STOP 2-N
22 I BN2  (STOP SELECT) (must be HI to set ACTIVE i.e. TX next character)
23 O AJ1  (BIT 6)   (connects to AK1 for 5 bit output)
24 O AK2  (ENABLE)  (connects to AK1 for 8 bit output)
25 I AK1  (CHARACTER LOADED)  (must be HI to set ACTIVE i.e. TX next character)
26 O AL1  (ENABLE-N)       (normally connects to DECODE INPUT 8)
27 I AH1  (DECODE INPUT 8) (normally connects to (ENABLE-N)
28 I AN2  ENABLE           (normally 3v)
29 I AP2  BIT 8            (normally AC4)
30 I AR2  BIT 7            (normally AC5)
31 I AL2  BIT 6            (normally AC6)
32 I AM2  BIT 5            (normally AC7)
33 I AU2  BIT 4            (normally AC8)
34 I AS2  BIT 3            (normally AC9)
35 I AT2  BIT 2            (normally AC10)
36 I AU1  BIT 1            (normally AC11)
37 O AD1  ACTIVE
38 O AD2  LINE
39 O AV2  20MA OUTPUT (PNP to +)

OIIIIIIIIIIIOOIIIIOOOIOOIOIIIIIIIIIIOOO
; set CLEAR FLAG 2-N, I/O CLEAR
; note: STOP FF outputs are unknown.
; note: 20MA output can not test (open emitter)
111000000010110011XXX00001110000000001X
; remove I/O CLEAR
  0
; clock 2 X BAUD CLOCK INPUT to set STOP FFs
   1              1
   0
   1               1
   0
   1                1
   0
; set (STOP SELECT since all 3 STOP FFs are HI)
                     1
;
; test DEVICE DECODER
; 
; turn on LOAD BUFFER (normally IOP4)
               1
;
; set up to load ENABLE/55h (alternating ones)
;
                           101010101
; turn on DEVICE ADDRESS bits, LOAD BUFFER STROBE-N goes LO
;       (ENABLE)   will go HI   (note: next CLOCK starts TX...)
;       (ENABLE-N) will go LO
    111111      0      1 0
; (ENABLE-N) is LO so change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          0
; remove DEVICE ADDRESS, LOAD BUFFER STROBE-N goes HI
;       since (ENABLE) is HI, set (CHARACTER LOADED) (normal 8 BIT TX)
    000000      1       1
; toggle (FORCE SELECT-N),    LOAD BUFFER STROBE-N goes LO
          0     0 
          1     1
; test all DEVICE ADDRESS combinations
    000000      1
    000001      1
    000010      1
    000011      1
    000100      1
    000101      1
    000110      1
    000111      1
    001000      1
    001001      1
    001010      1
    001011      1
    001100      1
    001101      1
    001110      1
    001111      1
    010000      1
    010001      1
    010010      1
    010011      1
    010100      1
    010101      1
    010110      1
    010111      1
    011000      1
    011001      1
    011010      1
    011011      1
    011100      1
    011101      1
    011110      1
    011111      1
    100000      1
    100001      1
    100010      1
    100011      1
    100100      1
    100101      1
    100110      1
    100111      1
    101000      1
    101001      1
    101010      1
    101011      1
    101100      1
    101101      1
    101110      1
    101111      1
    110000      1
    110001      1
    110010      1
    110011      1
    110100      1
    110101      1
    110110      1
    110111      1
    111000      1
    111001      1
    111010      1
    111011      1
    111100      1
    111101      1
    111110      1
    111111      0
; remove LOAD BUFFER (normally IOP4)
               01
; remove DEVICE ADDRESS
    000000
;
;
; send the 0x55 character
;
;
; on first 2 X BAUD CLOCK INPUT
;    ACTIVE is SET, causes LINE to CLEAR (i.e. START BIT).
;    
   1                                10
   0
; the 2nd 2 X BAUD CLOCK INPUT causes the STOP FFs to PRESET
   1              000
   0
; ORGINAL BIT 1 (AC11) goes to LINE
;       (BIT 6) shifts
;       (ENABLE) goes LO, (ENABLE-N) goes HI
   1                  10 1           1
; since (ENABLE) is LO, change (CHARACTER LOADED) (i.e. 8 not 5)
                        0
; (ENABLE-N) is HI so change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          1
   0
   1
   0
; ORGINAL BIT 2 (AC10) goes to LINE
   1                  0              0
   0
   1
   0
; ORGINAL BIT 3 (AC9) goes to LINE
;       (BIT 6) shifts
   1                  1              1
   0
   1
   0
; ORGINAL BIT 4 (AC8) goes to LINE
   1                  0              0
   0
   1
   0
; ORGINAL BIT 5 (AC7) goes to LINE
;
   1                  0              1
   0
   1
   0
; ORGINAL BIT 6 (AC6) goes to LINE
   1                                 0
   0
   1
   0
; ORGINAL BIT 7 (AC5) goes to LINE
   1                                 1
   0
   1
   0
; ORGINAL BIT 8 (AC4) goes to LINE
   1                                 0
   0
   1
   0
; ORGINAL (ENABLE) goes to LINE (STOP BITS)
;    (ACTIVE) goes LO
;    P.I.REQ-N  (FLAG-N) goes LO...FLAG is ON
   1         0                      01
   0
; STOP FFs bits start counting...
   1              1
   0
   1               1
   0
   1                1
; since STOP 2-N went HI, set (STOP SELECT) (i.e. 2 STOP BITS)
                     1
   0
   1
   0
;
; try the I/O SKIP
;
; turn on DEVICE ADDRESS bits
    111111
; toggle I/O SKP.STROBE  I/O SKP.-N pulses LO (active)
           10
           01
; turn off DEVICE ADDRESS bits
    000000
; toggle I/O SKP.STROBE- I/O SKP.-N stays HI (inactive)
           1
           0
; turn on DEVICE ADDRESS bits
    111111
; set I/O SKP. STROBE, I/O SKP.-N goes LO
           10
; clear the FLAG- pulse CLEAR FLAG 1, I/O SKP.-n goes HI
;    P.I.REQ-N (FLAG-N) goes HI...FLAG is OFF
            111
              0
; turn off I/O SKP. STROBE
           0
; turn off DEVICE ADDRESS bits
    000000
11000000001011001111110001110101010101X
;
;
; send a 0xAA
;
;
; set up to load ENABLE/0xAA (alternating ones)
                           110101010
; turn on DEVICE ADDRESS bits
    111111
; turn on LOAD BUFFER (normally IOP4)
;       LOAD BUFFER STROBE-N goes LO
;       (BIT 6)    goes HI
;       (ENABLE)   goes HI   (note: next CLOCK starts TX...)
;       (ENABLE-N) goes LO
               10     11 0
; (ENABLE) is HI, so set (CHARACTER LOADED) (normal 8 BIT TX)
                        1
; (ENABLE-N) is LO, so change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          0
; remove LOAD BUFFER (normally IOP4)
               01
; remove DEVICE ADDRESS
    000000
;
; shift out the 0xAA character
;
; on first 2 X BAUD CLOCK INPUT
;    ACTIVE is SET, causes LINE to CLEAR (i.e. START BIT).
;    
   1                                10
   0
; the 2nd 2 X BAUD CLOCK INPUT causes the STOP FFs to PRESET
   1              000
   0
; ORGINAL BIT 1 (AC11) goes to LINE
;       (BIT 6) shifts
;       (ENABLE) goes LO, (ENABLE-N) goes HI
   1                  00 1           0
; since (ENABLE) is LO, change (CHARACTER LOADED) (i.e. 8 not 5)
                        0
; since (ENABLE-N) is HI, change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          1
   0
   1
   0
; ORGINAL BIT 2 (AC10) goes to LINE
   1                  1              1
   0
   1
   0
; ORGINAL BIT 3 (AC9) goes to LINE
;       (BIT 6) becomes original ENABLE
   1                  1              0
   0
   1
   0
; ORGINAL BIT 4 (AC8) goes to LINE
;       (BIT 6) goes LO
   1                  0              1
   0
   1
   0
; ORGINAL BIT 5 (AC7) goes to LINE
;
   1                  0              0
   0
   1
   0
; ORGINAL BIT 6 (AC6) goes to LINE
   1                                 1
   0
   1
   0
; ORGINAL BIT 7 (AC5) goes to LINE
   1                                 0
   0
   1
   0
; ORGINAL BIT 8 (AC4) goes to LINE
   1                                 1
   0
   1
   0
; ORGINAL (ENABLE) goes to LINE (STOP BITS)
;    (ACTIVE) goes LO
;    P.I.REQ-N  (FLAG-N) goes LO...FLAG is ON
   1         0                      01
   0
; STOP FFs bits start counting...
   1              1
   0
   1               1
   0
   1                1
; since STOP 2-N went HI, set (STOP SELECT) (i.e. 2 STOP BITS)
                     1
   0
   1
   0
;
; try the I/O SKIP
;
; turn on DEVICE ADDRESS bits
    111111
; toggle I/O SKP.STROBE  I/O SKP.-N pulses LO (active)
           10
           01
; turn off DEVICE ADDRESS bits
    000000
; toggle I/O SKP.STROBE- I/O SKP.-N stays HI (inactive)
           1
           0
; turn on DEVICE ADDRESS bits
    111111
; set I/O SKP. STROBE, I/O SKP.-N goes LO
           10
; clear the FLAG- pulse CLEAR FLAG 1, I/O SKP.-n goes HI
;    P.I.REQ-N (FLAG-N) goes HI...FLAG is OFF
            111
              0
; turn off I/O SKP. STROBE
           0
; turn off DEVICE ADDRESS bits
    000000
11000000001011001111110001110101010101X
;
;
; send a 0x00
;
;
; set up to load ENABLE/0x00 (all zeroes)
                           100000000
; turn on DEVICE ADDRESS bits
    111111
; turn on LOAD BUFFER (normally IOP4)
;       LOAD BUFFER STROBE-N goes LO
;       (BIT 6)    goes LO
;       (ENABLE)   goes HI   (note: next CLOCK starts TX...)
;       (ENABLE-N) goes LO
               10     01 0
; (ENABLE) is HI, so set (CHARACTER LOADED) (normal 8 BIT TX)
                        1
; (ENABLE-N) is LO, so change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          0
; remove LOAD BUFFER (normally IOP4)
               01
; remove DEVICE ADDRESS
    000000
;
; shift out the 0x00 character
;
; on first 2 X BAUD CLOCK INPUT
;    ACTIVE is SET, causes LINE to CLEAR (i.e. START BIT).
;    
   1                                10
   0
; the 2nd 2 X BAUD CLOCK INPUT causes the STOP FFs to PRESET
   1              000
   0
; ORGINAL BIT 1 (AC11) goes to LINE
;       (BIT 6) shifts
;       (ENABLE) goes LO, (ENABLE-N) goes HI
   1                  00 1           0
; since (ENABLE) is LO, change (CHARACTER LOADED) (i.e. 8 not 5)
                        0
; since (ENABLE-N) is HI, change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          1
   0
   1
   0
; ORGINAL BIT 2 (AC10) goes to LINE
   1                  0              0
   0
   1
   0
; ORGINAL BIT 3 (AC9) goes to LINE
;       (BIT 6) becomes original ENABLE
   1                  1              0
   0
   1
   0
; ORGINAL BIT 4 (AC8) goes to LINE
;       (BIT 6) goes LO
   1                  0              0
   0
   1
   0
; ORGINAL BIT 5 (AC7) goes to LINE
;
   1                  0              0
   0
   1
   0
; ORGINAL BIT 6 (AC6) goes to LINE
   1                                 0
   0
   1
   0
; ORGINAL BIT 7 (AC5) goes to LINE
   1                                 0
   0
   1
   0
; ORGINAL BIT 8 (AC4) goes to LINE
   1                                 0
   0
   1
   0
; ORGINAL (ENABLE) goes to LINE (STOP BITS)
;    (ACTIVE) goes LO
;    P.I.REQ-N  (FLAG-N) goes LO...FLAG is ON
   1         0                      01
   0
; STOP FFs bits start counting...
   1              1
   0
   1               1
   0
   1                1
; since STOP 2-N went HI, set (STOP SELECT) (i.e. 2 STOP BITS)
                     1
   0
   1
   0
;
; try the I/O SKIP
;
; turn on DEVICE ADDRESS bits
    111111
; toggle I/O SKP.STROBE  I/O SKP.-N pulses LO (active)
           10
           01
; turn off DEVICE ADDRESS bits
    000000
; toggle I/O SKP.STROBE- I/O SKP.-N stays HI (inactive)
           1
           0
; turn on DEVICE ADDRESS bits
    111111
; set I/O SKP. STROBE, I/O SKP.-N goes LO
           10
; clear the FLAG- pulse CLEAR FLAG 1, I/O SKP.-n goes HI
;    P.I.REQ-N (FLAG-N) goes HI...FLAG is OFF
            111
              0
; turn off I/O SKP. STROBE
           0
; turn off DEVICE ADDRESS bits
    000000
11000000001011001111110001110101010101X
;
;
; send a 0xFF
;
;
; set up to load ENABLE/0xFF (all ones)
                           111111111
; turn on DEVICE ADDRESS bits
    111111
; turn on LOAD BUFFER (normally IOP4)
;       LOAD BUFFER STROBE-N goes LO
;       (BIT 6)    goes HI
;       (ENABLE)   goes HI   (note: next CLOCK starts TX...)
;       (ENABLE-N) goes LO
               10     11 0
; (ENABLE) is HI, so set (CHARACTER LOADED) (normal 8 BIT TX)
                        1
; (ENABLE-N) is LO, so change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          0
; remove LOAD BUFFER (normally IOP4)
               01
; remove DEVICE ADDRESS
    000000
;
; shift out the 0x00 character
;
; on first 2 X BAUD CLOCK INPUT
;    ACTIVE is SET, causes LINE to CLEAR (i.e. START BIT).
;    
   1                                10
   0
; the 2nd 2 X BAUD CLOCK INPUT causes the STOP FFs to PRESET
   1              000
   0
; ORGINAL BIT 1 (AC11) goes to LINE
;       (BIT 6) shifts
;       (ENABLE) goes LO, (ENABLE-N) goes HI
   1                  10 1           1
; since (ENABLE) is LO, change (CHARACTER LOADED) (i.e. 8 not 5)
                        0
; since (ENABLE-N) is HI, change (DECODE INPUT 8) (normally connects to (ENABLE-N)
                          1
   0
   1
   0
; ORGINAL BIT 2 (AC10) goes to LINE
   1                  1              1
   0
   1
   0
; ORGINAL BIT 3 (AC9) goes to LINE
;       (BIT 6) becomes original ENABLE
   1                  1              1
   0
   1
   0
; ORGINAL BIT 4 (AC8) goes to LINE
;       (BIT 6) goes LO
   1                  0              1
   0
   1
   0
; ORGINAL BIT 5 (AC7) goes to LINE
;
   1                                 1
   0
   1
   0
; ORGINAL BIT 6 (AC6) goes to LINE
   1                                 1
   0
   1
   0
; ORGINAL BIT 7 (AC5) goes to LINE
   1                                 1
   0
   1
   0
; ORGINAL BIT 8 (AC4) goes to LINE
   1                                 1
   0
   1
   0
; ORGINAL (ENABLE) goes to LINE (STOP BITS)
;    (ACTIVE) goes LO
;    P.I.REQ-N  (FLAG-N) goes LO...FLAG is ON
   1         0                      01
   0
; STOP FFs bits start counting...
   1              1
   0
   1               1
   0
   1                1
; since STOP 2-N went HI, set (STOP SELECT) (i.e. 2 STOP BITS)
                     1
   0
   1
   0
;
; try the I/O SKIP
;
; turn on DEVICE ADDRESS bits
    111111
; toggle I/O SKP.STROBE  I/O SKP.-N pulses LO (active)
           10
           01
; turn off DEVICE ADDRESS bits
    000000
; toggle I/O SKP.STROBE- I/O SKP.-N stays HI (inactive)
           11
           01
; turn on DEVICE ADDRESS bits
    111111
; set I/O SKP. STROBE, I/O SKP.-N goes LO
           10
; clear the FLAG- pulse CLEAR FLAG 1, I/O SKP.-n goes HI
;    P.I.REQ-N (FLAG-N) goes HI...FLAG is OFF
            111
              0
; turn off I/O SKP. STROBE
           0
; turn off DEVICE ADDRESS bits
    000000
END
