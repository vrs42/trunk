
/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 1

             /16     BOOT    -       OS/8 V3D        
             /
             /
             /
             /
             /
             /
             /
             /
             /
             /COPYRIGHT  (C)  1974,1975,1977 BY DIGITAL EQUIPMENT CORPORATION
             /
             /
             /
             /
             /
             /
             /
             /
             /
             /
             /THE INFORMATION IN THIS DOCUMENT IS SUBJECT TO CHANGE WITHOUT NOTICE
             /AND SHOULD NOT BE CONSTRUED AS A COMMITMENT BY DIGITAL EQUIPMENT
             /CORPORATION.  DIGITAL EQUIPMENT CORPORATION ASSUMES NO RESPONSIBILITY
             /FOR ANY ERRORS THAT MAY APPEAR IN THIS DOCUMENT.
             /
             /THE SOFTWARE DESCRIBED IN THIS DOCUMENT IS FURNISHED TO THE PURCHASER
             /UNDER A LICENSE FOR USE ON A SINGLE COMPUTER SYSTEM AND CAN BE COPIED
             /(WITH INCLUSION OF DIGITAL'S COPYRIGHT NOTICE) ONLY FOR USE IN SUCH
             /SYSTEM, EXCEPT AS MAY OTHERWISE BE PROVIDED IN WRITING BY DIGITAL.
             /
             /DIGITAL EQUIPMENT CORPORATION ASSUMES NO RESPONSIBILITY FOR THE USE
             /OR RELIABILITY OF ITS SOFTWARE ON EQUIPMENT THAT IS NOT SUPPLIED BY
             /DIGITAL.
             /
             /
             /
             /
             /
             /
             /
             /
             /
             /

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 2

                     /SR

             /FIXES MADE FOR MAINTENANCE RELEASE:

             /1.     ADDED RX01 (FLOPPY BOOTSTRAP)
             /2.     LEFT PATCH SPACE IN NAME TABLE

       0014          PTR=14
       0015          OLDLOC=15
       0016          NEWLOC=16
       0027          CDOIO=27
       0017          SCAN=17

       0001          *1
00001  7402          HLT
00002  5577          JMP I (7600
       0100          *100

00100  0000  INNER,  0
00101  7760  OUTR,   -20
00102  0000  CODE,   0
00103  0000  LENGTH, 0

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 3

       0200          *200

00200  7200  START,  CLA             /ALLOW BEING CHAINED TO
00201  1777          TAD I (7600
00202  7710          SPA CLA
00203  5311          JMP OS8IN
00204  2100          ISZ INNER
00205  5204          JMP .-1
00206  2101          ISZ OUTR
00207  5204          JMP .-3
00210  4776          JMS I (TESTRK
00211  1775  COSIN,  TAD I (7776
00212  7041  COMN,   CIA
00213  3102          DCA CODE
00214  1374          TAD (TABLE-1
00215  3014          DCA PTR
00216  1414  LOOP,   TAD I PTR
00217  7450          SNA
00220  5256          JMP OS8
00221  1102          TAD CODE
00222  7640          SZA CLA
00223  5252          JMP NXT
00224  6002          IOF
00225  7240          STA
00226  1414          TAD I PTR
00227  3015          DCA OLDLOC
00230  7240          STA
00231  1414          TAD I PTR
00232  3016          DCA NEWLOC
00233  1414          TAD I PTR
00234  7041          CIA
00235  3103          DCA LENGTH
00236  1415          TAD I OLDLOC
00237  3416          DCA I NEWLOC
00240  2103          ISZ LENGTH
00241  5236          JMP .-3
00242  1414          TAD I PTR
00243  3352          DCA TEMP
00244  1251          TAD HLTSWT
00245  7650          SNA CLA
00246  7402          HLT
00247  7100          CLL
00250  5752          JMP I TEMP
00251  0001  HLTSWT, 1

00252  1014  NXT,    TAD PTR
00253  1373          TAD (4
00254  3014          DCA PTR
00255  5216          JMP LOOP

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 4

00256  1372  OS8,    TAD ("N
00257  4771          JMS I (PUT
00260  1370          TAD ("O
00261  4771          JMS I (PUT
00262  7201          CLA IAC
00263  3251          DCA HLTSWT
00264  4767  RETRY,  JMS I (CRLF
00265  1366          TAD ("/
00266  4771          JMS I (PUT
00267  4765          JMS I (GET
00270  7410          SKP
00271  5264          JMP RETRY
00272  7106          CLL RTL
00273  7006          RTL
00274  7006          RTL
00275  3352          DCA TEMP
00276  4765          JMS I (GET
00277  7410          SKP
00300  5264          JMP RETRY
00301  1352          TAD TEMP
00302  3352          DCA TEMP
00303  4765          JMS I (GET
00304  5303          JMP .-1
00305  7200          CLA
00306  4767          JMS I (CRLF
00307  1352          TAD TEMP
00310  5212          JMP COMN

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 5

00311  1777  OS8IN,  TAD I (7600
00312  1364          TAD (-4207
00313  7640          SZA CLA
00314  5264          JMP RETRY
00315  1763          TAD I (1000
00316  1362          TAD (777
00317  7650          SNA CLA
00320  1361          TAD (600
00321  1362          TAD (1000-1
00322  3017          DCA SCAN
00323  1417  SKAN,   TAD I SCAN
00324  7450          SNA
00325  5264          JMP RETRY
00326  0360          AND (177
00327  1357          TAD (-"/!7600
00330  7640          SZA CLA
00331  5323          JMP SKAN
00332  1417          TAD I SCAN
00333  0356          AND (77
00334  7106          CLL RTL
00335  7006          RTL
00336  7006          RTL
00337  3352          DCA TEMP
00340  1417          TAD I SCAN
00341  0356          AND (77
00342  1352          TAD TEMP
00343  3352          DCA TEMP
00344  1417          TAD I SCAN
00345  0360          AND (177
00346  1355          TAD (-".!7600
00347  3251          DCA HLTSWT
00350  1352          TAD TEMP
00351  5212          JMP COMN

00352  0000  TEMP,   0
00355  7722
00356  0077
00357  7721
00360  0177
00361  0600
00362  0777
00363  1000
00364  3571
00365  2477
00366  0257
00367  2461
00370  0317
00371  2471
00372  0316
00373  0004
00374  0377
00375  7776
00376  2523
00377  7600
       0400          PAGE

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 6

00400  2403  TABLE,  2403    /TC
00401  0552          DECTAP
00402  7554          7554
00403  0025          25
00404  7554          7554

00405  2213          2213    /RK
00406  0576  RKADR,  RK8
00407  0021          21
00410  0011          11
00411  0021          21

00412  2404          2404    /TD
00413  0620          TD8E
00414  7277          7277
00415  0034          34
00416  7277          7277

00417  1424          1424    /LT
00420  0654          LINCTP
00421  4400          4400
00422  0007          7
00423  4400          4400

00424  2206          2206    /RF
00425  0663          RF08
00426  7746          7746
00427  0007          7
00430  7746          7746

00431  2024          2024    /PT
00432  2000          BINLDR
00433  7626          7626
00434  0152          152
00435  7700          7700

00436  3205          3205    /ZE
00437  2152          ZERO
00440  0004          4
00441  0006          6
00442  0004          4

00443  2431          2431    /TY
00444  2166          TYPSET
00445  7730          7730
00446  0042          42
00447  7730          7730

00450  0414          0414    /DL
00451  2160          DIAL
00452  4012          4012
00453  0006          6
00454  4012          4012

00455  0301          0301    /CA

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 6-1

00456  2261          CAS
00457  4000          4000
00460  0040          40
00461  4000          4000

00462  0415          0415    /DM
00463  2243          DSKMON
00464  0171          171
00465  0016          16
00466  0174          174

00467  2605          2605    /VE
00470  2233          VERS
00471  2233          VERS
00472  0001          1
00473  2233          VERS

00474  0424          0424    /DT
00475  2424          TAPE
00476  2424          TAPE
00477  0001          1
00500  2424          TAPE

00501  0413          0413    /DK
00502  2401          DISK
00503  2401          DISK
00504  0001          1
00505  2401          DISK

00506  2205          2205    /RE
00507  0607          RK8E
00510  0021          21
00511  0011          11
00512  0021          21

00513  2523          2523    /US
00514  0001          1
00515  0001          1
00516  0001          1
00517  0264          RETRY

00520  2230          2230    /RX
00521  2321          RX01
00522  0024          RX8E
00523  0036          36
00524  0033          RXSTRT

00525  0000          ZBLOCK 4^5      /PATCH SPACE

00551  0000          0

             /FORMAT:

             /SIXBIT OF 2-CHARACTER NAME
             /ADDRESS OF BOOTSTRAP CODE IN BOOT

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 6-2

             /ADDRESS WHERE BOOTSTRAP CODE IS TO BE MOVED TO
             /LENGTH OF BOOTSTRAP IN WORDS
             /STARTING ADDRESS OF BOOTSTRAP

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 7

00552  7600  DECTAP, 7600
00553  6774          6774
00554  1374          1374
00555  6766          6766
00556  6771          6771
00557  5360          5360
00560  7240          7240
00561  1354          1354
00562  3773          3773
00563  1354          1354
00564  3772          3772
00565  1375          1375
00566  6766          6766
00567  5376          5376
00570  7754          7754
00571  7755          7755
00572  0600          0600
00573  0220          0220
00574  6771          6771
00575  5376          5376

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 8

00576  6732  RK8,    6732
00577  6751          6751
00600  6745          6745
00601  5023          5023
00602  6742          6742
00603  6753          6753
00604  6755          6755
00605  6733          6733
00606  5031          5031

00607  7000  RK8E,   7000
00610  7000          7000
00611  7000          7000
00612  7000          7000
00613  7201          7201
00614  6742          6742
00615  6742          6742
00616  6743          6743
00617  5031          5031

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 9

00620  6007  TD8E,   6007
00621  1312          1312
00622  4312          4312
00623  4312          4312
00624  6773          6773
00625  5303          5303
00626  6777          6777
00627  3726          3726
00630  2326          2326
00631  5303          5303
00632  5732          5732
00633  2000          2000
00634  1300          1300
00635  6774          6774
00636  6771          6771
00637  5315          5315
00640  6776          6776
00641  0331          0331
00642  1327          1327
00643  7640          7640
00644  5315          5315
00645  2321          2321
00646  5712          5712
00647  7354          7354
00650  7756          7756
00651  7747          7747
00652  0077          0077
00653  7400          7400

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 10

00654  6141  LINCTP, 6141
00655  1020          1020
00656  0020          0020
00657  0004          0004
00660  0700          0700
00661  0000          0000
00662  6020          6020

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 11

00663  6643  RF08,   6643
00664  6615          6615
00665  7600          7600
00666  6603          6603
00667  6622          6622
00670  5352          5352
00671  5752          5752

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 12

             /       1000 IS OS/8 LINE BUUFFER
             /       1600 IS PS/8 LINE BUFFERE

       2000          *2000

02000  0000  BINLDR, 0000
02001  3212          3212
02002  4260          4260
02003  1300          1300
02004  7750          7750
02005  5237          5237
02006  2212          2212
02007  7040          7040
02010  5227          5227
02011  1212          1212
02012  7640          7640
02013  5230          5230
02014  1214          1214
02015  0274          0274
02016  1341          1341
02017  7510          7510
02020  2226          2226
02021  7750          7750
02022  5626          5626
02023  1214          1214
02024  0256          0256
02025  1257          1257
02026  3213          3213
02027  5230          5230
02030  0070          0070
02031  6201          6201
02032  0000          0000
02033  0000          0000
02034  6031          6031
02035  5262          5262
02036  6036          6036
02037  3214          3214
02040  1214          1214
02041  5660          5660
02042  6011          6011
02043  5270          5270
02044  6016          6016
02045  5265          5265
02046  0300          0300
02047  4343          4343
02050  7041          7041
02051  1215          1215
02052  7402          7402
02053  6032          6032
02054  6014          6014
02055  6214          6214
02056  1257          1257
02057  3213          3213
02060  7604          7604
02061  7700          7700

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 12-1

02062  1353          1353
02063  1352          1352
02064  3261          3261
02065  4226          4226
02066  5313          5313
02067  3215          3215
02070  1213          1213
02071  3336          3336
02072  1214          1214
02073  3376          3376
02074  4260          4260
02075  3355          3355
02076  4226          4226
02077  5275          5275
02100  4343          4343
02101  7420          7420
02102  5336          5336
02103  3216          3216
02104  1376          1376
02105  1355          1355
02106  1215          1215
02107  5315          5315
02110  0000          0000
02111  3616          3616
02112  2216          2216
02113  7600          7600
02114  5332          5332
02115  0000          0000
02116  1376          1376
02117  7106          7106
02120  7006          7006
02121  7006          7006
02122  1355          1355
02123  5743          5743
02124  5262          5262
02125  0006          0006
02126  0000          0000
02127  0000          0000
02130  6014          6014
02131  6011          6011
02132  5357          5357
02133  6016          6016
02134  7106          7106
02135  7006          7006
02136  7510          7510
02137  5374          5374
02140  7006          7006
02141  6011          6011
02142  5367          5367
02143  6016          6016
02144  7420          7420
02145  3776          3776
02146  3376          3376
02147  5357          5357
02150  0000          0000

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 12-2

02151  5301          5301

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 13

02152  1005  ZERO,   1005
02153  3410          3410
02154  5004          5004
02155  5404          5404
02156  0011          0011
02157  2010          2010

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 14

02160  6141  DIAL,   6141
02161  1020          1020
02162  0020          0020
02163  0004          0004
02164  0701          0701
02165  7300          7300

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 15

             /       7300
             /       6002
             /       6042
             /       6022
             /       6012
             /       6032
             /       6601
             /       6764
             /       1221
             /       3010
             /       1622
             /       2222
             /       7450
             /       5620
             /       3410
             /       5212
             /       7730
             /       7727
             /       0223
02166  6774  TYPSET, 6774
02167  1347          1347
02170  4341          4341
02171  7240          7240
02172  1353          1353
02173  3355          3355
02174  1352          1352
02175  4341          4341
02176  5753          5753
02177  7777          7777
02200  6766          6766
02201  3354          3354
02202  6771          6771
02203  5344          5344
02204  5741          5741
02205  4600          4600
02206  7777          7777
02207  7777          7777
02210  4220          4220
02211  7400          7400
02212  7777          7777
02213  7777          7777
02214  7777          7777
02215  6014          6014
02216  6011          6011
02217  5360          5360
02220  7106          7106
02221  6012          6012
02222  7420          7420
02223  5357          5357
02224  5756          5756
02225  4356          4356
02226  3373          3373
02227  4356          4356

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 16

02230  0301  PTCLEV, "A
02231  0264  L3,     "4
02232  0326  LV,     "V
02233  1232  VERS,   TAD LV
02234  4777          JMS I (PUT
02235  1231          TAD L3
02236  4777          JMS I (PUT
02237  1230          TAD PTCLEV
02240  4777          JMS I (PUT
02241  5642          JMP I PRETRY
02242  0264  PRETRY, RETRY

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 17

02243  7577  DSKMON, 7577
02244  7750          7750
02245  7751          7751
02246  1171          1171
02247  3572          3572
02250  1172          1172
02251  3573          3573
02252  6643          6643
02253  6615          6615
02254  6603          6603
02255  6602          6602
02256  5203          5203
02257  5606          5606
02260  7600          7600

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 18

02261  1237  CAS,    1237
02262  1206          1206
02263  6704          6704
02264  6706          6706
02265  6703          6703
02266  5204          5204
02267  7264          7264
02270  6702          6702
02271  7610          7610
02272  3211          3211
02273  3636          3636
02274  1205          1205
02275  6704          6704
02276  6706          6706
02277  6701          6701
02300  5216          5216
02301  7002          7002
02302  7430          7430
02303  1636          1636
02304  7022          7022
02305  3636          3636
02306  7420          7420
02307  2236          2236
02310  2235          2235
02311  5215          5215
02312  7346          7346
02313  7002          7002
02314  3235          3235
02315  5201          5201
02316  7737          7737
02317  3557          3557
02320  7730          7730

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 19

       6751          LCD=6751
       6755          SDN=6755
       6754          SER=6754
       6753          STR=6753
       6752          XDR=6752

02377  2471
       0024  RX01,   RELOC 24

00024* 7126  RX8E,   STL RTL
00025* 1060          TAD     UNIT    /GET A READ COMMAND ON THE PROPER
00026* 6751          LCD             /UNIT AND LOAD IT INTO THE COMMAND REGISTER
00027* 7201          CLA IAC
00030* 4053          JMS     LOAD    /READ SECTOR ONE
00031* 4053          JMS     LOAD    /OF TRACK ONE.
00032* 7104          CLL RAL         /SET AC = 2 AS FLAG SAYING WE READ TRACK 1

             RXSTRT,                 /** BOOTSTRAP START ADDR **
00033* 6755  HANGGG, SDN             /DO A FIGURE-8 SKIP -
00034* 5054          JMP     LOAD+1  /ONLY THE DONE FLAG WILL COME UP
00035* 6754          SER             /ANY ERRORS?
00036* 7450          SNA             /OR IS THIS THE INITIAL DUMMY WAIT?
00037* 7610          SKP CLA         /IF EITHER ONE, TRY OTHER DRIVE
00040* 5046          JMP     GOODRD  /IF ALL IS WELL, GO READ THE SECTOR BUFFER
00041* 1060          TAD     UNIT    /COME HERE ON READ ERRORS -
00042* 7041          CIA             /FLIP THE UNIT NUMBER
00043* 1061          TAD     X6030   /IN "UNIT"
00044* 3060          DCA     UNIT
00045* 5024          JMP     RX8E
00046* 6751  GOODRD, LCD             /LOAD THE EMPTY SECTOR BUFFER COMMAND ( A CONVENIENT 2)
00047* 4053  LP,     JMS     LOAD    /GET A WORD FROM THE SECTOR BUFFER
00050* 3002          DCA     2       /SECONDARY BOOT LOADS INTO LOCATIONS 2-51
00051* 2050          ISZ     .-1     /BUMP STORE ADDRESS
00052* 5047          JMP     LP

00053* 0000  LOAD,   0
00054* 6753          STR             /DO A FIGURE-8 LOOP WAITING FOR THE TRANSFER
00055* 5033          JMP     HANGGG  /OR DONE FLAGS TO COME UP.
00056* 6752          XDR             /TRANSFER FLAG CAME UP - TRANSFER A WORD
00057* 5453          JMP I   LOAD

00060* 7024  UNIT,   7024            /7004 = DRIVE 0,   7024 = DRIVE 1
00061* 6030  X6030,  6030            /CONSTANT NEEDED TO FLIP UNIT - 7004+7024.

       2357          RELOC
       2400          PAGE

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 20

02400  2213  L2213,  2213
       6615          DIML=6615
02401  7201  DISK,   CLA IAC
02402  6615          DIML
02403  7650          SNA CLA
02404  5216          JMP GOTRF
02405  1377          TAD (70
02406  6732          6732
02407  7650          SNA CLA
02410  5221          JMP GOTRK8
02411  7201          CLA IAC
02412  6744          6744
02413  7640          SZA CLA
02414  5623          JMP I PRETR
02415  7240          STA             /RE
02416  1220  GOTRF,  TAD L2206       /RF
02417  5657          JMP I PCOMN
02420  2206  L2206,  2206
02421  1200  GOTRK8, TAD L2213       /RK
02422  5657          JMP I PCOMN
02423  0264  PRETR,  RETRY

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 21

02424  6141  TAPE,   6141            /LINC
02425  0017          17              /COMPL AC
02426  0002          2               /PDP
02427  7001          IAC
02430  7650          SNA CLA
02431  5253          JMP GOTLTA
02432  1377          TAD (70
02433  6774          6774
02434  7200          CLA
02435  6772          6772
02436  7000          NOP
02437  1260          TAD M70
02440  7650          SNA CLA
02441  5251          JMP GOTTC
02442  7330          STL CLA RAR
02443  6774          6774
02444  7200          CLA
02445  6776          6776
02446  7700          SMA CLA
02447  5623          JMP I PRETR
02450  7201  GOTTD,  CLA IAC
02451  1256  GOTTC,  TAD L2403       /TC
02452  5657          JMP I PCOMN
02453  1255  GOTLTA, TAD L1424       /LT
02454  5657          JMP I PCOMN
02455  1424  L1424,  1424
02456  2403  L2403,  2403
02457  0212  PCOMN,  COMN
02460  7710  M70,    -70
             /       0000

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 22

02461  0000  CRLF,   0
02462  1267          TAD L215
02463  4271          JMS PUT
02464  1270          TAD L212
02465  4271          JMS PUT
02466  5661          JMP I CRLF

02467  0215  L215,   215
02470  0212  L212,   212

02471  0000  PUT,    0
02472  6046          TLS
02473  6041          TSF
02474  5273          JMP .-1
02475  7200          CLA
02476  5671          JMP I PUT

02477  0000  GET,    0
02500  6031          KSF
02501  5300          JMP .-1
02502  6036          KRB
02503  0376          AND (177
02504  6046          TLS
02505  6041          TSF
02506  5305          JMP .-1
02507  1375          TAD (-003
02510  7450          SNA
02511  5774          JMP I (7605
02512  1373          TAD (003-177
02513  7450          SNA
02514  5772          JMP I (RETRY
02515  1371          TAD (177-015
02516  7450          SNA
02517  2277          ISZ GET
02520  1370          TAD (015
02521  0367          AND (77
02522  5677          JMP I GET

02523  0000  TESTRK, 0
02524  1377          TAD (70
02525  6732          6732
02526  7650          SNA CLA
02527  5723          JMP I TESTRK
02530  1366  RK05,   TAD (RK8E
02531  3765          DCA I (RKADR
02532  5723          JMP I TESTRK

02565  0406
02566  0607
02567  0077
02570  0015
02571  0162
02572  0264
02573  7604
02574  7605

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 22-1

02575  7775
02576  0177
02577  0070
00177  7600
       0000          FIELD 0
       0200          *200
                     $

/16     BOOT    -       OS/8 V3D          PAL8-V10A NO DATE   PAGE 23

BINLDR 2000      RXSTRT 0033      
CAS    2261      RX01   2321      
CDOIO  0027      RX8E   0024      
CODE   0102      SCAN   0017      
COMN   0212      SDN    6755      
COSIN  0211      SER    6754      
CRLF   2461      SKAN   0323      
DECTAP 0552      START  0200      
DIAL   2160      STR    6753      
DIML   6615      TABLE  0400      
DISK   2401      TAPE   2424      
DSKMON 2243      TD8E   0620      
GET    2477      TEMP   0352      
GOODRD 0046      TESTRK 2523      
GOTLTA 2453      TYPSET 2166      
GOTRF  2416      UNIT   0060      
GOTRK8 2421      VERS   2233      
GOTTC  2451      XDR    6752      
GOTTD  2450      X6030  0061      
HANGGG 0033      ZERO   2152      
HLTSWT 0251      
INNER  0100      
LCD    6751      
LENGTH 0103      
LINCTP 0654      
LOAD   0053      
LOOP   0216      
LP     0047      
LV     2232      
L1424  2455      
L212   2470      
L215   2467      
L2206  2420      
L2213  2400      
L2403  2456      
L3     2231      
M70    2460      
NEWLOC 0016      
NXT    0252      
OLDLOC 0015      
OS8    0256      
OS8IN  0311      
OUTR   0101      
PCOMN  2457      
PRETR  2423      
PRETRY 2242      
PTCLEV 2230      
PTR    0014      
PUT    2471      
RETRY  0264      
RF08   0663      
RKADR  0406      
RK05   2530      
RK8    0576      
RK8E   0607      



ERRORS DETECTED: 0
LINKS GENERATED: 0



