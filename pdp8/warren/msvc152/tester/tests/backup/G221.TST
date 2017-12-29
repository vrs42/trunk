G221 REV D SCHEMATIC    REV B PCB    MEMORY SELECTOR (3-7440)

NOTES   7440 outputs (active low) are not at connector (drive transistors)
           but can be 'clipped' at the 1.5K resistors that connect
           7440 outputs to PNP base (emitters are 3.2V)
        output 00 is at the top    (pin A is top)
        output 01 is next       
        output 10 is next
        output 11 is at the bottom (pin V is bottom)



Note:  "P" for PULLUP OUTPUTS on the open collector outputs;
       POWER SINK- is driven low.
       output reads 0.74volts (low) when active

TODO:  still need a way to test POWER SOURCE diodes, pull downs



PINS
 1 I AD2  ENABLE 1    (ENABLE 1 HI) AND (ENABLE 2 HI) -> enabled
 2 I AE2  ENABLE 2    (ENABLE 1 HI) AND (ENABLE 2 HI) -> enabled
 3 I AH2  A1  (HIGH BIT)
 4 I AF2  A0  (LOW  BIT)
 5 I AT2  POWER SOURCE+/SINK- INPUT (+ diodes to NPN C; - diodes to NPN Emitter)
 6 I AV2  POWER -30V (used as SINK) (always drive low)
 7 P AJ2  OUTPUT 00 NPN COLLECTOR (DIODE to SOURCE+)
 8 O AK2  OUTPUT 00 NPN EMITTER   (DIODE to SINK-)
 9 P AL2  OUTPUT 01 NPN COLLECTOR (DIODE to SOURCE+) 
10 O AM2  OUTPUT 01 NPN EMITTER   (DIODE to SINK-)
11 P AN2  OUTPUT 10 NPN COLLECTOR (DIODE to SOURCE+) 
12 O AP2  OUTPUT 10 NPN EMITTER   (DIODE to SINK-)
13 P AR2  OUTPUT 11 NPN COLLECTOR (DIODE to SOURCE+) 
14 O AS2  OUTPUT 11 NPN EMITTER   (DIODE to SINK-)

IIIIIIPOPOPOPO
; turn on OUTPUT 00
1100000X1X1X1X
; turn on OUTPUT 01
  01  1 0 1 1
; turn on OUTPUT 10
  10  1 1 0 1
; turn on OUTPUT 11
  11  1 1 1 0
; all ouputs off
1000  1 1 1 1
  01
  10
  11
0100
  01
  10
  11
0000
  01
  10
  11
END
