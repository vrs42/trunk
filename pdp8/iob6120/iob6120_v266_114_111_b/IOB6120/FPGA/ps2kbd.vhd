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

entity ps2kbd is
    Port ( reset: in boolean;
	 		  clk: in std_logic;								-- logic clock
		 	  clkdiv24: in std_logic;						-- ~1MHz clock
			  alt_keypad_mode: in boolean;
			  hold_screen_mode: in boolean;
			  send_identify: in boolean;
			  hold_line_release: out std_logic;
			  hold_scrn_release: out std_logic;
           break_key: out std_logic;
           ack: in std_logic;								-- active one logic clock
           data: out std_logic_vector(6 downto 0);	-- active until ack
           data_avail: out std_logic;					-- active until ack
           kb_clk_raw: inout std_logic;				-- to ps/2 keyboard
           kb_data_raw: inout std_logic);				-- " " "
end ps2kbd;

architecture RTL of ps2kbd is

	-- this component deglitches the input
	component Voter is
		port
			(reset: in boolean;
			 clk: in std_logic;
			 inp: in std_logic;
			 outp : out std_logic);
	end component;


  	attribute INIT_00: string;  attribute INIT_01: string; attribute INIT_02: string;  attribute INIT_03: string;
  	attribute INIT_04: string;  attribute INIT_05: string; attribute INIT_06: string;  attribute INIT_07: string;
  	attribute INIT_08: string;  attribute INIT_09: string; attribute INIT_0A: string;  attribute INIT_0B: string;
  	attribute INIT_0C: string;  attribute INIT_0D: string; attribute INIT_0E: string;  attribute INIT_0F: string;

	-- PC/AT keycode lookup table.  Encoding is:
	-- 4 bytes for each code (right to left)
	-- in each code,  from left to right:
	--		unshifted result
	--		Ctrl result
	--		Shift result
	--		Extended result (code preceded by E0 code)
	--
	--
	-- Lookup value is
	--		0 c c c c c c c			=> c
	--		1 0 c c c c c c			=> c				normal keypad mode - determined by flag
	--		1 0 c c c c c c			=> ESC ? c+@	alt keypad mode   /
	--		1 1 0 c c c c c			=> ESC c+@
	--		1 1 1 0 0 0 0 0	E0		=> dead key
	--		1 1 1 0 0 0 0 1	E1		=> shift
	--		1 1 1 0 0 0 1 0	E2		=> ctrl
	--		1 1 1 0 0 1 0 0	E4		=> caps lock
	--		1 1 1 0 1 0 0 0	E8		=> hold screen line release
	--		1 1 1 0 1 0 0 1	E9		=> hold screen screen release
	--		1 1 1 0 1 0 1 0	EA		=> break
	--
	-- 00-07                             |7      |6      |5      |4      |3      |2      |1      |0      |
  	attribute INIT_00 of rom : label is "E0E0E0E0D1D1D1E0D0D0D0E0D2D2D2E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0";
	-- 08-0F                             |F      |E      |D      |C      |B      |A      |9      |8      |
  	attribute INIT_01 of rom : label is "E0E0E0E0601E7EE0090909E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0";
	-- 10-1F
  	attribute INIT_02 of rom : label is "E0E0E0E031E021E0711151E0E2E2E2E2E0E0E0E0E1E1E1E1E0E0E0E0E0E0E0E0";
  	attribute INIT_03 of rom : label is "E0E0E0E0320040E0771757E0610141E0731353E07A1A5AE0E0E0E0E0E0E0E0E0";
	-- 20-2F
  	attribute INIT_04 of rom : label is "E0E0E0E033E023E034E024E0650545E0640444E0781858E0630343E0E0E0E0E0";
  	attribute INIT_05 of rom : label is "E0E0E0E035E025E0721252E0741454E0660646E0761656E0202020E0E0E0E0E0";
	-- 30-3F
  	attribute INIT_06 of rom : label is "E0E0E0E036E05EE0791959E0670747E0680848E0620242E06E0E4EE0E0E0E0E0";
  	attribute INIT_07 of rom : label is "E0E0E0E038E02AE037E026E0751555E06A0A4AE06D0D4DE0E0E0E0E0E0E0E0E0";
	-- 40-4F
  	attribute INIT_08 of rom : label is "E0E0E0E039E028E030E029E06F0F4FE0690949E06B0B4BE02CE03CE0E0E0E0E0";
  	attribute INIT_09 of rom : label is "E0E0E0E02D1F5FE0701050E03BE03AE06C0C4CE02FE03F2F2EE03EE0E0E0E0E0";
	-- 50-5F
  	attribute INIT_0A of rom : label is "E0E0E0E0E0E0E0E03D1D2BE05B1B7BE0E0E0E0E027E022E0E0E0E0E0E0E0E0E0";
  	attribute INIT_0B of rom : label is "E0E0E0E0E0E0E0E05C1C7CE0E0E0E0E05D1D7DE00D0D0D8DE1E1E1E1E4E4E4E4";
	-- 60-6F
  	attribute INIT_0C of rom : label is "E0E0E0E07F7F7Fe0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0";
  	attribute INIT_0D of rom : label is "E0E0E0E0E0E0E0E0E0E0E0E0B7B7E0E0B4B4C4C4E0E0E0E0B1B1E0E0E0E0E0E0";
	-- 70-7F
  	attribute INIT_0E of rom : label is "E0EAE0E01B1B1BE0B8B8C1C1B6B6C3C3B5B5E0E0B2B2C2C2AE7FE07FB0B0E0E0";
  	attribute INIT_0F of rom : label is "E0E0E0E0E8F0E0E0B9B9E0E02A2A2AE02D2D2DE0B3B3E0E02B2B2BE0E0E0E0E0";
	
	signal kb_clk, kb_data: std_logic;

	-- low-level receive
  	signal sr: std_logic_vector(9 downto 0);
  	signal kb_clk_prev, parity: std_logic;
  	signal RC_1, RC_2: std_logic;
	signal timeout: integer range 0 to 127;

	-- ASCII conversion state machine
	signal break, ctrl, shift, capsl: boolean;

	signal lookup: std_logic_vector(8 downto 0);
	signal lookup_res: std_logic_vector(7 downto 0);
	signal xlate: unsigned(7 downto 0);
	signal lookup_en: std_logic;

	-- state machine for keyboard input code sequences
	type KStates is
		(Idle,
		 GotExt,
		 GotBrk,
		 GotExtBrk);

	signal state: KStates;

	-- state machine for output (CPU) code sequences
	type CStates is
		(Idle,
		 Alpha0,		-- c
		 KPN,			-- c-80
		 KPA,			-- ESC '?' c-80+40
		 QM3,
		 Alpha3,
		 ESC1,
		 Alpha1,		-- ESC c-C0+40
		 Ident1,		-- ESC '/' 'K'
		 Ident2,
		 Ident3,
		 BreakKey,
		 HoldReleaseScreen,
		 HoldReleaseLine);

	signal cstate: CStates;

	-- state machine for keyboard output sequences
	type XStates is
		(InitRead,
		 Reading,
		 Initiate,
		 Initiate_HS,
		 XByte_l,
		 XByte_h,
		 HS_l,
		 HS_h);

	signal xstate: XStates;

	signal LEDs, LEDs_prev: std_logic_vector(0 to 2);

	-- these following types and function are intended to allow
	-- the optimizer to generate the LED setting sequence as
	-- efficiently as possible.  The previous approach of using
	-- an array of registers seemed to get optimized, but the
	-- registers that were then unused were not optimized out,
	-- according to the warning messages.

	subtype XBitType is integer range 0 to 9;
	subtype KByte is std_logic_vector(XBitType);

	subtype XByteType is integer range 0 to 1;

	signal xbit: XBitType;
	signal xbyte: XByteType;

	impure function LEDCmd(seq: in XByteType; pos: in XBitType) return std_logic is
	type LEDSequence is array(XByteType) of KByte;
	constant LEDseq: LEDSequence :=
		( ( '1', '0', '1', '1', '0', '1', '1', '1', '1', '1' ),
		  ( '0', '0', '0', '0', '0', '0', '0', '0', '0', '1' ) );
	begin
		if seq = 1 then
			case pos is
				when 0		=> return LEDs(0);
				when 1		=> return LEDs(1);
				when 2		=> return LEDs(2);
				when 8		=> return not (LEDs(0) xor LEDs(1) xor LEDs(2));
				when others	=> return LEDseq(seq)(pos);
			end case;
		else
			return LEDseq(seq)(pos);
		end if;
	end LEDCmd;

