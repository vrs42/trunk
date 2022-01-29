
/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 1

             /       NEW SUPER RK05 ALIGNMENT PROGRAM ... ALIGNX ... R.L.MOORE
             /
             /                                               11/19/75
             /
             /       THANKS TO JOE LOMBARDI FOR TOGGLE-IN PROGRAMS
             /
             /       **************************************************************
             /
             /
             /
             /       SIMPLE TOGGLE IN PROGRAM        -       FOR DISK ALIGNMENT
             /
             /       20/     7201
             /               6742
             /               1051
             /               6744
             /               1050
             /               6746
             /               7604
             /               6743
             /               6741
             /               5230
             /               5220
             /       50/     0000
             /       51/     1000
             /
             /       CHANGE LOC. 50 TO 0002 FOR DRIVE 1; 0004 FOR DRIVE 2; 0006 FOR DRIVE 3
             /
             /
             /       SIMPLE TOGGLE IN        -       FOR OSCILLATING SEEKS
             /
             /       20/     7201
             /               7104
             /               6742
             /               1242
             /               6746
             /               7604
             /               6743
             /               6741
             /               5227
             /               2070
             /               5231
             /               1243
             /               6746
             /               7300
             /               6743
             /               6741
             /               5237
             /               5223
             /               3200
             /               3200
             /
             /
             /       CHANGE LOC'S 42 & 43 TO 3202,3204,ETC FOR OTHER DRIVES

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 2

             /               *** USEFUL PROGRAMMING INFO  ***
             /
             /
             /       SETUP OF 8E FRONT PANEL SWITCHES
             /
             /:  0  :  1  :  2  :  3  :  4  :  5  :  6  :  7  :  8  :  9  : 10 : 11 :
             /-----------------------------------------------------------------------
             /:     :     :     :     :     :     :     :     :     :     :    :    :
             /:           :SEEK :UPPER:>128 :                                       :
             /: DRIVE 0-3 :     :     :     :    ENTER TRACK TO SEEK OR ALIGN TO    :
             /:           :ALIGN:LOWER:<128 :                                       :
             /:     :     :     :     :     :     :     :     :     :     :    :    :
             /-----------------------------------------------------------------------
             /
             /
             /       RK8E COMMAND REGISTER CONTENTS
             /
             /:  0  :  1  :  2  :  3  :  4  :  5  :  6  :  7  :  8  :  9  : 10 : 11 :
             /----------------------------------------------------------------------
             /:     :     :     :     :     :     :     :     :     :     :    :    :
             /:                 : EN. : EN. : XFER:      EXTENDED   :          : EXT:
             /:  - FUNCTION -   : INT.: INT.: 128 : - MEMORY FIELD -: - DRIVE -:CYLN:
             /:                 : ON  : ON  : WORD:     ADDRESS     :          : BIT:
             /:  (SEE BELOW)    :DONE :SEEK :BLOCK:                 :          : IF :
             /:                 :FLAG :DONE :     :                 :          :>128:
             /:     :     :     :     :     :     :     :     :     :     :    :    :
             /-----------------------------------------------------------------------
             /
             /       FUNCTION BITS (0-2)
             /
             /       0 0 0   READ DATA
             /       0 0 1   READ ALL
             /       0 1 0   SET WRITE PROTECT BIT
             /       0 1 1   SEEK ONLY
             /       1 0 0   WRITE DATA
             /       1 0 1   WRITE ALL
             /       1 1 0   NOT USED
             /       1 1 1   NOT USED
             /
             /
             /       RK8E DISK ADDRESS REGISTER
             /
             /:  0  :  1  :  2  :  3  :  4  :  5  :  6  :  7  :  8  :  9  : 10 : 11 :
             /-----------------------------------------------------------------------
             /:     :     :     :     :     :     :     :     :     :     :    :    :
             /:                                         : SUR-:                     :
             /:       -   CYLINDER  (TRACK)    -        :FACE :     -  SECTOR  -    :
             /:     :     :     :     :     :     :     :     :     :     :    :    :
             /-----------------------------------------------------------------------
             /
             /       NOTE:
             /               MSB OF CYLINDER ADDR. IS BIT 11 OF CMD REGISTER
             /               THIS BIT IS SET IF ADDR. IS GREATER THAN CYL 128

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 3

                     / IOT & PARAMETER DEFINITIONS
       6741          DSKP=6741
       6742          DCLR=6742
       6743          DLAG=6743
       6744          DLCA=6744
       6745          DRST=6745
       6746          DLDC=6746
       6747          DMAN=6747
                     /
       0001          OS8=1                   /=1 IF OS-8 RESIDENT, 0 IF PAPER TAPE
                     /       
       4456          TYPE=JMS I A6BIT
       4457          WIPE=JMS I SCREN
       4460          DELAY=JMS I DEL
       4461          CHAR=JMS I ACHAR
       4462          RECAL=JMS I ARECAL
       4464          SEEK=JMS I ASEEK
       4463          ALIGN=JMS I AALIGN
       4451          MES1=JMS I MESG1
       4452          MES2=JMS I MESG2
       4453          MES3=JMS I MESG3
       4454          MES4=JMS I MESG4
       4455          MES5=JMS I MESG5
       4465          KBDMON=JMS I MON
       4466          BEEP=JMS I ABEEP
       4450          SWITCH=JMS I SW
       4467          TIME=JMS I TIMOUT
                     /
                     /
       0000          FIELD 0
       0050          *50
                     /
