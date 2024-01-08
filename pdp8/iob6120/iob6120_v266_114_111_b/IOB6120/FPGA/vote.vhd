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

entity Voter is
	port
		(reset: in boolean;
		 clk: in std_logic;
		 inp: in std_logic;
		 outp : out std_logic);
end Voter;

architecture RTL of Voter is

signal sr: std_logic_vector(0 to 2);
signal op: std_logic;

begin

-- this should translate to a LUT pretty well
outp <= op;

process (reset, clk, inp)
begin
	if reset then
		sr <= (others => '0');
		op <= '0';
	elsif rising_edge(clk) then

		sr(0 to 1) <= sr(1 to 2);
		sr(2) <= inp;

		if (op = '0') and (sr = "111") then
			op <= '1';
		elsif (op = '1') and (sr = "000") then
			op <= '0';
		end if;
	end if;
end process;

end RTL;
