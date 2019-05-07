


                           *       *       *







                 I C E (Intelligent Correction Editor)

                  ------------------------------------


                              Version 6-e


                        PROGRAM REFERENCE MANUAL
                             --------------


                              Nov.16, 1994



                ICE and ICE Manual Copyright (C),   1978
                by DEWAR  INFORMATION  SYSTEMS  CORPORA-
                TION.   This manual may be reproduced in
                whole or in part provided that  all such
                 copies contain this copyright notice.







                This  manual was  generated with  DISC's
                Automatic cross-referencing and Indexing
                   Document generator program (ACID)







                 DEWAR INFORMATION SYSTEMS CORPORATION
                           1010 Executive Ct
                           Westmont, IL 60559
                        UNITED STATES OF AMERICA

                           Phone 708-850-4350

I C E:  V-6e  Manual           Nov.16, 1994              Page  1 of 22


                           TABLE OF CONTENTS


1.        INTRODUCTION . . . . . . . . . . . . . . . . . . . . . .   3
2.        GENERAL FEATURES . . . . . . . . . . . . . . . . . . . .   3
2.1.        HIGH SPEED CLOSE . . . . . . . . . . . . . . . . . . .   3
2.2.        LINE NUMBER RECOLLECTION . . . . . . . . . . . . . . .   3
2.3.        MASK CHARACTERS  . . . . . . . . . . . . . . . . . . .   3
2.4.        EDIT/DELETION FLAGS  . . . . . . . . . . . . . . . . .   3
2.5.        AUTOMATIC FILE BACKUP  . . . . . . . . . . . . . . . .   3
2.6.        SEARCH & REPLACE . . . . . . . . . . . . . . . . . . .   3
2.7.        BLOCK SAVE AND RESTORE . . . . . . . . . . . . . . . .   4
2.8.        SPACE WARNING  . . . . . . . . . . . . . . . . . . . .   4
2.9.        CRT TERMINAL SUPPORT . . . . . . . . . . . . . . . . .   4
2.10.       USE ON TIME-SHARE SYSTEMS  . . . . . . . . . . . . . .   4
3.        USING THE ICE PROGRAM  . . . . . . . . . . . . . . . . .   4
3.1.        INPUT FILES  . . . . . . . . . . . . . . . . . . . . .   4
3.2.        OUTPUT FILE  . . . . . . . . . . . . . . . . . . . . .   5
3.2.1.        RUN-TIME OPTIONS . . . . . . . . . . . . . . . . . .   5
3.2.1.1.        /A OPTION  . . . . . . . . . . . . . . . . . . . .   5
3.2.1.2.        /B OPTION  . . . . . . . . . . . . . . . . . . . .   5
3.2.1.3.        /C OPTION  . . . . . . . . . . . . . . . . . . . .   5
3.2.1.4.        /D OPTION  . . . . . . . . . . . . . . . . . . . .   5
3.2.1.5.        /F OPTION  . . . . . . . . . . . . . . . . . . . .   6
3.2.1.6.        /H OPTION  . . . . . . . . . . . . . . . . . . . .   6
3.2.1.7.        /P OPTION  . . . . . . . . . . . . . . . . . . . .   6
3.2.1.8.        /R OPTION  . . . . . . . . . . . . . . . . . . . .   6
3.2.1.9.        /V OPTION  . . . . . . . . . . . . . . . . . . . .   6
3.2.1.10.       /Z OPTION  . . . . . . . . . . . . . . . . . . . .   7
4.        INITIAL MESSAGES . . . . . . . . . . . . . . . . . . . .   7
4.1.        NORMAL MESSAGE . . . . . . . . . . . . . . . . . . . .   7
4.2.        WARNING MESSAGE  . . . . . . . . . . . . . . . . . . .   7
4.3.        OTHER ERROR MESSAGES . . . . . . . . . . . . . . . . .   8
4.3.1.        CAN'T OPEN OUTPUT FILE . . . . . . . . . . . . . . .   8
4.3.2.        CAN'T LOAD HANDLER . . . . . . . . . . . . . . . . .   8
4.3.3.        FILE #N NOT FOUND  . . . . . . . . . . . . . . . . .   8
5.        GENERAL ERROR MESSAGES . . . . . . . . . . . . . . . . .   8
5.1.        I/O ERROR! CR=TRY AGAIN, ANYTHING ELSE=SKIP AHEAD  . .   8
5.2.        OUTPUT DEVICE FULL!  .TM FILE CLOSED . . . . . . . . .   8
6.        ICE COMMAND STRUCTURE  . . . . . . . . . . . . . . . . .   9
6.1.        POSITIONING ELEMENTS . . . . . . . . . . . . . . . . .   9
6.1.1.        CURRENT LINE NUMBER  . . . . . . . . . . . . . . . .   9
6.1.2.        ORIGINAL PAGE AND LINE NUMBER  . . . . . . . . . . .   9
6.2.        CURRENT LINE . . . . . . . . . . . . . . . . . . . . .  10
6.3.        DEFAULT POSITION . . . . . . . . . . . . . . . . . . .  10
6.4.        LAST LINE  . . . . . . . . . . . . . . . . . . . . . .  10
6.5.        FIRST SECTION  . . . . . . . . . . . . . . . . . . . .  10
6.6.        LAST SECTION . . . . . . . . . . . . . . . . . . . . .  10
6.7.        ALL TEXT . . . . . . . . . . . . . . . . . . . . . . .  11
6.8.        CONTEXT POSITION . . . . . . . . . . . . . . . . . . .  11
6.9.        SEARCH STRINGS . . . . . . . . . . . . . . . . . . . .  11
7.        ICE COMMANDS . . . . . . . . . . . . . . . . . . . . . .  12
7.1.        APPEND TEXT  . . . . . . . . . . . . . . . . . . . . .  12
7.2.        BLOCK SAVE . . . . . . . . . . . . . . . . . . . . . .  12
7.3.        CHANGE TEXT  . . . . . . . . . . . . . . . . . . . . .  13
7.4.        DELETE TEXT  . . . . . . . . . . . . . . . . . . . . .  13
7.5.        END FILE . . . . . . . . . . . . . . . . . . . . . . .  13
7.6.        FILE SELECT  . . . . . . . . . . . . . . . . . . . . .  13
I C E:  V-6e  Manual           Nov.16, 1994              Page  2 of 22