00050  0400  SW,     SETUP
00051  1200  MESG1,  MESS1
00052  1400  MESG2,  MESS2
00053  1600  MESG3,  MESS3
00054  2000  MESG4,  MESS4
00055  2200  MESG5,  MESS5
00056  2400  A6BIT,  SIXBIT
00057  1000  SCREN,  SCREEN
00060  1013  DEL,    DELAY4
00061  2435  ACHAR,  TTYOUT
00062  0220  ARECAL, RECAL1
00063  0600  AALIGN, ALIGN1
00064  0616  ASEEK,  SEEK1
00065  0231  MON,    KBFLAG
00066  1024  ABEEP,  BEEP1
00067  1033  TIMOUT, XTIME
             /
             /
             /
00070  0000  DRIVE,  0000
00071  0000  CMD,    0000
00072  4000  CURADD, 4000
00073  0000  SWREG,  0000

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 3-1

00074  0000  TRACK,  0000
00075  0000  NEW,    0000
00076  0000  OLD,    0000
00077  0000  EXT,    0000

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 4

                     / CONTROL PROGRAM
                     /
       0200          *0200
00200  7410  START,  SKP
00201  5211          JMP NOMESS
00202  7300          CLA CLL
00203  4457          WIPE
00204  4451          MES1
00205  4452          MES2
00206  4453          MES3
00207  4454          MES4
00210  4455          MES5
00211  7402  NOMESS, HLT
00212  4462          RECAL
00213  4465  LOOP,   IFNZRO OS8<KBDMON>              /ASSEMBLE ONLY IF AN OS-8 SYS
00214  4450          SWITCH
00215  4464          SEEK
00216  4463          ALIGN
00217  5213          JMP LOOP
                     /
                     /
                     /
                     / SUBROUTINE TO RECALIBRATE DRIVE
                     /
00220  0000  RECAL1, 0                               /RECAL AT STARTUP TIME
00221  4467          TIME
00222  1070          TAD Z DRIVE
00223  6746          DLDC                            /LOAD COMMAND REG
00224  7326          CLA CLL CML RTL                 /AC=0002
00225  6742          DCLR                            /RECALIBRATE
00226  6741          DSKP
00227  5226          JMP .-1
00230  5620          JMP I RECAL1                    /EXIT THIS SUB
                     /       
                     /
                     /
                     / SUBROTINE TO MONITOR KEYBOARD FOR ^C
                     /
00231  0000  KBFLAG, 0
00232  6031          KSF                             /IS A FLAG ??
00233  5631          JMP I KBFLAG                    /NO...SPLIT
00234  6036          KRB                             /YES...READ BUFFER
00235  1377          TAD (-203)                      /TEST FOR ^C
00236  7640          SZA CLA                         /IT IS ...
00237  5631          JMP I KBFLAG                    /NOT !
00240  5776          JMP I (07600)                   /EXIT TO OS-8
                     /
00376  7600
00377  7575
       0400  PAGE

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 5

                     /
                     /
                     /       SETUP CALLING SEQUENCE
                     /
                     /       JMS SETUP
                     /       SEEK
                     /       ALIGN
                     /
                     /
             /
             /
             /
