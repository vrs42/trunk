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
-- LC8E printer interface with Centronics output
-----------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

use work.IOB_Config.ALL;

entity LC8E is
	generic
	(
	print_addr: DevID
	);
	port
	(reset: in boolean;							-- true when reset (IOCLR)
	 IOTact: in boolean;							-- true when in IOT (LXDAR)
	 IOTdev: in DevID;							-- latched IOT device code
	 IOTcmd: in DevCmd;							-- latched IOT command

 	 cpu_write_n : in std_logic;
	 clk_write_n : in std_logic;
	 dx : in std_logic_vector(7 downto 0);
	 cpu_skip_n : out std_logic;
	 pIRQ: out std_logic;

	 -- LPT port
	 lpt_ack: in std_logic;
	 lpt_busy_n: in std_logic;
	 lpt_paper_end_n: in std_logic;
	 lpt_select_in_n: in std_logic;
	 lpt_error: in std_logic;
	 lpt_strobe: buffer std_logic;
	 lpt_ddir: out std_logic;
	 lpt_data: inout std_logic_vector(7 downto 0);
	 lpt_init: out std_logic);
end LC8E;

architecture RTL of LC8E is

	signal lpt_sel, lpt_wr: boolean;
	signal lpt_ready, lpt_flag, lpt_IE: std_logic;

begin

	lpt_ready <= '1' when (lpt_busy_n = '1') and (lpt_error = '0') and
					  (lpt_paper_end_n = '1') and (lpt_select_in_n = '0')
					  else '0';

	lpt_init <= '1' when reset else '0';
	lpt_ddir <= '1';  							-- always output for now

	process (clk_write_n, lpt_sel)
	begin
		if rising_edge(clk_write_n) then
			if lpt_sel then
				lpt_data <= dx;
			end if;
		end if;
	end process;

	lpt_sel <= IOTact and (IOTdev = print_addr);
	lpt_wr <= lpt_sel and (cpu_write_n = '0');

	process (clk_write_n, lpt_sel, IOTcmd)
	begin
		if not lpt_sel then
			lpt_strobe <= '0';
		elsif rising_edge(clk_write_n) then
			if lpt_sel and ((IOTcmd = TPC) or (IOTcmd = TLS)) then
				lpt_strobe <= '1';
			end if;
		end if;
	end process;
	
	pIRQ <= lpt_IE and lpt_flag;

	--maintain printer flag

	process (reset, lpt_wr, IOTcmd, lpt_ack)
	begin
		if reset or (lpt_wr and (IOTcmd = TCF)) then
			lpt_flag <= '0';
		elsif lpt_wr and ((IOTcmd = TFL) or (IOTcmd = TLS)) then
			lpt_flag <= '1';
		elsif rising_edge(lpt_ack) then
			lpt_flag <= '1';
		end if;
	end process;

	-- handle c0/c1/skip

	process (lpt_sel, IOTcmd, lpt_flag, lpt_ready)
	begin
		if lpt_sel then
			-- skip
			case IOTcmd is

				when TSF | TSK =>
					if (lpt_flag and lpt_ready) = '1' then
						cpu_skip_n <= '0';
					 else
					 	cpu_skip_n <= 'Z';
					end if;

				when others =>
					cpu_skip_n <= 'Z';

			end case;
		else
			cpu_skip_n <= 'Z';
		end if;
	end process;

	-- handle IOTs
	-- in this case, the print strobe is passed straight through to the printer,
	-- so the only command we have to decode here is KIE to maintain the
	-- Interrupt Enable flag
	process (reset, clk_write_n, dx)
	begin
		if reset then
			lpt_IE <= '0';
		elsif rising_edge(clk_write_n) then
			if lpt_sel and (IOTcmd = TIE) then
				lpt_IE <= dx(0);
			end if;
		end if;
	end process;

end RTL;
