
/                                         PAL8-V12B 25-JAN-94 PAGE 1

             /
             /       CALL THE OS SHELL
             /
       6770  SHELL=6770
00200  7200  MAIN,   CLA
00201  7200  CHAIN,  CLA                     / ALLOW CHAINING
00202  6770          SHELL                   / RETURNING AC = ERROR CODE, IF ANY
00203  5577          JMP I   [7600           / RETURN TO OS/8
             /
                     $
00177  7600

/                                         PAL8-V12B 25-JAN-94 PAGE 2

CHAIN  0201      
MAIN   0200      
SHELL  6770      



ERRORS DETECTED: 0
LINKS GENERATED: 0