7.7.        GET LINE WITH LABEL  . . . . . . . . . . . . . . . . .  13
7.8.        INSERT TEXT  . . . . . . . . . . . . . . . . . . . . .  13
7.9.        JUXTAPOSE TEXT STRINGS . . . . . . . . . . . . . . . .  13
7.10.       BLOCK RESTORE  . . . . . . . . . . . . . . . . . . . .  14
7.11.       LIST TEXT ON CONSOLE . . . . . . . . . . . . . . . . .  14
7.12.       LIST MODIFIED TEXT . . . . . . . . . . . . . . . . . .  14
7.13.       NEXT PAGE  . . . . . . . . . . . . . . . . . . . . . .  14
7.14.       WRITE TEXT OUT . . . . . . . . . . . . . . . . . . . .  14
7.15.       QUIT EDIT WITH CURRENT PAGE  . . . . . . . . . . . . .  15
7.16.       READ PAGE  . . . . . . . . . . . . . . . . . . . . . .  15
7.17.       SEARCH LINE  . . . . . . . . . . . . . . . . . . . . .  15
7.18.       LIST TEXT ON PRINTER . . . . . . . . . . . . . . . . .  16
7.19.       WHERE IS THE POINTER?  . . . . . . . . . . . . . . . .  16
7.20.       DELETE TEXT WITH VERIFICATION  . . . . . . . . . . . .  16
7.21.       POSITION WITHOUT WRITING TEXT  . . . . . . . . . . . .  17
7.22.       SET CONTEXT COUNT  . . . . . . . . . . . . . . . . . .  17
7.23.       LIST PREVIOUS LINE . . . . . . . . . . . . . . . . . .  17
7.24.       LIST NEXT LINE . . . . . . . . . . . . . . . . . . . .  17
8.        FUNCTION KEYS  . . . . . . . . . . . . . . . . . . . . .  17
8.1.        RUBOUT KEY . . . . . . . . . . . . . . . . . . . . . .  17
8.2.        CONTROL/K KEY  . . . . . . . . . . . . . . . . . . . .  17
8.3.        TAB KEY  . . . . . . . . . . . . . . . . . . . . . . .  18
8.4.        CONTROL/N KEY  . . . . . . . . . . . . . . . . . . . .  18
8.5.        ESCAPE OR ALTMODE KEY  . . . . . . . . . . . . . . . .  18
8.6.        CONTROL/U KEY  . . . . . . . . . . . . . . . . . . . .  18
8.7.        LINE FEED KEY  . . . . . . . . . . . . . . . . . . . .  18
8.8.        CARRIAGE RETURN KEY  . . . . . . . . . . . . . . . . .  18
8.9.        CONTROL/L KEY  . . . . . . . . . . . . . . . . . . . .  19
8.10.       CONTROL/O KEY  . . . . . . . . . . . . . . . . . . . .  19
8.11.       CONTROL/C KEY  . . . . . . . . . . . . . . . . . . . .  19
9.        USE OF LOWER CASE CHARACTERS . . . . . . . . . . . . . .  19
9.1.        CONTROL/O LATCH  . . . . . . . . . . . . . . . . . . .  19
9.2.        SLASH OR ASTERISK  . . . . . . . . . . . . . . . . . .  19
10.       SHORT ERROR MESSAGES . . . . . . . . . . . . . . . . . .  20
11.       NOTES ON USING THE ICE PROGRAM . . . . . . . . . . . . .  21
11.1.       EXAMPLE #1 . . . . . . . . . . . . . . . . . . . . . .  21
11.2.       EXAMPLE #2 . . . . . . . . . . . . . . . . . . . . . .  21
11.3.       EXAMPLE #3 . . . . . . . . . . . . . . . . . . . . . .  21
11.4.       EXAMPLE #4 . . . . . . . . . . . . . . . . . . . . . .  21
11.5.       EXAMPLE #5 . . . . . . . . . . . . . . . . . . . . . .  22
12.       ICE MEMORY MAP . . . . . . . . . . . . . . . . . . . . .  22
I C E:  V-6e  Manual           Nov.16, 1994              Page  3 of 22


1. Introduction

The  ICE  program (Intelligent Correction Editor)   is a line-oriented
text editor  program  that provides  an extremely convenient  means of
updating any kind of ASCII source files.   It is especially convenient
for updating  PAGE8  programs directly from the assembled source list-
ing. Although originally designed for use under MOS (a multi-user OS/8
supervisory program), its high throughput and extra features make it a
highly attractive replacement for OS/8 EDIT.   One of the main virtues
of ICE is its simplicity--anyone familiar with OS/8 EDIT.SV  can learn
to use ICE in a matter of minutes.

