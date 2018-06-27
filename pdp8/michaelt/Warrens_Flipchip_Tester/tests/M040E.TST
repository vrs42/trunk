M040, PCB Rev E, Two 4-input AND Solenoid Driver
PNP Darlingtion Open Collector (to GND).
NO REAL TESTS, you must scope the outputs

To test outputs:

Disconnect:
   Tester to AB2  (-15V will kill tester I/O pin)
   Tester to AR2  (-15V will kill tester I/O pin)
   Tester to AS2  (-15V will kill tester I/O pin)
   Tester to AV2  (-15V will kill tester I/O pin)
Connect pulldowns:
   UUT AR2 to resistor to -15V.
   UUT AS2 to resistor to -15V.
Connect -15V: 
  UUT AB2             to -15V.
  UUT AV2             to -15V.

Single step and check output levels.


   O AR2 Q3-C   OUT_A    OUT_A = IN_A1 AND IN_A2 AND IN_A3 AND IN_A4 (ON -> conducts to GND).
   O AS2 Q6-C   OUT_A    OUT_A = IN_A1 AND IN_A2 AND IN_A3 AND IN_A4 (ON -> conducts to GND).
     AV2        CLAMP VOLTAGE (for clamping coil inductive kickback).


PINS
 1 I AD2 E1-9   IN_A1
 2 I AE2 E1-10	IN_A2
 3 I AF2 E1-12  IN_A3
 4 I AH2 E1-13  IN_A4
 5 I AJ2 E1-4   IN_A1
 6 I AK2 E1-2	IN_A2
 7 I AL2 E1-1   IN_A3
 8 I AM2 E1-5   IN_A4

IIIIIIII
00000000

0001
0011
0010
0110
0111
0101
0100
1100
1101
1111
1110
1010
1011
1001
1000
0000
    0001
    0011
    0010
    0110
    0111
    0101
    0100
    1100
    1101
    1111
    1110
    1010
    1011
    1001
    1000
    0000

00000000
1000
1100
1110
1111
    1000
    1100
    1110
    1111

11111111

1110
1010
1011
1001
1000
0000
0001
0011
0010
0110
0111
0101
0100
1100
1101
1111
    1110
    1010
    1011
    1001
    1000
    0000
    0001
    0011
    0010
    0110
    0111
    0101
    0100
    1100
    1101
    1111

11111111
0111
0011
0001
0000
    0111
    0011
    0001
    0000

00000000
END