00400  0000  SETUP,  0000                    /SETUP DISK INFO FROM SW. REG.
00401  7300          CLA CLL
00402  3073          DCA SWREG
00403  3070          DCA DRIVE
00404  3074          DCA TRACK               /CLEAR OUT A LOT OF LOCATIONS
00405  3071          DCA CMD
00406  3075          DCA NEW
             /
             /
             /
             /       ********************************************************
             /
             /       DECIDE IF THE SW. REG. HAS BEEN CHANGED SINCE LAST TIME
             /
             /       ********************************************************
             /
             /
00407  7604          LAS
00410  3073          DCA SWREG               /SAVE SR VALUE
00411  1073          TAD SWREG
00412  0377          AND (7000
00413  7012          RTR;RTR;RTR
00414  7012
00415  7012
00416  3075          DCA NEW
00417  1075          TAD NEW
00420  7041          CIA                     /COMPLIMENT & INCR.
00421  1076          TAD OLD                 /COMPARE WITH OLD SR
00422  7640          SZA CLA
00423  4462          RECAL
00424  7300          CLA CLL
00425  1075          TAD NEW
00426  3076          DCA OLD
             /

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 5-1

             EJECT
             /
             /       **************************
             /       
             /       MAKE UP COMMAND REGISTER
             /
             /       **************************
             /
             /
00427  7300          CLA CLL
00430  1073          TAD SWREG
00431  0376          AND (0200)              /MASK FOR >128 BIT
00432  7006          RTL;RTL;RTL             /GET INTO BIT 11 (PASSES THRU LINK)
00433  7006
00434  7006
00435  3077          DCA EXT                 /SAVE THE EXT SEEK BIT
00436  7300          CLA CLL
00437  1073          TAD SWREG
00440  0375          AND (6000)              /MASK BITS 0-1    (DRIVE #)
00441  7006          RTL;RTL                 /GET INTO BITS 9-10
00442  7006
00443  3070          DCA DRIVE
00444  7300          CLA CLL
00445  1073          TAD SWREG
00446  0374          AND (1000)              /MASK FOR SEEK OR ALIGN BIT
00447  7640          SZA CLA                 /SKIP IF ALIGN (SEEK BIT DID NOT "AND" THRU)
00450  1373          TAD (3200)              /SEEK ONLY CMD WORD
00451  1077          TAD EXT                 /ADD THE EXT BIT
00452  3071          DCA CMD                 /TO SAVE AS COMMAND REGISTER WORD

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 6

             /
             /
             /       **************************
             /
             /       MAKE UP THE TRACK WORD
             /
             /       **************************
             /
             /
00453  7300          CLA CLL
00454  1073          TAD SWREG
00455  0372          AND (0400)              /MASK FOR THE UPPER-LOWER HEAD BIT
00456  7012          RTR;RTR                 /GET INTO BIT 7
00457  7012
00460  3074          DCA TRACK
00461  7300          CLA CLL
00462  1073          TAD SWREG
00463  0371          AND (0177)              /MASK TRACK INFO BITS 5-11
00464  7006          RTL;RTL;RAL             /GET INTO BITS 0-6
00465  7006
00466  7004
00467  1074          TAD TRACK               /ADD HEAD BIT (STORED IN TRACK)
00470  3074          DCA TRACK               /SAVE THE ENTIRE TRACK WORD
00471  7300          CLA CLL
00472  1073          TAD SWREG
00473  0374          AND (1000)              /GET BACK THE SEEK - ALIGN BIT
00474  7650          SNA CLA
00475  2200          ISZ SETUP               /BUMP RETURN POINTER FOR ALIGN
00476  7300          CLA CLL
00477  5600          JMP I SETUP             /EXIT
00571  0177
00572  0400
00573  3200
00574  1000
00575  6000
00576  0200
00577  7000
       0600  PAGE

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 7

                     /
             /
             /
             /       *****************************************************************
             /
             /       THIS SUBROUTINE DOES A SEEK TO THE ADDRESS LOADED INTO THE SW REG.,
             /       THEN READS THE DATA AT THAT CYLINDER ADDRESS INTO THE DUMP AREA
             /       IN CORE .... HEADS ARE ALIGNED DURING THIS SUB ....
             /
             /       ******************************************************************
             /
             /
             /
             /
             /
             /
             /
             /
00600  0000  ALIGN1, 0
00601  7201          CLA IAC                         /SET AC=1
00602  6742          DCLR
00603  1072          TAD Z CURADD
00604  6744          DLCA                            /LOAD CURRENT ADDRESS
00605  1070          TAD Z DRIVE                     /GET DRIVE NUMBER FROM PG 0
00606  1071          TAD Z CMD                       /GET COMMAND WORD
00607  6746          DLDC                            /LOAD COMMAND REG.
00610  1074          TAD TRACK
00611  6743          DLAG                            /LOAD ADDR & GO
00612  6741          DSKP                            /WAIT FOR HEAD
00613  5212          JMP .-1                         /TO GET THERE
00614  7300          CLA CLL
00615  5600          JMP I ALIGN1                    /EXIT THIS SUB
                     /
                     /

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 8

                     /SUBROUTINE TO DO OSCILLATING SEEKS
                     /
                     /
00616  0000  SEEK1,  0                               /OSC. SEEK SUBROUTINE
00617  7300          CLA CLL
00620  1070          TAD DRIVE                       /GET DRIVE NUMBER
00621  1071          TAD CMD                         /GET CMD WORD
00622  6746          DLDC                            /LOAD COMMAND REGISTER
00623  1074          TAD TRACK
00624  6743          DLAG                            /LOAD ADDR & GO
00625  6741          DSKP                            /WAIT...
00626  5225          JMP .-1                         /FOR FLAG
00627  2246          ISZ WAIT1
00630  5227          JMP .-1
00631  1070          TAD DRIVE
00632  1071          TAD CMD
00633  0377          AND (7776)                      /GET RID OF EXT BIT FOR CYL 0
00634  6746          DLDC
00635  7300          CLA CLL 
00636  6743          DLAG                            /LOADS FOR CYLINDER 0
00637  6741          DSKP
00640  5237          JMP .-1
00641  2246          ISZ WAIT1
00642  5241          JMP .-1
00643  2216          ISZ SEEK1
00644  7300          CLL CLA
00645  5616          JMP I SEEK1
                     /
00646  0000  WAIT1,  0
                     /
                     /
00777  7776
       1000  PAGE

/       NEW SUPER RK05 ALIGNMENT PROGRAM  PAL8-V10D NO DATE   PAGE 9

                     EJECT UTILITY PROGRAMS
             /
             /
             /       *******************************************************************
             /
             /       THIS SUBROUTINE CLEARS THE VT05 SCREEN PRIOR TO PRINTING OUT A 
             /       A MESSAGE...ALL CHARS ARE NON-PRINTABLE ON TTY OR LA30 ...
             /
             /       ******************************************************************
                     /
01000  0000  SCREEN, 0
01001  7300          CLA CLL
01002  1377          TAD (035)
01003  4461          CHAR
01004  4460          DELAY
01005  7300          CLA CLL
01006  1376          TAD (037)
01007  4461          CHAR
01010  4460          DELAY
01011  7300          CLA CLL
01012  5600          JMP I SCREEN
             /
             /
             /       ********************************************************************
             /
             /       SUBROUTINE TO OUTPUT 4 NULL CHARACTERS TO VT05 FOR 2400 BUAD FIX
             /
             /       *********************************************************************
                     /
01013  0000  DELAY4, 0
01014  1375          TAD (-0004)                     /OUTPUTS 4 NULL CHARACTERS
01015  3223          DCA KDLAY                       /FOR OS-8 2400 BUAD RATE
01016  7300          CLA CLL                         /PROBLEM
01017  4461          CHAR
01020  2223          ISZ KDLAY
01021  5216          JMP .-3
01022  5613          JMP I DELAY4
01023  0000  KDLAY,  0                               /GETS SET TO 7774
                     /
                     /
01024  0000  BEEP1,  0
01025  7300          CLA CLL
01026  1374          TAD (0007)
01027  4461          CHAR
01030  4460          DELAY
01031  7300          CLA CLL
01032  5624          JMP I BEEP1
                     /
01033  0000  XTIME,  0
01034  1373          TAD (7700)
01035  3244          DCA SETTL2
01036  2243          ISZ SETTLE
01037  5236          JMP .-1
01040  2244          ISZ SETTL2
01041  5236          JMP .-3

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 9-2

01042  5633          JMP I XTIME
                     /
01043  0000  SETTLE, 0
01044  0000  SETTL2, 0
                     /
01173  7700
01174  0007
01175  7774
01176  0037
01177  0035
       1200  PAGE

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10

             /       OUTPUT MESSAGES TO SCREEN
             /
01200  0000  MESS1,  0
01201  4456          TYPE
01202  4040          TEXT"                         ***  RK05   ALIGNX  ***                RLM '75"
01203  4040
01204  4040
01205  4040
01206  4040
01207  4040
01210  4040
01211  4040
01212  4040
01213  4040
01214  4040
01215  4040
01216  4052
01217  5252
01220  4040
01221  2213
01222  6065
01223  4040
01224  4001
01225  1411
01226  0716
01227  3040
01230  4052
01231  5252
01232  4040
01233  4040
01234  4040
01235  4040
01236  4040
01237  4040
01240  4040
01241  4040
01242  2214
01243  1540
01244  4767
01245  6500
01246  4460          DELAY
01247  1377          TAD (212)
01250  4461          CHAR
01251  4460          DELAY
01252  1377          TAD (212)
01253  4461          CHAR
01254  4460          DELAY
01255  4456          TYPE
01256  7240          TEXT":  0  :  1  :  2  :  3  :  4  :  5  :  6  :  7  :  8  :  9  : 10 : 11 :"
01257  4060
01260  4040
01261  7240
01262  4061
01263  4040
01264  7240

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-1

01265  4062
01266  4040
01267  7240
01270  4063
01271  4040
01272  7240
01273  4064
01274  4040
01275  7240
01276  4065
01277  4040
01300  7240
01301  4066
01302  4040
01303  7240
01304  4067
01305  4040
01306  7240
01307  4070
01310  4040
01311  7240
01312  4071
01313  4040
01314  7240
01315  6160
01316  4072
01317  4061
01320  6140
01321  7200
01322  4460          DELAY
01323  4456          TYPE
01324  7255          TEXT":---------------------------------------------------------------------:"
01325  5555
01326  5555
01327  5555
01330  5555
01331  5555
01332  5555
01333  5555
01334  5555
01335  5555
01336  5555
01337  5555
01340  5555
01341  5555
01342  5555
01343  5555
01344  5555
01345  5555
01346  5555
01347  5555
01350  5555
01351  5555
01352  5555
01353  5555

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-2

01354  5555
01355  5555
01356  5555
01357  5555
01360  5555
01361  5555
01362  5555
01363  5555
01364  5555
01365  5555
01366  5555
01367  7200
01370  4460          DELAY
01371  5600          JMP I MESS1
01377  0212
       1400          PAGE
01400  0000  MESS2,  0
01401  4456          TYPE
01402  7240          TEXT":     :     :     :     :     :     :     :     :     :     :    :    :"
01403  4040
01404  4040
01405  7240
01406  4040
01407  4040
01410  7240
01411  4040
01412  4040
01413  7240
01414  4040
01415  4040
01416  7240
01417  4040
01420  4040
01421  7240
01422  4040
01423  4040
01424  7240
01425  4040
01426  4040
01427  7240
01430  4040
01431  4040
01432  7240
01433  4040
01434  4040
01435  7240
01436  4040
01437  4040
01440  7240
01441  4040
01442  4072
01443  4040
01444  4040
01445  7200
01446  4460          DELAY

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-3

01447  4456          TYPE
01450  7240          TEXT":           :SEEK :UPPER:>128 :                                       :"
01451  4040
01452  4040
01453  4040
01454  4040
01455  4040
01456  7223
01457  0505
01460  1340
01461  7225
01462  2020
01463  0522
01464  7276
01465  6162
01466  7040
01467  7240
01470  4040
01471  4040
01472  4040
01473  4040
01474  4040
01475  4040
01476  4040
01477  4040
01500  4040
01501  4040
01502  4040
01503  4040
01504  4040
01505  4040
01506  4040
01507  4040
01510  4040
01511  4040
01512  4040
01513  7200
01514  4460          DELAY
01515  4456          TYPE
01516  7240          TEXT": DRIVE 0-3 :     :     :     :    ENTER TRACK TO SEEK OR ALIGN TO    :"
01517  0422
01520  1126
01521  0540
01522  6055
01523  6340
01524  7240
01525  4040
01526  4040
01527  7240
01530  4040
01531  4040
01532  7240
01533  4040
01534  4040
01535  7240

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-4

01536  4040
01537  4005
01540  1624
01541  0522
01542  4024
01543  2201
01544  0313
01545  4024
01546  1740
01547  2305
01550  0513
01551  4017
01552  2240
01553  0114
01554  1107
01555  1640
01556  2417
01557  4040
01560  4040
01561  7200
01562  4460          DELAY
01563  5600          JMP I MESS2
       1600          PAGE
01600  0000  MESS3,  0
01601  4456          TYPE
01602  7240          TEXT":           :ALIGN:LOWER:<128 :                                       :"
01603  4040
01604  4040
01605  4040
01606  4040
01607  4040
01610  7201
01611  1411
01612  0716
01613  7214
01614  1727
01615  0522
01616  7274
01617  6162
01620  7040
01621  7240
01622  4040
01623  4040
01624  4040
01625  4040
01626  4040
01627  4040
01630  4040
01631  4040
01632  4040
01633  4040
01634  4040
01635  4040
01636  4040
01637  4040

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-5

01640  4040
01641  4040
01642  4040
01643  4040
01644  4040
01645  7200
01646  4460          DELAY
01647  4456          TYPE
01650  7240          TEXT":     :     :     :     :     :     :     :     :     :     :    :    :"
01651  4040
01652  4040
01653  7240
01654  4040
01655  4040
01656  7240
01657  4040
01660  4040
01661  7240
01662  4040
01663  4040
01664  7240
01665  4040
01666  4040
01667  7240
01670  4040
01671  4040
01672  7240
01673  4040
01674  4040
01675  7240
01676  4040
01677  4040
01700  7240
01701  4040
01702  4040
01703  7240
01704  4040
01705  4040
01706  7240
01707  4040
01710  4072
01711  4040
01712  4040
01713  7200
01714  4460          DELAY
01715  5600          JMP I MESS3
       2000          PAGE
02000  0000  MESS4,  0
02001  4456          TYPE
02002  7255          TEXT":---------------------------------------------------------------------:"
02003  5555
02004  5555
02005  5555
02006  5555
02007  5555

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-6

02010  5555
02011  5555
02012  5555
02013  5555
02014  5555
02015  5555
02016  5555
02017  5555
02020  5555
02021  5555
02022  5555
02023  5555
02024  5555
02025  5555
02026  5555
02027  5555
02030  5555
02031  5555
02032  5555
02033  5555
02034  5555
02035  5555
02036  5555
02037  5555
02040  5555
02041  5555
02042  5555
02043  5555
02044  5555
02045  7200
02046  4460          DELAY
02047  4456          TYPE
02050  4040          TEXT"                          8E FRONT PANEL SWITCHES"
02051  4040
02052  4040
02053  4040
02054  4040
02055  4040
02056  4040
02057  4040
02060  4040
02061  4040
02062  4040
02063  4040
02064  4040
02065  7005
02066  4006
02067  2217
02070  1624
02071  4020
02072  0116
02073  0514
02074  4023
02075  2711
02076  2403

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-7

02077  1005
02100  2300
02101  4460          DELAY
02102  5600          JMP I MESS4
       2200          PAGE
02200  0000  MESS5,  0
02201  1377          TAD (212)
02202  4461          CHAR
02203  4460          DELAY
02204  1377          TAD (212)
02205  4461          CHAR
02206  4460          DELAY
02207  1377          TAD (212)
02210  4461          CHAR
02211  4460          DELAY
02212  1377          TAD (212)
02213  4461          CHAR
02214  4460          DELAY
02215  1377          TAD (212)
02216  4461          CHAR
02217  4460          DELAY
02220  4456          TYPE
02221  2022          TEXT"PRESS  'CONT'  TO START ALIGNMENT                    ^C  RETURNS TO OS-8"
02222  0523
02223  2340
02224  4047
02225  0317
02226  1624
02227  4740
02230  4024
02231  1740
02232  2324
02233  0122
02234  2440
02235  0114
02236  1107
02237  1615
02240  0516
02241  2440
02242  4040
02243  4040
02244  4040
02245  4040
02246  4040
02247  4040
02250  4040
02251  4040
02252  4040
02253  4036
02254  0340
02255  4022
02256  0524
02257  2522
02260  1623
02261  4024

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 10-8

02262  1740
02263  1723
02264  5570
02265  0000
02266  4460          DELAY
02267  5600          JMP I MESS5

UTILITY PROGRAMS                          PAL8-V10D NO DATE   PAGE 11

                     EJECT        SIXBIT TEXT RECOVERY  SUBROUTINE
                     /
                     / SUBROUTINE SIXBIT
                     /
                     /*** SIXBIT ***
                     /TEXT RECOVERY SUBROUTINE
02377  0212
       2400          PAGE
02400  0000  SIXBIT, 0
02401  1600          TAD I SIXBIT                    /POINTER TO TEXT
02402  7012          RTR;RTR;RTR                     /GET 1ST HALF OF WORD
02403  7012
02404  7012
02405  4212          JMS TYPIT                       /PROCESS CHARACTER FOR OUTPUT
02406  1600          TAD I SIXBIT                    /GET CHAR. AGAIN....
02407  4212          JMS TYPIT                       /THIS TIME LAST HALF
02410  2200          ISZ SIXBIT                      /UP THE POINTER
02411  5201          JMP SIXBIT+1                    /NEXT WORD
02412  0000  TYPIT,  0                               /CHARACTER PROCESSING
02413  0377          AND (77)                        /MASK FOR A SINGLE 6 BIT CHAR.
02414  7450          SNA                             /TEST FOR 0000
02415  5227          JMP CRLF                        /LAST CHAR....BEAT IT !!
02416  3243          DCA TEMP                        /TEMPORARY CHAR. STORAGE
02417  1243          TAD TEMP                        /RESTORE IT
02420  0376          AND (40)                        /TEST RANGE FOR BIT 6
02421  7650          SNA CLA                         /NUMERIC OR ALPHA DATA ??
02422  1375          TAD (100)                       /ADD 100 FOR ALPHA DATA
02423  1374          TAD (200)                       /ADD 200 FOR ALL DATA
02424  1243          TAD TEMP                        /ADD CHAR. ASCII VALUE
02425  4235          JMS TTYOUT                      /EXIT TO TTY ROUTINE
02426  5612          JMP I TYPIT                     /EXIT THIS SUB
02427  7300  CRLF,   CLA CLL                         /CRLF ROUTINE
02430  1373          TAD (215)                       /ASCII FOR CR
02431  4235          JMS TTYOUT                      /DO IT
02432  1372          TAD (212)                       /ASCII FOR LF
02433  4235          JMS TTYOUT                      /DO IT
02434  5600          JMP I SIXBIT                    /DONE...BYE !!
02435  0000  TTYOUT, 0                               /TTY OUTPUT SUB
02436  6046          TLS
02437  6041          TSF
02440  5237          JMP .-1
02441  7300          CLA CLL
02442  5635          JMP I TTYOUT                    /EXIT THIS SUB
02443  0000  TEMP,   0                               /TEMPORARY CHAR STORAGE
02572  0212
02573  0215
02574  0200
02575  0100
02576  0040
02577  0077
             $$$$

SIXBIT TEXT RECOVERY  SUBROUTINE          PAL8-V10D NO DATE   PAGE 12

AALIGN 0063      SEEK1  0616      
ABEEP  0066      SETTLE 1043      
ACHAR  0061      SETTL2 1044      
ALIGN  4463      SETUP  0400      
ALIGN1 0600      SIXBIT 2400      
ARECAL 0062      START  0200      
ASEEK  0064      SW     0050      
A6BIT  0056      SWITCH 4450      
BEEP   4466      SWREG  0073      
BEEP1  1024      TEMP   2443      
CHAR   4461      TIME   4467      
CMD    0071      TIMOUT 0067      
CRLF   2427      TRACK  0074      
CURADD 0072      TTYOUT 2435      
DCLR   6742      TYPE   4456      
DEL    0060      TYPIT  2412      
DELAY  4460      WAIT1  0646      
DELAY4 1013      WIPE   4457      
DLAG   6743      XTIME  1033      
DLCA   6744      
DLDC   6746      
DMAN   6747      
DRIVE  0070      
DRST   6745      
DSKP   6741      
EXT    0077      
KBDMON 4465      
KBFLAG 0231      
KDLAY  1023      
LOOP   0213      
MESG1  0051      
MESG2  0052      
MESG3  0053      
MESG4  0054      
MESG5  0055      
MESS1  1200      
MESS2  1400      
MESS3  1600      
MESS4  2000      
MESS5  2200      
MES1   4451      
MES2   4452      
MES3   4453      
MES4   4454      
MES5   4455      
MON    0065      
NEW    0075      
NOMESS 0211      
OLD    0076      
OS8    0001      
RECAL  4462      
RECAL1 0220      
SCREEN 1000      
SCREN  0057      
SEEK   4464      



ERRORS DETECTED: 0
LINKS GENERATED: 0



