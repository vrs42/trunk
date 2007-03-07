                                      PDP-8/V

                 A reimplementation of a PDP-8/e using FPGA technology

  		                  Version 1.24
 
                                 6 January 2004



Introduction
============

The PDP-8 was first announced in 1965 at a price of some $18,000 for a system
with 4K words of 12 bit memory. It was the first mass-market computer and coined
the term "mini-computer'. The most popular model of the long lived series was
probably the PDP-8/e of which this project is a reimplementation. 

Some reference documents if you are not familiar with the PDP-8 :

   http://www.cs.uiowa.edu/~jones/pdp8/index.html

   http://www.bitsavers.org/pdf/dec/pdp8/SmallComputerHandbook_1970.pdf
       (Caution file is 22.8 Mb).

All necessary components to build the PDP-8/V are available for purchase
off-the-shelf. For the most part, no soldering or other electronic experience
is necessary. Just plug together the components, download the configuration
and you will have a complete, working PDP-8/V computer. Excluding a VGA screen
and PC keyboard, the cost of building the PDP-8/V ranges from US$150 to US$900
depending on the FPGA development board selected. The appendix provides a 
description of several commercially available FPGA development boards suitable
for hosting the PDP-8/V. Certain boards, chosen for their particular 
functionality or superior cost/performance may not support all features or may
require a small amount of adaptation to make them functional.

Note that the flexibility of the implementation of this hardware setup allows
its use for any number of other systems implementations. Already in 
development are PDP-1 and PDP-9. Other manufacturers computers are also being
considered.


PDP-8 architecture
==================

In essence, a classic single accumulator machine architecture, the small 12 bit
word length of the PDP-8 posed some problems for the designers. Only 4K words
can be addressed even using all 12 bits of the word. The trade off between
opcode and address length was therefore crucial. 

All instructions are single address and encoded in a single word. Three bits
are allocated to the opcode, providing for only eight instructions. For the
six memory addressing instructions, seven bits are assigned for address bits
and the remaining two bits are used for address mode selection.


Instruction Set
---------------

Memory Addressing Instructions

There are six memory addressing instructions. The memory address comprised of 
two mode selections bits and seven address bits.

The basic 4K word memory is divided into 32 pages of 128 words. At any point of
execution, two of theses pages are directly addressable, selected by bit 4 of the
instruction, the page bit. When set the page bit selects the page from which the
instruction was fetched, thus providing access to "local" addresses; when the
page bit is zero, page 0 is selected, providing access to "global" addresses.
Within the page, the word addressed is selected by the seven address bits. When 
the second mode bit, the indirect bit, is set the addressed word is used as the
address of the operand thus providing access to the full 4 K-word base address 
space.

An interesting feature is the "auto-index" feature. When certain words (addresses
10 thru 17 octal) in page zero are used as indirect addresses, their value is
incremented in memory before their use as an address. This provides for a limited
indexing scheme. It is interesting to note that this auto-index comes at no cost
in execution time on the original PDP-8, the increment being done before the 
rewrite of the contents required by the way that core memory was accessed.

The six instruction operations provided are : and, add, increment skip zero, 
deposit, jump storing PC, and jump. Note the absence of load and of subtract
operations

The 'and' and 'add' instructions are the only ones to alter the accumulator,
performing their usual operations. Two's complement arithmetic was used.
Subtraction is performed by loading the subtrahend, complementing then adding the 
the minuend. 

The deposit instruction stores the contents of the accumulator in the referenced
memory word and then clears the accumulator. A load is effected by adding to the
cleared accumulator.

The increment and skip if zero instruction causes the referenced memory location
to be incremented and, if the result was zero, the instruction counter to be 
incremented effectively skipping the following instruction.

In the absence of a stack, the subroutine call or jump and save PC instruction 
saves the PC at the referenced memory location and sets to PC to the address of
the memory location following that one. A subroutine return is effected by an
indirect jump to the saved PC value, no special return instruction is required.
Note this precludes using subroutines in read only memory and makes recursive calls
complicated. One useful technique is to setup a table of often used subroutine
addresses in page 0, a call can thus be made to these subroutines from anywhere
in memory using a page zero indirect call instruction.

The operate instruction

