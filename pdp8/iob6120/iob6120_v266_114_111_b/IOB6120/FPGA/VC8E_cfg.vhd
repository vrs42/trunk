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

package VC8E_cfg is

  constant LLENGTH: integer := 11;
  constant CLENGTH: integer := 9;
  constant ALENGTH: integer := 4;

  subtype LinkType is integer range 0 to 2^LLENGTH-1;
  subtype LinkReg is unsigned(LLENGTH-1 downto 0);
  subtype CoordType is integer range 0 to 2^CLENGTH-1;
  subtype CoordReg is unsigned(CLENGTH-1 downto 0);
  subtype AgeType is integer range 0 to 2^ALENGTH-1;
  subtype AgeReg is unsigned(ALENGTH-1 downto 0);

end VC8E_cfg;