2. General Features

        2.1. High Speed Close

        ICE  can close out  files from 10 to 50 times as fast as  OS/8
        EDIT. On an RK05 disc, a file that would take a minute or more
        to close with EDIT can be closed out by ICE in a little over a
        second. In fact, ICE can close out a file just as fast as FOTP
        can copy it.

        2.2. Line Number Recollection

        ICE maintains both the  old and  the current line numbers in a
        file.   Additions and deletions only  affect the current  line
        number since  ICE always  ``remembers'' the original line num-
        bers.   This makes ICE ideal for updating files from assembled
        PAGE8 source listings or ACID documents.

        2.3. Mask Characters

        String searches in ICE allow specification of ``mask'' charac-
        ters  that  match  on some predefined  characteristic (for ex-
        ample, match all digits,  or match all alphanumeric characters
        etc.).

        2.4. Edit/Deletion flags

        ICE can insert Edit/deletion flags on source statements. These
        flags are then posted by PAGE8 on the assembled source listing
        so that a user can readily tell which statements were modified
        on the last editing cycle.   These flags are also processed by
        the ACID document generator program to facilitate maintainance
        and proofing of documentation.

        2.5. Automatic file backup

        ICE automatically  backs  up files (like the  `EB'  command in
        TECO) whenever a file is closed out onto a device that already
        has a file with the same name.

        2.6. Search & Replace

        ICE has an iterative search and replace command which makes it
        possible  to change all  occurrences of one  string to another
        string with one command.

I C E:  V-6e  Manual           Nov.16, 1994              Page  4 of 22


        2.7. Block Save and Restore

        ICE has a block save/block  restore feature instead of the `M'
        command of OS/8 EDIT.   The saved block can be retained across
        pages in  the buffer and even  across  different input  files.
        This  feature  greatly  facilitates merging  or  moving  large
        blocks of text.

        2.8. Space warning

        ICE informs the user of  the extra  number of blocks available
        for expansion of the file being edited.  ICE immediately warns
        the user if the space  allocated for the  output  file is  in-
        sufficient to  hold a copy of  the original input file.   This
        feature eliminates  the annoying problem in  EDIT  and TECO of
        editing a file only to  find out after much editing that there
        is not enough room left to close out the file.

        2.9. CRT Terminal Support

        ICE is designed to support  high speed CRT terminals for input
        as well as low speed Teletypes.   If a CRT is being used,  ICE
        will correctly erase  characters  (including  multiple  spaces
        generated by a TAB) from the screen.

        2.10. Use on Time-Share Systems

        One of the design considerations  for ICE was  fast  execution
        under a software-controlled,  time-share system (where CIF and
        CDF instructions are being remapped by software). Under such a
        system, EDIT and TECO run so slowly that they become virtually
        unusable.  ICE,  on the other hand,  still runs extremely fast
        (for example, the high-speed close is just as fast as it would
        be on a stand-alone system).  Any users of software time-share
        systems will find ICE to be an absolutely indispensable aid.

3. Using the ICE program

To call the ICE program, issue the following command to OS/8:

                                R ICE

ICE will respond by typing an `*' to show that the COMMAND DECODER  is
active.  Alternatively, ``ICE'' can be patched into the CCL program to
support a  direct call from the keyboard monitor with  the `EDIT'  and
`CREATE' commands.  (Note:  in modifying CCL,  note that ICE calls the
COMMAND DECODER in ``special mode'').

        3.1. Input Files

        ICE will allow up to five  input files to  be  specified.   No
        default extension  is provided  for by ICE since  the  COMMAND
        DECODER is called in special mode.  If no input file is speci-
        fied, a new file is created.

I C E:  V-6e  Manual           Nov.16, 1994              Page  5 of 22


        3.2. Output File

        One output file is allowed.   If  no output file is specified,
        the device and filename of  the  first  input file is used for
        the output file.   ICE does not permit an output file with the
        extension `.TM'  to be  used since the `TM'  extension is res-
        erved by ICE for the creation of the temporary file.   For ex-
        ample, the command below:

                                *RKA1:PROG.PA

        is interpreted by ICE to mean:

                          *RKA1:PROG.PA<RKA1:PROG.PA

        3.2.1. Run-time Options

                3.2.1.1. /A Option

                Allow all ASCII characters to be entered from the key-
                board. Normally, ICE only allows the standard 64 char-
                acter set (plus CR,   LF,   TAB and lower case alphab-
                etics).   The /A option allows all  ASCII codes  to be
                inserted into the buffer.

                3.2.1.2. /B Option

                This option  inhibits the  automatic file backup norm-
                ally performed by ICE.   If there is already a file on
                the output device with the same name,  it will be del-
                eted when  the output file file is closed.   Normally,
                such a  file  would  have  its  extension  changed  to
                ``.BK'' to identify the old file as a backup file.

                3.2.1.3. /C Option

                This   option   inhibits    the   insertion   of   the
                Edit/Deletion flags into the new source file. Whenever
                a line is entered or modified, ICE inserts a Control/A
                code (201 octal)   as the first character on the line.
                This code is  also inserted on a line that immediately
                follows line(s) that have been deleted.  Presence of a
                Control/A code is used by PAGE8,   ACID and other DISC
                OS/8 programs to identify a modified line.  The /C op-
                tion should ALWAYS be used if the source file is to be
                processed  by a program  that  does not recognize  the
                Edit/Deletion  flags.   Note that a single instruction
                patch to the ICE program in the field 1 initialization
                code  can be made  to reverse the  meaning of this op-
                tion.

                3.2.1.4. /D Option

                This option inhibits ICE  from  reading  in the  first
                page of the file.   Normally,   ICE reads in the first
                page and then lists the  first line of the file on the
                console. The /D option makes ICE work like OS/8 EDIT--
                i.e. nothing  is  read  in  and  the  text  buffer  is
I C E:  V-6e  Manual           Nov.16, 1994              Page  6 of 22


                initially empty.

                3.2.1.5. /F Option

                This option causes ICE to ignore all form feeds in the
                source file.   After a considerable  number of editing
                passes, form feeds and short pages may proliferate. By
                editing the file with  the /F option  all  prior  form
                feeds will be stripped and ignored.   This causes  the
                file to be completely repaged.

                3.2.1.6. /H Option

                This option is normally used in  conjunction with  the
                /F option to avoid having ICE fill the page buffer too
                full.   This option  informs ICE that the  page buffer
                should only be filled  about half full.   This is very
                convenient when large numbers of additions are antici-
                pated, since ICE will leave plenty of room in the page
                buffer each time a new  page is read  from the  source
                file.

                3.2.1.7. /P Option

                This  option inhibits the  High-speed close feature of
                ICE.   When closing a file,  ICE normally saves a con-
                siderable amount  of time  by padding the output  file
                with nulls (ASCII 200 codes)  to align the output file
                to the nearest block  boundary.   The remainder of the
                file is then copied over  15 blocks at a time in image
                mode.  Previously generated nulls are usually stripped
                out on  subsequent edits and are ignored by almost all
                OS/8  programs.   If this ``null-padding'' is undesir-
                able, the /P option reverts to a slower, character-by-
                character close.   Note that  correction flags are NOT
                removed from a section of  a file that is being copied
                over in image mode.  For this reason, the /P option is
                often used  to  ensure  that  all  correction/deletion
                flags reflect only the  current editing  cycle.   This
                option is also useful when a very small  file is being
                edited on a frequent basis.   In this case  the  high-
                speed  close is unnecessary  and  the null-padding may
                increase the length of the file by  a relatively large
                amount.

                3.2.1.8. /R Option

                This option causes ICE  to retain  all prior  correct-
                ion/deletion flags  that  are already  in  the  source
                file.   ICE normally strips  out  all the old  correc-
                tion/deletion flags when it reads the input file.   If
                the /R option is used,   these previous flags are ret-
                ained.

                3.2.1.9. /V Option

                This option causes ICE to print the built-in HELP file
                on the line printer rather than the console.  The HELP
I C E:  V-6e  Manual           Nov.16, 1994              Page  7 of 22


                file  is  automatically  printed  out  if there are no
                input nor output files  specified to the OS/8  COMMAND
                DECODER.

                3.2.1.10. /Z Option

                This option causes ICE  to ignore  the ASCII Control/Z
                code which marks the end of the file. ICE also ignores
                the physical end-of-file (i.e.  based on the number of
                blocks in the file).   This option makes ICE  run in a
                mode similar  to  the  so-called  ``SUPER  TECO''  and
                allows ICE  to be used as a retrieval utility  after a
                directory crash or inadvertent file deletion. Starting
                with a file before  the ``lost'' file,   a `Y' command
                with  a string search can be used to locate the  start
                of the file to be recovered.  Normal commands can then
                be used to  write  the  text  into another output file
                (which for  safety  should  definitely  be on  another
                device since the  input text will  be in  an ``empty''
                area  which  OS/8 could use for the output file).   To
                close out the file,  the `Q' command must then be used
                (the `E' command will not work properly  when  the  /Z
                option is used). If the directory was damamged, simply
                zero  the directory and create a null file with ICE or
                PIP.

4. Initial Messages

Before reading in the first page of the input file, ICE will print the
following mesage:

                               ICE V-ny

where `ny' represents the current  version number of the ICE  program.
This message is always accompanied  on the next line by one of the two
messages described below.

        4.1. Normal Message

        nnnn EXTRA BLOCKS

        This message indicates that there are `nnnn' (decimal)   extra
        blocks left for editing.  The number of blocks in this message
        is calculated by taking  the size  of the allocated empty slot
        for the output file and then subtracting  from that the length
        of the first  input file  being edited.   This number is  then
        decreased  by  one to account for the possible increase in the
        length of the file by one  block  which could  be generated by
        the high-speed close.   If the /P option is used,   this extra
        block is not needed  (and is not accounted for in the calcula-
        tion).  A value of 0 indicates that if nothing is added to the
        file, it will just fit.

        4.2. Warning Message

        nnnn BLOCKS SHORT!

        This message alerts the user to  the fact that the empty space
I C E:  V-6e  Manual           Nov.16, 1994              Page  8 of 22


        allocated for the output file is `nnnn' (decimal) blocks shor-
        ter than the first input file.  Unless a file is being reduced
        in size,  this warning usually means that the user should type
        ^C  to  abort since the  input  file  can not be  closed  out.
        Attempting  to  close  out the output  file when  there is not
        enough room will generate an error message: see 5.2. (Page 8).

        4.3. Other Error Messages

                4.3.1. CAN'T OPEN OUTPUT FILE

                This message appears  if  the  OS/8 system returns  an
                error on the USR ENTER function.  Typical errors would
                be device  full,   device write-protected,   read-only
                device specified for output etc.

                4.3.2. CAN'T LOAD HANDLER

                This message appears  if  the  OS/8 system returns  an
                error when a device handler was loaded by the ICE pro-
                gram.   A typical error would be a non-existent device
                handler.

                4.3.3. FILE #n NOT FOUND

                This message will appear when  ICE could not find  the
                nth file  in  the  OS/8  COMMAND  DECODER  input  file
                string.  ICE returns to the KEYBOARD MONITOR if called
                by  a CCL command or to the COMMAND DECODER if ICE was
                run directly.

5. General Error Messages

While ICE is running, there are two additional error messages that can
appear at any time:

        5.1. I/O ERROR! CR=TRY AGAIN, ANYTHING ELSE=SKIP AHEAD

        This  message appears when an OS/8 device handler signals that
        an I/O error has occurred.  Rather than aborting to OS/8,  ICE
        allows the user to  repeat  the operation  or to skip over the
        bad block(s).  If the user wishes to abort the edit, ^C can be
        typed at  this  point to  return to the OS/8 Keyboard Monitor.
        Typing a carriage return causes the I/O option to be repeated.
        Another error at this point causes the message to be repeated,
        so the I/O function can be tried over  and over  again if des-
        ired.   If anything else  is  typed,   ICE  skips over the bad
        block(s) and continues as if no error had occurred. This func-
        tion  of  ICE  can be invaluable in trying to recover a  vital
        source file that is on an unreliable medium.

        5.2. OUTPUT DEVICE FULL!  .TM FILE CLOSED

        This message can occur when ICE finds  no more  room left  for
        writing to the output device.   The output file is closed any-
        way, but with the extension `.TM', and ICE returns to the OS/8
        Keyboard Monitor.  After this, the user can squeeze the device
        or  delete files to gain  more space.   The user can then edit
I C E:  V-6e  Manual           Nov.16, 1994              Page  9 of 22


        both the  original file and the `.TM' file in order to recover
        almost all the corrections that had already been made.

6. ICE Command Structure

        6.1. Positioning Elements

        ICE  provides  several  types  of ``positioning  elements'' to
        facilitate finding the  desired text.   Most ICE commands have
        the form:

                <position element>,<position element><command>

        The two elements  specify  the block of text to be affected by
        the command.  If NO positioning elements are present, ICE def-
        aults  to the CURRENT LINE and NOT the entire  buffer (as does
        OS/8 EDIT).  If only one positioning element is provided for a
        command that can  take two positioning  elements,   the second
        element is set equal to the first element.  Before executing a
        command,  ICE first positions the text,  and then sets the in-
        ternal,  current-line pointer to the line marked by the second
        positioning element. Both positioning elements must lie in the
        same buffer.

                6.1.1. Current line number

                A current line number is a decimal  number that refers
                to  the actual physical position of  a line of text in
                the buffer.  For example, `14' refers to the 14th line
                in  the  current  buffer  (this  is identical to  OS/8
                EDIT).

                6.1.2. Original Page and Line Number

                An ``original  page and line number''  consists of two
                decimal numbers separated by a period.  The first num-
                ber identifies the ``page'' in the file,  where a page
                is defined as a block of text delimited by  form feeds
                and which  usually comprises a text-buffer load.   The
                second number is the relative line number of a line of
                text within that page. If the first number is omitted,
                it is assumed to have a value equal to the page number
                of the current line of the current buffer. However, if
                the current line was not in the original file (i.e. it
                was  added during  the current  editing pass),   it is
                illegal to omit the page number, and any attempt to do
                so will result in  the  `* P?   *'  message;   see 10.
                (Pg. 20). Note that the line number refers to the ori-
                ginal file that is being edited--it is not necessarily
                the same as the current line number within the buffer.
                The example below should clarify this:

                #11L                    (list line 11 in  current buf-
                                        fer)
                THIS IS LINE 11
                #.11L                   (list  line  11   in  original
                                        file)
                THIS IS LINE 11
