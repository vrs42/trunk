--
--   Copyright (C) 2003 by J. Kearney, Bolton, Massachusetts
--
--   This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
--   This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details.
--
--   You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package IOB_Config is

--
-- 100		Beginning of recorded history (end of alpha development)
--
-- 101		Added FPGA VHDL version display
--				
-- 102		Parameterized UARTs for parity, data bits, stop bits, default bps
--
-- 103		Changed ps/2 keyboard design a bit to allow for better optimization
--
-- 104		Added support for DS1302 Clock/Calendar via IOT 614x
--
-- 105		PS/2 Break key now pulses CPREQ and enters monitor

constant VERSION: integer := 8#105#;

constant DEBUG: boolean := false;

-- generic types
subtype DevID is unsigned(0 to 5);
subtype DevCmd is unsigned(0 to 2);

-- video terminal default, can be changed by system
-- n.b. mutually exclusive with X-Y scope
constant VT52OBASE: DevID := O"00";	-- "00" to disable
constant VT52IBASE: DevID := O"00";

-- serial ports
constant NUMUARTS: integer := 1;

type ParitySel is (None, Mark, Space, Odd, Even);

type UARTIDArray is array (0 to NUMUARTS-1) of DevID;

---- default addresses are 30,32,34,... "VT78 serial"
constant UARTIBASE: UARTIDArray := (others => O"30");
constant UARTOBASE: UARTIDArray := (others => O"31");

---- Settings for the serial ports.  The default is 8N1, 9600 bps,
---- as defined by the 'others =>' clauses here.  To make a specific UART
---- use a different setting, modify one of the constants below by adding
---- an exception, e.g.
----		constant StopBitsSetting: IntegerArray := (0 => 2, Others => 1);
---- to change the stop bits on the first port to 2.
---- Note that these are 'compile-time' settings.  The code does not have
---- the ability to change settings on-the-fly, except for the baud rate.

type ParityArray is array (0 to NUMUARTS - 1) of ParitySel;
type IntegerArray is array (0 to NUMUARTS - 1) of integer;

constant DataBitsSetting: IntegerArray := (Others => 8);
constant ParitySetting: ParityArray := (Others => None);
constant StopBitsSetting: IntegerArray := (Others => 1);
constant BaudRateSetting: IntegerArray := (Others => 14);	-- 9600 bps

-- parallel printer port
---- default address is 66
constant PARPTOBASE: DevID := O"00";

-- IOTs for PIO
constant PIOBASE:  DevID := O"00";	-- set to "00" to remove PIO code
constant PIOSETBANK: DevCmd := O"4";
constant PIOSETOD: DevCmd := O"5";
constant PIOSETBITS: DevCmd := O"6";
constant PIOGETBITS: DevCmd := O"7";

-- IOT for FPGA configuration	and test
constant SPCBASE: DevID := O"42";
constant SPCVERSION: DevCmd := O"2";
constant SPCUNLOCKKEY: DevCmd := O"3";
constant SPCSETCON: DevCmd := O"4";
constant SPCREPROG: DevCmd := O"5";
constant SPCTESTSIGNALS: DevCmd := O"6";
constant SPCTESTBUS: DevCmd := O"7";

-- IOT for RTC
constant RTCBASE: DevID := O"00";
constant CLLE: DevCmd := O"5";		-- set/clear interrupt mask
constant CLCL: DevCmd := O"6";		-- clear clock flag
constant CLSK: DevCmd := O"5";		-- skip on clock flag

-- IOT for Clock/Calendar
constant CLKCALBASE: DevID := O"00";
constant CCCM: DevCmd := O"0";		-- issue command
constant CCSK: DevCmd := O"1";		-- skip on command complete
constant CCWR: DevCmd := O"2";		-- write data register
constant CCRD: DevCmd := O"3";		-- read data register

-- IOT for X-Y scope (VC8-E)
-- n.b. mutually exclusive with VT52
constant XYBASE: DevID := O"50";		-- 00 (disabled) / 50 (default) / etc.
constant DILC: DevCmd := O"0";		-- Clears enables, flags and delays
constant DICD: DevCmd := O"1";		-- Clears Done flag
constant DISD: DevCmd := O"2";		-- Skip on Done flag
constant DILX: DevCmd := O"3";		-- load X register
constant DILY: DevCmd := O"4";		-- load Y register
constant DIXY: DevCmd := O"5";		-- Clear Done flag; intensify; Set Done flag
constant DILE: DevCmd := O"6";		-- Transfer AC to the enable register
constant DIRE: DevCmd := O"7";		-- Transfers display status/enabel register to AC

-- standard IOT input instructions
constant KCF: DevCmd := O"0";	 		-- clear flag
constant KSF: DevCmd := O"1";			-- skip if flag
constant KCC: DevCmd := O"2";			-- clear flag, clear AC, start next read (PT)
constant KRS: DevCmd := O"4";			-- AC |= current char
constant KIE: DevCmd := O"5";			-- set IE/SE flags
constant KRB: DevCmd := O"6";			-- AC = current char, clear flag

-- standard IOT output instructions
constant TFL: DevCmd := O"0";			-- set flag
constant TSF: DevCmd := O"1";			-- skip if flag
constant TCF: DevCmd := O"2";			-- clear flag
constant TSB: DevCmd := O"3";			-- set baud (VT278)
constant TPC: DevCmd := O"4";			-- print character
constant TSK: DevCmd := O"5";			-- skip if input or output flag
constant TIE: DevCmd := O"5";			-- set printer IE (line printer only)
constant TLS: DevCmd := O"6";			-- print char, clear flag

function slvrev ( v: in std_logic_vector ) return std_logic_vector;

end IOB_Config;


package body IOB_Config is

function slvrev ( v: in std_logic_vector ) return std_logic_vector is
variable result: std_logic_vector(v'range);
begin
	for index in v'range loop
		result(v'length - 1 - index) := v(index);
	end loop;
	return result;
end slvrev;

end IOB_Config;
