


                           *       *       *







                               P A G E 8

                             -------------


                              Version 7-B


                        PROGRAM REFERENCE MANUAL
                             --------------


                              Nov.16, 1994



                PAGE8  and  PAGE8 Manual Copyright  (C),
                1978 by DEWAR INFORMATION  SYSTEMS  COR-
                PORATION.  This manual may be reproduced
                in whole  or in  part provided  that all
                such  copies  contain   this   copyright
                                notice.







                This  manual was  generated with  DISC's
                Automatic cross-referencing and Indexing
                   Document generator program (ACID)






                 DEWAR INFORMATION SYSTEMS CORPORATION
                           1010 Executive Ct
                           Westmont, IL 60559
                        UNITED STATES OF AMERICA

                           Phone 708-850-4350

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  1 of 90


                           TABLE OF CONTENTS


1.        INTRODUCTION . . . . . . . . . . . . . . . . . . . . . .   3
1.1.        MACRO FACILITY . . . . . . . . . . . . . . . . . . . .   3
1.2.        AUTOMATIC PAGING . . . . . . . . . . . . . . . . . . .   3
1.3.        EXPRESSION ANALYZER  . . . . . . . . . . . . . . . . .   3
1.4.        CONSTANTS  . . . . . . . . . . . . . . . . . . . . . .   3
1.5.        ASSEMBLER DIRECTIVES . . . . . . . . . . . . . . . . .   3
1.6.        FIELD ADDRESSING . . . . . . . . . . . . . . . . . . .   3
1.7.        ERROR DETECTION  . . . . . . . . . . . . . . . . . . .   3
1.8.        CROSS ASSEMBLY . . . . . . . . . . . . . . . . . . . .   3
1.9.        CROSS-REFERENCE DIRECTORY  . . . . . . . . . . . . . .   4
1.10.       EXTERNAL SYMBOL DIRECTORY  . . . . . . . . . . . . . .   4
1.11.       LITERAL REFERENCE COUNTS . . . . . . . . . . . . . . .   4
1.12.       LOCAL SYMBOLS  . . . . . . . . . . . . . . . . . . . .   4
2.        USING PAGE8  . . . . . . . . . . . . . . . . . . . . . .   4
3.        PAGE8 RUN-TIME OPTIONS . . . . . . . . . . . . . . . . .   5
4.        PAGE8 CHARACTER SET  . . . . . . . . . . . . . . . . . .   8
5.        PAGE8 EXPRESSION RULES . . . . . . . . . . . . . . . . .   8
6.        PAGE8 OPERATOR PRECEDENCE HIERARCHY  . . . . . . . . . .   9
7.        PAGE8 SYMBOLS, CONSTANTS AND LITERALS  . . . . . . . . .  10
7.1.        SYMBOL . . . . . . . . . . . . . . . . . . . . . . . .  10
7.2.        SEQUENCE SYMBOL  . . . . . . . . . . . . . . . . . . .  10
7.3.        LOCAL SYMBOL . . . . . . . . . . . . . . . . . . . . .  10
7.4.        UNTYPED CONSTANT . . . . . . . . . . . . . . . . . . .  10
7.5.        TYPED CONSTANT . . . . . . . . . . . . . . . . . . . .  10
7.6.        SINGLE ASCII CONSTANT  . . . . . . . . . . . . . . . .  11
7.7.        DOUBLE ASCII CONSTANT  . . . . . . . . . . . . . . . .  11
7.8.        LITERALS . . . . . . . . . . . . . . . . . . . . . . .  11
8.        PAGE8 SOURCE STATEMENT FORMAT  . . . . . . . . . . . . .  11
9.        PAGE8 ERROR, WARNING AND STATUS FLAGS  . . . . . . . . .  12
10.       WARNING AND STATUS FLAGS . . . . . . . . . . . . . . . .  17
11.       OTHER PAGE8 ASSEMBLY ERRORS  . . . . . . . . . . . . . .  19
12.       GENERAL NOTES ON THE PAGE8 INSTRUCTION SET . . . . . . .  19
13.       ISZ AND INC  . . . . . . . . . . . . . . . . . . . . . .  21
14.       OPERATE INSTRUCTIONS . . . . . . . . . . . . . . . . . .  21
15.       SUBROUTINES IN PAGE8 . . . . . . . . . . . . . . . . . .  21
16.       PAGE8 LIST OUTPUT FORMAT . . . . . . . . . . . . . . . .  23
17.       CROSS REFERENCE DIRECTORY  . . . . . . . . . . . . . . .  23
18.       INDIRECT RUN-TIME REFERENCE OPERATOR . . . . . . . . . .  25
19.       PAGE8 MACRO PROCESSOR  . . . . . . . . . . . . . . . . .  25
19.1.       DEFAULT MACRO ARGUMENTS  . . . . . . . . . . . . . . .  27
19.2.       MACRO BODY STATEMENTS  . . . . . . . . . . . . . . . .  27
19.3.       SYMBOLIC CONCATENATION . . . . . . . . . . . . . . . .  27
19.4.       COMMENT FIELDS IN MACRO DEFINITIONS  . . . . . . . . .  28
19.5.       LABEL FIELD  . . . . . . . . . . . . . . . . . . . . .  28
19.6.       MACRO CALL LISTING . . . . . . . . . . . . . . . . . .  29
19.7.       BACKWARDS ASSEMBLY BRANCHES IN A MACRO . . . . . . . .  29
19.8.       INDIRECT, NUMERIC ARGUMENT REPLACEMENT . . . . . . . .  30
19.9.       INDIRECT, SYMBOLIC REPLACEMENT . . . . . . . . . . . .  31
19.10.      NESTING OF MACROS  . . . . . . . . . . . . . . . . . .  31
19.11.      MACRO CALLING SEQUENCES  . . . . . . . . . . . . . . .  31
19.12.      NULL ARGUMENTS . . . . . . . . . . . . . . . . . . . .  32
19.13.      MACRO LIBRARIES  . . . . . . . . . . . . . . . . . . .  32
19.14.      LOCAL MACRO SYMBOLS  . . . . . . . . . . . . . . . . .  33
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  2 of 90


19.15.      CHARACTER STRING PROCESSING  . . . . . . . . . . . . .  33
20.       PAGE8 DIRECTIVES . . . . . . . . . . . . . . . . . . . .  35
20.1.       AFIELD  (EXPRESSION) . . . . . . . . . . . . . . . . .  35
20.2.       AGO     (SEQUENCE SYMBOL)  . . . . . . . . . . . . . .  36
20.3.       AIF     (EXPRESSION),(SEQUENCE SYMBOL) . . . . . . . .  37
20.4.       ALIGN  . . . . . . . . . . . . . . . . . . . . . . . .  38
20.5.       ANOP . . . . . . . . . . . . . . . . . . . . . . . . .  39
20.6.       AREAD  . . . . . . . . . . . . . . . . . . . . . . . .  40
20.7.       AS      (EXPRESSION),(EXPRESSION)  . . . . . . . . . .  41
20.8.       BYTE    (EXPRESSION),(EXPRESSION)  . . . . . . . . . .  42
20.9.       CREF . . . . . . . . . . . . . . . . . . . . . . . . .  43
20.10.      DC      (EXPRESSION),(EXPRESSION),(EXPRESSION),... . .  44
20.11.      DI      (EXPRESSION) . . . . . . . . . . . . . . . . .  45
20.12.      DSEC . . . . . . . . . . . . . . . . . . . . . . . . .  46
20.13.      DSI     (EXPRESSION) . . . . . . . . . . . . . . . . .  47
20.14.      EJECT   (EXPRESSION) . . . . . . . . . . . . . . . . .  48
20.15.      END  . . . . . . . . . . . . . . . . . . . . . . . . .  49
20.16.      (SYMBOL) EQU    (EXPRESSION) . . . . . . . . . . . . .  50
20.17.      ERM  . . . . . . . . . . . . . . . . . . . . . . . . .  51
20.18.      ERROR:  (USER-DEFINED ERROR MESSAGE) . . . . . . . . .  52
20.19.      FIELD   (EXPRESSION) . . . . . . . . . . . . . . . . .  53
20.20.      FILE    (SOURCE PROGRAM NAME)  . . . . . . . . . . . .  54
20.21.      FREE    (EXPRESSION) . . . . . . . . . . . . . . . . .  55
20.22.      GAP     (EXPRESSION),(EXPRESSION),(EXPRESSION) . . . .  56
20.23.      ISEC    (EXPRESSION) . . . . . . . . . . . . . . . . .  57
20.24.      LFIELD  (EXPRESSION) . . . . . . . . . . . . . . . . .  58
20.25.      LINK    (OPERATION CODE) . . . . . . . . . . . . . . .  59
20.26.      LIST . . . . . . . . . . . . . . . . . . . . . . . . .  60
20.27.      LISTC  . . . . . . . . . . . . . . . . . . . . . . . .  61
20.28.      LISTM  . . . . . . . . . . . . . . . . . . . . . . . .  62
20.29.      LOAD . . . . . . . . . . . . . . . . . . . . . . . . .  63
20.30.      MACRO  . . . . . . . . . . . . . . . . . . . . . . . .  64
20.31.      MEND . . . . . . . . . . . . . . . . . . . . . . . . .  65
20.32.      MEXIT  . . . . . . . . . . . . . . . . . . . . . . . .  66
20.33.      MONR . . . . . . . . . . . . . . . . . . . . . . . . .  67
20.34.      (SYMBOL)  MSCAN  (EXPRESSION),(DUMMY MACRO AGRUMENT) .  68
20.35.      MSKIP  . . . . . . . . . . . . . . . . . . . . . . . .  69
20.36.      NOCREF . . . . . . . . . . . . . . . . . . . . . . . .  70
20.37.      NOLIST . . . . . . . . . . . . . . . . . . . . . . . .  71
20.38.      NOLISTC  . . . . . . . . . . . . . . . . . . . . . . .  72
20.39.      NOLISTM  . . . . . . . . . . . . . . . . . . . . . . .  73
20.40.      NOTE:   (USER-DEFINED MESSAGE) . . . . . . . . . . . .  74
20.41.      ORG     (EXPRESSION) . . . . . . . . . . . . . . . . .  75
20.42.      PAGE . . . . . . . . . . . . . . . . . . . . . . . . .  76
20.43.      PART . . . . . . . . . . . . . . . . . . . . . . . . .  77
20.44.      PUNCH   (EXPRESSION) . . . . . . . . . . . . . . . . .  78
20.45.      (SYMBOL) QUT (EXPRESSION),(EXPRESSION) . . . . . . . .  79
20.46.      RADIX   (EXPRESSION) . . . . . . . . . . . . . . . . .  80
20.47.      RET  . . . . . . . . . . . . . . . . . . . . . . . . .  81
20.48.      ROOM    (EXPRESSION) . . . . . . . . . . . . . . . . .  82
20.49.      (SYMBOL)  SET  (EXPRESSION)  . . . . . . . . . . . . .  83
20.50.      (SYMBOL)  SUB  (EXPRESSION)  . . . . . . . . . . . . .  84
20.51.      TEXT . . . . . . . . . . . . . . . . . . . . . . . . .  85
20.52.      TITLE   (USER-DEFINED SUB-TITLE) . . . . . . . . . . .  86
20.53.      UNLINK  (OPERATION CODE) . . . . . . . . . . . . . . .  87
21.       ALPHABETIC LISTING OF ALL DEFINED OPERATION CODES  . . .  88
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  3 of 90


1.  Introduction

PAGE8 is an extremely powerful two-pass macroassembler that runs under
OS/8 with the following special features:

   1.1.  Macro Facility

PAGE8  implements all of the features of large  scale assembler  posi-
tional macros, including forward and backward conditional and uncondi-
tional assembly branches, nesting,  concatenation and character string
manipulation. Macro libraries can be conventiently handled with PAGE8.

   1.2.  Automatic Paging

PAGE8 automatically and  optimally paginates the source input  program
so that the object code fits into the PDP-8 memory addressing scheme.

   1.3.  Expression Analyzer

PAGE8 contains an expression analyzer that analyzes expressions accor-
ding  to standard  rules  of precedence.   Parentheses may  be used to
change the order of evaluation. 5 arithmetic, 3 logical, 6 relational,
2 shift and several special unary operators are provided.

   1.4.  Constants

PAGE8 handles binary,   octal,   decimal and hexadecimal constants  in
addition to two types of ASCII constants.

   1.5.  Assembler Directives

PAGE8 contains an extensive set of more  than 50  assembler directives
that can be used to control all phases of the source assembly.

   1.6.  Field Addressing

PAGE8 treats the PDP-8 as a 32K processor  and provides full assembler
support for symbolocally addressing all of the available memory.

   1.7.  Error Detection

PAGE8 incorporates a comprehensive error detection, warning and status
scheme that  flags  virtually all symtactic  errors and  many semantic
errors in the source program.  Once detected, remedial action is taken
whenever  possible to ensure that the final object code can be  easily
patched.

   1.8.  Cross Assembly

With its extensive features,  PAGE8 can actually be used (and HAS been
used) as a reasonable macro assembler for other computers.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  4 of 90


   1.9.  Cross-Reference Directory

PAGE8  automatically  supplies a detailed croos-reference directory to
supplement the listing pass output.  All errors, warnings and symbolic
references are collated.   In the case of a symbolic reference,  flags
are posted indicating  whether the reference could change the value of
the addressed location (i.e.  a destructive reference) and the type of
reference (literal, I/O, field reference etc.).

   1.10.  External Symbol Directory

As a run-time option,   PAGE8 has the capability of generating  an ex-
ternal symbol directory of all symbols,  or just global symbols,  that
were defined in the program. This symbol directory can then be used as
an input source file to assemble  other programs that need the  values
of those defined symbols.

   1.11.  Literal Reference Counts

When the current page literal pool is output,   PAGE8 lists a count of
the  number of references that used that  literal.   This is extremely
useful when patches  are being  made since the  programmer  can be im-
mediately  alerted to a possibly  unexpected  use  of the same literal
elsewhere on the page.

   1.12.  Local Symbols

PAGE8 incorporates local symbols  which  relieve  the programmer  from
having to  invent symbolic labels that have no meaning in the program.
In  addition,   PAGE8  posts reference counts to  local  symbols which
specify the number of times that local symbol has been referenced. 
2.  Using PAGE8

The PAGE8 assembler requires an OS/8 system with a  minimum of  16K of
memory on either a PDP-8/e or PDP-8/I type computer. Separate two-page
device  handlers are permitted for both input and output.   All of the
available memory above the first 12K of program space is  used for the
master  symbol  table  (unless an explicit memory  directive has  been
issued to OS/8).   This allows about 700-850 symbols in each 4K memory
field under normal conditions.

When called, the PAGE8 assembler brings in the OS/8 Command Decoder to
get a file specification list for the assembly.   PAGE8 will also sup-
port a  direct call from OS/8 CCL if "PAGE8" is substituted for "PAL8"
in the appropriate CCL tables.

Up to three output and nine input files may  be entered to the Command
Decoder.   The first output file is for the binary output  and is gen-
erated in a format suitable for the standard binary loader or the OS/8
ABSLDR program.   The  second and third output  files are used for the
listing.  If the second output device fills,  PAGE8 automatically out-
puts and End-of-File, closes the file and switches to the third output
device.

The pass 3  list output should be on a device other than SYS:,   since
SYS:  is used for the temporary cross-reference file (CROSS.TM)  which
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  5 of 90


is also build during pass 3.   Failure to observe this precaution will
result in a totally scrambled listing and cross-reference directory.

If  a carriage return  is typed after the *  of the  Command  Decoder,
PAGE8  outputs a two page help file on the master terminal.   Striking
any character on the keyboard suppresses the listing of the help file.
The help file contains a list of all the error flags and their meaning
along with a list of all the run-time options in PAGE8.

At the start  of  each pass,   PAGE8 identifies the pass on the master
terminal.   If no object code is to be generated,  PAGE8 proceeds dir-
ectly to pass 3.   Three passes are only needed  when both  the object
code and assembly listing are to be generated at the same time. At the
end of the third pass,   PAGE8 chains to  the program HPSORT.7A  which
handles the sort/merge  of the cross-reference file  and generates the
cross-reference directory and external symbols directory (depending on
the run-time options that were in effect).

The  current assembly location counter is displayed in the MQ register
if one exists.   Due to the complexity of this assembler,  the rate at
which source statements are processed is  somewhat slower than PAL8 on
small programs.  On large programs,  or programs where there is a sig-
nificant crross-reference directory, PAGE8 is considerably faster than
PAL8.  Unlike CREF,  PAGE8 can handle arbitrarily large programs since
an external sort (modified TREESORT4)  is used for the cross-reference
directory.