The operate instruction uses the nine remaining instruction bits to perform 
operations requiring no memory operand. The operations are "micro-coded", 
meaning that each bit is allocated its function which, for the most part, is
independent of operations done by the other bits. Thus useful combinations can be
developed. The operations performed included : clearing, complementing and 
incrementing the accumulator, clearing and complementing the link bit, shift
left and rotate right of the accumulator by one or two bits, skipping the
following instruction based on the the accumulator being negative or zero
or the value of the link bit. The operations are executed in a predefined order 
in three phases so multiple operations on the accumulator can be safely combined.

Several literal values can be developed in the accumulator using these operations
including the numbers 0 to 4, reducing somewhat the inconvenient absence of any
literal load instruction.

The Input-Output instruction

The input output instruction provides a six bit device address and a three
bit function code which can be used in any way by the device. 

The device address, function code and contents of the accumulator are made
available on the bus. Depending on the function code, the device may read data
from the accumulator, write data to the accumulator, cause the next 
instruction to be skipped depending on the state of the device, or may perform
internal device functions.


Machine Extensions
------------------

Two major system expansion modules were offered: the EAE or extended arithmetic
element and the extended memory option.

The EAE module adds a second, 12 bit, register to the processor, the MQ register
and added functionality to the operate instruction by provided for multi-bit shift
instructions, 12 bit multiply and divide.

The extended memory module provides functions to extend the address space to 32
K-words or eight fields of 4 K-words each. It also provides a "time-share option"
which added a user-mode to the processor. In user-mode, all IO instructions and
certain sensitive operate functions are trapped and cause an interrupt. This
allowed time-sharing software to be developed.



PDP-8/V Operation
=================

The PDP-8/V uses a VGA display to show the internal state of the machine and 
a PS/2 or compatible keyboard (or numeric keypad) to control the operation
of the CPU.


The Display
-----------

The VGA display shows a number of registers corresponding to the internal state
of the CPU. The display is in binary, and is similar to the display of the 
machines at the time of the PDP-8/I and before.

The first row of indicators shows from left to right, the Data Field, the 
Instruction Field, and the Program Counter.

To the right, of the rows, there is a column that decode the Instruction Register, 
indicating which of the eight opcodes is currently being executed (if any).  The 
next column decodes the states of the machine:

Idle	The machine is idle (halted).
Fetch	The machine is setting up an instruction fetch.
Decode	The machine is decoding the data from the fetch.
Defer	The machine is doing a memory indirection.
Execute	The machine is executing an instruction using the data from memory.
OPR	The machine is executing a complicated OPR instruction.
Pause	The machine is waiting for a response to an IOT operation.
EAE1	The machine is initializing an EAE operation.
EAEStep	The machine is iterating an EAE operation.
Break	The machine is off the bus, waiting for a DMA operation.

To the right of that, a column indicates general status of the machine:

Run	The machine is running (executing instructions).
ION	Interrupts are enabled.
User	The machine is in user mode (IOT, OSR, HLT prohibited).
Trap	The machine has detected a priviledged instruction in user mode.
Fault	The machine has detected an internal error.

The next row of indicators shows the memory address involved in the most recent 
memory operation.  The row below that shows the content of that memory address.
(During IOT and OPR instructions, this will continue to show the instruction 
being executed.)

Following that is a display of the accumulator with its link bit. The next 
line show the state of the extended arithmetic registers, the Step Counter 
and the MQ.

The next display shows some additional CPU state.  The "B" indicator is lit 
if the EAE option is in mode B.  The "EAE Op" displays the relevant bits 
that encode EAE operations that take more than a single clock.  The the 
right of that, the "STA" bits encode information about the last IOT instruction.
In particular, the leftmost bit will be set if no I/O device responded to the 
last IOT.  If an I/O device did respond, this bit will be clear, and the I/O 
device has the option of setting the other two bits.  (This is useful for 
debugging the I/O devices.)

The ADDRESS KEYS and DATA KEYS lines show the data input registers used to set
data into the system. They are fully described in the next sections.



Keyboard Operation
==================

The operation of the PDP-8/V is controlled entirely form the numeric keypad of
the attached keyboard. Indeed you can use a numeric keypad.

