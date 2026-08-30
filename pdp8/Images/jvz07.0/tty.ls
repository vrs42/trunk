        FORTRAN IV  4BAAA    7-JAN-79             PAGE  ONE 

	C       PROGRAM TO CALCULATE RT /(1-VP)W**2 FROM 1K TO 50K RPM
0002	        DIMENSION AX(50)
0003	5       WRITE(4,10)
0004	10      FORMAT(' T= ',$)
0005	        READ(4,20) AT
0006	20      FORMAT(F6.2)
0007	        WRITE(4,30)
0010	30      FORMAT(' V= ',$)
0011	        READ(4,40) AV
0012	40      FORMAT(F4.3)
0013	        WRITE(4,50)
0014	50      FORMAT(' P= ',$)
0015	        READ(4,60) AR
0016	60      FORMAT(F7.5)
0017	        DO 70 N=1,50
0020	        AX(N)=8.134E+7*AT/((1-(AV*AR)))*6.2832*N*16.66667
0021	70      CONTINUE
0022	        WRITE(4,80) (N,AX(N),N=1,50
BAD READ OR WRITE STATEMENT 
0023	80      FORMAT( I2,' = ',E9.7)
0024	        GOTO 5
0025	        STOP
0026	        END
