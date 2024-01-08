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

use work.VT52_cfg.ALL;

-- map an XY (80 x 24) address to a 2K address range
entity AddrMap is
    Port ( X : in COLUMN;
           Y : in ROW;
           Ybase : in ROW;
           addr : out std_logic_vector(10 downto 0));
end AddrMap;

architecture RTL of AddrMap is

	signal Y2: unsigned(5 downto 0);
	signal Y3: unsigned(4 downto 0);
	signal X2: unsigned(6 downto 0);

begin

	-- permute (0..79,0..23) XY address to map into < 2^11 locations.

	-- generate (Y + Ybase) mod 24
	Y2 <= to_unsigned(Y, 6) + to_unsigned(Ybase, 6);
	with Y2(5 downto 3) select
		Y3 <= "00" & Y2(2 downto 0)	when "000" | "011",
		      "01" & Y2(2 downto 0) 	when "001" | "100",
				"10" & Y2(2 downto 0)	when others; --"010" | etc

	-- generate permuted address
	X2 <= to_unsigned(X, 7);
	addr <= std_logic_vector(Y3 & resize(X2, 6)) when X2(6) = '0' else
			  std_logic_vector("11" & Y3(4 downto 0) & resize(X2, 4));
end RTL;