The doc.pdf file contains a diagram of the keypad with legends
corresponding to the use of the keys. Here is an ASCII diagram :

              ------ ------ ------ ------
             | Start| Cont | Stop | Step |        
             |      |      |      |      |        
             |  Nlk |    / |    * |    - |        
              ------ ------ ------ ------
             | 7    | Data | Addr | Next |        
             |      |      |      | Addr |        
             |      |    8 |    9 |      |        
              ------ ------ ------|      |
             | 4    | 5    | 6    |      |        
             |      |      |      |      |        
             |      |      |      |    + |        
              ------ ------ ------ ------
             | 1    | 2    | 3    | Load |        
             |      |      |      | Addr |        
             |      |      |      |      |        
              ------ ------ ------|      |
             | 0           | Dep  |      |        
             |             |      |      |        
             |             |    . | Enter|
              ------ ------ ------ ------


The actual key legends are shown in the lower right of the keys.


ADDR and DATA and their registers
---------------------------------        

There are two data entry registers on the control panel. They are labeled
ADDRESS KEYS and DATA KEYS. The corresponding octal values are
displayed in the green area as ADR and DAT.

To enter data into the Address register, first press the Addr key (9), this
clears the Address Keys register ready for input. To indicate that the
address register is selected, its legend turns green. Now type an address
using the octal keys 0 to 7 on the keypad. To set an address of 1234 we would
press the Addr (9) key, followed by the keys 1, 2, 3, and 4. We will show this
sequence as follows : {Addr 1234}

In a similar fashion, the Data Keys are set by first pressing the Data key. To 
set the Data keys to a value of 23 type Data (8), 2 and 3 : {Data 23}

The Address and Data keys are just holding registers for values. Other keys
use the values in these registers when performing their assigned functions.


LOAD ADDR key
-------------

The LOAD ADDR key loads the current value in the ADDRESS KEYS register into the
Memory Address (MA) register. Once loaded the contents of the memory at that
address is fetched and displayed in the MB register. So to view the value of
memory location 7700 key the sequence {Addr 7700 Load-Addr}, the value in
MB should show 7402


NEXT ADDR key
-------------

The NEXT ADDR key increments the value in the MA and displays the contents
of that new address in the MB. Examining memory is thus the sequence of
initializing the MA using the LOAD-ADDR key and then NEXT-ADDR to display 
successive words.


DEPOSIT Key
----------

The DEPOST key, labeled DEP, is used to change the values in memory. Pressing
DEP down will copy the value in the DATA KEYS register to the MB register then
write that value to memory at the address in the MA register. Releasing the DEP
key will increment the MA and display the value of that new address in MB.
Setting a series of words in memory consists of establishing a value in MA using
LOAD-ADDR key, then keying in each data value, typing the DEP key between each
one. To write thew value 1,2,3,4 to memory location 100 onward : 

    {Addr 100 Load-Addr Data 1 Dep Data 2 Dep Data 3 Dep Dat 4 Dep}

If all 4 digits of a data value are typed it is not necessary to press DATA prior
to each value. The above sequence could also be done using : 

    {Addr 100 Load-Addr Data 1 Dep 0002 Dep 0003 Dep 0004 Dep}


START key
---------

The START key is used to begin execution of a program. START will copy the value
in the ADDRESS KEYS register into the Instruction Field, Data Field, and Program 
Counter, Clear AC and Link, re-initialize the I/O devices (similar to the CAF
instruction) and execute the instruction at that address. Unless the HLT key is 
active, instruction execution will continue at full speed until stopped by a 
HLT instruction, a processor fault or the action of the STOP key.


CONT key
--------

The CONT key resumes processor execution at the address in the Program Counter.
Its operation is similar to the START key with the exception that the PC is not
changed and re-initialization is not performed.  If the HLT key is active, CONT 
will execute a single instruction before halting the processor


STOP key
--------

Pressing the STOP key will halt the processor at the end of the current
instruction. Continuation is possible using the CONT key.

Pressing the STOP key down and keeping it down for a second or two will latch the
HLT key, in this state START and CONT will execute a single instruction before
halting the processor.  In this mode, the "SI" indicator will appear in the 
"down" position.  (Unfortunately, debugging in this mode is not as useful as 
one might expect, since it will always stop in "Idle" state, in which no 
information about the next instruction is yet available.)  To clear single 
instruction mode, briefly press the STOP key again.


STEP key
--------

Pressing the STEP key will toggle the SS or single step key on the panel. With 
this key active, the CONT key will allow the execution of a single processor 
cycle. Instructions typically take 2 or more cycles to execute and this 
operation allows the individual cycles to be observed. A detailed knowledge 
of the internal operation of the CPU is required to make sense of single 
cycle stepping.  To clear single stepping press the STEP key a second time.



