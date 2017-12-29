if exist t2.bat del t2.bat
start allowio LPT_COM.EXE %2 "%1 %2 %3" > t2.bat