I C E:  V-6e  Manual           Nov.16, 1994              Page 10 of 22


                #10D                    (delete  line  10  in  current
                                        buffer)
                #11L                    (line 11 is now  the  old line
                                        12)
                THIS IS LINE 12
                #.11L                   (list  line  11   of  original
                                        file)
                THIS IS LINE 11
                #10L                    (list line 10 of current file)
                THIS IS LINE 11
                #.10L                   (list  line  10   of  original
                                        file)
                * L? *                  (but  it   doesn't  exist  any
                                        more)
                #

        6.2. Current line

        As with OS/8 EDIT,   a period represents  the current line and
        may be followed by a plus  or minus sign and a decimal number:
        `.-3L' will list the line three lines before  the current line
        and will update the  internal line pointer in ICE to  point to
        the new current line. If a period is immediately followed by a
        command,   it is assumed to refer to  the current line.   This
        means that the ICE command `.L' is actually equivalent to  the
        OS/8 EDIT command `.L'.   This convention  was  made to assist
        users in switching from EDIT to ICE.

        6.3. Default Position

        If no positioning element is provided for a command,  ICE def-
        aults to the current line.   This is the opposite of OS/8 EDIT
        which defaults to the entire buffer.  For example, in ICE, the
        command `L' alone simply lists the  current line (and not  the
        entire buffer as would be the case in EDIT).   This convention
        was adopted  to  reduce  the  number of  key-strokes  normally
        needed for commands.

        6.4. Last line

        The last line in the buffer  may  be represented by the letter
        `Z'.  For example, the command `ZL' lists the last line in the
        buffer. Arithmetic is not currently allowed with the `Z'.

        6.5. First Section

        The letter  `F'  represents the first section  of  the  buffer
        which covers all text  from  line one  up to and including the
        current line.   This means  that to  list  from  line 1 to the
        current line, the command `FL' may be used instead of `1,.L'.

        6.6. Last Section

        The letter `L' may  be  used to  represent the last section of
        the buffer  which covers all text from the current line to the
        last line in the buffer.   For example,  to list all text from
        the current line to  the end of the buffer,   the command `LL'
        may be used instead of `.,ZL'.
I C E:  V-6e  Manual           Nov.16, 1994              Page 11 of 22


        6.7. All Text

        As a substitute for the string `1,Z',   the  letter `A' may be
        used to represent all the text in the buffer. For example, the
        command `AL' lists all the text in the buffer.

        6.8. Context Position

        The letter  `C' may be used  as  a substitute  for  the string
        `.-x,.+x' which is often used on a list command to examine the
        context  around  the current line.   The value  of `x' for the
        Context Position is defaulted to 3  but  may be changed to any
        other value with the `=' command:   see 7.22. (Pg. 17).   This
        positioning element can only  be used on the listing commands.
        An important feature of the  context  positioning  element  is
        that the internal line pointer is NOT moved.  For example, the
        two commands below are nearly identical:

        #.-3,.+3L
        #CL

        The only difference is that on the second command,  ICE leaves
        the  internal line pointer untouched whereas  in the first ex-
        ample above,   the line pointer  would  have  been moved three
        lines down. This feature is especially useful on fast CRTs for
        double-checking that a line  has  been inserted in the correct
        place,   or for  quickly finding out the context surrounding a
        line.

        6.9. Search strings

        A search string consists of a string of text enclosed in slash
        characters.   To search for and list the first line containing
        the string `TAD', the command would be:

                                   #/TAD/L

        Any  character can  appear in the  text string except the  up-
        arrow and the slash character itself--these are handled speci-
        ally. A number of special, two-character sequences can also be
        employed to match any one,   or a group  of characters at that
        position in  the string.   The table  below shows  the special
        significance attached to these two-character sequences:

        ^A      Matches any alphanumeric character (A-Z, or 0-9)
        ^B      Matches any alphabetic character (A-Z)
        ^C      Matches an end-of-line code (CR/LF sequence)
        ^D      Matches any decimal digit (0-9)
        ^O      Matches any octal digit (0-7)
        ^S      Matches any separator (i.e.   any character other than
                an  alphanumeric character.   This  is the opposite of
                ^A).
        ^V      Matches  any  number  of  characters  until  the  next
                character following the `^V' matches.
        ^X      Matches any character  EXCEPT the  character  that im-
                mediately follows the `^X'.
        ^^      Matches the up-arrow character.
        ^/      Matches the slash character.