begin

	vote_clk: Voter port map (reset, clkdiv24, kb_clk_raw, kb_clk);
	vote_data: Voter port map (reset, clkdiv24, kb_data_raw, kb_data);

	rom: RAMB4_S8
   port map
      (WE => '0', EN => lookup_en, RST => '0', CLK => clk,
       ADDR => lookup, DI => "00000000", DO => lookup_res);

	lookup_en <= '1' when (cstate = Idle) else '0';

	lookup(8 downto 2) <= sr(6 downto 0);
	lookup(1 downto 0) <= "00" when (state = GotExt) or (state = GotExtBrk) else
								 "10" when ctrl else
								 "01" when shift else
								 "11";

	xlate <= unsigned(lookup_res);

	process (cstate, xlate, capsl)
	begin
		case cstate is

			when Alpha0 =>
				-- check for Caps Lock on, if so shift if alpha only
				if capsl and
				   (xlate(6 downto 5) = "11") and
					(xlate(4 downto 0) /= "00000") and
					(xlate(4 downto 0) <= "11010") then
					data <= std_logic_vector(xlate(6 downto 0) + "1100000");
				else
					data <= std_logic_vector(xlate(6 downto 0));
				end if;

			when KPN | Alpha1 =>
				data <= std_logic_vector(xlate(6 downto 0));

			when ESC1 | KPA | Ident1 =>
				data <= "0011011";			-- <ESC> char or <ESC> "?" char or <ESC> "/K"

			when QM3 =>
				data <= "0111111";			-- "?"

			when Alpha3 =>
				data <=  std_logic_vector(xlate(6 downto 0) + "1000000");

			when Ident2 =>
				data <= "0101111";			-- "/"

			when Ident3 =>
				data <= "1001011";			-- "K"

			when others =>
				data <= (others => '0');

		end case;
	end process;

	data_avail <= '1' when cstate /= Idle else '0';
	hold_line_release <= '1' when cstate = HoldReleaseLine else '0';
	hold_scrn_release <= '1' when cstate = HoldReleaseScreen else '0';
	break_key <= '1' when cstate = BreakKey else '0';

	LEDs(0) <= '1' when hold_screen_mode else '0';
	LEDs(1) <= '1' when alt_keypad_mode else '0';
	LEDs(2) <= '1' when capsl else '0';

	break <= (state = GotBrk) or (state = GotExtBrk);

	process (reset, clk, RC_1, RC_2)
	begin
		if reset then
			RC_1 <= '0';
			state <= Idle;
			cstate <= Idle;

			ctrl <= false;
			shift <= false;
			capsl <= true;

		elsif rising_edge(clk) then

			-- check for end of read strobe from host; if true,
			-- advance read state
			if ack = '1' then
				case cstate is
					when ESC1 =>
						cstate <= Alpha1;
					
					when KPA =>
						cstate <= QM3;
					
					when QM3 =>
						cstate <= Alpha3;

					when Ident1 =>
						cstate <= Ident2;

					when others =>
						cstate <= Idle;
				end case;
			end if;

			-- check for identify sequence
			if send_identify then
				cstate <= Ident1;
			-- check for new code from keyboard
			elsif RC_1 /= RC_2 then
				RC_1 <= RC_2;

				case sr(7 downto 0) is

					when "11100000" =>	-- ext
						if state = Idle then
							state <= GotExt;
						else
							state <= Idle;
						end if;

					when "11110000" =>	-- break
						if state = Idle then
							state <= GotBrk;
						elsif state = GotExt then
							state <= GotExtBrk;
						else
							state <= Idle;
						end if;

					when "1-------" =>	-- command ack, or other unhandled code, ignore
						null;

					when others =>			-- a keypress, use lookup value or modify shift status
						state <= Idle;

						if not break then
							if xlate(7) = '0' then

								cstate <= Alpha0;

							elsif xlate(6) = '0' then

								if alt_keypad_mode then
									cstate <= KPA;
								else
									cstate <= KPN;
								end if;

							elsif xlate(5) = '0' then
								
								cstate <= ESC1;

							elsif xlate(4 downto 3) = "01" then

								case xlate(2 downto 0) is

									when "000" =>
										cstate <= HoldReleaseLine;

									when "001" =>
										cstate <= HoldReleaseScreen;

									when "010" =>	-- break key
										cstate <= BreakKey;

									when others =>
										null;

								end case;

							end if;
						end if;

						if xlate(7 downto 5) = "111" then

							if break then

								if xlate(0) = '1' then	-- shift
									shift <= false;
								end if;


								if xlate(1) = '1' then	-- ctrl
									ctrl <= false;
								end if;

							else	-- make

								if xlate(3) = '0' then

									if xlate(0) = '1' then	-- shift
										shift <= true;
									end if;


									if xlate(1) = '1' then	-- ctrl
										ctrl <= true;
									end if;

									if xlate(2) = '1' then	-- caps
										capsl <= not capsl;
									end if;

								end if;

							end if;

						end if;

				end case;
			end if;
		end if;
	end process;

	process (reset, clkdiv24, kb_clk_prev, kb_data, RC_1, LEDs)
	begin
		if reset then

			RC_2 <= '0';
			kb_clk_prev <= '0';
			xstate <= InitRead;
			LEDs_prev <= (others => '0');

		elsif rising_edge(clkdiv24) then

			kb_clk_prev <= kb_clk;

			case xstate is

				when InitRead =>

					kb_clk_raw <= 'Z';
					kb_data_raw <= 'Z';
					timeout <= 0;
					parity <= '0';
					xstate <= Reading;

				when Reading =>

					-- if idle, and LEDs should change, send out the update command
					if (LEDs /= LEDs_prev) and (timeout = 0) then
						LEDs_prev <= LEDs;
						xbyte <= XByteType'left;
						xstate <= Initiate;
						kb_clk_raw <= '0';
						timeout <= 127;
					end if;

					if (kb_clk = '0') and (kb_clk_prev = '1') then
						sr(8 downto 0) <= sr(9 downto 1);
						sr(9) <= kb_data;
						timeout <= 127;
						parity <= parity xor kb_data;
					else
						if (timeout = 1) and (parity = '0') and (sr(9) = '1') then
							RC_2 <= not RC_1;
							parity <= '0';
						end if;
						if timeout /= 0 then
							timeout <= timeout - 1;
						end if;
					end if;

				when Initiate =>

					if timeout = 0 then
						kb_clk_raw <= 'Z';
						kb_data_raw <= '0';
						xstate <= Initiate_HS;
					else
						timeout <= timeout - 1;
					end if;

				when Initiate_HS =>
					if kb_clk = '1' then
						xbit <= XBitType'left;
						xstate <= XByte_l;
					end if;

				when XByte_l =>

					if kb_clk = '0' then
						kb_data_raw <= LEDCmd(xbyte, xbit);
						xstate <= XByte_h;
					end if;
					
				when XByte_h =>
					if kb_clk = '1' then
						if xbit = XBitType'right then
							xstate <= HS_l;
							kb_data_raw <= 'Z';
							timeout <= 127;
						else
							xbit <= xbit + 1;
							xstate <= XByte_l;
						end if;
					end if;

				when HS_l =>
					if (kb_data = '0') and (kb_clk = '0') then
						xstate <= HS_h;
					else
						if timeout = 0 then
							xstate <= InitRead;
						else
							timeout <= timeout - 1;
						end if;
					end if;

				when HS_h =>
					if (kb_data = '1') and (kb_clk = '1') then
						if xbyte /= XByteType'right then
							xbyte <= xbyte + 1;
							xstate <= Initiate;
							kb_clk_raw <= '0';
							timeout <= 127;
						else
							xstate <= InitRead;
						end if;
					end if;

			end case;

		end if;
	end process;


end RTL;
