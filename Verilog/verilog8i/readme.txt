This folder contains a project to translate the partlist and pinlist of
an Eagle drawing of the PDP-8/i into Verilog code.  Here is a list of
the files:

readme.txt      This file.
Mxxx.v          Decriptions of Gxxx, Mxxx, Wxxx modules in pseudo-verilog.
pdp8i.ifc       Interface and implementation description of the 8/L.
pdp8i.pin       The pinlist (netlist sorted by component and pad).
pdp8i.prt       The partlist, correlating part names and module types.
toverilog.pl    The Perl script to read .ifc, .pin, and .prt, emits .v
pdp8i.v         The output verilog description of the 8/L.

The current state of the Eagle 8/i schematic and the Mxxx.v file cause 
the result to emit null descriptions for all the core memory subsystem, 
the reader/punch, and the TTY.  The result is just the core CPU itself, 
with memory interface (for extended memory), Posibus, and the front
panel.


        Vince
        v.slyngstad@frontier.com
