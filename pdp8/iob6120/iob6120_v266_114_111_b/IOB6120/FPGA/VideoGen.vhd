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

entity VideoGen is
	generic
		(CLKFREQ: integer := 29491200;
		 HCENTER: real := 0.50;
		 VCENTER: real := 0.50;
		 curs_blink: boolean := true;
		 curs_block: boolean := false;
       fore_color: RGB := "111";
       back_color: RGB := "000");
    port
	 	(clk : in std_logic;
       X : out COLUMN;
       Y : out ROW;
		 text_rd: out std_logic;
       text : in std_logic_vector(7 downto 0);
       curs_X : in COLUMN;
       curs_Y : in ROW;
		 invert_screen: in boolean;
       vga_RGB : out RGB;
       vga_HSYNC : out std_logic;
       vga_VSYNC : out std_logic);
end VideoGen;

architecture RTL of VideoGen is

	-- n.b. synthesizer doesn't like to use time type for calcs,
	-- so the constants are manually calculated

	-- total line and frame times
--	constant HTIME : time := 31.778 us;
--	constant VTIME : time := 14.286 ms;

	-- H and V sync pulse times
--	constant HSWIDTH : time := 3.813 us;
--	constant VSWIDTH : time := 63 us;

	-- one clock pulse
--	constant CLKTIME : time := 1 sec / CLKFREQ;

	-- number of pixels H and V
	constant HPSIZE : integer := 720;
	constant VPSIZE : integer := 384;	-- 24 lines of 16 rows

	-- total and sync clocks
	constant HTCLKS : integer := 937; -- HTIME / CLKTIME;
	constant HSCLKS : integer := 112; -- HSWIDTH / CLKTIME;
	constant VTLINES : integer := 450; -- VTIME / HTIME;
	constant VSLINES : integer := 2; -- VSWIDTH / HTIME;

	-- back and front porch clocks
	constant HBPCLKS : integer := 56; -- integer((HTCLKS - HSCLKS - HPSIZE) * HCENTER);
	constant HFPCLKS : integer := 881; --HTCLKS - HBPCLKS;
	constant VBPLINES : integer := 32; --integer((VTLINES - VSLINES - VPSIZE) * VCENTER);
	constant VFPLINES : integer := 32; --VTLINES - VBPLINES;

	component CG8x16 is
		port
			(clk : in std_logic;
			 char : in std_logic_vector(6 downto 0);
          row : in integer range 0 to 15;
          outp : out std_logic_vector(7 downto 0));
	end component;

	signal cstate: integer range 0 to 8;
	signal scan_x: COLUMN;
	signal scan_y: ROW;
	signal scan_cell: integer range 0 to CELLV-1;

	signal vidsr: std_logic_vector(8 downto 0);
	signal cursor, invert, visible_invert: boolean;

	signal hpos: integer range 0 to HTCLKS;
	signal vpos: integer range 0 to 450;
	signal eoh, acth,
			 hsync, vsync: boolean;
	signal actv: std_logic;

	signal curs_count: integer range 0 to 15;
	signal cur_blink: boolean;

	signal cg_out: std_logic_vector(7 downto 0);

begin

	X <= scan_x;
	Y <= scan_y;

	cg: CG8x16 port map
		(clk => clk, char => text(6 downto 0),
		 row => scan_cell, outp => cg_out);

	visible_invert <= invert_screen and acth and (actv = '1');

	vga_RGB <= fore_color when (vidsr(8) = '1') /= visible_invert else back_color;
	vga_HSYNC <= '0' when hsync else '1';
	vga_VSYNC <= '1' when vsync else '0';

	-- horizontal counter
	process (clk, hpos)
	begin
--		if reset then
--			hpos <= 0;
--			hsync <= false;
--			eoh <= false;
--			acth <= false;
--		els
		if rising_edge(clk) then
			if hpos = HTCLKS - 1 then
				hpos <= 0;
				eoh <= true;
			else
				hpos <= hpos + 1;
				eoh <= false;
				if hpos = 0 then
					hsync <= true;
				elsif hpos = HSCLKS - 1 then
					hsync <= false;
				elsif hpos = HSCLKS + HBPCLKS - 2 then
					acth <= true;
				elsif hpos = HSCLKS + HBPCLKS + HPSIZE then
					acth <= false;
				end if;
			end if;
		end if;
	end process;

	-- vertical counter
	process (clk, eoh)
	begin
--		if reset then
--			vpos <= 0;
--			vsync <= false;
--			actv <= '0';
--		els
		if rising_edge(clk) then
			if eoh then
				if vpos = VTLINES - 1 then
					vpos <= 0;
				else
					vpos <= vpos + 1;
					if vpos = 0 then
						vsync <= true;
					elsif vpos = VSLINES then
						vsync <= false;
					elsif vpos = VSLINES + VBPLINES then
						actv <= '1';
					elsif vpos = VSLINES + VBPLINES + VPSIZE then
						actv <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;

	-- generate blink for cursor ~ 2Hz
	process (actv)
	begin
		if falling_edge(actv) then
			if curs_count = 15 then
				curs_count <= 0;
				cur_blink <= not cur_blink;
			else
				curs_count <= curs_count + 1;
			end if;
		end if;
	end process;

	-- character generation
	cursor <= (curs_X = scan_X) and (curs_Y = scan_Y) and
				 (curs_block or ((scan_cell = 2) or (scan_cell = 3)));

	invert <= (cursor and cur_blink) or (text(7) = '1');

	text_rd <= '1' when cstate = 0 else '0';

	process (clk, eoh, acth, actv)
	begin
		if rising_edge(clk) then
			if actv = '0' then
				scan_X <= 0;
				scan_y <= 0;
				scan_cell <= 15;
				cstate <= 0;
				vidsr <= (others => '0');
			elsif not acth then
				cstate <= 0;
				vidsr <= (others => '0');
			else

				if cstate = 8 then
					cstate <= 0;
				else
					cstate <= cstate + 1;
				end if;

				vidsr(8 downto 1) <= vidsr(7 downto 0);

				case cstate is

					-- when 0 =>	-- character is read
					-- when 1 =>	-- c.g. is read

					when 2 =>
						if invert then
							vidsr <= '1' & (not cg_out);
						else
							vidsr <= '0' & cg_out;
						end if;

					when 3 =>

						if scan_x = 79 then
							scan_x <= 0;
							if scan_cell = 0 then
								scan_cell <= 15;
								scan_y <= scan_y + 1;
							else
								scan_cell <= scan_cell - 1;
							end if;
						else
							scan_x <= scan_x + 1;
						end if;

					when others =>
						null;

				end case;

			end if;
		end if;
	end process;

end RTL;
