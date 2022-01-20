@ECHO OFF

Rem PDP-8 Development Drive Setup Utility                                08-Feb-2014

Rem Copyright 1975-2014 CLA Systems.

SET VERSION=1.1

SET CREDATE=08-Feb-2014

COLOR 1f

MODE CON: COLS=80 LINES=37

Rem This program sets the development drive required by all PDP-8 development
Rem packages.  THe user environment variable PDP-8_DRIVE will be set to the desired
Rem drive letter [followed by ":"] which is used by all development packages as the
Rem drive to read components of the various packages from.

Rem Output the title bar now.

Title PDP-8 Development Drive Setup Utility,       Version %VERSION%, Copyright (c) 2014, CLA Systems

Rem First check if a valid file collection.

IF EXIST DEVELOP GOTO INSTALL

ECHO.
ECHO.
ECHO INSTALLATION FILES CORRUPT OR INCOMPLETE.  INSTALLATION ABORTED!
ECHO.

:MISSCOM

PAUSE

EXIT


:INSTALL

Rem First check if required system files are present.

Rem Check if Notepad editor is installed.

IF EXIST %SystemRoot%\system32\notepad.exe GOTO NTPDOK

ECHO Notepad editor not installed!

GOTO MISSCOM


:NTPDOK

Rem Check if system registry editor is installed.

IF EXIST %SystemRoot%\system32\reg.exe GOTO REGOK

ECHO Reg.exe program not installed!

GOTO MISSCOM


:REGOK

Rem Check if sleep.exe file is present.

IF EXIST sleep.exe GOTO SLEEPOK

ECHO sleep.exe not found!

GOTO MISSCOM


:SLEEPOK

Rem Check if hlpscrn1.txt file is present.

IF EXIST hlpscrn1.txt GOTO HLP1OK

ECHO hlpscrn1.txt not found!

GOTO MISSCOM


:HLP1OK

Rem Check if we are in the correct directory.

FOR %%F IN (*.*) DO SET OURPATH=%%~PF

IF "%OURPATH%" == "\PDP-8\SIMH\Links and Support Files\PDP-8_SETUP\" GOTO PATHOK

ECHO Invalid installation directory!

GOTO MISSCOM


:PATHOK

Rem output opening screen.
 
ECHO PDP-8 Development Drive Setup Utility                   Version %VERSION%, %CREDATE%

Rem ECHO.
ECHO Copyright (c) 2014, CLA Systems
ECHO CLASystems@gmail.com

Rem Output starting time before (hopefully) setting the output drive.

ECHO.
ECHO %DATE% %TIME%
ECHO.
ECHO Current Profile: %USERNAME%
ECHO.
ECHO Gathering system information, please wait . . .

Rem Output the gathering status on the title bar as well.

Title PDP-8 Development Drive Setup Utility,       Version %VERSION%, Copyright (c) 2014, CLA Systems

Rem Setup Notepad editor for our help screen.

CALL :NTPDSET

ECHO.
ECHO Launching Notepad editor with help screen 1.

Rem startup Notepad with our output file.

START /WAIT Notepad.exe hlpscrn1.txt

ECHO Notepad editor closed.
ECHO.

Rem Restore former Notepad editor settings.

CALL :NTPDREST

:AGAIN

Rem Check if PDP-8_DRIVE is already set before we got here.

Rem First check if the variable is clear.

IF "%PDP-8_DRIVE%"=="" GOTO NOTSET

Rem PDP-8_DRIVE exists and must be validated.

FOR %%F IN (%PDP-8_DRIVE%) DO SET DRV=%%~DF

IF NOT "%PDP-8_DRIVE%"=="%DRV%" GOTO BADVAR

:MLOOP

ECHO PDP-8 Development drive already set.
ECHO.
ECHO PDP-8 Development packages will be located on drive %PDP-8_DRIVE%
ECHO.

SET /P YN=Modify? (y/n) 

IF "%YN%"=="Y" GOTO CHANGIT

IF "%YN%"=="y" GOTO CHANGIT

IF "%YN%"=="N" GOTO NOCHANGE

IF "%YN%"=="n" GOTO NOCHANGE

ECHO.

GOTO MLOOP


:NOCHANGE

ECHO.
ECHO PDP-8 Development drive setting will not be changed.
ECHO.
ECHO Exiting . . .

SLEEP 30

EXIT


:CHANGIT

Rem Comes here to change existing source drive letter.

ECHO.
ECHO PDP-8 Development drive letter will be reset.
ECHO.

GOTO NOTSET


:BADVAR

