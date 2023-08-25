This directory contains the programs for dumping and restoring mass storage
devices on a PDP8 to another system.  Precompiled exe for MSDOS are
provided which will run under windows also but will only work with 8.3
file names (up to 8 character file name with 3 character extention 
after the period).  When running under windows don't have any other programs 
running.  The serial port will not be usable by windows programs until you 
close the DOS window that these programs were run in.

Examples of how to use are at the end of this readme

The top of each program tells how to use them.  Most of these programs
use two fields so you need at least 8k memory.  If they don't end at the
normal halt they may leave the data field non zero so remember to do an
extd addr load to clear.

The top of config.c tells the format of the config file needed to use these
programs.  The top of the dumpxxxx and restxxxx programs will tell how to use
them.

The PDP8 programs have preassembled .bin files which can be sent out the
serial port in binary mode to the binary loader so no operating system needs
to be running on the PDP8.  Under windows 95 the new hyperterminal from
www.hilgraeve.com will need to be used, the one that comes with it does not
seem to work correctly.  I have a config file for seyon under Linux which will
make it work.

I have also provided a program sendtape which can be used to send paper
tape images to the PDP-8.  

I have also provided a dumbterm program and checkser to verify serial 
communication to the PC.  The dumbterm program will act like a simple
dumb terminal so if you boot the PDP-8 to an operating system you should
be able to use it to talk to the PDP-8.
   The checkser program writes the data sent to memory for testing.  Toggle
in the following program, start it running at address 0200 then use sendtape
to send checkser.dat.

00200 7340  START,  CLA CLL CMA     / Init all our variables
00201 3017          DCA BUFLOC
00202 6031  READ,   KSF2            / Have character waiting
00203 5202          JMP .-1         / No
00204 7200          CLA
00205 6036          KRB2            / Get character
00206 3417          DCA I BUFLOC    / Save through auto increment location
00207 5202          JMP READ

See the top of checkser.pal for the expected results.  If the results are
wrong try changing stop bits to 2, see below.  If it still is wrong then
verify your serial card is set to 8 bits no parity.  Jumper settings are
at http://www.pdp8.net/serial (http://www.cs.uiowa.edu/~jones/pdp8/hard8e/).

All of the programs will work up to at least 38400 baud if you have a modified
serial board which will work at that speed.  The default serial port is
the standard console port but can be changed by reassembling the pal files.

Files:
(rest and dump have .pal and .c files)
restrk05        - RK05 Restore program
dumprk05        - RK05 Dump program
readrk05        - RK05 Surface scan program
testrk05        - RK05 Destructive read/write test
restrx01        - RX01/RX02 Restore program
dumprx01        - RX01/RX02 Dump program
resttd8e        - TD8E Dectape restore program
dumptd8e        - TD8E Dectape dump program
sendtape        - Send paper tape image to PDP-8
dumbterm        - Simple dumb terminal program
comm.c          - Communication routines for dump and restore C programs
config.c        - Config file read routine for dump and restore C programs
compall         - Unix shell file to compile all C files
compall.bat     - Dos bat file to compile all C files with turbo C
palall          - Unix shell file to assemble all pal files
checkser.pal	- Serial port test program, see below
checkser.dat	- Data file to check serial port
blkdectp.c	- Converts between old and new style DECtape images

Other useful programs:
From ftp.dbit.com/pub/putr programs to read files from and write files to
the images created by these programs.

From http://www.vobis.de/bbs/ari/files/cplus/library/en160.zip the library
I used with turbo c to compile the dos version of the C programs.

From ftp://ftp.cs.uiowa.edu/pub/jones/pdp8/palbart.c.Z the pal8 compiler
I use to assemble these programs.  They will also compile correctly will the
OS/8 PAL assembler

If you have questions or comments let me know
David Gesswein
djg@drs-esg.com
(or if that stops working djg@pdp8.net)


Example usage of these program:

First create a dumprest.cfg config file or rename the file dumprest.dos 
under DOS or dumprest.unx under unix to dumprest.cfg and edit. See
http://www.pdp8.net/serial for information on how to setup a PDP-8
(currently 8/E cards only) serial card or see read the current
configuration.  The M8655 serial card can support different numbers
of bits per character and parity.  It must be set to 8 bits no
parity for these programs to work.

The config file format is three lines
   baud rate
   0 if 1 stop bit or 1 if two stop bits
   serial device to use

The DOS default is com1 1 stop bit 9600 baud, the unix is /dev/ttyS0 
1 stop bit 9600 baud.

Next, if you can run a OS or stand alone program like Focal start it on
your PDP-8.  Then run the dumbterm program to verify that the dumprest.cfg
is correct and you can communicate with the PDP-8.  If what you
type displays correctly things are probably set up ok.  If the transfer
programs have communcatation errors you might want to try selecting
two stop bits.