Pre-Loaded Programs
===================

After loading the FPGA, memory is preset to contain the RIM and BIN loaders, 
and the Focal 1969 interpreter.  These programs are not protected in any way 
and they can be overwritten by any other program.

RIM loader
----------
A normal PDP/8 had no ROM memory, to load any software it was necessary to key in
a small bootstrap which was used to load a tape in what is called RIM 
(Read-In-Mode) format. This is quite an inefficient format with no error checking.
The normal use of the RIM loader is to load the more capable Binary Loader, which 
reads a more efficient coding scheme and performs checksums on the values read.

In the PDP-8/V the RIM loader is preset in the memory when the FPGA is programmed.
To start the RIM loader begin execution at 7756 : {Addr 7756 Start}

The CPU will loop waiting for input from the console tape reader or equivalent.
On the attached PC, send a file in raw 8-bit binary.

BIN loader
----------
To start the Binary Loader begin execution at address 7777 with the data keys set
to value 7777 for the console reader, or 0000 for the high-speed reader.

Again the CPU will loop waiting for tape input. On the PC send the program you
wish to run in raw 8-bit binary form.

Most programs start execution at address 200, some require configuration or 
parameter information to be set in the Data keys also : {Data xxx Addr 200 Start}

FOCAL69
-------
Focal is an interactive language somewhat like BASIC. For an information about 
the language see : 

    http://www.cs.uiowa.edu/~jones/pdp8/focal/
    http://bitsavers.org/pdf/dec/pdp8/DEC-08-AJBB-DL_AdvFocalTech.pdf  (3.7Mb)

Some sample programs :

    http://bitsavers.org/pdf/dec/decus/FOCAL8-69_AnalysisOfVarianc.pdf
    http://bitsavers.org/pdf/dec/decus/FOCAL8-81_LunarLanding.pdf

Start FOCAL at 200 : {Addr 200 Start}

There will be a dialog on the TTY asking whether or not you want to keep various
extended functions. Saying no increases the amount of memory for your programs.



It can happen that an program overwrites the Binary and even the RIM loader. If
this happens you have two choices, either reload the FPGA to restore the original
preset values or type in the RIM loader manually.  It may also be that you want 
the high speed version of RIM instead of the console verstion.  Here are the 
sequences to load the two versions:

Set the Addr to 7756 and deposit values as follows:

    High Speed Version	Console Version
    ------------------  ---------------
    {Addr 7756 Data     {Addr 7756 Data 
       6014 Dep		   6032 Dep
       6011 Dep		   6031 Dep
       5357 Dep		   5357 Dep
       6016 Dep		   6036 Dep
       7106 Dep		   7106 Dep
       7006 Dep		   7006 Dep
       7510 Dep		   7510 Dep
       5374 Dep		   5357 Dep
       7006 Dep		   7006 Dep
       6011 Dep		   6031 Dep
       5367 Dep		   5367 Dep
       6016 Dep		   6034 Dep
       7420 Dep		   7420 Dep
       3776 Dep		   3776 Dep
       3376 Dep		   3376 Dep
       5357 Dep }	   5356 Dep }

It is always good form to verify that the correct values have been loaded before
execution, Type {Enter} and use {Next-Addr} to verify the sequence



Other Programs
==============

Chess Program
-------------
This is a complete chess playing program which runs in 4K of PDP-8 memory!

Load CHESS using the binary loader as explained above, start at location 200.

CHESS will ask if you want to play white or black, reply 'B" (upper case)
and CHESS will play the first move. To get a view of the board type *B when CHESS
asks for your move.



AC Counter
----------

To examine this program type the sequence {Addr 7740 Load-Addr}, then deposit
the values below.  The program uses 5 memory words :

   Addr    Data             Assembler           Comment
   --------------------------------------------------------------------------
   7740 :  7001             IAC			increment AC
   7741 :  2344             ISZ  7744		inc word 7740, skip if zero
   7742 :  5341             JMP  7741           jump to 7741
   7743 :  5340             JMP  7740		jump to 7740
   7744 :  0000             count word 		counter

The program increments AC then delays by counting the word 7744 til it overflows
and then jumps back to increment AC again.

