

## Writing a PQS8 System Device Handler


To add a system device for PQS8, you need to create a module
containing the following:


1) The device driver. This will be the main I/O driver for the
   system, and must follow the calling conventions described
   later.


   The system device driver entry point is always 07640. (Chosen
   to match the encoding of the common instruction "SZA CLA".)


2) The driver must also provide a suitable bootstrap.  This
   bootstrap and the driver itself co-exist in block 0. The
   bootstrap may only use certain reserved locations for once
   only code, since they will be overlayed later by the O/S.


   The boot loader must fit in 07600-07642, and execution must
   start at 07600.


3) The modified BIN loader and RIM loader occupy 07643-0777, along
   with the driver.


4) The SLURP loader, if implemented.


5) A "FILE" image used to reload the handler with SLURP.


6) Rewind or similar device dependent operations, if implemented.



Miscellaneous facts:

The block size is one PDP-8 page (128 words).

The boot block is always block 0.

The modified BIN loader starts at 07643.

The "%" file starts at block 20.

The system (re)boots when restarted at 07600.

The system notes the low 12 bits of the current date in 07610.

The system notes the amount of memory available in location 07611.

The system notes the value of the "=" parameter, if any, in 07756.

The system notes the option flags (A-Z0-9) from the command line in
locations 07604-07606.

The system notes the list of files starting in 07757.

The system notes the output file count in location 07607.

Locations 07632-07635 contain the system loader entry point,
loading address, function word, and starting block.

Location 07637 contains the system loader startup pointer.

Location 07756 begins the standard RIM loader.

Location 07777 contains a branch to start the BIN loader.


Magic Constants:

SLURP Control functions:
    0	Data Word
    1	End of File
    2	Origin Setting
    3	Field Setting

```
Driver Calling Convention:
    	CDF MYFIELD	/DF must match caller IF
    	CIF 00		/Driver is in field 0
    	JMS I (SYSIO	/Call driver at 07640
    	BUFFER		/Buffer pointer
    	FUNC		/Function word
    	BLOCK		/First 128 word block
    	/Return here, AC clear, LINK undefined
    	/(Ideally, LINK would be clear.)
```

Driver Function Word Bits:
    0	READ=0, WRITE=1
    1-5	Block/Page Count (1-31, 0=>32 pages)
    6-8	Field for BUFFER
    9-11	Unit number (0-7)


The values in AC, LINK, etc. at the time of the call are
to be ignored.  Interrupts may be enabled at the time of
a driver call, but may be masked inside the driver during
the call. Previous state of the interrupt enable must be
restored. The system device is not permitted to set an
interrupt request -- must leave with flags clear or
interrupt masked.


Unit numbers should refer to physical or logical drives.


The block size is always one page (128 words).


There is no error return; errors should halt, and retry
when the user corrects the problem and presses continue.


Some drivers require extra code in the last available field.
TODO: Need a how-to for that.


Some drivers can interface with console overlays.
TODO: Need a how-to for that.


Ideally information relevant to shell overlays would be included
in the driver. (No such overlay is available at this time.)


System drivers are configured in memory before being written to
block 0 (and eventually booted). Drivers are currently loaded for
configuration at 17400, and should be assembled to load there, but
to operate from 07600-07777.