The source program syntax is slightly different from that of PAL8.  If
an  existing PAL8 program is to be assembled under PAGE8,   some minor
conversions will be needed. In almost all cases, however, such conver-
sions can be quickly handled with the TECO editor program.

Although any text editor  program can be used  to  prepare  the source
program (such as TECO or EDIT),  there are several advantages in using
DISC's ICE editor (Intelligent Correction Editor).  ICE command syntax
is virtually identical to EDIT,   but has  the  advantage of being far
faster, providing automatic file backup and space warning, in addition
to keeping track of  both the new  and the original line numbers in  a
program.   Furthermore,   the ICE editor can post flags on modified or
deleted statements which are then picked up by PAGE8 and posted on the
assembly listing as warnings.   This way,  the programmer has a cross-
reference of all modified and deleted statements from the most  recent
editing pass through the source program. 
3.  PAGE8 Run-Time Options

The  following special  run-time  options may be  used in the  command
string typed in to the OS/8 Command Decoder:

        /A  Abort assembly upon detecting an error  in the source pro-
            gram.  The line in error is listed before PAGE8 returns to
            the OS/8 Keyboard Monitor.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  6 of 90


        /C  Remove all comment  fields and comment statements from the
            list output.

        /D  Generate  an external symbol directory of all symbols used
            in the program.   HPSORT generates an external symbol dir-
            ectory file on the system device (SYS:) with the extension
            of .SD.   This file can then be used as  an input file for
            subsequent assemblies of programs which  need  this set of
            equivalences.   If there  is no  name for the pass  3 list
            output file (viz.  LPT was used as the output device), the
            file is given the name: NONAME.SD.

        /E  List all  the pass  1  errors and/or pass  1 output on the
            pass 3 listing device  with the  same  file name  but  the
            extension of .LX. Pass 1 errors are normally listed on the
            master terminal.

        /F  Replace the cross-reference directory with a simple symbol
            table  listing.   This feature  may be necessary  in cases
            where there is not sufficient room on  the  system  device
            for the temporary cross-reference file (CROSS.TM).  It may
            also  be necessary in cases where the  listing pass output
            has to be placed on the system device. In the latter case,
            it would be possible to  run the listing  and cross-refer-
            ence directory separately.

        /G  This  option is identical to  /D  except that  only global
            symbols are included in the external symbol directory.  /G
            is the normal option for general symbol directories.

        /H  Hexadecimal output.  If this option is chosen,  PAGE8 out-
            puts all  addresses and  assembled code in hexadecimal in-
            stead of octal on the final list output from pass 3.  This
            option is  useful to programmers  more familiar  with hex-
            adecimal than octal,   or when PAGE8 is  being  used as  a
            cross-assembler for a hexadecimal-oriented computer.

        /I  Generate an index  of contents.   This option  produces an
            index  of  all  the  FILE  and  TITLE statements with  the
            file/section/line numbers.   The index of contents is gen-
            erated during pass 1,  and the outputs appears on the pass
            3 list device  with the same file name but an extension of
            .LX.

        /J  List all  statements.   Normally statements such as EJECT,
            TITLE,  FILE,  LIST etc.   are not listed.   The /J option
            forces all statements to be listed.   Note that  even when
            statements are not listed,  the line numbers are correctly
            updated.

        /L  Suppress the entire  listing except  for  the  symbol dir-
            ectory.  Only NOTE:  statements and statements with errors
            will be listed.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  7 of 90


        /M  Assume that only an 80 column printer is available for the
            cross-reference directory. HPSORT normally uses the entire
            132 column width of a line printer for the listing.

        /P  Pass 1 list.   This option causes the pass 1 output to  be
            listed on the console (or on the output  device if  the /E
            option is  also included).   This is primarily an internal
            diagnostic tool, but it can be useful in debugging complex
            macros.

        /S  Suppress the listing of the symbol directory.   The symbol
            directory normally  appears on the pass 3 list device with
            the same name but the extension of .CF. The /S option does
            not inhibit generation of an external symbol directory via
            the /D or /G options.

        /T  Title suppression.   This option suppresses the listing of
            the PAGE8 title and subtitle lines.  Page ejects will also
            be suppressed.

        /W  Warnings as errors.   This option instructs PAGE8 to treat
            all warnings as errors.   Any warning statements will then
            be  flagged as errors and listing in all passes along with
            the error asterisks.   Combined with the /L option,   this
            provides a convenient way  of  getting a quick listing  of
            all statements on which warnings have been posted.

        /Y  Suppress listing  of un-referenced symbols in  the  symbol
            directory.   If a symbol is defined but never used,   this
            options inhibits the appearance of this symbol in the dir-
            ectory.   It is  most  useful when a large external synbol
            directory is being assembled along with a program. In this
            case there may be many definitions that  are not needed by
            the  program and the /Y  option prevednts their cluttering
            up the cross-reference directory.

        =   Set default page eject count. Normally, an EJECT statement
            without an expression is unconditional. If a default eject
            count is  supplied with this  option,   PAGE8 treats  such
            EJECT directives  as conditional page  ejects  (see  EJECT
            directive for more details on conditional page ejects). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  8 of 90


4.  PAGE8 Character Set

Numeric Characters:     digits 0-9
Alphabetic Characters:  letters `a' to `z' and `:'

Special Characters:

        *       Current location counter
        *-+/    Arithmetic operators
        =       Defines current page literal expression
        #       Defines a page zero literal expression
        .       Delimits logical, shift and relational operators
        .       Identifies a sequence symbol
        ,       Separates expressions
        '       Delimits a typed or ASCII constant
        ()      Delimits a parenthetical expression
        $       Identifies  a global or macro symbol or absolute  add-
                ress reference
        &       Defines an indirect run-time assembly reference
        %       Unary symbolic operator to extract field address
        "       Identifies a double ASCII constant
        ?       Unary symbolic definition operator or macro substitute
        <>      Delimits dummy macro arguments
        !       Identifies the listing line for a macro call
        ;       Delimits start of a strippable macro comment
        :       As the first character of a symbol,   inhibits appear-
                ance in the cross-reference directory

5.  PAGE8 Expression Rules

An expression consists of any number  of  symbols or numeric constants
separated  by  legal PAGE8 operators.   All expressions are  evaluated
accorlding to normal rules of precedence.   Operators at the same pre-
cedence level that are adjacent are evaluated from left to right.  The
normal order  of evaluation  may be altered by the use of parentheses.
Unary operators may appear before any symbols or numeric  constants or
parenthetic expressions.   If an expression is too complex  (excessive
nesting of parenthetic expressions etc.) the E error flag is posted. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page  9 of 90


6.  PAGE8 Operator Precedence Hierarchy

In  the table below,   1 represents the highest  precedence and 8 rep-
resents the lowest precedence.   All operators are listed in order  of
increasing binding power.

     OPERATOR   TYPE            PRECEDENCE      OPERATION
     --------   ----            ----------      ---------
        .XO.    Logical              8          Exclusive OR
        .OR.    Logical              7          Inclusive OR
        .AN. &  Logical              6          Logocal AND
        .LS.    Shift                5          Left Shift
        .RS.    Shift                5          Right Shift
        .LT.    Relational           4          Less than
        .LE.    Relational           4          Less than or equal
        .EQ.    Relational           4          Equal
        .NE.    Relational           4          Not equal
        .GE.    Relational           4          Greater than or equal
        .GT.    Relational           4          Greater than
        +       Arithmetic           3          Binary addition
        -       Arithmetic           3          Binary subtraction
        *       Arithmetic           2          Binary multiplication
        /       Arithmetic           2          Binary division
        .MO.    Arithmetic           2          Binary modulus
        +       Arithmetic           1          Unary addition
        -       Arithmetic           1          Unary subtraction 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 10 of 90


7.  PAGE8 Symbols, Constants and Literals

   7.1.  SYMBOL

A symbol consists of an alphabetic character followed by any number of
alphabetic or numeric characters.L There is  no limit on  the  length
and all  characters  are  significant.   Only the first 11 characters,
however, will appear in the cross-reference directory.

   7.2.  SEQUENCE SYMBOL

A sequence symbol consists of a  period followed by a symbol.   Unlike
address labels,   sequence  symbols  may be used in the label field of
almost all PAGE8 directives.

   7.3.  LOCAL SYMBOL