Run the program by typing {Addr 7740 Start}. Note the AC is incrementing, a real
PDP-8/E runs about 6.5 times slower!




                                      Appendix I

                      Commercially available FPGA development boards

The boards listed here are commercially available and all should be able to host
the PDP-8/V. Not all have been validated and some may require small hardware
customization to support all the PDP-8/V functionality.

Each board to which the PDP-8/V has been ported has its own sub-directory
containing a read-me which describes the detailed setup for that board.



Burched B3
==========

This early board from Burched ( http://www.burched.biz ) based on the XC2S200 
FPGA is no longer available. It is listed because it is the board on which the
project was developed and it is still being used for development by the author.

As can be seen from the photos, the interfaces to the VGA, RS-232 and PS/2 were
home-brewed as was the SRAM extension.



Burched B5X300
==============

BurchED (http://www.burched.biz) supplies a Xilinx Spartan IIe XC2S300 based
development board and a number of accessory modules. The complete PDP-8/V system
can be built entirely from these modules requiring only a VGA monitor and PC
compatible keyboard to complete the system and a PC to provide download functions
and paper tape reader functionality.

The cost varies depending on the modules purchased : from  US$300 for a minimal
setup to US$500 for a fully developed setup.



Digilent DigiLab-2e
=================== 


     At the time of writing the DigiLab-2e version will build but issues
     remain to be resolved in the .UCF file. This version has not yet
     been validated on hardware


Digilent Inc (http://www.digilentinc.com) has a Spartan IIe based product, the
DigiLab-2e which supports the PDP-8/V. Use the DigiLab-2e in conjunction
with the DIO1 board to provide all IO connectors.

The DigiLab-2e and DIO1 boards provide compact and neat system implementing
all the functions for a 4 K-word PDP-8/V. The only lacking features are an SRAM
module to  provide for a 32 K-word configuration and a non volatile configuration
memory to avoid the necessity to download the FPGA code at each power-on. 
A socket on the FPGA board can be populated with a PROM for power on configuration
but the PROM is only programmable once. The cost of the boards is extremely 
reasonable, at about $150.



Insight-Memec DS-KIT-2S200 and DS-KIT-3SLC400
=============================================


                 Ports to these boards have ot yet been done


Insight-Memec seem to be the first to offer development systems for the new 
Spartan III FPGA : http://www.memec.com/Memec/iplanet/link1/Spartan3LC_2.pdf
The board sports a 400,000 gate FPGA at US$195 for international purchasers
this must be a bargain! In addition to this board you will need the communications
board : http://www.memec.com/Memec/iplanet/link1/P160CommModule.pdf (US$195).
which provides the RS-232, PS/2 and RS-232 ports in addition to 8 MB flash and
1 MB SRAM.

The Spartan II version of this board at US$295 includes a number of features such
as 8M x 32 SDRAM which make it quite attractive for future use. It also has RS-232
and VGA ports so though the communications board is not required to host PDP-8/V a
a PS/2 keyboard port will need to be added.

The SystemACE module at US$125 would also be useful in configuration control for
both these boards.



Trenz Electronics TE-XC2Se
==========================


     At the time of writing the TE-XCS2e version will build but
     issues remain to be resolved. This version has not yet been
     validated on hardware


Trenz Electronic (http://www.trenz-electronic.de/prod/proden6.htm) has a single
board Spartan IIe development system, the TE-XC2Se.

This is a very nice compact system providing most all facilities needed for the
PDP-8/V. The single board is extremely compact and includes a sophisticated system
which allows FPGA configuration to be saved in an on board FLASH memory. The 
only missing interfaces are PS/2 keyboard and parallel port but the board has 
a USB interface which could be used for both keyboard and paper-tape (and other)
emulations. An 8 bit expansion port could also be easily converted to a 
parallel port and PS/2 keyboard interface. At 449 euros (about US$550) it is a
very reasonable and capable system.



Xess XSB-300e
=============


              A port to the Xess XSB-300e board has not yet been done


Xess at http://www.xess.com/prod032.php3 , provide an extremely capable
board at $900 it is the most expensive listed but its capabilities more that 
justify the price. With a very complete set of interfaces many are not yet
used in the project. The only missing interface is for a PS/2 keyboard  but that
is easily connected to one of the expansion ports.



Hans B Pufal
hansp@citem.org
6 January 2004

