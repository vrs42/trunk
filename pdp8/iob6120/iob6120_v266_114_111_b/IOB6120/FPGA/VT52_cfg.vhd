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
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.ALL;

package VT52_cfg is

	constant BELLSOUND: boolean := true;
	constant BELLVISIBLE: boolean := true;
	constant BELLDURATION: integer := 10;	-- frames the bell lasts - ~1/6 sec

	constant INTERCHDELAY: integer := 767;	-- clocks delay between characters = ~ 26 us

	constant ROWS: integer := 24;
	constant COLUMNS: integer := 80;
	constant CELLH: integer := 8;
	constant CELLV: integer := 16;

	subtype ROW is integer range 0 to ROWS-1;
	subtype COLUMN is integer range 0 to COLUMNS-1;
	subtype RGB is std_logic_vector(0 to 2);

	constant FOREG: RGB := "111";
	constant BACKG: RGB := "000";
	constant CURSBLINK: boolean := true;
	constant CURSBLOCK: boolean := false;

end VT52_cfg;
