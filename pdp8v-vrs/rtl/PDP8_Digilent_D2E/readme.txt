Digilent DigiLab-2e
=================== 

     At the time of writing the DigiLab-2e version will build but issues
     remain to be resolved in the .UCF file. This version has not yet been
     validated on hardware so no .bit file is released


Digilent Inc (http://www.digilentinc.com) has a Spartan IIe based product, the
DigiLab-2e which supports the PDP-8/V. Use the DigiLab-2e in conjunction
with the DIO1 board to provide all IO connectors.

The DigiLab-2e and DIO1 boards provide compact and neat system implementing
all the functions for a 4 Kword PDP-8/V. The only lacking features are an SRAM
module to  provide for a 32 Kword configuration and a non volatile configration
memory to avoid the necessity to download the FPGA code at each power-on. 
A socket ont he FPGA board can be populated with a PROM for power on configuration
but the PROM is only progammable once. The cost of the boards is extremely 
reasonable, at about $150.


Hardware Setup
==============

Connect the DIO1 board to the E-F connectors of the Digilab-2e board. 

Connect the peripheral to their appropriate connectors : 

    Parallel port to a PC, 
    RS232 terminal.
    VGA monitor
    PS/2 keyboard/keypad, 

Verify that the frequency of the oscillator at ?? on the DigiLab board is the 
default 50MHz

On the DIO1 board, set the configuration on the 8 sliders switcehs as follows :

       SW   : 1  2  3  4  5  6  7  8
              -  -  -  -  -  -  -  -           
                    |  |  
                    |  |
                    ------------------- TTY baud   : 0 0  : 9600
                                                     0 1  : 2400 
                                                     1 0  : 1200
                                                     1 1  :  110


The terminal should be set up for 7 bit data, mark parity, 2 stop bits. The speed
may be 9600, 2400, 1200 or 110 baud, selected by the configuration switches SW-3
and SW-4.



Building the Bit file
=====================

If you use the standard configuration described above it should not be necessary
to build the bit file from the sources. If your configuration differs
from the standard you will need to modify the sources to conform to your changed 
configuration and then rebuild the bit file.

Before compiling a changed version it is a good idea to build the standard
version from the sources to gain familiarity with the process and to verify
that the original sources contain no compile errors.

You will need the Xilinx WebPack version 6.03. This is available as a free 
download after registering on the Xilinx site :

Follow the Xilinx instructions for installling your WebPack software.

To build the binary bitstream file :

1) Start the Xilinx Project Navigator

2) Open the DIGILAB2e.npl project file.

3) Select the PDP8.vhd module in the sources panel

4) In the processes panel, if no green check mark appears click on Check Syntax.

5) Select the CGEN.vhd module in the sources panel

6) In the processes panel, if no green check mark appears click on Check Syntax.

7) Select the DIGILAB2E.VHD module in the Sources panel.

8) Click on Generate Programming File in the processes panel

9) Click on the Impact (programming icon and download your newly
    created bitfile.

