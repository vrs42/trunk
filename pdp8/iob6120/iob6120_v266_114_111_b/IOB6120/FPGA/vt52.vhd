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

library unisim;
use unisim.vcomponents.all;

use work.IOB_Config.ALL;
use work.VT52_cfg.ALL;

entity VT52 is
	port
		(-- addresses
		 keyb_addr: in DevID;
		 print_addr: in DevID;

		 -- clocks
		 clk: in std_logic;
		 clkdiv24: in std_logic;
		 vidclk: in std_logic;

--		 DEBUGIO: inout std_logic_vector(0 to 11);

		 -- CPU bus interface
		 reset: in boolean;
		 IOTact: in boolean;
		 IOTdev: in DevID;
		 IOTcmd: in DevCmd;

	 	 cpu_write_n : in std_logic;
		 clk_write_n : in std_logic;
		 IOTread : in boolean;
		 dx : inout std_logic_vector(0 to 11);
		 cpu_c0_n : out std_logic;
		 cpu_c1_n : out std_logic;
		 cpu_skip_n : out std_logic;
		 IRQ: out std_logic;

		 -- Keyboard
		 kb_clk: inout std_logic;
		 kb_data: inout std_logic;

		 -- VGA
		 vga_RGB: out RGB;
		 vga_HS: out std_logic;
		 vga_VS: out std_logic;
		 
		 -- bell
		 bell: out boolean;
		 
		 -- break
		 break: out boolean);
end VT52;

architecture RTL of VT52 is

	component ps2kbd is
		port
			(reset: in boolean;
			 clk: in std_logic;
			 clkdiv24: in std_logic;
		  	 alt_keypad_mode: in boolean;
			 hold_screen_mode: in boolean;
			 send_identify: in boolean;
			 hold_line_release: out std_logic;
			 hold_scrn_release: out std_logic;
          break_key: out std_logic;
          ack : in std_logic;
          data : out std_logic_vector(6 downto 0);
          data_avail : out std_logic;
          kb_clk_raw : inout std_logic;
          kb_data_raw : inout std_logic);
	end component;

	component VideoGen is
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
	end component;

	component addrmap
		port
			(x: in COLUMN;
			 y: in ROW;
			 ybase: in ROW;
			 addr: OUT std_logic_vector(10 downto 0));
	end component;

	component PosEdge
		port
		  (reset: in boolean;
			clk: in std_logic;
			inp: in std_logic;          
			outp: out std_logic);
	end component;

	component bbfifo_16xN is
		generic
			(WIDTH : integer);
		port
			(data_in : in std_logic_vector(WIDTH-1 downto 0);
			 data_out : out std_logic_vector(WIDTH-1 downto 0);
			 reset : in std_logic;               
			 write : in std_logic; 
			 read : in std_logic;
			 full : out std_logic;
			 half_full : out std_logic;
			 data_present : out std_logic;
			 clk : in std_logic);
	end component;

	-- flags and interrupts
	signal IE, printer_flag, keyb_flag: std_logic;

	signal write: boolean;

	-- keyboard logic

	subtype ASCII7 is std_logic_vector(6 downto 0);
	signal rsel, rselread, alt_keypad_mode: boolean;
	signal advance_n, advance_pe, kb_valid_data,
			 kb_avail, kb_ack, resetsl: std_logic;
	signal kb_ASCII, keyQhead: ASCII7;
	signal inppacing: integer range 0 to INTERCHDELAY/24;
	signal inpready, inpavail, inpavail_pe: std_logic;
	signal iclrflag: boolean;

	-- video logic
	signal vga_VS_int, VS_pe: std_logic;

	signal scan_X, curs_X, save_X: COLUMN;
	signal top_Y, scan_Y, curs_Y, save_Y: ROW;
	signal invtext, scr_rd_en, scr_wr_en: std_logic;
	signal scr_rd_addr, scr_wr_addr: std_logic_vector(10 downto 0);
	signal scr_rd, scr_wr: std_logic_vector(7 downto 0);

	-- output control signals
	signal oclrflag: boolean;
	signal osetflag: std_logic;
	signal tsel: boolean;

	-- terminal control logic

	signal outrdy, THRE, THRE_1, THRE_2: std_logic;
	signal outpacing: integer range 0 to INTERCHDELAY/24;
	signal outc: std_logic_vector(6 downto 0);
	signal bell_int, visible_bell, erase_op: boolean;
	signal bell_count: integer range 0 to BELLDURATION;
	signal identify: boolean;

	signal break_key, hold_line_release, hold_scrn_release: std_logic;
	signal break_int: boolean;
	signal break_count: integer range 0 to 7;

	signal first_curs_X, last_curs_X: boolean;

	type OutState is
		(
		BumpIdle,
		Idle,
		IncrX,
		WaitCmd,
		WaitX,
		WaitY,
		ClearLine,
		WriteEOL,
		WriteEOS
		);

	signal ostate: OutState;

