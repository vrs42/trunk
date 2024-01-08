
	      All files Copyright (C) 2001 by Spare Time Gizmos.

  All SBC6120 documentation files including, but not limited to, schematics,
Gerber files, and the SBC6120 User's Guide, are covered under the terms of
the GNU Free Documentation License.  Permission is granted to copy,
distribute and/or modify these files under the terms of the GNU Free
Documentation License, Version 1.1 published by the Free Software Foundation;
with no invariant sections; with the front cover text "Portions Copyright (C)
2001 by Spare Time Gizmos" and our URL, and with no back cover text.  A copy
of this license is included with this distribution in the file FDL.TXT.

  All SBC6120 software and firware including, but not limited to, BTS6120,
PALX, PLD configuration files, and the VM01/ID01 handlers, are covered under
under the terms of the GNU General Public License.  Permission is granted to
copy, distribute and/or modify these files under the terms of the GNU General
Public License as published by the Free Software Foundation, version 2.  A
copy of this license is included with this distribution in the file GPL.TXT.

  This file gives a brief sumary of the files included in the SBC6120 design
files distribution.  For more infomration please refer to the SBC6120 User's
Guide, which is available for download from www.SpareTimeGizmos.com.

In sub-directory SCH
CPU    .PS  -> PostScript schematic for the SBC6120 CPU section
MEMORY .PS  ->   "    "      "       "   "     "    memory subsystem
IOT    .PS  ->   "    "      "       "   "     "    IOT decoding subsystem
CONSOLE.PS  ->   "    "      "       "   "     "    console terminal subsystem
IDE    .PS  ->   "    "      "       "   "     "    IDE disk subsystem
RAMDISK.PS  -> PostScript schematic for the RAMDISK board

In sub-directory LAY
SBC6120.GTL -> Gerber file for the SBC6120 PC board top (component) layer
SBC6120.GBL ->   "     "    "   "     "    "    "   bottom (solder)   "
SBC6120.GVL ->   "     "    "   "     "    "    "   power  (inner)    "
SBC6120.GGL ->   "     "    "   "     "    "    "   ground (inner)    "
SBC6120.NC  -> NC drill file for the SBC6120 PC board
RAMDISK.GTL -> Gerber file for the RAMDISK PC board top (component) layer
RAMDISK.GBL ->   "     "    "   "     "    "    "   bottom (solder)   "
RAMDISK.NC  -> NC drill file for the RAMDISK PC board

In sub-directory PLD
IOT1  .JED  -> JEDEC file for IOT GAL #1 (U12)
IOT2  .JED  ->   "    "    "   "   "  #2 (U11)
MEMORY.JED  ->   "    "    "  memory decode GAL (U4)

In sub-directory SW
211H  .HEX  -> BTS6120 v211 image for U9  (high order six bits)
211L  .HEX  ->    "     "     "    "  U10 (low    "    "   "  )
ID01  .PA   -> Source for the OS/8 ID01 (IDE disk) handler
VM01  .PA   ->   "     "   "    "  VM01 (RAM disk)    "
