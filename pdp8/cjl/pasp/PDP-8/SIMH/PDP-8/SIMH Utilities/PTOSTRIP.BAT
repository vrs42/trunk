@ECHO OFF

Rem Strip out unwanted characters from the SIMH PDP-8 simulator paper-tape output file et al.

Rem Copyright 1975-2014 CLA Systems.

Rem Last edit:                                                           16-Feb-2014

Rem There are potentially many quirky and undesired characters in the paper tape output stream
Rem created by the SIMH PDP-8 Simulator depending upon the programs used in the simulated
Rem environment.  This program [a TECO macro tailored for use with the MS-DOS or Windows
Rem versions of TECOC] will remove all occurrences of these unwanted characters.

Rem The resultant file will be totally consistent with seven-bit ASCII standards in the host
Rem environment which is based on an exact byte count as opposed to the *sometime* standard of
Rem an imbedded sentinel Control-Z character such as is required by fixed blocksize systems
Rem such as OS/8, the P?S/8 SHELL, etc.  [Note: The Microsoft host systems themselves are also
Rem based on various fixed blocksize values, which while not unique as in the PDP-8 and other
Rem systems, still must occupy an analogous size fixed by the directory particulars.  The
Rem difference is that these systems must not only allocate fixed blocks, but also maintain the
Rem byte count.  The overhead associated with this method of file allocation could be far worse
Rem than the PDP-8-based methods; frill features in directories can cause severe overhead.]

Rem The program will remove all of the following undesired character codes and aberrations in
Rem the file:

Rem 1) The high-order bit will be stripped in all instances if set.  In some cases this means
Rem    every character as some OS/8 programs always set this bit that adds no value for
Rem    simulation although potentially serving an alternate purpose on another system
Rem    configuration.  A good example of this is how some OS/8 programs will attempt to create
Rem    file output that conforms with the old paper-tape standards for files written to be used
Rem    with the stand-alone paper-tape binary programs such as PAL III [which actually doesn't
Rem    require this] and the paper-tape edit program [that does require this].  This is only
Rem    meaningful when creating actual paper-tapes intended for that environment.  When
Rem    transferring ASCII text files either in or out of the simulated environment all
Rem    high-order bits must scrupulously be removed because the host system supports an ANSI
Rem    extended character set where all characters with the bit set have a totally different
Rem    and incompatible interpretation.  If not remedied in this regard, the files are
Rem    incompatible with virtually every host utility program that might apply.

Rem 2) The files contain embedded <NUL> and <RO> characters apparently placed there to add
Rem    inadequate support for <HT> in a misguided attempt for the file to self-support what is
Rem    required on certain output devices such as the model 35 teletype.  [Self-support means
Rem    that instead of having some local operating system dynamically tailor the actual output
Rem    characters to the intended target output device, the files are filled with the actual
Rem    fill characters needed in certain output situations such as delay characters after a
Rem    form-feed operation.  While that would make the files capable of being read into these
Rem    terminals on their built-in paper-tape readers while offline, this is otherwise a major
Rem    detriment when using the file for all other purposes.  It is simply bad practice for
Rem    terminal support to be imbedded into the file.  [And would be totally inappropriate if
Rem    the output device was ever redefined to alternate hardware with different requirements
Rem    for handling special characters.  For example, a model 37 terminal has a few cases of
Rem    alternate handling of special characters.  This kind of support is the province of
Rem    operating systems and/or utilities and should not extend into the output through a
Rem    device handler when the nominal device has no such requirement.  However, this "feature"
Rem    apparently was added to placate others with limited management and programming skills as
Rem    the contemplated usage allowed wasting a lot of time and material resources to allow the
Rem    use of the most lazy of techniques of remote printing at extremely low speed.]

Rem 3) The files will tend to contain Control-Z as the imbedded logical end of file character.
Rem    Invariably there are additional junk characters after the sentinel that were added to
Rem    flesh out the original due to fixed blocksize considerations in the PDP-8 environment
Rem    which was then transmitted to the paper-tape output via a handler designed to do this.
Rem    The simulator is not aware of this limitation of [in all likelihood] OS/8.  [Note:
Rem    OS/8 PIP has an optional operating mode to limit the output past the sentinel Control-Z
Rem    which also forces the output of some of the other undesired characters.  There is no
Rem    operating mode that can eliminate all of the problems due to the particular way each
Rem    available mode allows certain things while disallowing others.  This program will handle
Rem    all known cases allowing users of the simulated environment the ability to choice any
Rem    available mode; all will achieve the identical final result.]

