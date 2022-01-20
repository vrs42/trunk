@ECHO OFF

REM Copy the source file to the SIMH PTR: file and then run SIMH.

REM Last edit: 05-Aug-2015 cjl

SETLOCAL

REM Set desired PDP-8 bootup file below; REM the other one.

SET GOCONFIG=os8config.ini
REM SET GOCONFIG=pqsconfig.ini

REM Set the file name.

SET FILENAME=TC12F.PAL

REM Set the path for source files.

SET SRCPATH=%PDP-8_DRIVE%\PDP-8\Source Files\PQS8

REM Set the path for the working files.

SET WORKPATH=%PDP-8_DRIVE%\PDP-8\SIMH\PDP-8\SIMH_Working_Files

REM Copy the source file to the SIMH PTR: file.

COPY /Y "%SRCPATH%\%FILENAME%" "%WORKPATH%\PTRFILE.TXT" > NUL:

REM Now run SIMH.  If OS/8, read PTR: into a .PA or other file using PIP.
REM If P?S/8, use PTUTIL to read PTR: input and create P?S/8 output files.

CD "%PDP-8_DRIVE%\PDP-8\SIMH\PDP-8\SIMH_Working_Files"

"%PDP-8_DRIVE%\PDP-8\SIMH\PDP-8\SIMH Simulator Releases\PDP8.exe" "%PDP-8_DRIVE%\PDP-8\SIMH\PDP-8\SIMH Configuration Files\%GOCONFIG%"
