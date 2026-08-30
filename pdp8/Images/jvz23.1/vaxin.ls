

BUFR    0202
CCL     0000UNDF
CHAR1   0210
CHAR2   0211
CHR2    0000UNDF
CMI     6402OP
CMLD    6406OP
CMR     6407OP
CMT     6404OP
CSDA    6401OP
CSTR    6403OP
ICNT    0200
IPNT    0205
L1      0220
L2      0237
L3      0273
MASK    0317
NARG    0206
NBUF    0207
OUT1    0275
OUT2    0277
RDY     0312
STARG   0204
TRA     0302
TRNS    0301
TTYO    0311
VAXIN   0212EXT 

                /  VAXIN.SB    CHARACTER INPUT ROUTINE
                /       CALLED BY VAXCOM.FT
                /        R.A.E.    12-AUG-80
                /
                /  COMMUNICATOR I/O DEFINITIONS
                /
      6401      SKPDF   CSDA  6401      /DATA AVAILABLE
      6403      SKPDF   CSTR  6403      /TMTR READY
      6402      OPDEF   CMI   6402      /INITIALIZE
      6404      OPDEF   CMT   6404      /TRANSMIT
      6406      OPDEF   CMLD  6406      /AC->M730
      6407      OPDEF   CMR   6407      /RECEIVE
                /
                /  INTERACTIVE SUBROUTINE
                /
                        ENTRY VAXIN
                        DUMMY ICNT      /CHARACTER COUNT ADDRESS
                        DUMMY BUFR      /INPUT BUFFER ADDRESS
0200  0000      ICNT,   BLOCK 2
0201  0000   
0202  0000      BUFR,   BLOCK 2
0203  0000   
                /
0204  0200 01   STARG,  ICNT
0205  0000      IPNT,   0
0206  0000      NARG,   0
0207  0000      NBUF,   0
0210  0000      CHAR1,  0
0211  0000      CHAR2,  0
                /
0212  0000      VAXIN,  BLOCK 2
0213  0000   
0214  1204              TAD STARG
0215  3205              DCA IPNT
0216  1377              TAD(-4
0217  3206              DCA NARG
0220  4067      L1,     TAD I VAXIN     /FIND SUBROUTINE ARGUMENTS
0221  0212 01
0222  1407   
0223  6201 05           DCA I IPNT      /SAVE ADDRESS
0224  3605   
0225  2213              INC VAXIN#      /NEXT ADDRESS
0226  2205              INC IPNT        /NEXT SAVE ADDRESS
0227  2206              ISZ NARG        /LAST ADDRESS ?
0230  5220              JMP L1
                /
0231  7300              CLA CLL         /ZERO CHARACTER COUNT
0232  4067              DCA I ICNT
0233  0200 01
0234  3407   
                /
0235  1376              TAD (221        /SEND ^Q
0236  4301              JMS TRNS
                /
0237  6401      L2,     CSDA            /CHECK IF CHAR. RECEIVED
0240  5273              JMP L3
0241  6407              CMR             /READ CHAR.
0242  6402              CMI             /INIT. ASYCH.
0243  7040              CMA             /COMPLEMENT INPUT
0244  0317              AND MASK        /STRIP TO SIX BITS
0245  3211              DCA CHAR2       /SAVE CHAR
                /
0246  1375              TAD (-215       /CHECK FOR 'CR'
0247  7450              SNA
0250  5275              JMP OUT1
                /
    I                   CCL CLA
0251  1210              TAD CHAR1
0252  7440              SZA
0253  5774              JMP CHR2
0254  1211              TAD CHAR2       /GET CHAR.
0255  3210              DCA CHAR1       /SAVE LOW CHAR.
0256  5273              JMP L3
                /
0257  7006              RTL;RTL;RTL     /GET HIGH CHAR.
0260  7006   
0261  7006   
0262  1210              TAD CHAR1       /ADD LOW CHAR.
0263  4067              DCA I BUFR      /SAVE CHARS. IN BUFFER
0264  0202 01
0265  3407   
                /       INC BUFR#       /INC. BUFR. PNTR.
0266  4067              INC I ICNT      /INC. CHAR. COUNT
0267  0200 01
0270  2407   
    I                   CCL CLA         /ZERO FLAG
0271  3210              DCA CHAR1       /SAVE FLAG
0272  5277              JMP OUT2
                /
0273  6031      L3,     KSF             /CHECK FOR KEYB. INTERRUPT
0274  5237              JMP L2
                /
0275  1373      OUT1,   TAD (223        /SEND ^S TO STOP INPUT
0276  4301              JMS TRNS
0277  4040      OUT2,   RETRN VAXIN
0300  0001 06
                /
0301  0000      TRNS,   0               /TRANSMITTER OUT SUBROUTINE ENTRY
0302  6403      TRA,    CSTR            /SKIP ON TRNSMTR READY
0303  5302              JMP TRA
0304  6406              CMLD            /LOAD CHAR.
0305  6404              CMT             /TRANSMIT CHAR.
0306  7421              7421            /DISPLAY IN MQ
0307  6201 05           JMP I TRNS
0310  5701   
                /
0311  0000      TTYO,   0               /TTY OUT SUBROUTINE
0312  6041      RDY,    TSF
0313  5312              JMP RDY
0314  6046              TLS
0315  6201 05           JMP I TTYO
0316  5711   
                /
0317  0077      MASK,   77
0373  0223   
0375  7563   
0376  0221   
0377  7774   
                        END