begin

	-- misc

	write <= (cpu_write_n = '0');
	IRQ <= IE and (printer_flag or keyb_flag);

-- debugging
--	process (printer_flag, tsel, outavail, IOTact, outavail, IOTdev, print_addr)
--	begin
--		if DEBUG then
--			DEBUGIO(0) <= printer_flag;
--			if IOTact then DEBUGIO(1) <= '1'; else DEBUGIO(1) <= '0'; end if;
--			DEBUGIO(2) <= outavail;
--			if IOTdev = print_addr then DEBUGIO(3) <= '1'; else DEBUGIO(3) <= '0'; end if;
--			DEBUGIO(6 to 11) <= std_logic_vector(IOTdev(0 to 5));
--		end if;
--	end process;

	-- Input (PS/2 keyboard)

	keyb: ps2kbd port map
		(reset => reset, clk => clk, clkdiv24 => clkdiv24,
		 alt_keypad_mode => alt_keypad_mode,
		 hold_screen_mode => false,
		 send_identify => identify,
		 hold_line_release => hold_line_release,
		 hold_scrn_release => hold_scrn_release,
		 break_key => break_key,
		 ack => kb_ack, data => kb_ASCII, data_avail => kb_avail,
		 kb_clk_raw => kb_clk, kb_data_raw => kb_data);

	resetsl <= '1' when reset else '0';

	kb_valid_data <= kb_ack and kb_avail;

	fifo: bbfifo_16xN
		generic map (WIDTH => 7)
		port map
			(data_in => kb_ASCII, data_out => keyQhead,
			 reset => resetsl,
			 write => kb_valid_data,
			 read => advance_pe,
			 full => OPEN,
			 half_full => OPEN,
			 data_present => inpready,
			 clk => clk);
	
	-- FIFO filling process
	process (reset, clk, kb_avail, kb_ack)
	begin
		if reset then
			kb_ack <= '0';
		elsif rising_edge(clk) then
			if kb_ack = '1' then
				kb_ack <= '0';
			elsif ((break_key or hold_line_release or hold_scrn_release or kb_avail) = '1') and
					-- n.b. we don't want to put another key into the FIFO during
					-- an IOT in which the flag might be cleared.  Not only would we
					-- lose the second key, but the flag will never go to '1' again
					-- because there will never be a rising edge on keyQ/data_present.
			      (not rsel) then
				kb_ack <= '1';
			end if;
		end if;
	end process;

	-- manage input pacing timer.  We limit the rate of input characters to
	-- a speed reasonable for a VT52
	process (reset, clkdiv24, iclrflag, inppacing)
	begin
		if reset then
			inppacing <= 0;
		elsif iclrflag then
			inppacing <= INTERCHDELAY/24;
		elsif rising_edge(clkdiv24) then
			if inppacing /= 0 then
				inppacing <= inppacing - 1;
			end if;
		end if;
	end process;

	-- manage keyboard flag
	inpavail <= '1' when (inpready = '1') and (inppacing = 0) else '0';
	inpavail_det: PosEdge port map (reset, clk, inpavail, inpavail_pe);

	-- reading process
	rsel <= IOTact and (IOTdev = keyb_addr);
	rselread <= rsel and IOTread;

	dx(5 to 11) <= keyQhead when rselread else (others => 'Z');
	dx(0 to 4) <= (others => '0') when rselread else (others => 'Z');

	-- keyboard flag management
	iclrflag <= rsel and ((IOTcmd = KCC) or (IOTcmd = KRB));
				
	process (reset, clk, inpavail_pe, iclrflag)
	begin
		if reset or iclrflag then
			keyb_flag <= '0';
		elsif rising_edge(clk) then
			if inpavail_pe = '1' then
				keyb_flag <= '1';
			end if;
		end if;
	end process;

	-- need to advance head after IOT that reads char
	advance_n <= '0' when rselread and (inpready = '1') else '1';
	adv_det: PosEdge port map (reset, clk, advance_n, advance_pe);

	-- latch IE bit
	process (reset, clk_write_n)
	begin
		if reset then
			IE <= '0';
		elsif rising_edge(clk_write_n) then
			if rsel and (IOTcmd = KIE) then
				IE <= dx(11);
			end if;
		end if;
	end process;

	-- c0/1/skip feedback
	process (rsel, write, iotcmd, keyb_flag)
	begin
		if rsel and write then

			-- c0/c1
			case IOTcmd is

				when KCC =>
					cpu_c0_n <= '0';
					cpu_c1_n <= 'Z';

				when KRS =>
					cpu_c0_n <= 'Z';
					cpu_c1_n <= '0';

				when KRB =>
					cpu_c0_n <= '0';
					cpu_c1_n <= '0';

				when others =>
					cpu_c0_n <= 'Z';
					cpu_c1_n <= 'Z';

			end case;

			-- skip
			case IOTcmd is

				when KSF =>
					if keyb_flag = '1' then
						cpu_skip_n <= '0';
					else
						cpu_skip_n <= 'Z';
					end if;

				when others =>
					cpu_skip_n <= 'Z';

			end case;
		else
			cpu_c0_n <= 'Z';
			cpu_c1_n <= 'Z';
			cpu_skip_n <= 'Z';
		end if;
	end process;

	-- Output (VGA display)
	tsel <= IOTact and (IOTdev = print_addr);

	-- manage output pacing timer

	process (reset, clkdiv24, ostate, outpacing)
	begin
		if reset or (ostate /= Idle) then
			outrdy <= '0';
			outpacing <= INTERCHDELAY/24;
		elsif rising_edge(clkdiv24) then
			if outrdy = '0' then
			   if outpacing = 0 then
					outrdy <= '1';
				else
					outpacing <= outpacing - 1;
				end if;
			end if;
		end if;
	end process;

	-- manage print flag
	osetflag <= '1' when tsel and write and (IOTcmd = TFL) else '0';
	oclrflag <= tsel and write and ((IOTcmd = TCF) or (IOTcmd = TLS));
				
	process (reset, clk, outrdy, osetflag, oclrflag)
	begin
		if reset or oclrflag or (osetflag = '1') then
			printer_flag <= osetflag;
		elsif rising_edge(outrdy) then
			printer_flag <= '1';
		end if;
	end process;

	-- manage transmit
	THRE <= '1' when THRE_1 = THRE_2 else '0';

	process (reset, clk_write_n, tsel, THRE_2)
	begin
		if reset then
			THRE_1 <= '0';
		elsif rising_edge(clk_write_n) then
			if tsel and ((IOTcmd = TPC) or (IOTcmd = TLS)) then
				-- latch the output character, reversing the bits while we're at it
				outc <= dx(5) & dx(6) & dx(7) & dx(8) & dx(9) & dx(10) & dx(11);
				THRE_1 <= not THRE_2;
			end if;
		end if;
	end process;

	-- c0/1/skip feedback
	process (tsel, write, iotcmd, printer_flag, keyb_flag)
	begin
		if tsel and write then

			-- skip
			case IOTcmd is

				when TSF =>
					if printer_flag = '1' then
						cpu_skip_n <= '0';
					else
						cpu_skip_n <= 'Z';
					end if;

				when TSK =>
					if (printer_flag or keyb_flag) = '1' then
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


	-- map the user cursor and screen refresh cursor to RAM addresses
	curs_map: addrmap
		port map
			(x => curs_X, Y => curs_Y, Ybase => top_Y, addr => scr_wr_addr);

	scan_map: addrmap
		port map
			(x => scan_X, Y => scan_Y, Ybase => top_Y, addr => scr_rd_addr);

	-- the text buffer
	textram: for n in 0 to 3 generate
	begin
		textb: RAMB4_S2_S2
			port map
				(
				-- reading port
				RSTA => '0', WEA => '0', ENA => scr_rd_en, CLKA => clk,
				ADDRA => scr_rd_addr, DIA => "00",
				DOA => scr_rd(n*2+1 downto n*2),

				-- writing port
				RSTB => '0', WEB => '1', ENB => scr_wr_en, CLKB => clk,
				ADDRB => scr_wr_addr, DOB => open,
				DIB => scr_wr(n*2+1 downto n*2)
				);
	end generate;

	vga_VS <= vga_VS_int;

	-- this module generates the timing and video signals, and converts the ASCII into
	-- its corresponding scan patterns
	video: VideoGen
		generic map
			(curs_blink => CURSBLINK,
			 curs_block => CURSBLOCK,
	       fore_color => FOREG,
	       back_color => BACKG)
	    port map
		 	(clk => vidclk,
			 X => scan_x, Y => scan_y,
	       text_rd => scr_rd_en, text => scr_rd,
	       curs_X => curs_X, curs_Y => curs_Y,
			 invert_screen => visible_bell,
	       vga_RGB => vga_RGB, vga_HSYNC => vga_HS, vga_VSYNC => vga_VS_int);

	visible_bell <= (bell_int or break_int) when BELLVISIBLE else false;
	bell <= bell_int when BELLSOUND else false;

	break_int <= (break_count /= 0);
	break <= break_int;

	-- character writing logic.
	-- this is the entire state machine that interprets character writes as
	-- displayable characters or executes control or escape functions

	vs_det: PosEdge port map (reset, clk, vga_VS_int, VS_pe);

	first_curs_X <= (curs_X = 0);
	last_curs_X  <= (curs_X = COLUMNS-1);

	scr_wr(7) <= invtext;
	scr_wr(6 downto 0) <= "0100000" when erase_op else outc;

	-- the state machine
	process (reset, clk, ostate)
	begin
		if reset then

			THRE_2 <= '0';

			-- initial state=> clear screen
			curs_X <= 0;
			curs_Y <= 0;
			save_X <= 0;
			save_Y <= 0;
			erase_op <= true;
			scr_wr_en <= '1';
			ostate <= WriteEOS;

			bell_count <= 0;
			bell_int <= false;
			invtext <= '0';
			alt_keypad_mode <= false;
			identify <= false;
			break_count <= 0;

		elsif rising_edge(clk) then

			identify <= false;

			if break_count = 0 then
				if break_key = '1' then
					break_count <= 1;
				end if;
			else
				if break_count = 7 then
					break_count <= 0;
				elsif VS_pe = '1' then
					break_count <= break_count + 1;
				end if;
			end if;

			case ostate is

				when BumpIdle =>
					-- we use this state as a way to momentarily leave Idle, so
					-- that the flag machinery is triggered
					ostate <= Idle;

				when Idle =>

					-- reset various state flags
					erase_op <= false;

					-- bell counter
					if VS_PE = '1' then
						if bell_count /= 0 then
							bell_count <= bell_count - 1;
						else
							bell_int <= false;
						end if;
					end if;

					if THRE = '0' then

						THRE_2 <= THRE_1;	-- handshake character

						if outc(6 downto 5) /= "00" then

							-- write the character to the screen
							scr_wr_en <= '1';
							ostate <= IncrX;

						else

							-- interpret control character
							case outc(4 downto 0) is
								when "00111" =>	-- BEL
									bell_count <= BELLDURATION;
									bell_int <= true;
									ostate <= BumpIdle;

								when "01000" =>	-- BS
									if not first_curs_X then
										curs_X <= curs_X - 1;
									end if;
									ostate <= BumpIdle;

								when "01001" =>	-- Tab
									if curs_X < ((COLUMNS-1) / 8)*8 then
										curs_X <= to_integer(to_unsigned(curs_X, 7) or "111") + 1;
									end if;
									ostate <= BumpIdle;

								when "01010" =>	-- LF
									if curs_Y = ROWS-1 then
										if top_Y = ROWS-1 then
											top_Y <= 0;
										else
											top_Y <= top_Y + 1;
										end if;
										ostate <= ClearLine;
									else
										curs_Y <= curs_Y + 1;
										ostate <= BumpIdle;
									end if;

								when "01101" =>	-- CR
									curs_X <= 0;
									ostate <= BumpIdle;

								when "01110" =>	-- SO	(inverse)
									invtext <= '1';
									ostate <= BumpIdle;

								when "01111" =>	-- SI	(normal)
									invtext <= '0';
									ostate <= BumpIdle;

								when "11011" =>	-- ESC
									ostate <= WaitCmd;

								when others =>		-- unknown ESC code, don't display it
									ostate <= BumpIdle;

							end case;

						end if;
					end if;

				when WaitCmd =>

					if THRE = '0' then

						THRE_2 <= THRE_1;	-- handshake character

						case outc is

							when "1000001" =>	-- 'A'	cursor up
								if curs_Y /= 0 then
									curs_Y <= curs_Y - 1;
								end if;
								ostate <= Idle;
							
							when "1000010" =>	-- 'B'	cursor down
								if curs_Y /= ROWS-1 then
									curs_Y <= curs_Y + 1;
								end if;
								ostate <= Idle;
							
							when "1000011" =>	-- 'C'	cursor right
								if not last_curs_X then
									curs_X <= curs_X + 1;
								end if;
								ostate <= Idle;
							
							when "1000100" =>	-- 'D'	cursor left
								if not first_curs_X then
									curs_X <= curs_X - 1;
								end if;
								ostate <= Idle;

							when "1001000" =>	-- 'H'	cursor home
								curs_X <= 0;
								curs_Y <= 0;
								ostate <= Idle;


							when "0111101" =>	-- '='	alt keypad mode
								alt_keypad_mode <= true;
								ostate <= Idle;

							when "0111110" =>	-- '>'	norm keypad mode
								alt_keypad_mode <= false;
								ostate <= Idle;

							when "1001001" =>	-- 'I'	reverse linefeed
								if curs_Y = 0 then
									if top_Y = 0 then
										top_Y <= ROWS-1;
									else
										top_Y <= top_Y - 1;
									end if;
									ostate <= ClearLine;
								else
									curs_Y <= curs_Y - 1;
									ostate <= Idle;
								end if;

							when "1001010" =>	-- 'J'	erase to end of screen
								erase_op <= true;
								save_X <= curs_X;
								save_Y <= curs_Y;
								scr_wr_en <= '1';
								ostate <= WriteEOS;

							when "1001011" =>	-- 'K'	erase to end of line
								erase_op <= true;
								save_X <= curs_X;
								scr_wr_en <= '1';
								ostate <= WriteEOL;

							when "1011010" =>	-- 'Z'	identify
								identify <= true;
								ostate <= Idle;
							
							when "1011001" =>	-- 'Y'	cursor positioning
								ostate <= WaitY;

							when others =>
								ostate <= Idle;

						end case;

					end if;

				when WaitY =>

					if THRE = '0' then
						THRE_2 <= THRE_1;	-- handshake character
						curs_Y <= to_integer(unsigned(outc)) - 32;
						ostate <= WaitX;
					else
						ostate <= Idle;
					end if;

				when WaitX =>

					if THRE = '0' then
						THRE_2 <= THRE_1;	-- handshake character
						curs_X <= to_integer(unsigned(outc)) - 32;
					end if;
					ostate <= Idle;

				when IncrX =>
					scr_wr_en <= '0';
					if not last_curs_X then
						curs_X <= curs_X + 1;
					end if;
					ostate <= Idle;

				when ClearLine =>				-- common code for fwd and rev line feed
					erase_op <= true;
					save_X <= curs_X;
					curs_X <= 0;
					scr_wr_en <= '1';
					ostate <= WriteEOL;

				when WriteEOL =>				-- keep writing until end of line
					if last_curs_X then
						scr_wr_en <= '0';
						ostate <= Idle;
						curs_X <= save_X;
					else
						curs_X <= curs_X + 1;
						ostate <= WriteEOL;
					end if;

				when WriteEOS =>				-- keep writing until end of screen
					if last_curs_X then
						if curs_Y = ROWS-1 then
							scr_wr_en <= '0';
							ostate <= Idle;
							curs_X <= save_X;
							curs_Y <= save_Y;
						else
							curs_Y <= curs_Y + 1;
							curs_X <= 0;
							ostate <= WriteEOS;
						end if;
					else
						curs_X <= curs_X + 1;
						ostate <= WriteEOS;
					end if;

				end case;

		end if;
	end process;

end RTL;