Rem Comes here if variable is corrupted or misformatted.

ECHO The environment variable setting:
ECHO.
ECHO "PDP-8_DRIVE=%PDP-8_DRIVE%"
ECHO.
ECHO is incompatible with the PDP-8 Development Packages.
ECHO.
ECHO PDP-8_DRIVE must be reset to continue.
ECHO.
ECHO (Press control-C to cancel this program and preserve the current value.)
ECHO.

PAUSE

ECHO.

Rem GOTO NOTSET


:NOTSET

Rem Comes here if no prior source volume set.

Rem Use our current drive as the source drive.

FOR %%F IN (.) DO SET ICDRIVE=%%~DF

:ALOOP

ECHO PDP-8 Development packages will be located on drive %ICDRIVE%
ECHO.

SET /P YN=Is this correct? (y/n) 

ECHO.

IF "%YN%"=="Y" GOTO ACCEPTIT

IF "%YN%"=="y" GOTO ACCEPTIT

IF "%YN%"=="N" GOTO NOACCEPT

IF "%YN%"=="n" GOTO NOACCEPT

GOTO ALOOP


:NOACCEPT

ECHO Cancelled . . .

GOTO BADEXIT


:ACCEPTIT

Rem Check if this drive has the proper additional directories.

IF NOT EXIST "%ICDRIVE%\PDP-8\SIMH\Links and Support Files\PDP-8_SETUP\" GOTO DRVINC

IF NOT EXIST %ICDRIVE%\PDP-8\SIMH\PDP-8\ GOTO DRVINC

Rem The drive seems to have the appropriate files to be used as the source drive.

Rem Delete any previous setting.

IF "%PDP-8_DRIVE%"=="" GOTO NODELETE

REG DELETE "HKCU\Environment" /v PDP-8_DRIVE /f > NUL:

:NODELETE

REG ADD "HKCU\Environment" /v PDP-8_DRIVE /t REG_SZ /d "%ICDRIVE%" /f > NUL:

ECHO PDP-8 Development Drive Setup successful.
ECHO.
ECHO Completely Log off %USERNAME% (switching users is not sufficient) to allow
ECHO the settings to update).

:BADEXIT

Rem All of the error exit routines come here.

ECHO.
ECHO Exiting . . .

SLEEP 30

EXIT


:DRVINC

Rem Comes here is some vital files are missing.

ECHO Selected source drive incomplete - Files missing, aborting . . .

GOTO BADEXIT


Rem Internal subroutines.


:DRVCHK

Rem Check if the user input matches an element of the all drives string.

IF "%UDRIVE%"=="%1" SET ODRIVE=%1

GOTO THE_END


:NTPDSET

Rem Save whatever Notepad settings currently are.

REG EXPORT "HKCU\SOFTWARE\MICROSOFT\NOTEPAD" %TEMP%\notepadbackup.reg > NUL:

Rem Customize Notepad for installation/guided help purposes.

REG ADD "HKCU\Software\Microsoft\Notepad" /v lfEscapement /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfOrientation /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfWeight /t REG_DWORD /d 400 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfItalic /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfUnderline /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfStrikeOut /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfCharSet /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfOutPrecision /t REG_DWORD /d 3 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfClipPrecision /t REG_DWORD /d 2 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfQuality /t REG_DWORD /d 1 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfPitchAndFamily /t REG_DWORD /d 49 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iPointSize /t REG_DWORD /d 80 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v fWrap /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v StatusBar /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v fSaveWindowPositions /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v lfFaceName /t REG_SZ /d "Lucida Console" /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v szHeader /t REG_SZ /d "&f" /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v szTrailer /t REG_SZ /d "Page &p" /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iMarginTop /t REG_DWORD /d 1000 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iMarginBottom /t REG_DWORD /d 1000 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iMarginLeft /t REG_DWORD /d 750 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iMarginRight /t REG_DWORD /d 750 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v fMLE_is_broken /t REG_DWORD /d 0 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iWindowPosX /t REG_DWORD /d 244 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iWindowPosY /t REG_DWORD /d 4 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iWindowPosDX /t REG_DWORD /d 529 /f > NUL:
REG ADD "HKCU\Software\Microsoft\Notepad" /v iWindowPosDY /t REG_DWORD /d 586 /f > NUL:

GOTO THE_END


:NTPDREST

Rem Restore former notepad settings.

REG IMPORT %TEMP%\notepadbackup.reg > NUL:

DEL %TEMP%\notepadbackup.reg > NUL:

Rem GOTO THE_END


:THE_END
