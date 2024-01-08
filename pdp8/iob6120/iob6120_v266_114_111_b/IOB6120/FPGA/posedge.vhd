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

entity PosEdge is
    port ( reset: in boolean;
	 		  clk, inp: in std_logic;
           outp: out std_logic);
end PosEdge;

architecture RTL of PosEdge is

signal inp_prev: std_logic;

begin

	process (reset, clk, inp)
	begin
		if reset then
			outp <= '0';
			inp_prev <= inp;
		elsif rising_edge(clk) then
			inp_prev <= inp;
			if (inp = '1') and (inp_prev = '0') then
				outp <= '1' after 10 ns;
			else
				outp <= '0' after 10 ns;
			end if;
		end if;
	end process;

end RTL;
