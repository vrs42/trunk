  1. 1.  1                   /       CLEAR ALL OF MEMORY TO ZEROES
CLEAR.LS          DISC PAGE8 V-7B   1/13/94          PAGE    1



  1. 1.  2                   /
  1. 1.  3                           DSEC
  1. 1.  4                   /
  1. 1.  5      00000  0000          AS      0100,0
  1. 1.  6                   /
  1. 1.  7      00100  7000  MAIN    NOP
  1. 1.  8 @    00101  6776  CHAIN   DC      06776
  1. 1.  9 @    00102  7402          HLT
  1. 1. 10 @                 /
  1. 1. 11      00103  0000          AS      0200-*,0
  1. 1. 12                   /
  1. 1. 13                           END
