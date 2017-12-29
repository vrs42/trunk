M044   PCB Rev B Schematic Rev B   	Four 2-input AND 100ma Solenoid Driver
					PNP Open Collector (to GND).
NO REAL TESTS, you must scope the outputs

To test outputs:

Disconnect:
   Tester to AB2  (-15V will kill tester I/O pin)
   Tester to AR2  (-15V will kill tester I/O pin)
   Tester to AS2  (-15V will kill tester I/O pin)
   Tester to AT2  (-15V will kill tester I/O pin)
   Tester to AU2  (-15V will kill tester I/O pin)
   Tester to AV2  (-15V will kill tester I/O pin)
Connect pulldowns:
   UUT AR2 to resistor to -15V.
   UUT AS2 to resistor to -15V.
   UUT AT2 to resistor to -15V.
   UUT AU2 to resistor to -15V.
Connect -15V: 
  UUT AB2             to -15V.
  UUT AV2             to -15V.

Single step and check output levels.

   O AR2 Q5-C   OUT_A    OUT_A = IN_A1 AND IN_A2 (ON -> conducts to GND).
   O AS2 Q6-C   OUT_B    OUT_B = IN_B1 AND IN_B2 (ON -> conducts to GND).
   O AT2 Q7-C   OUT_C    OUT_C = IN_C1 AND IN_C2 (ON -> conducts to GND).
   O AU2 Q8-C   OUT_D    OUT_D = IN_D1 AND IN_D2 (ON -> conducts to GND).
     AV2        CLAMP VOLTAGE (for clamping coil inductive kickback).


PINS
 1 I AN2 E1-3   IN_A1
 2 I AP2 E1-2	IN_A2
 3 I AJ2 E1-3   IN_B1
 4 I AK2 E1-2	IN_B2
 5 I AF2 E1-3   IN_C1
 6 I AH2 E1-2	IN_C2
 7 I AD2 E1-3   IN_D1
 8 I AE2 E1-2	IN_D2

IIIIIIII
00000000

01
11
10
00
  01
  11
  10
  00
    01
    11
    10
    00
      01
      11
      10
      00
      
00000000
10
11
  10
  11
    10
    11
      10
      11

11111111

10
00
01
11
  10
  00
  01
  11
    10
    00
    01
    11
      10
      00
      01
      11

11111111
01
00
  01
  00
    01
    00
      01
      00
00000000
END