I C E:  V-6e  Manual           Nov.16, 1994              Page 12 of 22


        ^?      Matches any character in this position.

        The ^V  sequence permits an  unanchored search to occur in the
        middle of a string. For example, the command below would match
        any string of text that  begins with  the  letter `X' and ends
        with an octal digit:

                                 #/^SX^V^O/L

        ICE always remembers the last  strings  that  were  used in  a
        command (i.e.  both the starting and the ending strings).  Two
        slashes in a row (a null string)   indicate that ICE is to re-
        use the most recently specified string in that position.  Con-
        sider the following examples:

        #/TAD/L                 List a line with `TAD' in it.
        #//L                    List next line with `TAD' in it.
        #/TADA/,/TADB/L         List a  block  of text from  the  line
                                with `TADA' to the line with `TADB'.
        #//,//L                 Lists the next  block  of text meeting
                                the  same criteria  as  the  line  im-
                                mediately above.

        If a comma separates the search  strings (or there is just one
        string), the search is from line one of the current buffer. If
        a semicolon follows the first string,   the search begins with
        the current line.  If a match is not found, the current buffer
        is written out (except  if  the associated  command is the `Y'
        command: 7.21. (Pg. 17)) and the following buffer load of text
        is searched. This process continues until the string is found,
        or until the end-of-file is encountered.   Note that a default
        search (i.e.  using `//')  always continues from one line past
        the current line.

        If a colon follows the first string, the search is confined to
        the current buffer.  In the event that no match is found,  ICE
        will return the `* S? *' error message but will not  leave the
        current buffer.

7. ICE Commands

In all of the commands below, <pe> represents a positioning element as
previously described (line number,  original page/line number,  search
string or special character.  Remember that if the positioning element
is omitted, the current line is assumed as a default.

        7.1. Append Text

        <pe>A           Identical to the INSERT command: 7.8. (Pg. 13)
                        except  that  the insert  is  made  after  the
                        specified line.

        7.2. Block Save

        <pe>,<pe>B      The specified block  of  text is  copied  to a
                        separate area  of memory and the block is then
                        deleted from the text buffer.   Any previously
                        saved  block of  text  is overwritten at  this
I C E:  V-6e  Manual           Nov.16, 1994              Page 13 of 22


                        time.

        7.3. Change Text

        <pe>,<pe>C      This is combination  of  the `D'  and `I' com-
                        mands. The specified block of text is deleted,
                        and  ICE enters text mode  to replace the del-
                        eted block of text.

        7.4. Delete Text

        <pe>,<pe>D      The specified  block  of text  is deleted from
                        the text buffer.   As with  all commands  that
                        delete text,   garbage collection takes  place
                        automatically to recover the now unused space.

        7.5. End file

        E               Text in the current buffer is written  to  the
                        output file.   The remainder of the input file
                        is then copied over into the output file,  the
                        output file is closed and  ICE returns  to the
                        OS/8  Monitor.   For  more  information on the
                        close operation, see 3.2.1.7. (Page 6).

        7.6. File Select

        <pe>F           <pe> is a number from 1 to 5 which selects the
                        next input file for continuing the edit cycle.
                        The  current text buffer is cleared,   and the
                        first page of  the selected file is then  read
                        into the text buffer. This command can be rep-
                        eated any number of times,   and the  user can
                        step backwards  or forwards without any  rest-
                        rictions.

        7.7. Get Line with Label

        <pe>G           Starting with the specified  line,   ICE scans
                        for a line that has a character  other than an
                        asterisk, slash, blank, TAB or Carriage return
                        as the first character on the line.  This line
                        is then listed,  and the internal text pointer
                        is updated to this line. If the `G' command is
                        given alone,   the search begins with the fol-
                        lowing line.

        7.8. Insert Text

        <pe>I           Ice  enters text mode  to  allow  insertion of
                        text immediately  before  the  specified line.
                        Any number of lines of text can be entered.

        7.9. Juxtapose Text Strings

        <pe>,<pe>J      In this  command,   both <pe>'s represent text
                        strings.  The first <pe> represents the string
                        of text which ICE is to  locate.   The  second
I C E:  V-6e  Manual           Nov.16, 1994              Page 14 of 22


                        <pe> represents the string of text which is to
                        replace the first string.  If a comma or semi-
                        colon separates the two strings, the text rep-
                        lacement starts in the current buffer and then
                        iterates until the end of file is reached,  at
                        which point, the * EF * message appears.  If a
                        colon is used as the separator character,  the
                        text replacement  only takes place in the cur-
                        rent buffer.   All occurrences  of  the  first
                        string in the current buffer are replaced even
                        if  the string occurs several times within the
                        same line.

        7.10. Block Restore

        <pe>K           The saved block of text from a prior  `B' com-
                        mand 7.2. (Pg. 12)  is inserted immediately in
                        front of the specified line.   The saved block
                        of text is not affected -- another `K' command
                        would cause the same  block of  text to be in-
                        serted again.   If there is not enough room in
                        the current buffer to  insert the block,   ICE
                        will insert as many lines as possible and then
                        ring  the  bell  before  returning  to command
                        mode.

        7.11. List Text on Console

        <pe>,<pe>L      The specified block  of  text is listed on the
                        console.

        7.12. List Modified Text

        <pe>,<pe>M      The specified block of text is scanned to find
                        all  lines that have  the  correction/deletion
                        flag set.   These lines are then listed on the
                        console.   The listed lines are  preceded with
                        their  current line  number within the buffer,
                        followed by a hash (#)  character.  This makes
                        it possible to quickly scan all the statements
                        that have been entered  on the current editing
                        cycle.

        7.13. Next Page

        <pe>N           The current buffer is written  to  the  output
                        file and  the  next page of the  input file is
                        read in.  If <pe> is provided, it is used as a
                        count of the  number of times  this command is
                        to be executed.   It is NOT treated as a posi-
                        tioning element.

        7.14. Write text out

        <pe>,<pe>P      The specified block of  text is written to the
                        output file and then  deleted  from  the  text
                        buffer.   The command `P' alone is  considered
                        invalid   (to  prevent  accidental  errors  by
I C E:  V-6e  Manual           Nov.16, 1994              Page 15 of 22


                        people used to EDIT.SV)   although the command
                        `.P' is permitted.

        7.15. Quit edit with current page

        Q               This command is identical to the  `E'  command
                        7.5. (Pg. 13) except that the remainder of the
                        input  file is NOT  copied over  to the output
                        file.   The current text buffer,  however,  is
                        written out to the output file before  closing
                        the output file.

        7.16. Read Page

        <pe>R           If <pe> is omitted,   the next page of text in
                        the  file  is read  and appended to the end of
                        the text in the current buffer.   Text in  the
                        current buffer is NOT lost.   If <pe>  is pre-
                        sent, it specifies the maximum number of lines
                        to be read into the buffer.  For example,  the
                        command `12R' means that ICE can read up to  a
                        maximum  of 12 additional lines from the input
                        file into the current buffer.  ICE will always
                        stop when a form feed character is found.  The
                        positioning element  provides a convenient way
                        of adding  more  text to  the  current  buffer
                        without the danger of filling up the text buf-
                        fer too full.

        7.17. Search Line

        <pe>S           This operation is somewhat similar to the line
                        search feature of OS/8 EDIT.   After this com-
                        mand is issued, ICE waits for the search char-
                        acter to be typed (the search character is not
                        echoed).  After the search character is typed,
                        ICE  echoes each character  on the line  until
                        the search character is found. Once found, new
                        characters can  be typed and inserted  at that
                        point,   or  special control characters can be
                        used:

                        LF              Echo  back  the  entire  line,
                                        eliminating  all  rubout codes
                                        (for non-CRT terminals)
                        CR              Close off the current  line at
                                        this point and  return to com-
                                        mand mode.
                        Control/L       Find  the  next occurrence  of
                                        the  specified  search   char-
                                        acter.
                        Control/G       Allow  a  new search character
                                        to be entered  after  the Con-
                                        trol/G and continue the search
                                        for it. Typing two Control/G's
                                        in  a  row provides the normal
                                        way of allowing the  remainder
                                        of the line to be copied over.
I C E:  V-6e  Manual           Nov.16, 1994              Page 16 of 22


                        ALT or ESC      Echo and  copy  over  the next
                                        character  on  the  line  reg-
                                        ardless of what it is.
                        Control/K       Delete the  word/field to  the
                                        left of the current position.
                        Control/P       Abort the line search,  return
                                        to command mode  and leave the
                                        line unchanged.
                        Rubout          Delete  one  character  to the
                                        left of the current position.

        7.18. List Text on Printer

        <pe>,<pe>V      This command  is  identical to the `V' command
                        except that the  specified  block  of text  is
                        listed on the line printer.   ICE  assumes the
                        presence of a  line  printer on device address
                        66.   Note that the standard OS/8 line printer
                        handler is NOT used for this command, so there
                        may be  some difficulty if the printer  is not
                        on a standard interface.

        7.19. Where is the Pointer?

        W               ICE prints out three values as shown below:

                        C=aaa   `aaa' represents the current  physical
                                line in the  buffer where ICE's inter-
                                nal line pointer is located.

                        L=bbb   `bbb' represents  the line  number  of
                                the last  line  in the  buffer  and is
                                therefore  the count of  the number of
                                lines of text in the buffer.

                        S=ccc   `ccc' represents the space left in the
                                buffer  in  terms  of  the  number  of
                                character  positions  that  are  still
                                free.   Note that for each line,   two
                                character positions are  used  for the
                                original page/line number information.

        7.20. Delete text with verification

        <pe>,<pe>X      This command  is  identical to the `L' command
                        7.11. (Pg. 14),  except that after listing the
                        block of text, ICE prints ``DELETE?'' at which
                        point typing a  `Y' deletes that block of text
                        just as if a `D' command had been used. Typing
                        any  other character causes  ICE  to return to
                        command mode  without deleting  the  block  of
                        text.  This is the normal way of deleting text
                        when a  CRT is used for editing since the user
                        can always  verify that the  correct block  of
                        text is being deleted.

I C E:  V-6e  Manual           Nov.16, 1994              Page 17 of 22


        7.21. Position without writing Text

        <pe>,<pe>Y      This command  is  identical to the `L' command
                        7.11. (Pg. 14), except that when it is time to
                        write out the input buffer  (during the search
                        for the positioning element), nothing is writ-
                        ten  to the output file--the current buffer is
                        always zeroed before  reading in the next page
                        of the input  file.   This command is commonly
                        used  in conjunction with the `F' command 7.6.
                        (Pg. 13)   when  text  is  being  merged  from
                        another file.

        7.22. Set Context Count

        <pe>=           In this command, <pe> represents the number of
                        lines to be  listed on either side of the cur-
                        rent line when the `CL' command is used.   The
                        default value for the count is 3.

        7.23. List previous line

        <               This command  must  be entered  as  the  first
                        character on the line in command mode. No car-
                        riage  return is  needed since ICE immediately
                        lists the previous line,  updates the internal
                        pointer and returns to command mode.

        7.24. List next line

        >               This command is identical to the < command ex-
                        cept that  ICE lists the next line in the buf-
                        fer.

8. Function Keys

The  following  function keys are  always available in both  text  and
command mode and perform the following functions:

        8.1. Rubout key

        The rubout key deletes the character  immediately to the  left
        of  the current position.   For each character  deleted,   ICE
        prints out the contents of `DELCHAR' which is normally assemb-
        led to contain the sequence:   Control/H,   space,   Control/H
        (since  Control/H is the standard ASCII code for a backspace).
        If a CRT console is not available,   DELCHAR should be patched
        to contain a single backslash character. If the line is empty,
        the Rubout key will be ignored.

        8.2. Control/K Key

        The  control/K key deletes all  characters immediately  to the
        left  of  the current  position  until a space or TAB code  is
        found.  For each character that is deleted, ICE prints out the
        contents of DELCHAR as described above. If a TAB code is being
        deleted, ICE prints this sequence out for each space code that
        was originally generated by the TAB.  This feature is provided
I C E:  V-6e  Manual           Nov.16, 1994              Page 18 of 22


        for CRTs since it ensures that the cursor is always positioned
        correctly and that subsequent TAB codes are reconstituted cor-
        rectly.   If the character immediately to the left of the cur-
        rent position  is a  TAB  or space code,   it will be  deleted
        before the check is made for the terminating space or TAB.  In
        editing normal text,   the ^K key  has the effect of  a ``word
        delete.'' In editing programs,  the ^K key has the effect of a
        ``field delete'' key.

        8.3. TAB key

        The TAB key  (Control/I)   automatically  generates  the  app-
        ropriate number  of space codes to reach the  next tab stop on
        the console.  For this purpose, fixed tab stops are assumed at
        every 8 positions on the line.  TAB codes conserve space since
        the multiple spaces are  only generated  on  list commands and
        are not stored into the buffer. Care must be taken in perform-
        ing  searches since a TAB code is not considered  to be equiv-
        alent to a blank.

        8.4. Control/N key

        The  control/N key causes ICE to print  the contents  of `FP'.
        This function  is  essentially a user-defined  function  since
        `FP' can be patched to contain  up to  a 22 character sequence
        to  be  generated with  a  single keystroke.   ICE is normally
        assembled with the  sequence:   <Escape><E>  which performs an
        erase screen function on some CRTs.

        8.5. Escape or Altmode key

        The Escape or Altmode keys (ASCII codes 233, 375, 376) are all
        changed to an ASCII Escape code (233). Whenever an Escape code
        is to be printed on the console or printer, it is changed to a
        `$' character  in order to make it visible.   This also avoids
        causing  a problem  with  terminals  that  respond to  special
        Escape sequences when Escape characters are echoed on the con-
        sole prior to their entry into the text buffer.

        8.6. Control/U Key

        Typing Control/U causes ICE to  echo `^U' and  delete all  the
        text on the current line.   ICE moves down one line to allow a
        new line to be entered.

        8.7. Line Feed Key

        The line feed key is provided  as a  convenience for users who
        do not have a CRT console.   The line feed key causes the cur-
        rent  line to be echoed back on the console  with  all  rubout
        codes  and deleted characters removed (in  a manner similar to
        the OS/8 Keyboard Monitor).

        8.8. Carriage Return Key

        The carriage return key always closes off the current line and
        causes a CR/LF sequence to be sent to the console.  In command
        mode,   this key causes ICE to  execute the  command that  was
I C E:  V-6e  Manual           Nov.16, 1994              Page 19 of 22


        entered. Typing a Carriage Return alone in command mode causes
        ICE to move down a line and stay in command mode.

        8.9. Control/L Key

        This key causes ICE to return to command mode  if it was curr-
        ently in text mode.  If ICE was already in command mode,  this
        key function likes Control/U  except that  ICE remains on  the
        same line.

        8.10. Control/O Key

        This key causes any printing to stop (viz. from an `L', `V' or
        `M' command etc.). Also, if ICE is searching for a positioning
        element,  it will abort the search and return to command mode.
        The check for ^O is made every time ICE goes to write and read
        a page of text.   The ^O  key is  also used to set the special
        software latch governing the  use of lower case characters  in
        the text: 9.1. (Pg. 19).

        8.11. Control/C Key

        The control/C key causes an immediate return to the OS/8 moni-
        tor if ICE was in command mode.  If ICE was in text mode,  ICE
        returns to command mode first.  To exit from text mode,  ther-
        efore, ^C must be typed twice.


9. Use of Lower Case Characters

ICE  also contains rather  special  features for handling console ter-
minals that can generate  both upper  and lower case  ASCII  character
codes.  If the /A option is NOT used,  ICE will still allow lower case
alphabetic characters to be entered from the console.   However,   the
lower case letters will normally be folded to upper case before inser-
tion into the text buffer and before being echoed on the console.  The
features below can be  used to provide elegant  documentation of PAGE8
programs since  PAGE8 will  allow  lower  case  characters  in comment
fields.   To facilitate use of lower  case characters,   there are two
special rules that govern the  way in  which ICE handles  these  char-
acters:

        9.1. Control/O Latch

        Whenever a Carriage Return is struck, ICE sets the `lower-case
        latch' to force subsequent lower case characters to be  folded
        to upper case.  However, if Control/O is struck,  the latch is
        reset in  order to allow lower case characters  to be  entered
        for the remainder of that line.

        9.2. Slash or Asterisk

        If the first character on the  line is a slash or asterisk and
        ICE is in text mode,   ICE automatically resets the lower-case
        latch to immediately allow lower case characters to be entered
        without being folded. 
I C E:  V-6e  Manual           Nov.16, 1994              Page 20 of 22


10. Short Error Messages

        * L# *          Syntax error in line number

        * L? *          Line number not found (or already passed by)

        * S? *          Text string not found on search  (when a colon
                        is used as the separating character)

        * S# *          Syntax error in search  string  (missing slash
                        at the end of  the string,   or undefined code
                        after the ^ character).

        * EF *          End of file reached in the input file.

        * UC *          Undefined Command

        * RM *          No more room in the page buffer  for entry  of
                        text.   This message indicates  that  the last
                        line typed  in has  been discarded owing  to a
                        lack of space in the main text buffer.

        * F? *          File not found on `F'  command.   There was no
                        input file specified in that position.

        * F# *          Syntax error in file number on `F' command.

        * CL *          Close error:   OS/8 returned an error when the
                        USR CLOSE  function was issued by  ICE.   Also
                        caused if an attempt is made to create an out-
                        put file with  the extension `.TM',   see 3.2.
                        (Page 5).

        * P# *          Syntax  error   in   page   number   (original
                        page/line number positioning element).

        * P? *          Page number not found (or already passed).

        * ,; *          Bad separator between positioning elements, or
                        some other kind of syntax  error  in the  com-
                        mand. 
I C E:  V-6e  Manual           Nov.16, 1994              Page 21 of 22


11. Notes on Using the ICE Program

Notice  that ICE automatically  searches for a positioning  element by
executing implicit  `N' commands (unless  the  `Y'  command was used).
Several  examples  are provided below to assist the user in seeing how
ICE operates.

        11.1. Example #1

        Consider, for example, that the only change needed in a source
        program is to  delete line 56 on page 37 of the source file (a
        PAGE8 source listing might have indicated the extraneous  line
        at 1.37.56).

        .ED DEV:FILE
        ICE V-6A
        127 EXTRA BLOCKS
                FILE    PROGRAM TEST4 8/11/76
        #37.56D
        #E
        .

        Note that it  is not  necessary  to issue commands to find the
        right page and line number  since  all ICE commands allow  the
        positioning to be executed as part of the command itself.

        11.2. Example #2

        Insert page 2 of `FILEB' as the third page of `FILEA'

        .ED DEV:FILEA,FILEB
        ICE V-6A
        12 EXTRA BLOCKS
                FILE    FILEA -- TEST FILE
        #2N                             [write first 2 pages of FILEA]
        #2F                             [select FILEB now]
        #N                              [write out page 1 of FILEB]
        #1F                             [Get back to FILEA now]
        #3.1Y                           [skip to page 3 in FILEA]
        #E                              [and close it out]

        11.3. Example #3

        Move lines  10 through 15 in the current buffer to just before
        line 45 on page 33 of the input file.

        #10,15B                         [Save lines 10-15  of the cur-
                                        rent buffer in the save area]
        #33.45K                         [find line 45 of  page  33 and
                                        then insert the saved block of
                                        text just before that line]

        11.4. Example #4

        This example is just the same as the above except that we want
        to copy the lines over (i.e.  we don't want those lines erased
        from the current page).