Next you need to start the stand alone binary loader.  If you are running 
OS/8 you can use the command 
BOOT/PT
This should load the binary loader and then halt the PDP-8.
If you can't start the binary loader with the operating system you are
running you can manually load the RIM loader, start that running and then
load the binary loader.  If you need help on doing this contact me.

Next set the switch register to 7777, load address 7777 and start the
PDP-8 running.

Now run the sendtape program.  You can either specify on the command
line the file to send or it will prompt you.  For example to dump an RX01
enter the command sendtape dumprx01.bin.

The PDP-8 should halt after the sendtape program exits (if not wait a little
while to allow all the serial data to be sent).  The accumulator should
be zero after the halt.  If it is non zero the file did not transfer
correctly, repeat the procedure.

If you are dumping a device on the PDP-8 to a file on the PC follow this 
section, otherwise skip to the next.

******
start the dump program on the PC and enter the file name to write the
image to
example: dumprx01 image1.rx01

Next load address 200 then set switches 9 to 11 (low 3 bits of switch
register)  to the number of the drive to dump.  For your first RX01 drive 
enter 0, for the second enter 1.  For RK05's you can have a third, it 
would be 2, or 000 000 000 010 for the switch setting in binary.
If you are dumping a TD8E tape the maximum field number should
be in switches 6-8.  If you have an 8K machine (the minimum) set to 1.

Next start the PDP-8 running.  After a little bit the PC should start
printing out Track # where # will increment as each track is received
from the PDP-8.  For the DECtape is will print block instead of track.
If you are running at a slow baud rate it may take a little while
before the message appears.  See later in this file for information on 
setting baud rates on the serial cards.  If you are dumping RK05's you will
want a high baud rate, at 9600 baud it will take about an hour.

After the entire image is received the PC program will exit and the PDP-8
will halt.  If you wish to dump another media in the same drive you can 
start the PC program again and then hit CONT on the PDP-8

If a read error occurs the PDP-8 will retry several times and then
send whatever data was received.  When this happens PC program will print a 
line with information on what data was unreadable.

******

For restoring an image from the PC to the PDP-8

Next load address 200 then set switches 10 to 11 (low 2 bits of switch
register)  to the number of the drive to dump.  For your first RX01 drive 
enter 0, for the second enter 1.  For RK05's you can have a third, it 
would be 2, or 000 000 000 010 for the switch setting in binary.
If you are restoring a TD8E tape the maximum field number should
be in switches 6-8.  If you have an 8K machine (the minimum) set to 1.

Next start the PDP-8 running. 

Start the PC restore program and give it the file name to send
example: restrx01 image1.rx01

After a little bit the PC should start printing out Track # (or Block #) 
where # will increment as each track/block is sent to the PDP-8.  The PDP-8 
should write to the device.  For the DECtape it will buffer up 4k to 28k of 
data (set when you started the PDP-8) before writing to the tape so you 
make need to wait a while before seeing tape motion.  For the RK05 it
may be hard to see the write light activity but if you set the PDP-8
to display the accumulator it will display an incrementing count as
the data is received.

After all the data is sent from the PC the program will exit.  The
PDP-8 will halt at address 140 after it receives all the data.  The 
accumulator should be zero if the transfer was successful.  Other halts 
or if the accumulator is not zero indicate that either an error occurred
in the serial data or the device the PDP was writing to had an IO error.

*******

For information on setting baud rate on PDP-8/E serial cards, including
how to run M8650 cards faster than the jumper selectable baud rates
The M8655 serial card can support different numbers of bits per character 
and parity.  It must be set to 8 bits no parity for these programs to work.
See http://www.pdp8.net/serial

If the PDP-8 halts at an unexpected location read the address from
the PDP-8 and then look at the listing for the program you are running.
The halt should be one less than the address displayed on the PDP-8.
Comments should give you some information on what the error is.  If you
can't figure out the problem email me. (djg@drs-esg.com)

*******

To convert a DECtape between the old 128 words/block and the new 129
words/block format use

blkdectp infile output

It will convert infile to the opposite format

*******

I also have some other programs I wrote for testing.

readrk05        - RK05 Surface scan program

If you run this program from address 200 with switch register bits 10-11 
set to the drive number it will do a non destructive read test of the
drive.  I use this when first mounting a stored pack which hasn't been
used recently or one I just cleaned.  This verifies the pack is good and
lets me listen for noise due to dust while it quickly goes across the
entire surface.

testrk05        - RK05 Destructive read/write test

This does a quick read/write test of the drive.  It probably doesn't use
the best data pattern but runs much quicker than the diagnostics since it
doesn't do all the seeks.

David Gesswein
djg@drs-esg.com
(or if that stops working djg@pdp8.net)