A local symbol consists of a digit from 0-9 followed  by an `H' (mean-
ing `here') in the label field. In the operand field, a digit from 0-9
is  followed by either an `F' (for `forwards')   or  a `B' (for `back-
wards')  in order to reference the next or previous local symbol lthat
has the same digit.   A detailed decription of local symbols and their
usage may be found in volume  1 of Knuth's `THE ART OF  COMPUTER  PRO-
GRAMMING'.   Local symbols may also be used in the label field  of the
SET,  EQU and QUT directives.   A local macro symbol is identical to a
normal local  symbol  except that it is prefixed  in all cases  with a
dollar sign ($).

   7.4.  UNTYPED CONSTANT

An untyped constant consists of a string of decimal digits whose value
lies in the range: 0-4095 (decimal).  Note that untyped,  decimal con-
stants are treated as signed numbers.  If the value of the constant is
greater than 2047 (decimal), the Z warning will bed posted to indicate
that a  sign change has  occurred.   The  value  of the constant will,
however, be correct.  The RADIX directive controls the base of untyped
constants (the default value is 10).   If the untyped constant  begins
with a leading zero,   this is tgreated as an alternate way of expres-
sing an octal  constant.   The  sign change warning  is not  posted on
untyped constants when the radix is something other than decimal.

   7.5.  TYPED CONSTANT

A typed constant consists of a  letter identifying  the  radix  of the
constant followed by a  string of  digits  or  hexadecimal  characters
(A-F)   in the range 0-4095 (decimal)   enclosed within single quotes.
Binary, octal, decimal and hexadecimal constants are allowed:

        X'FF'           Hexadecimal constant
        O'73'           Octal constant
        B'110110'       Binary constant
        D'984'          Decimal constant

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 11 of 90


   7.6.  SINGLE ASCII CONSTANT

A  single ASCII constant consists of a quote followed  by an character
from the PAGE8 character set.  All characters in the range 240 (octal)
to 337 (octal)   are allowed.   Character codes are generated with the
parity bit  always  set to 1.   Macros may be  used  to generate ASCII
constants with parity.

   7.7.  DOUBLE ASCII CONSTANT

A double ASCII constant consists of a double quote followed by any two
characters from the PAGE8 character set.  The two characters are trun-
cated to 6-bit ASCII and combined to form a single 12-bit value.   For
example, "QX would have the value 2130 (octal).

   7.8.  LITERALS

Any legal PAGE8 expression may be preceded by either an equals sign or
a number sign  to indicate that the  expression should be taken liter-
ally.  PAGE8 evaluates the expression, inserts the value into the app-
ropriate literal pool (either on the current page if `=', or page zero
if `#')   and uses the address of the  literal in  the operand  field.
Literals are allowed with any operation codes or directives.  Literals
can also be used to force explicit indirect memory references.  In the
event thatg the operand is located in a different memory field,  PAGE8
requires an explicit  indirect memory reference  to a literal in order
to avoid the posting of the K error flag  (illegal  cross field refer-
ence).

   For example:

        TAD     TABLE           would be  illegal  if TABLE is located
                                in a different memory field.
        TADI    =TABLE          would be  the  correct  method of ref-
                                erencing TABLE under these conditions.

8.  PAGE8 Source Statement Format

The source program for input to PAGE8  should adhere to the  following
specifications:

        1.  A  comment line  is  identified  by  the  presence  of  an
            asterisk (*)  or a slash (/)   in column one of the state-
            ment.   A blank line consisting of just  a  CR/LF  is per-
            mitted.

        2.  If a label is present, it must begin in column one; other-
            wise, column one should be blank. A comma is allowed after
            the label (as in PAL8) but it is not required by PAGE8.

        3.  The operation code must appear no later than 20  character
            positions after the last  character in the label field (or
            from column one, if there is no label on the statement).

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 12 of 90


        4.  The operand field  must appear no later than 10  character
            positions after the last character of the operation code.

        5.  The comment field is separated from  the operand field  by
            one or more blanks.   No special character is required  to
            identify the start of the comment field.   The only excep-
            tion to  the `one-blank' rule involves operation  instruc-
            tions.   Operate instructions must be separated  by two or
            more  blanks  from the comment  field since a single blank
            after  an operate instruction indicates that another oper-
            ate instruction is to be micro-coded.

        6.  If an optional operand field is omitted, the comment field
            should lie at least 10 character positions after the oper-
            ation code.

        7.  A  source statement should not  contain more than 80 char-
            actgers. If there are more than 80 characters, the remain-
            ing characters are stripped and the X warning flag will be
            posted.

        8.  Some of these specifications are slightly different inside
            a macro definition.   For example,  in a macro definition,
            comment fields are generally (but not necessarily)   deli-
            mited with a semicolon.   The documentation  on the  macro
            facility describes these differences in detail.

        9.  On input,   all lower case characters are  folded to upper
            case and are therefore legal.   Invalid control characters
            are replaced with a square bracket (]).

9.  PAGE8 Error, Warning and Status Flags

Error,   warning and status flags consist of a single  character  that
appears between  the line number and the address.   A maximum of  four
flags will be posted on a single line,  although the total error count
will continue  to  be  incremented  and cross-references  accumulated.
Error flags always  increment the error count and cause two  asterisks
to appear in the left margin; warning and status flags do neither. The
following error flags may be posted by the PAGE8 assembler:

        A  Autopaging exception error.   An attempt was made to refer-
           ence a symbol located on a page other than the current page
           or  page zero with an indirect memory reference.   A paging
           link is generated on the current  page with a value of zero
           and  an indirect reference assembled to it.   In PAGE8 pro-
           grams,  it is generally best to reserve a small set of tem-
           porary cells on  page zero through which  explicit indirect
           references may always be executed  without addressing  pro-
           blems.

        B  An attempt has been made to resetr either the assembly ori-
           gin or the  assembly field  backwards  within a given  ISEC
           area.   Due to constraints of automatic paging,  PAGE8 will
           not allow this to happen.   A HLT instruction is  assembled
           instead,   so  that  the  memory  address  can  be  readily
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 13 of 90


           identified.   Efficient  use of the two ISEC areas and  the
           relocation directives effectively removed this restriction.

        C  An illegal character was found in an expression  when PAGE8
           was scanning for an operand.   The most likly cause  of the
           error is  adjacent operators or an incorrect number of sub-
           expressions in the operand field.

        D  Duplicate  symbolic  label.   PAGE8 found a  symbolic label
           which had either been used previously as  a  label or which
           had been previously  defined via an  EQU,   QUT or SET dir-
           ective.

        E  Expression  is too complex (expression analyzer stack over-
           flowed).   The expression must be broken down  into two (or
           more) simpler expressions.

        F  Error in number of Fields.  PAGE8 found an incorrect number
           of expressions in the operand field of a statement.  If too
           many,  the extra expressions were ignored.   If too few,  a
           value of zero was return for each missing expression.

        G  Group error on microcoded operates.   One (or more)  of the
           operate instructions microcoded does not belong to the same
           group as the first operate instruction.   This flag is also
           posted  if the operate instructions are  in  the same group
           but have incompatible bit assignments.   A halt instruction
           is assembled instead.   The error may also have been caused
           by a failure to  leave at least two blanks between the last
           operate instruction  and the start of  the  comment  field.
           NOTE:   PAGE8 does not permit HLT to be microcoded with and
           skip instructions  (use  DSI  or a macro in the rare  event
           that a microcoded HLT instruction is needed).

        H  An illegal character was found in a typed constant.   PAGE8
           returns a value of zero for the constant.   This error flag
           is also  posted if a  carriage return is found  immediately
           after thke single or double quote of an ASCII constant.

        I  Illegal operand displcement. PAGE8 requires that the absol-
           ute displacement from the  first symbolic tag in an operand
           field of  a  memory  reference instruction  be less than or
           equal to 77 (octal)  (paging adjustment restriction).   For
           example,  a statement such as `JMP *-0123' is illegal while
           `JMP TABLE+040' would be perfectly legal.

        J  PAGE8 fould that the operand field of a RET directive (ret-
           urn from subroutine) contained a symbolic address which had
           not been defined as  a  subroutine entry point via the  SUB
           directive.

        K  Memory field overflow or  illegal field reference.   In the
           first case, PAGE8 found that the next available memory page
           was located in the next memory field. PAGE8 requires use of
           the  FIELD  directive to switch to  the  next memory field.
           After  posting  the  error  flag,   PAGE8 sets the assembly
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 14 of 90


           location counter back to  zero and moves to the next memory
           field. Under such conditions, the generated object code and
           assembly listing will be invalid (in particular, this error
           condition cannot be used as an ingenious method of overcom-
           ing  the restriction about  setting the  assembly  location
           backwards).

           In the  second case,   a reference was found  to a location
           that  could  not be legally referenced due  to memory field
           addressing problems.  For example,  a source statement con-
           tained a  direct memory reference  instruction  to a tagged
           location in a different memory field.   It should have been
           coded as an indirect memory reference through a literal.

        L  The page zero literal pool is full. The literl in the stat-
           ement on which this flag was posted  has not been stored in
           the literal pool on page zero. Page zero literals are built
           down from location 177 (octal)   to the highest location on
           page zero where object code was generated.   In  any event,
           the page  zero literal pool may  not  go  below location 20
           (octal)  because unexpected problems can arise if a literal
           is stored in an auto-index register location.

           This error flag is also posted  if a literal is encountered
           in  a  subexpression  of  a  DC or subroutine call constant
           list.

        M  Macro definition syntax error. This error could be cause by
           a missing MEND directive, illegal use of the angle brackets
           or an illegal statement within the macro definition.   This
           error flag will also be posted if a MEND or MEXIT directive
           is  encountered  outside  of a macro or if the maximum per-
           mitted nexting level (which is 3) is exceeded during expan-
           sion of the innermost macro.

        N  Numeric error. This error flag may be posted for any one of
           the following three reasons:
                (1)  an attempt  was made to divide  by zero in an ex-
                     pression.  In this case,  a value of zero is ret-
                     urned for the entire expression.
                (2)  a  non-existent  radix designation was  used in a
                     typed constant (the only legal  designations are:
                     B, D, O and X).
                (3)  the value of the operand  to an LDI  directive is
                     invalid--there is  no combination  of  microcoded
                     instructions that can generate  the desired  con-
                     stant.

        O  Undefined operation code.  Apart from an obvious error, the
           following possibilities should be checked:
                (1)  a macro  definition  for that  operation  code is
                     missing.
                (2)  a blank line  had  one or  more blanks before the
                     carriage return, line feed.
                (3)  an UNLINK directive had been issued at some point
                     to  remove  the  operation  code definition  from
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 15 of 90


                     PAGE8.

        P  An undefined or illegal operator was encountered  in an ex-
           pression.   A value of zero  is returned for the entire ex-
           pression.  A value of zero is return for the entire expres-
           sion. Another common cause for a P error is a syntactically
           incorrect local symbol--a  single digit  followed by an `F'
           or a `B' identifies a local symbol.   If  a character other
           than `F' or  `B' is present,   PAGE8 treats it  as a single
           digit decimal constant followed by an illegal operator.

        Q  Illegal forward reference. The operand field for this oper-
           ation  code must only contain symbols which  have been pre-
           viously defined. The value of the expression is always zero
           regardless of which pass the assembler is in.   Unlike most
           assemblers,  PAGE8 is not subject to phase errors caused by
           illegal forward references. Predefinition (i.e.  definition
           of all symbols in a prior source statement) is required for
           all of the following directives: EQU, QUT, SET, MSCAN, ORG,
           FIELD, AS, GAP,  FREE,   AIF and ROOM.   In addition,   the
           statement:  `(Symbol)  QUT %*,*' is illegal in an ISEC area
           (but legal in DSEC).   This latter restriction is necessary
           in order  to  avoid  obscure but  hightly undesirable page-
           addressing errors.

        R  Redefinition error.  An attempt has been made to redefine a
           symbol with an EQU or QUT directive.   Or,   an attempt was
           made to redefine  a symbol with SET/MSCAN that had not ori-
           ginally been defined with a SET or  MSCAN  directive.   The
           value of the symbol remains unchanged.

        S  Error  in  symbolic label.   This error flag  may be posted
           under any one of the four following conditions:
                (1)  the directive in the operation code field is not
permitted to have a label field.
                (2)  the label does not begin with an alphabetic char-
                     acter  or does not  have  the correct form  for a
                     local symbol.
                (3)  the label is missing in a directive that requires
                     a label such as SET, EQU, QUT or MSCAN.
                (4)  the  operation code field  contains  a call  on a
                     macro  whose definition did  not contain a  label
                     specification.

        T  Truncated value. The expression in the operand field is too
           large for the specified operation code.   The  value of the
           expression is truncated to the correct size by masking.

        U  Undefined  symbol.   A  source statement contains a  symbol
           which has never been defined in  the source program.   Such
           symbols always have a value of zero return for them.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 16 of 90


        V  Table overflow.   The master  symbol table has exceeded the
           memory capacity of the computer on which the source program
           is being assembled.  Assembly continues but no more symbols
           can be defined.  On subsequent passes, such symbols will be
           treated as  undefined symbols and the U error flag  will be
           posted.   This error  flag could also be posted  in the ex-
           tremely  unlikely  event that too  many local symbols  were
           used (limits: main program: 1024 (decimal)  for each digit;
           macro next levels  one and two:   512 (decimal)   for  each
           digit;   macro next level three:   256 (decimal)   for each
           digit).

        Y  Either there is no more room for an entry in the object gap
           tables (error flag posted on GAP  directive)   or  a syntax
           error was encountered in a sequence symbol (error flag pos-
           ted on an AGO or AIF directive).

        Z  Arithmetic overflow  occurred during  the  evaluation of an
           expression.  A value of zero is returned for the expression
           in such cases. Overflow can occur as the result of a multi-
           plication, or during the evaluation of a constant. Overflow
           and underflow can occur during shift operations.   To avoid
           an error flag on shifts, the operand should be masked first
           to  ensure that only zero  bits  are lost during the  shift
           operation.

        $  Missing  sequence  symbol  or missing MEND  directive on  a
           macro. An END directive (or EOF on the last input file) was
           encountered in a  macro definition,   or while the assembly
           was turned off. If a missing sequence symbol was the cause,
           the sequence symbol for which PAGE8 was searching is listed
           immediately above the flagged line.

        )  The parentheses in an expression do not balance. A value of
           zero is returned for the entire expression.

        #  Missing argument on macro call. A macro call was missing an
           argument required by the macro definition, or for which the
           macro definition  included no provision for defaulting  its
           value if omitted on the macro call.

        *  Internal  pagination phase error.   An internal phase error
           has occurred in paging the source program (the literal pool
           and  assembled  code  have collided  on the current page in
           pass 2).   Pagin phase error can only  occur in conjunction
           with some  other  kind of highly fatal error such as memory
           field  overflow or invalid usage of the UNLINK directive or
           the special `&' run-time reference operator.

        <  Macro syntax  error.   A macro definition was found  with a
           syntax  error involving the use of the dummy argument deli-
           miters.   The  most  likely  cause would be unmatched angle
           brackets.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 17 of 90


        %  Infinite loop.  More than 4095 (decimal)  assembly branches
           have been taken at a single nexting level in a macro expan-
           sion.   Under such condition,   an infinite loop in a macro
           definition  seems to be almost certain.   PAGE8 exists  the
           macro expansion regardless of the current nexting level.

          Illegal unprotected statement. The flagged statement must be
          protected with a ROOM directive in an ISEC area.  Generally,
          the problems lies in a sequence of statements  which must be
          protected in order to ensure that a bad page break  will not
          occur. The most common examples include:
                (1)  a CIF or CID instruction that  is not immediately
                     followed with a JMP or JMS.
                (2)  two or more consecutive skip instructions.
                (3)  an  unprotected call to a subroutine  whose entry
                     point has been destructively referenced (indicat-
                     ing that either a  parameter list follows in sub-
                     sequent statements  or  that  there are  multiple
                     exit points on the return).

           In the event that a ROOM directive is not actually required
           (possible in some unusual cases), the programmer can simply
           insert an ANOP statement in front of the flagged statement.
           This will suppress generation of the error flag.

        ?  Absolute  addressing  error.   In order to trap out obscure
           semantic errors caused by a missing  = or # on an  intended
           literal reference, PAGE8 insists that absolute operand add-
           resses be preceded with the $ operator.   For example,  the
           statement:

                AND     077

           will be flagged  as an error since  it is very likely  that
           the intended statement was:

                AND     =077

           where the 077 is a literal. If a reference to location 0077
           was actually intended, it should be coded as:

                AND     $077

           (the $ signals PAGE8 that the 077 is a location).

10.  Warning and Status Flags

        W  Address Warning.   The instruction has been assembled  cor-
           rectly but may not assemble correctly in the future because
           of page addressing problems.   This warning would be posted
           if  there was an indirect memory reference through a  loca-
           tion  on the current page.   In future assemblies the  page
           break may  occur at  a different place  at which  time  the
           reference could become illegal (and the A error flag  post-
           ed).   Judicious use of  the ROOM and ALIGN  directives can
           prevent any problems arising in the future.
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 18 of 90


        X  Source statement truncate warning.   A line of more than 80
           (decimal) caharacters has been found.  All additional char-
           acters after the 80th character are stripped until a carri-
           age return is found.  The statement is then processed norm-
           ally.

        +  Forwards address adjustment.   This is a status flag to in-
           dicate that the actual numeric valued of the operand  field
           has  been recalculated and adjusted forwards to account for
           the space taken up by the current page literal pool.

        -  Backwards address adjustment.   This status flag  indicates
           that the actual numeric value of the operand field has been
           recalculated  and  adjusted  backwards  to account  for the
           space taken up by a current page literal pool.

        '  Indirect paging link.   This status flag indicates  than an
           indirect paging link has been generated by PAGE8  on a dir-
           ect memory reference  instruction.   If  the  memory  field
           specified in the most recent AFIELD directive (or  default)
           differs from the current  assembly field,   PAGE8 will adi-
           tionally post the K error flag (illegal memory field refer-
           ence).

        ?  Dubious syntax/possible semantic  error.   PAGE8 posts this
           warning  flag when it  finds a statement of doubtful  vali-
           dity. For example, the statement:

                DCA     =TEMP

           is syntactically correct but semantics indicate that it was
           probably intended to be:

                DCAI    =TEMP.

           This warning  may  also be posted  when an external  memory
           reference has  been made to a  location within the  current
           memory field. In any event, PAGE8 assembles the instruction
           according to the specified syntax of the statement.

        [  Protected range.   This status flag is posted on any state-
           ment producing  object code  that PAGE8 determines is still
           contiguously protected by  the most recent  ROOM directive.
           Due  to the complex internal processing of ROOM directives,
           the programmer is advised to  examine PAGE8's determination
           of protection  ranges rather  than  relying on  any  simple
           empiracal rules.

        0,2,3,4,5,6,7
           Local symbol  reference  counts.   The digit identifies the
           number of references  made to the local symbol in the label
           field of  the statement on  which the  count is posted.   A
           count of 7 is used to  indicate 7 or more references to the
           local symbol,   while 0 indicates a likely error--there are
           no references to this symbol. A count of 1 is considered to
           be the most  common case,   so no count is posted  in  this
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 19 of 90


           case.   These warnings are provided in addition to the PART
           directive to aid the programmer in overcoming the most com-
           mon error in the use of local symbols--a missing label will
           not  cause a U error  flag to be posted if there is another
           identical label  at a previous or subsequent statement that
           can be referenced without crossing a PART directive.

        Z  Sign change.  This flag is posted on untyped,  decimal con-
           stants whose value exceeds 2047 (decimal)  but is less than
           4095 (decimal)   to alert the  programmer  that this number
           will be considered a  negative  number in two's  complement
           arithmetic.   This warning flag is also  posted  if  a sign
           change occurs following the multiplication of two numbers.

        @  Edit/deletion change.   If the  source program was prepared
           with DISC's ICE editor,   this warning flag  indicates that
           the  current statement during the last edit cycle (1)   was
           modified or (2) follows statement(s) that were deleted.

11.  Other PAGE8 Assembly Errors

        USER ERROR 8 AT xxxxx

           This error message indicates that PAGE8 ran out of room  on
           the output device. Assembly is aborted.

        USER ERROR 5 AT xxxxx

           This error message indicates that PAGE8 could not load  the
           device handler. Assembly is aborted.

        USER ERROR 9 AT xxxxx

           An OS/8  device handler return a  fatal I/O error status to
           PAGE8. Assembly is aborted.

        NO CREF

           PAGE8 ran out of room on the system device  (SYS)   for the
           temporary cross-reference file (CROSS.TM).   A cross-refer-
           ence directory cannot be supplied.   Assembly continues and
           PAGE8  set  the /F option so that a  simple directory  with
           reference counts will be supplied instead.

12.  General Notes on the PAGE8 Instruction Set

PAGE8 recognizes  most of  the standard PAL8 mnemonics.   One  general
departure involves memory references. Separate operation code are pro-
vided for indirect memory references, so that one writes 'TADI' rather
than 'TAD I'.   On CIF,  CDF and CID operation codes the operand field
should  contain a memory field designation in the range 0-7 (not 10 to
70 as in PAL8).

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 20 of 90


External memory references are provided with TADX, DCAX,  ANDX,  INCX,
JMSX and  JMPX  in order  to facilitate cross-field memory references.
PAGE8 automatically supplies the correct CDF instruction and then gen-
erates  an indirect reference  through the  current page  literal pool
(CIF is generated for JMPX and JMSX).  Except for JMSX and JMPX, PAGE8
then  supplies another CDF instruction back to the field  specified in
the most recent AFIELD  directive (or to  the  current field if AFIELD
has not been used).   If the operand to TADX,  ANDX,   DCAX,   or INCX
contains a second expression,   PAGE8  treats  that expression  as the
memory field to which the first  CDF  is to be generated.   If none is
found,  PAGE8 supplies the field address of the referenced symbol,  or
if none, field zero.  In the case of a JMSX or JMPX instruction, PAGE8
generates the CIF  instruction but does  not generate  any other  code
other than the instruction itself.

The following examples demonstrate  PAGE8 syntax  on  external  memory
references and also show the expanded code generated:

        PAGE8 Instruction       Generated Code
        -----------------       --------------

        TADX    TEMP            CDF     %TEMP
                                TADI    =TEMP
                                CDF     %*
        AFIELD  3
        INCX    $010,6          CDF     6
                                INCI    =$010
                                CDF     3

        JMSX    SUBR,43,X'FF'   CIF     %SUBR
                                JMSI    =SUBR,43,X'FF'
                                (Note:   in the above example,   PAGE8
                                handles the page break problem.)

With the JMS,   JMSI and JMSX memory references,   a parameter list is
permitted on the same line separated by commas. The parameter list and
the assembled instruction(s)   are  then kept together  as a group and
PAGE8 ensures that  a  page break will not occur at that point.   Note
that instructions  are not permitted as parameters  in the sub-expres-
sion--a statement such as 'JMS SUBR,JMP ERROR' is not valid  in PAGE8.
Any addresses supplied as  parameters will be taken as absolute values
and  will not  be adjusted by the paging routines.   The point of this
latter  warning  is  that if a program  passes an  error address  as a
parameter, and that error address has an offset (such as ERROR+4),  it
is conceivable that the absolute address could  be  pointing into  the
literal pool (if ERROR was located at the end of a memory page).

If the restrictions above are too sever,   the subroutine call and its
arguments can be handled with a macro. The macro could then handle the
page break problem and additionally allow any  kind of instructions as
arguments.   Note also that the parameter list on a subroutine call is
treated just like a  DC  constant list--in particular,   literals  are
barred in sub-expressions in both cases.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 21 of 90


PAGE8 does not recognize any I/O instructions other than IOT and  IOS.
Unlike PAL8, PAGE8 syntax follows the actual architecture of the PDP-8
I/O instructions:   the operand field  contains a 6-bit device address
followed by a 3-bit device instruction field.   In this way the device
address can  be equated symbolically and easily  changed.   The device
instruction  field is  always constant for  a particular device.   For
example,   the instruction  'KSF' of PAL8 would  be coded in PAGE8 as:
'IOS 3,1'  and the instruction 'TLS' as 'IOT  4,6'.   Note that IOT is
used for non-skip I/O instructions while IOS must be used for skip I/O
instruction.   This distginction is required to avoid bad page breaks.
If  the programmer  prefers the standard PAL8 syntax,   macros may  be
written to allow compatibility.

13.  ISZ and INC

PAGE8  allows a distinction to  be made in connection with the use  of
the ISZ instruction.  When an ISZ instruction is being used purely for
the purpose of  incrementing a memory location,   and there is no pos-
sibility (or no intended possibility!)  of its skipping,  it is desir-
able to inform  PAGE8 of  this fact.   When paging the source,   PAGE8
treats  ISZ specially since the  fact that it might skip requires that
there be room to assemble the following instruction. Otherwise, if the
ISZ were followed with the page escape,   the program could skip  into
the literal pool if the ISZ instruction skipped. Using INC forms PAGE8
that the  instruction  will not skip and it  would therefore  be quite
legal to follow  the INC with the page escape jump instruction.   Con-
sider the example below which occurs frequently at the end of  a  pro-
gram loop:

        INC     PTR             Step pointer to data
        ISZ     CNTR            Step loop counter, test for end
        JMP     LOOP            Loop back for more to do

In this case,  a page break after the 'INC PTR' would be perfectly all
right. If an 'ISZ' was used instead (preceded with a ROOM directive to
avoid  unprotected multiple skip  instructions)   the page break might
unnecessarily occur in front of the first instruction above. Note that
the use of INC  is  not required--it  merely  allows  PAGE8 to  do  an
optimal job of the page packing.

14.  Operate Instructions

PAGE8 recognizes all the standard PDP-8 operate instructions. In addi-
tion,   PAGE8 recognizes a `pseudo-instruction':   LDI  for `load  im-
mediate'.   The operand field is evaluated and PAGE8 supplies the app-
ropriate  microcoded operate  instruction.   The  following values are
allowed in the operand  field (note that 64 is  only possible with the
PDP-8/e BSW instruction):

        1  2  3  4  6  -1  -2  -3  64  1024  2047  2048  3171  3172

15.  Subroutines in PAGE8

Because of the special  problems  of automatic  paging  and  the PDP-8
addressing  architecture,   special directives  are used to facilitate
subroutine entry and exits.   The SUB directive generates  an indirect
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 22 of 90


jump instruction followed by the actual cell for the entry point.   If
an off-page exit  is needed,   the RET directive will generate  an in-
direct JMP through a  paging  link  to the first JMP instruction  gen-
erated by the SUB directive. If the entry point is on the same page as
the RET directive,   RET generates an indirect JMP through the  actual
entry point to the subroutine.

The example below should clarify the use of SUB and RET directives:

        PAGE8 Instruction       Generated Object Code
        -----------------       ---------------------
   PROCESS  SUB  (expr)                 JMPI  *+1
                                PROCESS DC  (expr)

             RET  PROCESS               JMPI  PROCESS  (On-page)
     -----------------------------------------------------------
   CALC     SUB                         JMPI  *+1
                                PROCESS  HLT

             RET  CALC                  JMPI  =CALC-1  (Off-page)

Note  that SUB can take an optional expression  to be generated at the
entry point.   If none is supplied,  PAGE8 assembles a HLT instruction
instead.

PAGE8 keeps track of whether there has been a destructive reference to
the entry point of a subroutine in order to catch unprotected calls. A
destructive reference (such as  ISZ,   etc.)   indicates that the sub-
routine either has an argument  list,   or may have several  different
return points.   If so,  and the parameters are not in line (as a con-
stant list),  PAGE8 insists that the JMS(X)   be protected with a ROOM
directive (although  PAGE8 cannot  check  that  the correct number  of
statements is being protected).

Occasionally, however,  the destructive reference may not actually in-
dicate that the subroutine call  has to be protected.   A very typical
case would occur  with  the initialization of co-routine entry points.
Advantage can be taken of the fact that PAGE8 checks for an  offset in
the  operand  field of the  destructive instruction but does not check
the value of  that offset.   If there is an offset to  the  subroutine
address,  PAGE8 reasonably assumes that the reference does not involve
the actual entry point to the subroutine.  This fact provides a simple
way  of   avoiding  the  check  for  a  protected  call  to  the  sub-
routine--simply by appending +0 to the reference.   For example,  when
initializing  the entry  point to a coroutine  with a DCA instruction,
the following statement could be used:

        DCA     PROCESS+0

PAGE8 will not consider the above statement to be a destructive refer-
ence to the PROCESS subroutine.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 23 of 90


16.  PAGE8 List Output Format

The assembled list  output from PAGE8 includes the FILE and TITLE text
strings at the head of each page.  On a typical source statement,  the
first numeric field is the three part line number. The first number is
the current input file number (0-9).   The second number is the `page'
number as delimited by  form feed characters generated byh  the editor
program (ICE, TECO,  EDIT).  If no form feed characters are present in
the  input sourcd program,   a  `page' is considered to consist of 999
lines. The third number is the line number within that page.

The second numeric field is the full 5 digit address field. If reloca-
tion is in effect,  an asterisk will be lposted after this field.  The
third field contains the assembled object code.

On the dump of the literal pool (current page or page zero),  a fourth
numeric field  appears  which  contains  the current/zero page literal
reference count.  Note that this field is in the_ current output radix
(octal or hexadecimal)  and not in decimal.   When patching entries in
the literal pool, this field makes it easy to avoid patching a literal
which is  referenced elsewhere  on the lpage possibly  for a different
purpose (it might also be used as a paging link, for example).

Page  zero literals are  dumped whenever a FIELD  or END  directive is
encountered, or when the end of the last input field is reached. In an
ISEC area, the last assembled instruction on each PDP-8 page is a 5777
(octal)   which  provides the escape to the first location in the next
page (or next available page if  the next  page falls in an object gap
and the current program sections lies in ISEC 0).

Error flags and warnings are posted between the three part line number
and the address field.  Up to four flags may be posted.   There may be
more than four erors in a statement,  but only the first four erors or
warnings cause flags to be posted.

In  the  case of  a QUT statement,   where the  operand field actually
contains a 15-bit address field,   the full 15- address appears in the
object field as a 5 digit octal number.

17.  Cross Reference Directory

At the end of pass 3,   PAGE8 chains to the HPSORT program in order to
process  the  cross-reference  directory.   A  temporary  file  called
CROSS.TM is built during pass  3 by PAGE8.   CROSS.TM contains all the
raw cross-reference information.  HPSORT processes this file and sorts
it.   CROSS.TM is deleted by HPSORT just before  returning to the OS/8
Keyboard Monitor.

Following  the  program  assembly  statistics  (total source statement
count, number of symbols, core used, etc.),  the cross-reference lists
for all errors and warnings (if any)  are printged.  Following this is
the cross-reference directory of all symbols defined in the program.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 24 of 90


The first field after  the symbol name  is present only if  the symbol
was defined as an address (either as a label on a statement or defined
via a QUT directive).   In this case,   a single  digit identifies the
memory field address of the symbol.  This field will be left blank for
symbols defined via SEDT, MSCAN, EQU, or MACRO.

The second field  contains the  12-bit value of the symbol unless  the
symbol was a macro (in which case the field is blank). The third field
contains a single letter identifying the type of symbol:

        S       SET or MSCAN
        E       EQU
        M       MACRO
        A       Address (defined as a label or via QUT)

If  the /F  option was  used (or if  PAGE8  ran  out  of room for  the
CROSS.TM file  and forced /F on),   the fourth field  is the reference
count for that symbol.   lOtherwise,  the remaining fields contain the
cross-reference directory of all references to that symbol.  The first
cross reference field is  always  the  lpoint at which the symbol  was
defined.  The remaining field contains all the references to that sym-
bol in order of appearance in the source program. After the three-part
file/page/line number for the reference,  various flags are lposted to
further idedntify the type of reference.

In  the case of cross-reference  lists for  errors  or warnings,   the
actual error or warning flag is posted after the hyphen.  For symbols,
the following flags are used:

        D       Destructive memory reference
        N       Non-destructive memory reference
        I       IOT or operate instruction reference
        A       Assembler directive reference
        =       Literal reference (current or zero page)
        %       Memory field reference or definition reference

A small help file to remind the programmer of  the  meaning  of  these
flags  may be obtained by issuing  a direct  RUN command on the HPSORT
program.

Local symbols,   symbols beginning with a colon and macros that do not
begin with a  period  are  all inhibited from appearing in the  cross-
reference directory  (although they are included in  the total  symbol
count).

In the evednt  that only reference counts are  being supplied,   there
will be a digit from 1 to  7  where 7 indicates that  there were 7  or
more references to that symbol. A count of 1 indicates that the symbol
was defined but never referenced.

This feature of automatically switching  to the third output  file (if
the second output file overflows)  is in PAGE8,  but not HPSORT.  How-
ever, if PAGE8 has already moved to the third output file, HPSORT will
generate the cross-reference file on the third output device.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 25 of 90


If  HPSORT.xx is not found on  the  system device at the  start of the
assembly, the message: `NO HPSORT.xx' will appear on the console prior
to the start of pass one.

18.  Indirect Run-Time Reference Operator

By preceding a symbol with the `&' unary operator,   PAGE8 will return
as the value  of that symbol the current contents of  the memory loca-
tion addressed by the symbol.  The addressed memory location has noth-
ing to do with the program  being assembled.   Before  describing this
feature further, the following example should be examined:

DATE    QUT     1,07666         `DATE' has address of OS/8 date word
CDATE   EQU     &DATE           `CDATE' now has value of date word

Following the execution of these two  statements,   the symbol `CDATE'
has the actual value of the OS/8 date word since it was equated to the
contents of memory location 17666 (octal).

This feature provides  extraordinary capabilities to  the  programmer.
For example,   a macro can be written to take the binary date word and
convert it into an ASCII text string.   The text string could lthen be
used in the program as a message.   With this a program could not only
print  out a version number  but  also  print  out the precise date on
which the progrm was last assembled.

Another very useful way of utilizing this feature is to gain access to
the OS/8 Command Decoder tables  to look at the run-time switches that
were set for running PAGE8. In the example below, a program implements
a  run-time switch that is not used by PAGE8 (/B)   for the purpose of
stripping out  some conditional code.   If the /B switch is specified,
the code is not assembled;  if the /B switch is not used,  the code is
assembled:

SWIT0   QUT     1,07643         A-L switches in Decoder tables
        AIF     &SWIT0.AN.02000,.SKIP   Skip if /B set
        ...     .....
        ...     .....           This code assembled if /B not set
        ...     .....
.SKIP   ANOP                    Assembly continues in any event

The second statement isolates  bit 1 of the contents of location 07643
(octal)  which will be set if /B was used.  If set,  the expression is
true and the assembly branch will be taken.

19.  PAGE8 Macro Processor

This section describes all of the features of the macro processor.  In
the following documentation it is assumed that the programmer is reas-
onably familiar with the concept of macros.

The MACRO directive and associated definition may only  appear at cer-
tain points in a PAGE8 source program. In all cases, the macro defini-
tion must, of course,  precede the first invocation of the macro.  Any
macro calls  made  prior to  the macro definition  will be treated  as
undefined operation codes  and the O  error flag will  be posted.   In
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 26 of 90


general, macros should appear in the following positions in the source
program:

        1.  Before the end of page zero in any memory field.
        2.  In any DSEC area.
        3.  In any  memory page  prior  to generation  of any links or
            literals.

There are also some highly obscure,   additional internal restrictions
on the third item, so that to be safe, a macro in this position should
be defined after an ALIGN directive or ORG directive to the start of a
memory page.  If a macro definition appears at an illegal point in the
program,   the M  error flag  will be posted  and  the MACRO directive
ignored.

The example below shows typical syntax for a PAGE8 macro:

        MACRO                           Signal that definition follows
        LOOP    <ADDR><COUNT=CNT>       Prototype header statement
<>      ISZ     <COUNT>                 Test loop counter
        JMP     <ADDR>                  Loop back if non-zero
        MEND                            End of macro definition

The above macro provides a `LOOP' instruction  that tests a loop coun-
ter (defaulted to `CNT' if no argument is supplied)  and if it is non-
zero, jumps back to the address specified in the argument.

The first statement of a macro definition must be the MACRO directive.
Any operand field to  the directive is  treated as part of the comment
field.   THe only type of label permitted is an assembly sequence sym-
bol.  In all macro definitions,  many of the errors are only posted in
pass 1,   so the pass 1  error count must be examined carefully before
concluding that there are no assembly errors.

The second statement is the prototype header statement.   No label  of
any kind  is  permitted on this statement (not even sequence symbols).
The dummy macro arguments (up to as many as will fit on the line)  are
all  enclosed  in  angle  brackets.     The  arguments  must  be  con-
tiguous--separating blanks or commas are not allowed.   Note that this
latter rule is  different from the  specification  of arguments in the
actual call to the macro (to be described later).

The dummy macro argument names  must be unique within a single defini-
tion or a D error  flag will be lposted for the  duplicate definition.
The dummy  macro arguments are defined only  within the  macro defini-
tion:  no confusion is caused should they happen to have the same name
as  symbols that have already  been defined in the  program.   In  the
example  on the previous page,   it makes no  difference  if  a symbol
already exists whose name is `ADDR'. Dummy macro argument names should
comprise  standard PAGE8  symbols.   Dummy arguments are encoded  in a
special form within the macro tables,  so that the length of the dummy
macro artument name has no affect at all on the amount of symbol table
space used to store the macro definition.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 27 of 90


The user-defined macro name must be unique.   It may not duplicate any
prevcious macro name, standard PAGE8 operation code (unless previously
removed with the UNLINK directive),  or user-defined symbol.  For this
reason,  and to avoid conflicts,  user-defined macros usually (but not
necessarily)   have a period as the first character of the macro name.
Also, if the macro does not begin with a period (as is the case in the
example above)   the macro name will not be listed in the cross refer-
ence directory.

   19.1.  Default Macro Arguments

Default arguments are indicated by an equals sign following the  dummy
argument name. After the equals sign, a test string can be supplied as
a default value to be substituted.  If a macro call fails to supply an
argument in this position,   the default argument is supplied by PAGE8
whenever that particular dummy  artument appears in a body  statement.
In the default text string, any characters may appear except the angle
brackets.   Consider the two calls below to the macro that was defined
earlier:

        Macro Call              Macro Expansion
        ----------              ---------------

        LOOP    TAG,KOUNT       ISZ     KOUNT
                                JMP     TAG
        -----------------       -------------------
        LOOP    TAG             ISZ     CNT
                                JMP     TAG

In the second case,   PAGE8 supplies a  default for the missing second
argument of the text string: `CNT'.

   19.2.  Macro Body Statements

In  the body of the  macro definition,   any  number of statements may
appear.   Dummy artuments must always  appear  enclosed  within  angle
brackets.  If the angle brackets are missing, PAGE8 will not treat the
symbol as a dummy argument.

Two special characters must not appear in macro body statements:   the
up-arrow (ASCII 236 (octal))   and the left-arrow or  underline (ASCII
237  (octal)).   These two characters are used  for the  internal rep-
resentation of a tab and an end-of-line.

   19.3.  Symbolic Concatenation

Due to the syntax of PAGE8 macro definitions,   symbolic concatenation
of dummy arguments requires no special feature or operator.   Consider
the example below where a symbolic reference is dependent on the macro
call to supply the last part of the full symbolic name:

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 28 of 90


        Macro Call                      Macro Definition
        ----------                      ----------------
        ADD  LABEL                      MACRO
                                        ADD     <ENDNAME>
   -----------------------              TAD     MAC<ENDNAME>
        Macro Expansion                 MEND
        ---------------
        TAD     MACLABEL

   19.4.  Comment Fields in Macro Definitions

Comment  fields  should be used freely in macro definitions to  aid in
the documentation of the source program. Normally comments need not be
stored in the macro tables and for this reason,  a semicolon is gener-
ally used  to indicate the start of a comment field in a macro defini-
tion.  When a semicolon is seen, all preceding blanks and tabs back to
the most recent character other than a blank or tab are stripped.

If the semicolon is omitted,   the comment field will be stored in the
macro tables and will  be  seen in the macro expansion if a LISTM dir-
ective is  in effect.   This feature  can be useful  for documentation
purposes or for debugging complex macros.

Comment statements,   signalled by an asterisk or slash in column 1 of
the statement,   are always stripped out of  macro definitions and not
stored in the macro table.

Multiple  tab characters are stored as  a single tab character  in the
macro tables.   Two  or more blanks  are automatically converted to  a
tabl.  lThis ensures that the expanded source,  if listed,  appears at
the normal tab lpositions on the  line (PAGE8  sets tabs  at every 8th
character position on a line).

   19.5.  Label Field

The following information describes a requirement of PAGE8 that is not
a standard feature of most macro processors.  Because of the automatic
source paging  and the  need to  generate  page  escapes  over literal
pools,   labels cannot be evaluated in PAGE8 until the object code for
the associated operation code has been generated.   For  this reason a
label on a macro call  cannot be blindly assigned to  the value of the
current  location  counter  (as would  be the  case  with a non-paging
assembler). In PAGE8 macros, the label is passed as a hidden parameter
to the  macro and the macro definition indicates where the label is to
be placed by  a  left angle  bracket followed immediately by  a  right
angle bracket in the label field of the body statement.   For example,
the call to the previously defined macro `LOOP':

        TAG     LOOP    1B

would cause the following expansion to be generated:

        TAG     ISZ     CNT
                JMP     1B

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 29 of 90


The  label field on  the  macro call  can thus  be  placed on any body
statement who directive permits a label.   The label on the macro call
can also appear on more than one body statement.   This would be legal
if the  macro used  the label on  SET or  MSCAN directives  or if  the
symbol being passed was a local symbol.

If the macro definition does not  include an indication  of where  the
label should appear,   an attempt to call that macro with a label will
result in the S error flag's being posted.

The  label  field  indication  in  the macro definition must appear in
column 1 of the statement.   The only  exception involves  the special
macro call list indicator character (an  exclamation point (!))   des-
cribed below.

   19.6.  Macro Call Listing

Normally, the macro call statement is listed as the first statement of
the macro expansion.  Under some conditions, however, this could cause
the macro call to be lost.   For example,   if the macro begins with a
NOLIST directive,  the macro call would not appear since the statement
will  not  be listed.   To avoid this  problem  there is a feature  to
specify on which statement the macro  call is to be listed.   This  is
done by placing an exclamation mark (!)   character as the first char-
acter on the line which contains the body statement to be used for the
listing.

The ! character is considered to precede column 1 on the statement and
does  not therefore prohibit placement of  any  kind of label on  that
statement.  As a clarification of this feature, consider the following
macro which precisely describes the PAGE8 SUB directive and the manner
in which the SUB directive is listed:

        MACRO
        SUB     <ARG=07402>     ; If no argument, use HLT
        ROOM    2               ; ensure contiguous room on page
        JMPI    *+1             ; for off-page return
!<>     DC      <ARG>           ; generate entry point & list it
        MEND

If a LISTM condition is in effect,   all the source  statements of the
macro expansion are  listed.   lThe  call to  the macro is then listed
before the expansion of the first line of the macro. In nexted macros,
only the call to the first macro is listed.

   19.7.  Backwards Assembly Branches in a Macro

Both the AIF and AGO directives are permitted in a macro.  When an AGO
or  AIF  (with an  expression that is true)   is found within a macro,
PAGE8  turns the assembly  off and  begins the  scan for the  matching
sequence symbol at the START of the macro and not at the current line.
As a result,   backwards assembly branches are possible allowing iter-
ative loops to be set up.   Note that within a macro definition,   all
sequence symbols must be unique for this feature to work properly. The
following macro will set  up  a  table in which the length,   starting
value,   and incrfment value to be added to each subsequent entry  are
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 30 of 90


supplied in the macro call.

        MACRO
        .TABLE  <LENGTH><START><INDEX>
T       SET     <LENGTH>        ; Set loop count to length
V       SET     <START>         ; Establish starting value
.LOOP   DC      V               ; Generate value (loop here)
V       SET     V+<INDEX>       ; Increase value by index
T       SET     T-1             ; Decrement loop counter
        MEND

In coding backwards assembly branches,   it should be remembered  that
the start of the loop should be as close as possible  to the start  of
the macro in order to gain speed. If there is extensive initialization
to be performed prior to the loop,  it may be more efficient to use an
AGO directive to  skip  over the loop and do the  initialization after
the loop.

   19.8.  Indirect, Numeric Argument Replacement

A  PAGE8 symbol in  a macro expansion can be  replaced indirectly by a
numeric texgt string that represents the current value of that symbol.
The indirect argument replacement is signified by preceding the symbol
with a backslash ()   character.   The numeric text string will be a 4
digit octal number  (or  3 digit hexadecimal number if the /H run-time
option is in effect). This operator may not appear in front of a dummy
argument.  Should this be required,  the dummy argument can be used in
the operand field of a SET directive, and the label used in subsequent
statements with the backslash operator.

The following examples should clarify the use of this feature.   Every
time the first macro is invoked,  the symbolic argument is stored as a
constant. At the same time, a special `symbol' table is built up which
contains the addresses of each  call to the  macro.   The second macro
would be called later on to generate a table of all the addresses that
were saved by the first macro.

        MACRO
        .SAVE   <CON>           ; Argument is some constant
CT      SET     CT+1            ; Index numeric part of name
TCT    DC      <CON>           ; Generate constant and symbol
        MEND

        MACRO                   This macro generates the table
        .GENTABLE
CT      SET     1               ; Reinitialize numeric part
.LOOP   DC      TCT            ; Generate address of entry
CT      SET     CT+1            ; Increment numeric part
        AIF     ?TCT,.LOOP     ; Stop when no more defined
        DC      0               ; Attach sentinel of zero
        MEND

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 31 of 90


Note  also the  use of the definition  operator to find  out how  many
symbols we actually  generated.   The symbols generated  have names of
T0001, T0002, T0003,  T0004,  ...etc.   The symbol that follows the `'
operator must have been defined in a prior source statement; otherwise
the Q error flag is posted for an illegal forward reference.

   19.9.  Indirect, Symbolic Replacement

A  PAGE8 symbol in  a macro expansion can be  replaced indirectly by a
single  letter that  represents the ASCII  code contained in  the  low
order 8 bits of the value of the symbol.  This is specified by preced-
ing the symbol with an opening square bracket ([).   As with the back-
slash operator,   the symbol must have been previously defined and may
not be a dummy argument. This feature is generally used to reconstruct
symbolic names or tgext strings from numeric arguments.

The following  example  should clarify the use of this feature.   This
macro  takes  a single  argument  and converts  it to  two  characters
(treatihe argument as a packed, 6-bit representation of two alphabetic
characters) to appear in a text message.

        MACRO
        .VERSION        <ARG>
T       SET     <ARG>           ; Set standard symbol to dummy arg
T1      SET     ((T.AN.07700).RS.6)+0300  ; 8-bit value of left
T2      SET     (T.AN.077)+0300 ; 8-bit value of right half
        TEXT    /VERSION [T1[T2 OF TEST PROGRAM/

Note  that in some  sense the  `['  operator  is the "reverse" of  the
single  ASCII constant  operator.   For example,   if the value of the
symbol TEMP is 316 (octal),   both statements below result in the gen-
eration of the value 316 (octal):

        DC      TEMP
        DC      '[TEMP

   19.10.  Nesting of Macros

Macros may be nested to a level of three.   Attempting to call a macro
trhat would  increase the nesting depth to  four is  an error and will
cause the M flag to be posted on the offending macro call.   The macro
call would not be processed.   A macro may call  itself recursively as
long as the nexting level limit is not exceeded.

   19.11.  Macro Calling Sequences

A typical macro call includes an optional label, the macro name in the
operation code field,   any number  of  real arguments in the  operand
field and a comment field.

The label field is passed as a "hidden" argument to the macro and will
be substituted in any label field of the macro body which contains the
lpaired angle brackets.

P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 32 of 90


Macro arguments are of two types: simple and extended.  A simple argu-
ment consists of a string of characters which do not  contain a blank,
comma or angle brackets.   Angle brackets must not appear  in a simple
argument. An extended argument may contain commas and blanks since the
whole argument  string is enclosed in angle brackets.   All  arguments
(simple or extended) must be separated with commas. The extended argu-
ment  form is provided  primarily  to allow  nested arguments  and  to
handle cases  where a comma or  blank need  to be passed as arguments.
Consider these examples:

        DEFIN   ARG,HELP,TEMP,61,$
        ATXT    ARG,<THIS IS A TEXT STRING>,ARG2
        OUTER   ARG,<DEFIN  1,TOOP,TEP,7,90>
        NEST    <<<ARG,$>>>

In the third case, a macro call with simple arguments is itself passed
as an argument to another macro. In the fourth case, two arguments are
presumably being  passed down  directly to a macro  that  is called by
another macro that itself is called within the 'NEST' macro.   At each
nesting level in the macro  expansions,   the outermost pair  of angle
brackets associated with that level will be stripped off.

As  another example,   consider the following macro which repeats some
source statement a specified number of times:

        MACRO
        .REPEAT <COUNT><STATEMENT>
CT      SET     <COUNT>         ; Set loop counter
.LOOP   <STATEMENT>             ; Generate the statement
CT      SET     CT-1            ; Decrement loop counter
        AIF     CT,.LOOP        ; Back if more to do
        MEND

This macro  could then be called to generate  256  statements  of  the
form: `ISZ COUNT' with the this call:

        .REPEAT 256,<ISZ  COUNT>

   19.12.  Null Arguments

A null  argument within the middle of a set of arguments  is indicated
by two  consecutive commas.   If the macro definition has  supplied no
default argument in that position,   a null string is substituted  for
the dummy macrro argument and the  # error flag will be posted for the
missing argument.   If a default was provided in the macro definition,
the default argument will replace the dummy argument in that position.

In the example below, the third argument in the macro call is null:

        DEFN    ARG1,HELP,,ARG4,SYM9

   19.13.  Macro Libraries

The  usual way  to  handle macro  libraries is to  have a source  file
containing  the macro definitions assembled  in front  of other source
files.   If only selective portions are required,   a file of requests
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 33 of 90


(consisting of equate  statements)   can  be inserted in  front of the
macro library.   The macro library can then make use of the  question-
mark  definition operator and  conditional  assembly  branches to skip
macro definitions that are not required.

   19.14.  Local Macro Symbols

Within a macro it may be necessary  to generate  unique address labels
on each invocation of the  macro.   In  order to prevent duplicate tag
errors,  local macro symbols are used.   Although normal local symbols
could be used, serious program errors could arise if a calling routine
was unaware that a particular local symbol appeared in some macro that
was being called.   To avoid this difficulty,  PAGE8 reserves a set of
special local symbols for each of the three nesting levels.   A macro,
local symbol  is  identical to  a normal local prefixed that a $ char-
acter:

        MACRO
        .EXAMP1
$7H     TAD     STAK
        JMP     $2F
        NOP
$2H     JMP     $7B
        ...     ....

Local macro symbols are  illegal  outside  of a macro.   Should one be
used,   PAGE8 posts the M error  flag and  uses a normal local  symbol
instead.   Local macro symbols are only defined at the current nesting
level. Consider the following macro that calls the macro above:

        MACRO
        .EXAMP2
        TAD     $2F
        .EXAMP1 $2H     NOP
        ....

In this  case the $2H tag in .EXAMP2 is not confused with the  $2H tag
in .EXAMP1 because they appear at different nesting levels.  Also, the
PART directive may  be used  inside a macro  in which case  only local
macro symbols at that nesting level are partitioned.

   19.15.  Character String Processing

The AREAD and MSCAN directives provide PAGE8 with a powerful character
string processing capability.  When an AREAD directive is encountered,
PAGE8 reads in the next source statement  and treats it  as the  first
argument to the macro.  The first character in the first argument will
comprise the character in column 1  of the statement that was  read in
by the AREAD directive.

In conjunction with AREAD,   the MSCAN directive makes it possible  to
examine  each character in the  argument  one by one  and process them
accordingly. MSCAN can also be used on normal arguments thus providing
a  way of  finding out what type of argument has been  supplied to the
macro.   For example,   a macro could be defined called  `OS8TXT' that
would take an argument just like the standard PAGE8  `TEXT' directive.
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 34 of 90


The OS8TXT macro could then use the  MSCAN cirective to save the deli-
miting character and pick off the characters in the string one by one.
OS8TXT could then use these characters to  pack up a message buffer in
the special format required for OS/8 ASCII files. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 35 of 90


20.  PAGE8 Directives

   20.1.  AFIELD  (Expression)

        Label:          Blank or sequence symbol
        Operation:      AFIELD
        Operand:        Any expression with a value between 0 and 7
        Comment:        Permitted

        Mnemonic definition:    Assembly data FIELD setting.
                                -             -----

This directive  specifies the actual run-time data field which will be
in  effect for subsequent instructions.   This information is  used by
PAGE8 to  resolve some of the complex field addressing errors that can
appear in a program that is  frequently referencing data fields otheer
than the current instruction field.  Also,  the TADX,  ANDX,  INCX and
DCAX instructions cause an automatic CDF instruction back to the field
set by the  most recent AFIELD directive.   If no AFIELD directive has
been issued,  PAGE8 sets a continuously updated default of the current
assembly field.

Judicious use of the AFIELD directive can ensure that certain types of
addressing errors will always be caught  by PAGE8.   For example,   if
PAGE8 is forced to  generate a paging link for a memory reference  in-
struction,   the current run-time assembly data field is checked.   If
this field differs from the current field,   PAGE8 knows that the ref-
erenced location cannot  be  accessed correctly  and will consequently
post the K error flag.

To facilitate field tracing,  a macro can be written to force PAGE8 to
change the AFIELD setting whenever a CDF instruction is executed:

        UNLINK  CDF             Remove CDF from op-code tables *
        MACRO                   Now redefine meaning of CDF
        CDF     <FIELD>         ; Argument is 3-bit field
        LINK    CDF             ; recollect CDF definition
!<>     CDF     <FIELD>         ; list & execute CDF with label
        UNLINK  CDF             ; reset `trap' for CDF op-code
        AFIELD  <FIELD>         ; execute implicit AFIELD
        MSKIP                   ; allow skip instruction to precede
        MEND 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 36 of 90


   20.2.  AGO     (Sequence Symbol)

        Label:          Blank or sequence symbol
        Operation:      AGO
        Operand:        Sequence Symbol
        Comment:        Permitted

        Mnemonic definition:    Assembler GO.
                                -         --

Unconditional assembly branch.   The  operand  field should  contain a
sequence symbol to which assembly unconditionally branches. All inter-
vening instructions are not assembled.   In a macro,  PAGE8 will begin
the search for the matching  sequence  symbol at the BEGINNING of  the
macro, so that a backwards assembly branch is allowed.  For this feat-
ure to work correctly, it is important that all sequence symbols with-
in a single macro definition be unique,   since the scan always begins
from the first macro body statement.  If not in a macro,  the sequence
symbol must appear in a subsequent statement. The AGO directive is not
listed unless a prior LISTC directive is in effect. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 37 of 90


   20.3.  AIF     (Expression),(Sequence Symbol)

        Label:          Blank or sequence symbol
        Operation:      AIF
        Operand:        Any expression followed by a sequence symbol
        Comment:        Permitted

        Mnemonic definition:    Assembler IF.
                                -         --

Conditional  assembly branch.   The expression in the operand field is
evaluated. If it has a non-zero value (i.e. TRUE), the assembly branch
will  be taken as if an AGO directive had been issued to the specified
sequence symbol. If the expression has a zero value (i.e.  FALSE), the
assembly  branch is  not taken and the AIF directive  functions  as an
ANOP directive. As with the AGO directive, backwards assembly branches
are permitted within macros.

If the expression in the operand field was false, the AIF statement is
listed.  If the expression was true and the assembly branch taken, the
AIF statement is not listed unless a LISTC directive is in effect. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 38 of 90


   20.4.  ALIGN

        Label:          Blank or sequence symbol
        Operation:      ALIGN
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    ALIGN to start of next memory page.
                                -----

Unconditional page alignment.  When encountered, PAGE8 will force ali-
gnment to the start of the next PDP-8 memory page.   This directive is
similar in  function  to the  PAGE  directive  of  the PAL8  assembler
although it rarely appears in PAGE8 programs. The current page literal
pool is output and a page escape is generated in the normal manner.

If the next page  has been marked  as unavailable by a prior GAP  dir-
ective and if  the current program section  is in ISEC 0,   PAGE8 will
align to the start of the next available page in that memory field and
adjust the linkage in the page escape.  If there are no further avail-
able pages,   the K  error flag  is  posted and assembly continues  at
location 0000 in the next memory field. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 39 of 90


   20.5.  ANOP

        Label:          Blank or sequence symbol
        Operation:      ANOP
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    Assembly NO-oP.
                                -        --  -

This directive has no function other than to service as a target oper-
ation code for a sequence symbol in the label field. This is generally
used in conjunction with the AGO and AIF directives. No object code is
generated by this directive.

The ANOP directive can also be used to separate  operation codes which
might  generate  some unwanted error flag  if  they  occurred as  con-
secutive statements.   For example,   it is illegal  to have  two con-
secutive TEXT directives in an ISEC area due to  the possibility  of a
semantic error (viz.   an unexpected and undesirable page break  could
occur between the two text strings). In this case, the restriction can
be easily overcome by simply inserting  an ANOP statement  between the
two TEXT directives. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 40 of 90


   20.6.  AREAD

        Label:          Blank or sequence symbol
        Operation:      AREAD
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    Assembly READ.
                                -        ----

This is  a  macro directive which  causes PAGE8  to  read in the  next
source statement as a single,   extended argument to the current macro
that is being expanded.  All characters of the following statement are
read  in  and can then be processed by  the macro.   This directive is
generally  used  in conjunction with the  MSCAN directive in order  to
provide PAGE8 with a complete character string processing  capability.
The statement to be read does not have to be a PAGE8 statement--it can
have any syntax or  form since the statement would only be interpreted
by the macro that issued the AREAD directive.

The example below may help to clarify the use of this directive.  This
macro  is passed an argument indicating  the number of folowing source
statements that comprise a single block of text:

        MACRO
        .TBLOK  <ARG>           ; Argument is # of statements
COUNT   SET     <ARG>           ; Set up loop counter
.LOOP   AREAD                   ; Read next source statement
        TEXT    /<ARG>/         ; `ARG' contains statement
COUNT   SET     COUNT-1         ; Decrement loop counter
        AIF     COUNT,.LOOP     ; Loop back if more
        MEND                    ; Else all done
*
*       Example of a call to the above macro
*
        .TBLOK  3               Three source statements
THIS IS THE FIRST STATEMENT TO BE PROCESSED HERE
%$#*@& IT DOESN'T HAVE TO BE A LEGAL PAGE8 STATEMENT*&#@
----------THIS IS THE FINAL STATEMENT----------
*
*       Normal PAGE8 statements continue now
* 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 41 of 90


   20.7.  AS      (Expression),(Expression)

        Label:          Syymbol, sequence symbol or blank
        Operation:      AS
        Operand:        An expression,   followied by  an optional ex-
                        pression
        Comment:        Permitted

        Mnemonic definition:    Allocate Storage.
                                -        -

The AS directive  provides  a  convenient  method of  allocating large
blocks of storage in a program. The expression in the operand field is
evaluated and  treated as the length of a block of storage that should
be reserved starting at the current location.   In an  ISEC area,   if
there is no room on the current PDP-8 page,  the block will be aligned
to the start of the next page.   If there is a label field,  the label
will  refer to the address of the first location in  the  block.   All
locations in the block will be set to the  value of the second expres-
sion.  If the second expression is omitted, a default value of zero is
used to fill the block.

The first  expression  must  contain only previously  defined symbols.
This restriction does not apply to the optional second expression.   A
large storage block will not be broken up to skip over pages marked as
unavailable because of a prior GAP directive. The block will, however,
not start at the beginning of an object gap.

The  example below will generate a  block of 128 words where each word
will contain the value -1:

TABLE   AS      128,-1          Entire table set to -1 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 42 of 90


   20.8.  BYTE    (Expression),(Expression)

        Label:          Symbol, sequence symbol or blank
        Operation:      BYTE
        Operand:        Two expressions each in the  range 0-63 (deci-
                        mal)
        Comment:        Permitted

        Mnemonic definition:    BYTE constant.
                                ----

The operand to the BYTE  directive must  be two 6-bit expressions sep-
arated by a comma.   The first expression goes in the left  byte (i.e.
left 6 bits of the word)  and the second expression in the right byte.
If  either  expression is larger than 63 (decimal),   the T error flag
will  be  posted to indicate a truncate  error and the value for  that
expression will be truncated to 6 bits.

In the example below, the BYTE directive is used to implement a trans-
late table where the right byte contains  the translated value and the
left byte contains control and status flags:

        BYTE    ALPHA,"@A
        BYTE    DIGIT,"@6
        BYTE    SPECIAL+ILLEGAL,"@#
        BYTE    SPECIAL,"@$ 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 43 of 90


   20.9.  CREF

        Label:          Sequence symbol or blank
        Operation:      CREF
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    accumulate Cross REFerences.
                                           -     ---

The  CREF directive  allows  the accumulation of  cross- references to
symbols  to resume immediately.   If no  prior NOCREF directive was in
force,   the CREF directive has no effect  and  functions as  an  ANOP
directive.

The CREF and NOCREF directives  are often encountered in macro defini-
tions that incorporate loops.  Such macros can genedrate extraordinary
quantities of cross-references that may  be of  no use or significance
to the programmer. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 44 of 90


   20.10.  DC      (Expression),(Expression),(Expression),...

        Label:          Symbol, sequence symbol or blank
        Operation:      DC (optional)
        Operand:        An expression  followed  by  optional  sub-ex-
                        pressions
        Comment:        Permitted

        Mnemonic definition:    Define Constant.
                                -      -

The DC directive provides a  convenient was  of specifying single con-
stants or multiple constant lists. The first expression in the operand
field  is evaluated  and stored at the  current location.   This first
expression may be a literal. Optional multiple expression separated by
commas are allow to follow and will be stored in successive locations.
These sub-expressions may not contain literals.

A label,   if present,   will always refer to the address of the first
constant in the string.   Multiple expressions  are guaranteed to stay
together as a unit--a page break cannot occur within the list  of con-
stants.

Pagination recalculations are not performed on any  expressions in the
string. Also, all expressions are evaluated prior to generation of any
object code, so that references to the current assembly location coun-
ter lin a  sub-expression will reference the address of the first con-
stant rather than the address of the constant that contains the refer-
ence.

Note that  the use of  `DC' in the operation code  field is  optional.
PAGE8 first tests the operation code field for a standard PAGE8 opera-
tion code. If this failes, PAGE8 tests to see if it is a macrfo. If it
is not a macro,   PAGE8 defaults the operation  code to  `DC' and then
rescans the operation code field as an operand field to `DC'.  The two
statements below are equivalent in PAGE8:

TAG     DC      4*3+(TEMP/14)
TAG     4*3+(TEMP/14) 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 45 of 90


   20.11.  DI      (Expression)

        Label:          Symbol, sequence symbol or blank
        Operation:      DI
        Operand:        Any valid expression
        Comment:        Permitted

        Mnemonic definition:    Define Instruction constant.
                                -      -

This directive is essentially identical to  the DC  directive.   It is
provided merely  for syntactic  clarity in the source program and  in-
dicates that the constant in the operand field is an instruction to be
executed rather than data.  For instruction constants that may cause a
skip, see the definition of the DSI diredctive. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 46 of 90


   20.12.  DSEC

        Label:          Sequence symbol or blank
        Operation:      DSEC
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    Data SECtion.
                                -    ---

This  directive indicates that all the following statements comprise a
data section in the program.   Genration of automatic  page escapes is
inhibited and no  pagination recalculations will be  performed.   When
this directive is encountered, PAGE8 will perform a page alignment and
output the  current  page literal pool only  if some paging  links  or
literals have been generated on the current memory page.  Otherwise no
page  alignment will occur.   The DSEC directive  has no effect on the
current ISEC area. DSEC is essentially a sub-section of an ISEC area.

Instructions used in a DSEC area will be processed correctly. However,
all paging links  and literals will be forced into the page zero  lit-
eral pool rather than the current page literal pool.  This occurs even
if the  explicit current page literal operator  (=)   is used  in  the
operand field.   This  feature  can be very useful when space is at an
absolute premium, since sharing of all literals and links on page zero
increases the packing density of the program. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 47 of 90


   20.13.  DSI     (Expression)

        Label:          Symbol, sequence symbol or blank
        Operation:      DSI
        Operand:        Any valid expression
        Comment:        Permitted

        Mnemonic definition:    Define Skip Instruction constant.
                                -      -    -

This directive is essentially identical to the DI directive.  The dif-
ference lies in the  fact that DSI informs PAGE8  that the instruction
constant to be assembled may cause a skip when it is  executed.   This
information is needed by  PAGE8 to ensure that a  page  break does not
occur immediately after this instruction.  If there is not enough room
on the current  page to  hold  the following instruction,   PAGE8 will
force a page alighment and assemble the instruction on the next avail-
able page.

The example  below shows a very  common  usage of the DSI instruction.
Note that using DC instead of DSI  could result in a bad page break in
some future assembly.

SWITCH  DSI     07000           NOP now, may be a skip later on 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 48 of 90


   20.14.  EJECT   (Expression)

        Label:          Sequence symbol or blank
        Operation:      EJECT
        Operand:        Blank or an optional expression
        Comment:        Permitted

        Mnemonic definition:    EJECT page.
                                -----

PAGE8 performs  an explicit  page  eject on  the output device  before
listing the following statement. The EJECT directive is not listed.

If the operand field contains an  expression,   the  EJECTG  directive
becomes conditional:   a  page eject wsill only occur if the  curfrent
line lies within the  specified number of lines  of  the bottom of the
page.   This conditional form  of the  directive can be very useful in
obtaining clean,  readable listings of the source program.   Note also
that through the use of the equals (=)  run-time option,  all uncondi-
tional  page ejects  can  be  forced to be  conditional to a  specific
value.

In the example below,   a condition EJECT directive is used  to ensure
that the description of a subroutine does not  get separated  from the
entry to the subroutine:

        EJECT   10              Do an eject if less than 10 lines left
                                * *       The  calling  convention for
                                          this  subroutine........   *
                                          SUBR    SUB
        .......... 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 49 of 90


   20.15.  END

        Label:          Sequence symbol or blank
        Operation:      END
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    END of source program.
                                ---
This directive signifies  that  assembly  should terminate  with  this
statement.   Use of this directive is optional.   If PAGE8 reaches the
end-of-file in  the  last  sourced  file,   PAGE8  will  terminate the
assembly  pass normally as if  an  END directive had  been elxplicitly
issued.

The primary use of this directive is for  conditional assemblies where
it may be desirable to  mark the end of the program without  having to
include an assembly branch over any remaining source statements. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 50 of 90


   20.16.  (Symbol) EQU    (Expression)

        Label:          Symbol
        Operation:      EQU
        Operand:        Any valid expression
        Comment:        Permitted

        Mnemonic definition:    EQUate symbol.
                                ---

The symbol in the  label field is equated to the value of the  expres-
sion in the operand field.  As with the QUT directive, any attempts to
redefine the  symbol with  a  difference  value will be  treated as an
error (the SET directive should be used lif redefinition is required).

Note  that  EQU  is  not generally  used for  equating  symbolic  add-
resses--the QUT directive is used for that purpose.  However,  if sym-
bolic addresses are defined with the EQU directive,  any references to
that symbol will be assumed to be in  the current memory field.   This
feature can be useful on occasion. For example, it may be desirable to
equate the addresses of some  cells which are present at the same rel-
ative  location within  each memory field (viz.   general gemporary or
"garbage" cells).   Such symbols  can then be referenced in any memory
field without generation of a K field addressing error.

The operand field may not contain  any symbols which are defined  at a
later point in the source program.   Should lthis occur,   the Q error
flag will be posted and the expression  will  always  have  a value of
zero. Illegal forward references do not cause assembly phase errors in
PAGE8. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 51 of 90


   20.17.  ERM

        Label:          Sequence symbol or blank
        Operation:      ERM
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    End RooM check.
                                -   -  -

This directive is used in conjunction with the ROOM directive.  If the
statement lies outside of the protected range set by a ROOM directive,
the square bracket error flag (illegal unprotected statement)  will be
posted.   If protected,  the ERM directive functions like an ANOP dir-
ective.

The ERM  directive  is useful when it becomes necessary  to  protect a
large number of statements.  Because of the complex nature of the ROOM
directive and the necessary prohibition  of future references,   it is
not always easy to  tell how large  the operand  to the ROOM directive
should be until an assembly  listing is generated.   The ERM directive
provides a convenient way of ensuring that the ROOM directive  preced-
ing this statement does indeed  protect the necessary number of state-
ments against a page break. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 52 of 90


   20.18.  ERROR:  (User-defined error message)

        Label:          Sequence symbol or blank
        Operation:      ERROR:
        Operand:        User-defined text for an error message
        Comment:        Continuation of the operand field

        Mnemonic definition:    ERROR message.
                                -----

This directive makes it possible to signal user-defined error messages
during assembly of a program.  When encountered, PAGE8 posts the error
asterisks and forces  the listing of the  statement just as if a valid
error flag had been posted internally by PAGE8.   The operand and com-
ment field to  the directive will  normally  contain an  error message
that identifies the error condition that was detected  during assembly
of  the program.   The error  will also appear in the  cross-reference
directory of errors, with a blank for the posted error flag.

This directive provides an extremely useful tool for  protecting  pro-
grams during future assemblies or source modifications.   Coupled with
the use of conditional assembly directives, checks can be made for all
kinds of special error  conditions in a source program.   For example,
one  can check that  a program lies within certain memory limits,   or
check that tables have the correct length.   It is also very useful in
macros.  Often the macros will have been written by another programmer
who can  then  include checks that the arguments  passed to  the macro
have the correct form or type, or that the correct number of arguments
are passed.

See also use  of  the  NOTE:   directive which  has a somewhat similar
function. In the example below, a macro checks that the first argument
to be passed has a value of 5 or less:

        MACRO
        .SAMPLE <ARG1><ARG2>            ; 2 arguments to the macro
        AIF     <ARG1>.LE.5,.OK         ; Assembly branch if legal
        ERROR:  <ARG1> IS INVALID--IT SHOULD BE 5 OR LESS!
.OK     ANOP 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 53 of 90


   20.19.  FIELD   (Expression)

        Label:          Sequence symbol or blank
        Operation:      FIELD
        Operand:        Any expression whose value lies  between 1 and
                        7
        Comment:        Permitted

        Mnemonic definition:    FIELD address.
                                -----

This  directive  indicates to PAGE8 the memory field at which assembly
is to continue. It is similar to the ORG directive in that the expres-
sion field must not contain any symbols that are defined  at  a  later
point in the source program. Should this occur, thed Q error flag will
be lposted and  the FIELD  directive will be  ignored in all  assembly
passes (an assembly phase error does not occur).

Also,   field settings may not go backwards,   the  operand field must
contain  a value that  is greater and  not equal to  the current field
setting. If an attempt is made to set the field backwards, the B error
flag will be posted and the FIELD directive will be ignored.

When the FIELD directive is encountered, the current page literal pool
is output followed by the page zero  literal pool.   No page escape is
generated and the assembly location counter is reset back to zero. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 54 of 90


   20.20.  FILE    (Source program name)

        Label:          Sequence symbol or blank
        Operation:      FILE
        Operand:        Character string of up to 40 characters
        Comment:        Treated as an extension of the operand field

        Mnemonic definition:    FILEname for mail title.
                                ----

The FILE directive should be followed by a character string of no more
than 40 characters which will then be used as the main title on line 1
of the assembled source listing.  The title begins with the first non-
blank character in the operand field.  The FILE directive will cause a
page eject to be performed before listing the next statement.   If the
character string exceeds 40 characters in length, it will be truncated
to that length without any error message.

PAGE8  assumes that  the first source  statement will contain  a  FILE
directive.  If it is omitted,  and the first statement is not TITLE or
EJECT,   the first line in the source file will not be listed properly
(it will be listed by itself prior to the first page).   The FILE dir-
ective may actually appear anywhere in the source program.   It is not
restricted in use to the first statement in the source file and it may
be used any number of times within a source file.

Generally,   PAGE8  programs use this directgive at the start olf each
source file,   so that one can  tell immediately from the listing what
the name of the associated source file is.   See also use of the TITLE
directive  which is normally used for providing sub-headings within  a
source file. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 55 of 90


   20.21.  FREE    (Expression)

        Label:          Sequence symbol or blank
        Operation:      FREE
        Operand:        Expression in the range 0-63 (decimal)
        Comment:        Permitted

        Mnemonic definition:    FREE up room on page.
                                ----

This directive contains an  operand field which specifies  the minimum
number of free locations  to be  reserved at  the  end of  each  PDP-8
memory page.   The default value set by PAGE8 at the beginning of each
pass  is zero,   indicating that most  memory pages will be completely
packed.   This directive may appear anywhere and  any  number of times
within the source program.

This directive is particularly useful during the debugging stages of a
program.  With this directive, the programmer can ensure that there is
plenty of room on each page for patching purposes.  Once debugged, the
FREE  statement can  be removed,   thus restoring  the optimal packing
density for the program.

Note that this directive specifies  the minimum  number  of free loca-
tions to  be reserved.   Because of the way in which  instructions are
assembled,   it  is entirely possible that one or  two extra locations
will be left free.   This can  happen when a  skip instruction  occurs
right at the end of a page, or when some expressions that were undefi-
ned in  pass 1 are  found to resolve to the same entry in  the literal
lpool during subsequent passes. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 56 of 90


   20.22.  GAP     (Expression),(Expression),(Expression)

        Label:          Sequence symbol or blank
        Operation:      GAP
        Operand:        Three expressions separated by commas
        Comment:        Permitted

        Mnemonic definition:    object GAP.
                                       ---

This  is  a highly  unusual  assembly  directive  that is provided  to
enhance the usefulness of the automatic paging feature of PAGE8.  This
directive is followed by three expressions in the operand field.   The
first expression will contain the field address of the gap as value in
the range 0-7.  The second expression will contain the 12-bit starting
address of the object gap,   and the third expression will contain the
number of words in the gap.   The  latter  two expressions  should  be
multiples of 128 (e.e.  on a page boundary).   Object gaps may not lie
below location 0400 in a field.

During automatic pagination of the source program, PAGE8 checks to see
if the next page lies within a specified object gap.  If it does,  the
page(s)   specified in the gap are skipped over and assembly continues
at the first free page after the gap.   This skipping over object gaps
only occurs in ISEC 0. In ISEC area 1, object gaps are always ignored.

When skipping over an object gap, PAGE8 adjusts the final entry in the
previous  page's literal pool to ensure that the paging link correctly
jumps over the object gap.  This means that the programmer can reserve
pages  at the beginning of the program without having to be  concerned
about overlaying them with subsequent source code.   There is room for
the specification of 4 object gaps in each of the 8 memory fields. The
Y error flag will posted if this limit is exceeded.

This directive can  be  useful for reserving data space  at  specified
locations within a program.  Also,  these object gaps can be filled in
later with  code by  switching to ISEC 1 and setting the origin to the
start of the object gap. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 57 of 90


   20.23.  ISEC    (Expression)

        Label:          Sequence symbol or blank
        Operation:      ISEC
        Operand:        Expression with a value of 0 or 1
        Comment:        Permitted

        Mnemonic definition:    Instruction SECtion.
                                -           ---

The operand  field must contain an expression who value is either zero
or one in  order to select on of the  two instruction sections.   Each
instruction section has its own set of location counters (12-bit loca-
tion counter,   field  location counter and AFIELD location  counter).
PAGE8 defaults to instruction section 0 at the start of each pass.

When switching between  instruction section areas,   a  page  break is
forced in  the old ISEC area (if  necessary)   and  the saved assembly
location counters for the  new area are loaded.   Two instruction sec-
tions  are  provided in order to  overcome the restriction in PAGE8 of
setting an origin backwards.   If there is a need to go backwards,   a
switch can  be  made to  the  other instruction section whose location
counters have not been affected.

Extreme caution is required in  the correct handling of this  feature.
In particular,   problems can  arise  in switching between ISEC  areas
where the assembly fields are different.  In general,  both ISEC areas
should be updated at the same time.   The reason for this is that when
switching between ISEC areas,   the page zero literal pool is not out-
put.   This  could cause literals from both fields to be stored in the
same pool.   The page zero literal pool is not output in order to make
it possible to  briefly  switch  instruction  sections  and back again
without losing all the page zero literals.

In most  cases,   the programmer will find that  it  is best either to
update fields in both areas at the same time,   or to only switch sec-
tions once in a program, preceding the instruction section switch with
a FIELD directive to  ensure that the page zero literals are output in
the correct memory field. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 58 of 90


   20.24.  LFIELD  (Expression)

        Label:          Sequence symbol or blank
        Operation:      LFIELD
        Operand:        Expression in the range 0-7
        Comment:        Permitted

        Mnemonic definition:    Load FIELD.
                                -    -----

The  operand field should contain an  expression in the range  of 0-7.
The field setting is punched on the object code during pass2.  Neither
the current assembly field nor the  location counter are reset and the
page zero literals are not affected.

On the listing,   all the addresses will have an asterisk posted after
them to indicate that  the actual  address on the listing differs from
the address at which the assembled object code will be loaded.

Relocation of the object code will remain in effect  until  an ORG  or
FIELD directive is encountered. Either of these directives will remove
the relocation.   See also the use of the LOAD directive which effects
relocations within a memory field. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 59 of 90


   20.25.  LINK    (Operation code)

        Label:          Sequence symbol or blank
        Operation:      LINK
        Operand:        Any PAGE8 operation code
        Comment:        Permitted

        Mnemonic definition:    LINK definition.
                                ----

The LINK directive causes the referenced operation code to be inserted
back into  the PAGE8 operation code tables.   If it is  already in the
table, this directive has no effect and functions as an ANOP.

The LINK directive is generally used within a macro who function is to
trap out  some standard PAGE8 operation code in order to provide  some
extra feature.

The example below should  clarify the  use of the LINK and UNLINK dir-
ectives.   This macro traps out the LIST directive in order to get the
directive listed (PAGE8 normally suppresses  the listing of this  dir-
ective) and also assert a LISTC directive as well:

        UNLINK  LIST            Set trap  on  LIST  directive in  main
                                code
*
        MACRO                   Macro to process trapped LIST
        LINK    LIST            ; Recollect standard definition
        LIST                    ; Turn on the listing
        UNLINK  LIST            ; Set `trap' again
        LISTC                   ; Turn on conditional list, too
!       ANOP                    ; `LIST' gets listed here
        MSKIP                   ; Allow a preceding skip instruction
        MEND 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 60 of 90


   20.26.  LIST

        Label:          Sequence symbol or blank
        Operation:      LIST
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    turn on LISTing.
                                        ----

The LIST directive controls  the listing output.   If  the listing had
been  turned off by  a previous NOLIST directive,   the listing is now
turned back on. If the listing was currently on, this directive has no
effect. The LIST directive is not listed by PAGE8.

The LIST  directive will not override  the  effect of  the /L run-time
option (which turns the listing off permanently). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 61 of 90


   20.27.  LISTC

        Label:          Sequence symbol or blank
        Operation:      LISTC
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    LIST Conditional source.
                                ---- -

The  LISTC directive  controls the listing of statements  that are not
being assembled (dur to a prior AGO or AIF directive).  This directive
has the effect of causing the unassembled statements to be listed.

PAGE8  defaults to a  NOLISTC condition at the start of each  assembly
pass. The LISTC directive is not listed. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 62 of 90


   20.28.  LISTM

        Label:          Sequence symbol or blank
        Operation:      LISTM
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    LIST Macro expansion.
                                ---- -

The LISTM directive specifies  that the  source  code generated during
the  expansion of a macro should be  listed along with the macro call.
PAGE8  defaults to a NOLISTM  condition at the start of each  assembly
pass.

This directive is generally  used during  debugging of  complex  macro
definitions or  in  cases where the  macro definition itself  supplies
useful documentation.

The LISTM directive is not listed. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 63 of 90


   20.29.  LOAD

        Label:          Sequence symbol or blank
        Operation:      LOAD
        Operand:        Any PAGE8 expression
        Comment:        Permitted

        Mnemonic definition:    LOAD origin.
                                ----

The LOAD directive specifies  that the following object code should be
loaded  at  the  address  indicated by the  expression  in the operand
field. This origin setting in punched on the object code output during
pass 2.   As with the LFIELD directive,  the current assembly location
counter is not affected, nor is the current page literal pool output.

An asterisk will  appear  after the address  field  on the listing  to
indicate thatg  relocation is  in effect.   PAGE8  adds the relocation
constant (i.e.   difference between load and assemblyu origins)   when
outputting the origin for the current page literal pool,  so that cur-
rent page literals and links are addressed correctly even when reloca-
tion is in effect.  The programmer should be aware, however,  that the
page escape  and  other paging links  reflect  values relative to  the
current location counter  and not the address at which the object code
will be loaded. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 64 of 90


   20.30.  MACRO

        Label:          Sequence symbol or blank
        Operation:      MACRO
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    MACRO definition.
                                -----

This directive indicates that all subsequent statements up to the fol-
lowing MEND directive comprise a macro definition. The next stgatement
after the MACRO directive will be the prototype header statement which
contains the name of the macro and  the format  of  the arguments that
will be passed to the macro.

All subsequent  body statements will be treated as  part of the  macro
definition until the MEND directive is found, at which point the macro
definition will be terminated.   Although macro calls  can be  nested,
macro definitions may not be nested, nor may a macro be defined with a
macro.

A  detailed description of macros  and macro definitions will be found
in the section: PAGE8 MACRO PROCESSOR 19. (Pg. 25). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 65 of 90


   20.31.  MEND

        Label:          Sequence symbol or blank
        Operation:      MEND
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    Macro definition END statement.
                                -                ---

This directive indicates the end of a macro definition.   It also ter-
minates the expansion of the  macro definition when the macro is being
processed.  If this directive appears without a prior MACRO directive,
the M error flag will be posted (macro syntax error).

Conditional  or  unconditional  assembly  branches are  not  permitted
across a MEND statement.   If the  assembly is off when  the MEND dir-
ective is found,   the assembly is automatically turned back  on again
without generating an error message.

More details on the  use  of macro  directives  can  be  found in  the
secion: PAGE8 MACRO PROCESSOR 19. (Pg. 25). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 66 of 90


   20.32.  MEXIT

        Label:          Sequence symbol or blank
        Operation:      MEXIT
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    end Macro expansion and EXIT macro.
                                    -                   ----

When encountered during the expansion of a macro, PAGE8 terminates the
expansion with this statement.  MEXIT is identical to MEND except that
it does not mark the end of a macro definition.   MEXIT is provided to
allow premature  exits from the macro expansion without having  to use
assembly branches to the MEND statement.

More details on the  use  of macro  directives  can  be  found in  the
secion: PAGE8 MACRO PROCESSOR 19. (Pg. 25). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 67 of 90


   20.33.  MONR

        Label:          Sequence symbol or blank
        Operatin:       MONR
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    MONitor Return.
                                ---     -

When  the directive is encountered,   PAGE8 immediately returns to the
OS/8 monitor program by executing a JMP to location 07600. The purpose
of this directive  is to allow assembly to be aborted  immediately  in
the event  of some  fatal error lcondition.   It is generally used  in
conjunction with the ERROR: and NOTE: directives.

For example,   a  program can check to see  if  it  is using too  much
memory. If is it (and this is an absolutely hopeless error condition),
the program can use the AIF directive to perform the check, the ERROR:
directive to  inform the user of the error condition and the MONR dir-
ective  to force  an immediate abort  of the  assembly.   This  can be
especially useful when PAGE8 is running under OS/8 BATCH. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 68 of 90


   20.34.  (Symbol)  MSCAN  (Expression),(Dummy macro agrument)

        Label:          Symbol
        Operation:      MSCAN
        Operand:        An expression followed by a  dummy macro argu-
                        ment
        Comment:        Permitted

        Mnemonic definition:    Macro argument character SCAN.
                                -                        ----

This directive makes it possible to examine a single character  in  an
argument  (usually  a substitution for a  dummy  macro argument)   and
obtain the value of the ASCII character code for that character.  lThe
character in the  argument to  be "scanned" is  specified by the first
expression.   For example,  if the argument begins with the letter `A'
and the first expression has a value of zero,   the symbol will be set
to the value of 301 (octal)   (the ASCII character code for the letter
`A'.   If the first expression had a value of 7,  the 8th character in
the string would be returned.

This directive provides PAGE8 with a powerful character string proces-
sing capability.   The example below should  help to  clarify its use.
This macro reads a string of characters until a carriage  return  code
is found and then  generates an ASCII text string where each character
is stored right-justified, one character per word.

        MACRO
        .ASCII  <STRING>        ; Argument is character string
PTR     SET     0               ; Initialize character pointer
.LOOP   ANOP                    ; Loop here for next character
CHAR    MSCAN   PTR,<STRING>    ; Pick off next character
        AIF     CHAR.NE.0215,.GO        ; If CR, we are done
        MEXIT                   ; It was CR, all done
.GO     DC      CHAR            ; Generate the character
        AGO     .LOOP           ; Loop back for next character
        MEND

To call the macro above,  the text string would be passed as a single,
extended argument (to avoid problems with blanks). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 69 of 90


   20.35.  MSKIP

        Label:          Sequence symbol or blank
        Operation:      MSKIP
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    Macro SKIP permitted.
                                -     ----

This is a macro directive that inhibits  PAGE8  from posting the  "Il-
legal Unprotected  Statement" flag if it finds that  the macro call is
preceded with a skip instruction.

It is  often  very easy to forget  that  a macro may  generate  a sub-
stantial  amount of object code  from a  single  statement calling the
macro.  PAGE8 accomodates this common mistake by posting an error flag
if it finds a macro call preceded with a skip instruction.

Some macros,  however,  may not generate any object code,  or may gen-
erate only one instruction. In these cases, it would be permissable to
precede the macro call with a skip instruction without having an error
flag posted. By including the MSKIP directive at some point within the
macro definition,   PAGE8 will  not execute the check for a  preceding
skip instruction when the macro call  is encountered and will not post
the error flag.   Note that the MSKIP directive can appear anywhere in
the macro definition--its position is not important.

More details on the  use  of macro  directives  can  be  found in  the
secion: PAGE8 MACRO PROCESSOR 19. (Pg. 25). 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 70 of 90


   20.36.  NOCREF

        Label:          Sequence symbol or blank
        Operation:      NOCREF
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    NO Cross-REFerences.
                                -- -     ---

The  NOCREF directive inhibits the accumulation of cross-references to
symbols until a later CREF directive is encountered. This directive is
normally used in macros that contain iterative code.  Use of this dir-
ective inbigits generation of hundreds or possibly thousands of cross-
references which are of no significant value.

PAGE8 defaults to a CREF condition at the start of each assembly pass.
The NOCREF cirective does  not affect cross-reference  accumulation of
definitions.  In particular, if a symbol is being constantly redefined
with SET,   references will still appear  in the cross-reference  dir-
ectory even if NOCREF is in effect. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 71 of 90


   20.37.  NOLIST

        Label:          Sequence symbol or blank
        Operation:      NOLIST
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    NO LISTing.
                                -- ----

The NOLIST directive controls the listing of the assembled program. If
the listing was on, the listing is not turned off.  If the listing was
curfrently off,   then this directive has no effect.   The NOLIST dir-
ective is not listed. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 72 of 90


   20.38.  NOLISTC

        Label:          Sequence symbol or blank
        Operation:      NOLISTC
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    do NOt LIST Conditional source.
                                   --  ---- -

The  LISTC directive  controls the listing of statements  that are not
being assembled because of a prior AGO or AIF  directive  that  turned
off the assembly. When a NOLISTC directive has been encountered, PAGE8
will not list statements that are not being assembled.

PAGE8  defaults to a  NOLISTC condition at the start of each  assembly
pass. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 73 of 90


   20.39.  NOLISTM

        Label:          Sequence symbol or blank
        Operation:      NOLISTM
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    do NOt LIST Macro expansions.
                                   --  ---- -

The NOLISTM directive specifies  that only  the  assembled object code
and macro  call  are to be listed during  the  expansion of  a  macro.
NOLISTM cancels the effect of a prior LISTM directive.

PAGE8 defaults to  a  NOLISTM  condition  at  the  beginning  of  each
assembly pass. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 74 of 90


   20.40.  NOTE:   (User-defined message)

        Label:          Sequence symbol or blank
        Operation:      NOTE:
        Operand:        Contains a user-defined text message
        Comment:        Treated as a continuation of the operand field

        Mnemonic definition:    print NOTE.
                                      ----

This directive is  identical to the  ERROR:   directive except that no
error condition is signalled.  The error asterisks do not appear,  and
no entry appears in the cross reference cirectory of errors.  However,
the listing will be forced on,  to ensure that this statement is list-
ed.  If will be printed during each pass when the statement is encoun-
tered.

The passes one and two,   the message will always appear on the master
terminal.   In pass 3,  the message will appear on the third pass list
file. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 75 of 90


   20.41.  ORG     (Expression)

        Label:          Sequence symbol or blank
        Operation:      ORG
        Operand:        Any valid PAGE8 expression
        Comment:        Permitted

        Mnemonic definition:    ORiGin setting.
                                -- -

The ORG directive sets the origin for subsequent assembly. The expres-
sion  in the operand field is evaluated and becomes the new origin for
continuation of the assembly.  A default origin of zero is assigned by
PAGE8 at the beginning of each pass,  or whenever a FIELD directive is
encountered.  If the origin is set backwards within a given ISEC area,
the B error flag  will  be posted,   and a  HLT  instruction assembled
instead.   A HLT instruction is assembled in order to force generation
of  object  code so that the current location counter will  be printed
along with the flagged statement.   This feature provides a convenient
wasy of checking that  a program does not  go beyond a certain  memory
address.

Any symbols  in the operand field must have been previously defined in
a prior source statement  or the Q error  flag  will be posted and the
origin will not be changed.   This action takes place in all passes so
that no assembly phase errors will occur. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 76 of 90


   20.42.  PAGE

        Label:          Sequence symbol or blank
        Operation:      PAGE
        Operand:        Expression in the range 0-127 (decimal)
        Comment:        Permitted

        Mnemonic definition:    PAGE depth.
                                ----

This directive is used to  control  the number of  lines to  appear on
each page of the  listing generated during pass 3.   The operand field
should contain an expression indicating the required number of lines.

PAGE8 defaults to  a page  depth of 52 lines per page at the start  of
each assembly pass. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 77 of 90


   20.43.  PART

        Label:          Sequence symbol or blank
        Operation:      PART
        Operand:        Treated as part of the comment field
        Comment:        Permitted

        Mnemonic definition:    PARTition local symbols.
                                ----

When a PART  directive is found,   PAGE8 ensures that no previous for-
ward, nor following backward local symbols "cross" this statement. Any
attempts  to reference a local  symbol across  a  PART  directive will
cause the U error flag (unedfined symbol) to be lposted. If in a macro
expansion,   local macro symbols at the current nesting level are par-
titioned.

This  directive is supplied in order to  combat the  difficulties that
arise when a local symbol tag is missing:  no error flag is posted and
the reference will go forward or backwards until a tag is  found  with
the same number.  Obviously,  there is no way that PAGE8 can determine
that a local symbol tag is missing.   However,   by including frequent
PART directives in a program,   the programmer  can guard against this
problem quite effectively. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 78 of 90


   20.44.  PUNCH   (Expression)

        Label:          Sequence symbol or blank
        Operation:      PUNCH
        Operand:        Any valid PAGE8 expression
        Comment:        Permitted

        Mnemonic definition:    PUNCH object code.
                                -----

The PUNCH directive specifies that  the 8-bit value  of the expression
in the operand field  is to be punched on the pass 2 object code with-
out updating the assembly location counter.   The 8-bit value is added
into the binary checksum.  If the value is greater than 8 bits,  it is
truncated to 8 bits without any error flag's being posted.

By specifying a value with bit zero set (i.e.   by adding the constant
4000 (octal)),   the low order 8 bits will be punched as above but the
value will  NOT be added into the  binary checksum.   lThis  directive
caters  to special loading programs  other than ABSLDR or the standard
paper tape binary loader.  For example, the DEC typesetting loader has
a  special  DECtape origin indication--DTORG.   A macro can be  easily
written  using the  PUNCH  directive to  generate the  special  format
needed by that loading program.

As a cross-assembler,   macros  incorporating the  PUNCH directive can
generate special record headers, trailers,  data formats and checksums
for the object loader programs that run on that compouter.  Macros can
even  be written to take an  object  byte and  output  it  is a highly
specialized  format such as  the BPNF  standards require  for  burning
ROMs. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 79 of 90


   20.45.  (Symbol) QUT (Expression),(Expression)

        Label:          Symbol
        Operation:      QUT
        Operand:        Expression in range 0-7,   followed  by an ex-
                        pression
        Comment:        Permitted

        Mnemonic definition:    eQUaTe to address.
                                 -- -

The operand field should contain two expressions separated by a single
comma.  The first expression should be the 3-bit field address for the
symbol in the range 0-7.   The second  expression  should  contain the
12-bit address within that field for the symbol.  Offset references to
symbols defined by QUT will be adjusted (if necessary)  by the pagina-
tion routines.   In other words,  QUT defines a symbol in the same way
that it  would have  been defined  if the  symbol  had appeared in the
label field at the specified address.

Note that the external symbol directory generated by the /D or /G run-
time options defines all the symbolic addresses in terms of QUT state-
ments.   Offset references,  however,   should be used with great care
since PAGE8 does not have access to the page mapping  tables that were
built during  the previous assembly.   To be safe,   offset references
should probably be avoided altogether when referencing symbols defined
through an external symbol directory.

See also the use of the EQU directive for defining symbolic addresses,
since the EQU directive has some special  features associated with its
use in defining addresses. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 80 of 90


   20.46.  RADIX   (Expression)

        Label:          Sequence symbol or blank
        Operation:      RADIX
        Operand:        An expression in the range 2-10 (decimal)
        Comment:        Permitted

        Mnemonic definition:    RADIX setting for untyped constants.
                                -----

This directive sets a new radix in the range of  2-10  (decimal)   for
untyped constants.   All following untyped constants will be evaluated
in this specified radix.   Radix settings  do not affect the  use of a
precedent zero on untyped  constants as an alternate way of expressing
octal  constants--a leading zero always  specifies an  octal constant.
Also, the sign change warning posted on untyped constants applies only
to decimal constants.

This directive should be used with care.   In particular,   failure to
reset the  radix back  again after its  use  could cause  very obscure
errors in a program.  Also,  the operand field for the RADIX directive
should use a typed constant,   since the current radix of untyped con-
stants may  not be known at that point.   PAGE8 will always check that
all digits used in  an untyped constant lie within the radix specified
by the RADIX directive.

PAGE8 defaults  to a  radix of  10  (decimal)   at the start  of  each
assembly pass. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 81 of 90


   20.47.  RET

        Label:          Symbol, sequence symbol or blank
        Operation:      RET
        Operand:        Any expression containing a symbolic address
        Comment:        Permitted

        Mnemonic definition:    RETurn from subroutine.
                                ---

The RET directive provides the normal way of exiting from a subroutine
whose entry  point  has been defined with the SUB  directive.   If the
subroutine entry point is on the same page as the RET, an indirect JMP
instruction is assembled through the entry point to the subroutine. If
the RET is on a different page, an indirect JMP is assembled through a
paging link  that  points  one location back from the subroutine entry
point.   In these  cases,   it will require two jumps to exit from the
subroutine.

The operand field to the RET directive must contain a symbolic address
which appeared in the label field of a SUB directive.  If PAGE8 fiends
that this is not the case,  the J error flag is posted.   See also the
description of the SUB directive and the section on SUBROUTINES. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 82 of 90


   20.48.  ROOM    (Expression)

        Label:          Sequence symbol or blank
        Operation:      ROOM
        Operand:        An expression in the range 0-63 (decimal)
        Comment:        Permitted

        Mnemonic definition:    ROOM on page.
                                ----

The ROOM directive takes an operand field which  specifies the  number
of  following  locations  which must be assembled  together on a page.
PAGE8 forces a premature page break if necessary.  Prior definition of
any symbols  in the expression is required or the Q error flag will be
postged and the directive will be ignored.

Because  of the  complex nature of the  ROOM  directive,   PAGE8 posts
status  flags  on the listing to show approximately how  many instruc-
tions (or data)  are covered by the ROOM directive.   As a simply (al-
though not totally accurate)  guide,  the following "rule" can be app-
lied:

        1 for data,
        2 for instructions,
        1 additional if the last instruction is a skip.

Following this rule will guarantee proper coverage.  In point of fact,
this  "rule" will often result  in an  unnecessarily high value  since
certain instructions (operates and page zero  memory reference)   will
generally only require one location.  On the other hand,  current page
references may require one or  two  locations depending  on where  the
pages break,   so it  is probably best  to  use the conservative  rule
above. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 83 of 90


   20.49.  (Symbol)  SET  (Expression)

        Label:          Symbol
        Operation:      SET
        Operand:        Any valid expression
        Comment:        Permitted

        Mnemonic definition:    SET value of symbol.
                                ---

The SET directive is identical in function to the EQU directive except
that SET allows  the symbol in  the  label field  to be redefined to a
different value withoput generation of an error condition. The expres-
sion in the operand  field is evaluated and  assigned to  the  current
value of the symbol in the label field and the old value (if any)   is
lost.

In order to permit changing the value of the symbol,   the symbol must
have been originally defined with the SET directive. If the symbol had
been  originally defined with QUT  or  EQU  or appeared  as an address
label,   the value will not change and the R error flag will be posted
to signify a redefinition error.

As with EQU and QUT,   any symbols in the  expression  must  have been
defined in  a prior source statement;   otherwise,   the Q error  flag
(illegal forward reference) will be posted and the value of the symbol
will remain unchanged. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 84 of 90


   20.50.  (Symbol)  SUB  (Expression)

        Label:          Symbol
        Operation:      SUB
        Operand:        An optional expression
        Comment:        Permitted

        Mnemonic definition:    SUBroutine entry point.
                                ---

The SUB  directive  defines the entry point  of a  subroutine.   PAGE8
assembles two contiguous instructions:   the first  is an indirect JMP
instruction  to  the next location  (which will always be on the  same
page as  the first instruction).   The second location  is a data word
that comprises the value of the optional expression. If the expression
is  omitted,   a  default data word of 7402 (octal)   is automatically
provided by PAGE8. The default HLT instruction is provided to trap out
any  bad jump instructions to  the label when the program is first ex-
ecuted.

It is not necessary to define all subroutine entry points with the SUB
directive.   However,   in order to make use of the RET directive  and
allow for automatic paging, it is always desirable to do so.  See also
use of the RET  directive and the section  on SUBROUTINES  fur further
description of handling subroutines in PAGE8.

The provision for an optional expression in the SUB directive  is made
in order  to  allow  for  convenient implementation  of coroutines  in
PAGE8. A typical coroutine entry is shown in the example below:

COROUT1         SUB                     Coroutine entry point
COROUT2         SUB     1F              Initial linkage at 1H tag
        RET     COROUT1         Coroutine exit point
1H      ...                     Main-line code of coroutine
        ...
        JMS     COROUT2         Call coroutine exit point
        ...                     Main-line code continues here 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 85 of 90


   20.51.  TEXT

        Label:          Symbol, sequence symbol or blank
        Operation:      TEXT
        Operand:        Any text string  enclosed  in delimiting char-
                        acters
        Comment:        Permitted if closing delimiter is present

        Mnemonic definition:    TEXT string.
                                ----

The TEXT directive generates packed ASCII text strings. The first non-
blank character after the operator  should be the delimiter which will
appear at both ends of the string of text. If no terminating delimiter
is found,  the text string will be closed out when the end of the line
is found.

The text  string is converted so that successive locations are  filled
two characters per word with only  the low order six bits of the ASCII
character code's being stored. If the string contains an odd number of
characters, the final 6-bit byte will be set to 00 (octal).

If there is not enough room on the current page in an ISEC area, PAGE8
will  force a premature page  break and store the text  string on  the
nextg free page. If a full word of zero is needed as a sentinel on the
string,   an "at-sign" (@)   character can always be used as the final
character of the text string. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 86 of 90


   20.52.  TITLE   (User-defined sub-title)

        Label:          Sequence symbol or blank
        Operation:      TITLE
        Operand:        User-defined text  string  of  1-60  (decimal)
                        characters for title
        Comment:        Treated an an extension of the operand field

        Mnemonic definition:    TITLE for listing.
                                -----

The TITLE directive should be followed by a 1-60 (decimal)   character
text string which will then become the line 3 title (or sub-title) for
the following pages of the assembly listing. An explicit page eject is
performed before  the next  statement  is listed.   If  the charfacter
string is longer than 60 (decimal)   characters,   the remaining char-
acters will be truncated without an error's being noted.

Generally,   the second line in any source file should be a TITLE dir-
ective.   The TITLE directive should be  used frequently in the source
program to  aid in the  identification of major program segments.   As
with the FILE directive,   the TITLE directive is  not  listed so that
both directives can be issued in succession without generating a blank
page between them in the listing. The FILE, TITLE and EJECT directives
do not cause  an immediate page eject.   They  cause  a flag to be set
which indicates that a page eject will be needed in front  of the next
statement that will  actually print on the listing.   For example,   8
consecutive  EJECT  statements have the same effect as  a single EJECT
statement. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 87 of 90


   20.53.  UNLINK  (Operation code)

        Label:          Sequence symbol or blank
        Operation:      UNLINK
        Operand:        Any PAGE8 operation code
        Comment:        Permitted

        Mnemonic definition:    UNLINK operation code.
                                ------

The UNLINK  directive  causes the referenced operation code to be rem-
oved from the PAGE8  operation code tables.   Subsequent  use of  that
operation code forces PAGE8 to search the master symbol table in order
to find out if that operation code has been  defined as  a macro.   If
not,  the O error flag is posted for an undefined operation code.  The
operation code  is removed on a temporary basis only  and may be "rec-
alled" by the use of the LINK directive.

The primary purpose  of  this  directive is  to permit redefinition of
standard PAGE8 operation codes by use of the macro facility.   For ex-
ample,   when assembling a program for the PDP-8/I that was originally
written for the PDP-8/e,  the UNLINK directive could be used to delete
the BSW definition.   An  appropriate  macro could then  be defined to
generate in-line code or a subroutine call to emulate the BSW instruc-
tion.   This directive can also be used to trap  PAGE8 operation codes
for the purpose of providing some special feature (see the description
of the LINK directive for an example).   One final  use of the  UNLINK
directive is to remove operation  codes that conflict with the  opera-
tion  codes  of another computer when PAGE8  is being used as a cross-
assembler for that computer.

NOTE:   careless use  of the  UNLINK directive can cause phase  errors
during assembly  if the  directive being unlinked  has been  used in a
prior source statement.   This can occur because PAGE8 does not relink
all unlinked  operation  codes at  the  start of each pass.   For this
reason,   one should be  careful to include these LINK and UNLINK dir-
ectives  early  in the program  before any  object code has been  gen-
erated. The fact that operation codes are not relinked at the start of
each pass can be a useful feature in some special circumstances. 
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 88 of 90


21.  Alphabetic Listing of all Defined Operation Codes

Legend:
------

mri     memory reference.
imri    indirect memory reference.
opr     operate instruction (7xxx)(octal).
iot     I/O instruction (6xxx)(octal).
oasm    object code generating assembly directive.
nasm    non-object code generating asembly directive.
nasm*   assembly directive that causes information to be  generated on
        the object file,  but does not itself cause any information to
        be stored at any location within the program.

        AFIELD  nasm
        AGO     nasm
        AIF     nasm
        ALIGN   nasm
        AND     mri
        ANDI    imri
        ANDX    oasm
        ANOP    nasm
        AREAD   nasm
        AS      oasm
        BSW     opr
        BYTE    oasm
        CAF     iot
        CAL     opr     (CLA    CLL)
        CAM     opr     (CLA    MQL)
        CDF     iot
        CIA     opr     (CMA    IAC)
        CID     iot
        CIF     iot
        CLA     opr
        CLL     opr
        CMA     opr
        CML     opr
        CREF    nasm
        DC      oasm
        DCA     mri
        DCAI    imri
        DCAX    oasm
        DI      oasm
        DSEC    nasm
        DSI     oasm
        EJECT   nasm
        END     nasm
        EQU     nasm
        ERM     nasm
        ERROR:  nasm
        FIELD   nasm*
        FILE    nasm
        FREE    nasm
        GAP     nasm
        GTF     iot
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 89 of 90


        HLT     opr
        IAC     opr
        INC     mri
        INCI    imri
        INCX    oasm
        IOF     iot
        ION     iot
        IOS     iot
        IOT     iot
        ISEC    nasm
        ISZ     mri
        ISZI    imri
        ISZX    oasm
        JMP     mri
        JMPI    imri
        JMPX    oasm
        JMS     mri
        JMSI    imri
        JMSX    oasm
        LAS     opr     (CLA    OSR)
        LDI     oasm
        LFIELD  nasm*
        LINK    nasm
        LIST    nasm
        LISTC   nasm
        LISTM   nasm
        LOAD    nasm*
        MACRO   nasm
        MEND    nasm
        MEXIT   nasm
        MONR    nasm
        MQA     opr
        MQL     opr
        MSCAN   nasm
        MSKIP   nasm
        NOCREF  nasm
        NOLISTC nasm
        NOLISTM nasm
        NOP     opr
        NOTE:   nasm
        ORG     nasm*
        OSR     opr
        PAGE    nasm
        PART    nasm
        PUNCH   nasm*
        QUT     nasm
        RADIX   nasm
        RAL     opr
        RAR     opr
        RDF     iot
        RET     oasm
        RIF     iot
        RMF     iot
        ROOM    nasm
        RTF     iot
        RTL     opr
P A G E 8 -- MACRO ASSEMBLER, V-7B         Sep.13, 1993  Page 90 of 90


        RTR     opr
        SET     nasm
        SKP     opr
        SMA     opr
        SNA     opr
        SNL     opr
        SPA     opr
        SRQ     iot
        STA     opr
        STL     opr
        SUB     oasm
        SWP     opr
        SZA     opr
        SZL     opr
        TAD     mri
        TADI    imri
        TADX    oasm
        TEXT    oasm
        TITLE   nasm
        UNLINK  nasm 