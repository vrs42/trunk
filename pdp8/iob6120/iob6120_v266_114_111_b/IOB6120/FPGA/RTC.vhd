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

-----------------------------------------------------------------------------------------
-- VT278 compatible RTC
-----------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

use work.IOB_Config.ALL;

entity RTC is
	generic
		(addr: DevID := RTCBASE);
	port
		(reset: in boolean;
		 clk: in std_logic;	-- system clk
		 timebase: in std_logic;	-- counting clock 900 Hz

		 -- CPU bus interface
		 IOTact: in boolean;
		 IOTdev: in DevID;
		 IOTcmd: in DevCmd;

		 cpu_write_n : in std_logic;
		 clk_write_n : in std_logic;
		 dx11 : in std_logic;
		 cpu_skip_n : out std_logic;
		 IRQ: out std_logic);
end RTC;

architecture RTL of RTC is

	signal IE, flag: std_logic;
	signal div: integer range 0 to 8;
	signal clrflag: boolean;
	signal zero, was_zero: boolean;

begin

IRQ <= flag and IE;

process (reset, timebase)
begin
	if reset then
		div <= 0;
	elsif rising_edge(timebase) then
		if div = 8 then
			div <= 0;
		else
			div <= div + 1;
		end if;
	end if;
end process;

zero <= (div = 0);

process (reset, clrflag, clk, zero, was_zero)
begin
	if reset or clrflag then
		flag <= '0';
	elsif rising_edge(clk) then
		was_zero <= zero;
		if zero and not was_zero then
			flag <= '1';
		end if;
	end if;
end process;

-- async
process (IOTact, IOTdev, IOTcmd, cpu_write_n)
begin
	if IOTact and (IOTDev = addr) and (cpu_write_n = '0') then

		if IOTcmd = CLCL then
			clrflag <= true;
		else
			clrflag <= false;
		end if;

		if IOTcmd = CLSK then
			cpu_skip_n <= '0';
		else
			cpu_skip_n <= 'Z';
		end if;

	else
		clrflag <= false;
		cpu_skip_n <= 'Z';
	end if;
end process;

-- sync
process (reset, clk, IOTact, IOTdev, IOTcmd, clk_write_n, dx11)
begin
	if reset then
		IE <= '0';	-- N.B. initially disabled
	elsif rising_edge(clk_write_n) then
		if IOTact and (IOTDev = addr) and (IOTcmd = CLLE) then
			IE <= dx11;
		end if;
	end if;
end process;


end RTL;
