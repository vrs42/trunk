
/                                         PAL8-V12B 25-JAN-94 PAGE 1

             /
             /       DOS COMMAND
             /       EXECUTE ONE DOS COMMAND
             /
             /       AUTHOR: BILL HAYGOOD
             /               41832 ERNEST ROAD
             /               LOON LAKE, WA 99148-9607
             /               VOICE/FAX: 509-233-2555
             /
       6770  DOS=6770
       1000  LINE=1000
             /
       0020          *20
00020  0000  CHAR,   0
             /
00021  0000  KEY,    0
00022  6031          KSF
00023  5022          JMP     .-1
00024  6036          KRB
00025  3020          DCA     CHAR
00026  1020          TAD     CHAR
00027  5421          JMP I   KEY
             /
00030  0000  OUT,    0
00031  6041          TSF
00032  5031          JMP     .-1
00033  6046          TLS
00034  7200          CLA
00035  5430          JMP I   OUT
             /
00036  0000  RUBOUT, 0
00037  7200          CLA
00040  1177          TAD     [10
00041  4030          JMS     OUT
00042  1176          TAD     [40
00043  4030          JMS     OUT
00044  1177          TAD     [10
00045  4030          JMS     OUT
00046  5436          JMP I   RUBOUT
             /
00047  1000  PNTR,   LINE                    / POINTER TO TEXT LINE
             /
       0200          *200
00200  7410  MAIN,   SKP                     / ALLOW CHAINING
00201  5237          JMP     CHAIN
00202  6046          TLS
00203  4021  LOOP,   JMS     KEY             / GET A KEY INPUT
00204  1175          TAD     [-10            / BACKSPACE ?
00205  7640          SZA CLA                 / YES
00206  5223          JMP     MAIN2           / NO
00207  4036          JMS     RUBOUT          / REMOVE IT FROM SCREEN
00210  7240          STA
00211  1047          TAD     PNTR            / AND BACK UP THE POINTER
00212  3047          DCA     PNTR
00213  1047          TAD     PNTR

/                                         PAL8-V12B 25-JAN-94 PAGE 1-1

00214  7041          CIA
00215  1174          TAD     [LINE
00216  7700          SMA CLA
00217  5203          JMP     LOOP            / GET NEXT KEY
00220  1174          TAD     [LINE
00221  3047          DCA     PNTR            / RESET POINTER
00222  5203          JMP     LOOP            / GET NEXT KEY
             /
00223  1020  MAIN2,  TAD     CHAR            / GET THE KEY
00224  4030          JMS     OUT             / SHOW IT
00225  1020          TAD     CHAR            / STORE CHAR IN TEXT LINE
00226  0173          AND     [0177
00227  1172          TAD     [-15
00230  7650          SNA CLA                 / CARRIAGE RETURN ?
00231  5236          JMP     MAIN3           / YES
00232  1020          TAD     CHAR            / NO, STORE CHAR IN TEXT LINE
00233  3447          DCA I   PNTR
00234  2047          ISZ     PNTR
00235  5203          JMP     LOOP            / GET NEXT CHAR
             /
00236  3447  MAIN3,  DCA I   PNTR            / CLEAR LAST LOCATION OF TEXT LINE
             /
00237  1174  CHAIN,  TAD     [LINE
00240  6770          DOS                     / CALL DOS TO EXECUTE COMMAND LINE
00241  5571          JMP I   [7600           / RETURN TO OS/8
             /
                     $
00171  7600
00172  7763
00173  0177
00174  1000
00175  7770
00176  0040
00177  0010

/                                         PAL8-V12B 25-JAN-94 PAGE 2

CHAIN  0237      
CHAR   0020      
DOS    6770      
KEY    0021      
LINE   1000      
LOOP   0203      
MAIN   0200      
MAIN2  0223      
MAIN3  0236      
OUT    0030      
PNTR   0047      
RUBOUT 0036      



ERRORS DETECTED: 0
LINKS GENERATED: 0



