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
library UNISIM;
use UNISIM.VComponents.all;

use work.VC8E_cfg.ALL;

entity XYRam is
    Port ( clk : in std_logic;
           re : in std_logic;
           rAddr : in LinkReg;
           rLink : out LinkReg;
           rX : out CoordReg;
           rAge : out AgeReg;
           we : in std_logic;
           wAddr : in LinkReg;
           wLink : in LinkReg;
           wX : in CoordReg;
           wAge : in AgeReg);
end XYRam;

architecture RTL of XYRam is

begin


end RTL;
