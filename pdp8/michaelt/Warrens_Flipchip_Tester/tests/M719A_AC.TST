M719, PCB REV A, KW12 CLOCK INPUT SYNCHRONIZER
;Last modified on 5/29/19 by MGT

****************EXTREMELY LIMITED, ONLY CHECKS THE TWO AC INPUTS.

*************** USE DMM AND SINGLE STEP.

PINS
1 I AJ1 E8-2+++        IOT LOAD CONTROL 2H
2 I AH2 E5-9           AC(N-1) INPUT (E5-8 inverted output)
3 I AK1 E8-1,E8-9      AC(N)   INPUT (E8-3 inverted output when AJ1 E8-2 is HI) 

III

;    E5-8 HI      E8-3 HI          
100
;                 E8-3 LO
 01
;    E5-8 LO
 11
;                 E8-3 HI
 10

END
