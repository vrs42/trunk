REM Edit a specific file then copy it into the PTR: file in preparation for
REM assembly in SIMH.

REM Last edit: 25-May-2014 cjl

REM Set the file name.

SET FILENAME=TC12M.PAL

REM Set the path for source files.

SET SRCPATH=%PDP-8_DRIVE%\PDP-8\Source Files\PQS8

REM Set the path for the working files.

SET WORKPATH=%PDP-8_DRIVE%\PDP-8\SIMH\PDP-8\SIMH_Working_Files

START /WAIT NOTEPAD.EXE "%SRCPATH%\%FILENAME%"

REM Copy the source file to the SIMH PTR: file.

COPY /Y "%SRCPATH%\%FILENAME%" "%WORKPATH%\PTRFILE.TXT"