Rem 4) The files may contain <LF> characters not preceded by <CR>.  This apparently comes about
Rem    due to lazy program design.  All of the physical printers encountered by the original
Rem    programmers may have indeed been capable of conforming to this convention, but it is
Rem    hardly a universal one.  When the output is passed into the host environment, intended
Rem    editing programs will have problems with this as the host environment generally conforms
Rem    to the original DEC definition with respect to such similarities as <HT> conventions and
Rem    line terminations of <CR>/<LF>.  As such, any <LF> characters will have <CR> placed
Rem    before them in the output file regardless of whether there already was one present or
Rem    not. [Note: <CR> will never be added if <CR>/<LF is already present.]

Rem Special <FF> considerations.

Rem Due to the nature of simulated environments, it is necessary to edit the intended output of
Rem certain programs geared towards printing on line printers.  The host environment will be
Rem used to select what sections of the output will be printed [or perhaps processed further
Rem before optional printing or archiving].  As such, it is clear that certain page separators
Rem must be removed from the output.  [The original convention was to output a leading and
Rem trailing <FF> to ensure the output starts and completes on a whole-page boundary.
Rem Additionally the final <FF> often facilitated tearing off the relevant output without
Rem having to place the printer offline momentarily.]

Rem As such, if the first unfiltered character is a <FF> it wll be removed.  With special
Rem focus on PAL8 and related OS/8 programs, a specific sequence of characters starting with a
REM <FF> will be entirely deleted if at the end of the file.  [Note: That these characters are
Rem present after the trailing <FF> is just additional sloppy programming.  A well-crafted
Rem program should not output characters after a <FF> on the presumption that some additional
Rem blank lines are needed afterwards; this is a clear logic error that allows this erroneous
Rem output after the trailing <FF> character.]

Rem What is particularly troublesome is some of the erroneous characters require removal or
Rem modification due to other special character considerations within the program.  At first
Rem glance this would seem to indicate the problem had to be removed in layers.  However, by
Rem using extremely pragmatic search logic, the program can be implemented in a one-pass mode
Rem of operation.  Thus, if any program creates slightly different analogous output, it might
Rem get through the overall stripping process.  As such, minor redesign might be required for
Rem handling different specifics.

Rem Despite all of these design considerations, the program processes the input file into a
Rem stripped output file in a single pass.  A more conventional "layered" approach would take
Rem inordinate time [as well as many intermediate temporary files] that would be highly
Rem undesirable.

SET CREDATE=16-Feb-2014

SET VERS=1.3

COLOR 1f

MODE CON: COLS=108 LINES=16

TITLE P?S Paper Tape or Line Printer Output Stripper

ECHO P?S Paper Tape/Line Printer Output Stripper for SIMH PDP-8 Simulator   Version %VERS% Release Date: %CREDATE%
Rem ECHO.
ECHO Copyright (c) 1975-2014, CLA Systems
ECHO CLASystems@gmail.com
ECHO.
ECHO Start %DATE% %TIME%
ECHO.

Rem Test for passed argument.

IF "%1"=="" GOTO NOARG

Rem Gets here if there is a passed argument.

SET PTO=%1

GOTO ARGSET

:NOARG

Rem If no argument set, use default paper tape output file.

SET PTO=PTPDUMMY

:ARGSET

ECHO Paper Tape/Line Printer Output File: %PTO%
ECHO.
ECHO Paper Tape/Line Printer Output Stripper in progress, please wait ...

TECOC MUNG STRIP.TEC,%PTO%

ECHO End   %DATE% %TIME%
ECHO.
ECHO Done
ECHO.

SLEEP 3

EXIT