I C E:  V-6e  Manual           Nov.16, 1994              Page 22 of 22


        #10,15B                         [Save lines 10-15 as before]
        #K                              [Restore  them  back   now  in
                                        their original position]
        #33.45K                         [now do the insert as before]

        11.5. Example #5

        This  is the same as example #3  11.3. (Pg. 21)   except  that
        lines 10-15 have to be moved from page 40 (i.e.   from a later
        point in the file).

        #40.10Y                         [Skip to line 10 in page 40
        2H      JMS     SUBR...         [Line 10, page 40 is listed]
        #.10,.15B                       [desired  block   of  text  is
                                        saved]
        #1F                             [Return to  1st  page  of file
                                        now]
        #33.45K                         [Insert the block of text just
                                        before line 45 in page 33]
        #40.10,40.15D                   [Now   delete  the   lines  we
                                        copied over]




12. ICE Memory Map

Field 0         0-6577          ICE editor program and messages
                6600-7577       Input/Output Device driver area

Field 1         0-377           1 block buffer for input file
                400-777         1 block buffer for output file
                1000-1077       Save area  for string positioning ele-
                                ments
                1100-7577       Main text buffer. On intial load, con-
                                tains the intialization code  and  the
                                HELP file.   The text  buffer utilizes
                                the  right  8 bits for the ASCII  code
                                and the left  four bits  as flag  bits
                                (correction/deletion  flag,   original
                                page/line number flags etc.).

Field 2         0-7577          Block  save  area for the  `B' and `K'
                                commands

                Note that  if the `B' and `K'  commands are not  used,
                ICE will run in 8k of memory. Otherwise, 12k of memory
                is required. 