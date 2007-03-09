Burched B5X300 FPGA development System
======================================

BurchED (http://www.burched.biz) supplies a Xilinx Spartan IIe XC2S300 based
development board and a number of accessory modules. The complete PDP-8/V system
can be built entirely from these modules requiring only a VGA monitor and PC
compatible keyboard to complete the system and a PC to provide download functions
and paper tape reader functionality.

The cost varies depending on the modules puchased : from  US$300 for a minimal
setup to US$500 for a fully developed setup.


The following modules form the essential minimum set :

   B5-X3200			Xilinx XC2S300 FPGA board with advanced 
                                download module

   B5-peripheral-connector	Module to connect VGA, Keyboard and RS232 devices

   
Highly recommended are :

   B5-SRAM			128K*16bit SRAM module. Extends teh base memory
				configuration form 4K to 32K words.

   B5-Switches			16 DIP switch module provides configuration 
                                control

Optional :

   B5-LEDS			Display of the PDP-8/V accumulator
   
   B5-X-Flash-Config		Provides non-volatile storage of FPGA config which
                                loads automatically at power on.


BurchED also has a "Super Value Pack" which includes all the above except the
Flash-Config modules and in addition includes a Compact-Flash module and a two
digit 7-segment display module.

The Burched system is modular and provides all functions required. It even opens
the posibility of adding IDE and flash support. Its conenction system with flat
cables is very flexible but leasves the system in a somewhat untidy state. The 
total cost for all modules gets somewhat expeise at about $600. 


Hardware Setup
==============

The setup procedure consists of pluging the modules onto the FPGA board. The
standard configuration is as follows :

       FPGA
     connector
   I      
        A       --
                   >    B5-SRAM module
        B       --

        C		B5-Switches

        D		B5-Leds

        E       --
                   >    B5-Compact-Flash (not yet supported)
        F       --

        G		B5-peripherals

        H		Parallel port from advanced download module



The Burched B5-X300 board should have the oscillator frequency set to 50MHz use
follwoing values :

    S(2 downto 0) <= "011"
    R(6 downto 0) <= "0000001"
    V(8 downto 0) <= "000000111


Set the jumper on conenctor H to provide 5 volts to the peripheral connector

Set the jumper A on the SRAM board to position 1-2

Connect the 20 pin header on the download module to connector H on the FPGA board

On the switch module, set the configuration on SW1 as follows :

       SW1  : 1  2  3  4  5  6  7  8
              -  -  -  -  -  -  -  -           
                    |  |  |  |  |  |
                    |  |  |  ---------- SRAM speed : - - =  : 1 clock delay
                    |  |  |
                    |  |  ------------- RAM config : -  : No SRAM present 4Kw RAM
                    |  |                             =  : SRAM present 32 Kw RAM
                    |  |
                    ------------------- TTY baud   : - -  : 9600
                                                     - =  : 2400 
                                                     = -  : 1200
                                                     = =  :  110

The final configuration should appear as here :

               https://host3.quickdns.net/burched/b5xsvp.html

Finally connect the peripheral equipment : a PS/2 keyboard or numeric keypad to 
the either keyboard connector (note the mouse connector is not used) on the 
IO module, a VGA monitor to the video connector and an ascii terminal
to the RS232 connector.

The terminal should be set up for 7 bit data, mark parity, 2 stop bits. The speed
may be 9600, 2400, 1200 or 110 baud, selected by the configuration switches SW1-3
and SW1-4.


Downloading the FPGA configuration
==================================

The FPGA configuation is a 230 Kbyte file which contains the necesary bits to 
program the FPGA to function as the PDP-8/V. The FPGA is RAM based so it must
be reprogrammed at each power on. The download is done from a PC parallel
port connected to the download cable by the supplied 26 conductor flat cable.

If you have the B5-X-FLASH-CONFIG module it can be programmed once from the FPGA
configuration file and then it will automatically program the FPGA at each power
on thus removing the necessity of a PC connection.

Use the procedure as described in the Burched documentation to download the 
file B5V123.BIT

    
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

2) Open the PDP8-B5.npl project file.

3) Select the PDP8.vhd module in the sources panel

4) In the processes panel, if no green check mark appears click on Check Syntax.

5) Select the CGEN.vhd module in the sources panel

6) In the processes panel, if no green check mark appears click on Check Syntax.

7) Select the B3X500.VHD module in the Sources window

8) Click on Generate Programming File in the processes window.

9) Click on the Impact (programming icon and download your newly
    created bitfile.
