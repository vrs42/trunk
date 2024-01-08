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
-- KL8JA serial port
-----------------------------------------------------------------------------------------
-- 2003-04-04 jdk	added parity check/generate

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

use work.IOB_Config.ALL;

entity KL8JA is
	generic
	(
	r_addr: DevID := O"03";
	t_addr: DevID := O"04";

	stop_bits: integer := 1;
	data_bits: integer := 8;
	parity: ParitySel := None;

	default_baud_sel: integer := 14;	-- 9600 bps

   instance: integer := 0
	);
	port
	( -- clocks
	clk: in std_logic;
	brg: in unsigned(18 downto 0);

	--DEBUGIO: inout std_logic_vector(0 to 11);

	-- CPU bus interface
	reset : in boolean;
	IOTact: in boolean;
	IOTdev: in DevID;
	IOTcmd: in DevCmd;

	cpu_write_n : in std_logic;
	clk_write_n : in std_logic;
	clk_lxdar_n : in std_logic;
	IOTread : in boolean;
	dx : inout std_logic_vector(0 to 11);
	cpu_c0_n : out std_logic;
	cpu_c1_n : out std_logic;
	cpu_skip_n : out std_logic;
	IRQ: out std_logic;

	-- serial port
	txd : out std_logic;
	rxd : in std_logic;
	rts : out std_logic;
	cts : in std_logic
	);
end KL8JA;

architecture RTL of KL8JA is

	constant parity_bits: integer := boolean'pos(parity /= None); -- 0 or 1

	-- PosEdge: in this implementation, most processes are
	-- synchronous to clk, so this component is used to sample
	-- slower signals, and generates a 1-clock pulse on their rising edge
	component PosEdge
	port
	  (reset: in boolean;
		clk: in std_logic;
		inp: in std_logic;          
		outp: out std_logic);
	end component;

	-- common
	signal keyb_flag,														-- "keyboard flag"
			printer_flag,														-- "printer flag"
			IE,															-- Interrupt Enable
			SE: std_logic;												-- Status Enable

	signal baud_sel: integer range 0 to brg'left;			-- baud config register

	signal clk16_raw, clk16: std_logic;					-- clocking
	signal mod16: unsigned(3 downto 0);

	-- receive part
	signal rsel, rclrflag: boolean;
	signal RBR: std_logic_vector(data_bits - 1 downto 0);	-- receive buffer register
	signal RR: std_logic_vector(data_bits + parity_bits - 1 downto 0); -- receive data register
	signal RR_parity, framing_error, overrun_error, parity_error: std_logic;
	signal rbit: integer range 0 to data_bits + stop_bits + 2;
		-- 0 = waiting
		-- 1 = start bit
		-- 2.. data_bits, parity_bit, stop_bits
	signal inpv: std_logic_vector(0 to 2);
	signal startdet: boolean;
	signal samplet: unsigned(0 to 3);
	signal RBRF_1, RBRF_2: std_logic;							-- Receive Buffer Register Full

	-- transmit part
	signal tsel, write: boolean;
	signal tsetflag, tclrflag: boolean;
	signal sendt: unsigned(0 to 3);
	signal TRE: boolean;												-- Transmit Register Empty
	signal TR: std_logic_vector(0 to data_bits);				-- Transmit Register (space for start)
	signal tbit: integer range 0 to data_bits + parity_bits + stop_bits + 1;
		-- 0 = start bit
		--	1-x = data bits
		-- x+y = parity bit (opt)
		-- x+y+z = stop bit(s)
		-- x+y+z+1 = ready
	signal THR: std_logic_vector(0 to data_bits-1);						-- Transmit Holding Register
	signal TR_parity, THRE_1, THRE_2, THRE, THRE_pe: std_logic;	-- Transmit Holding Register Empty

--	attribute clock_signal: string;
--	attribute clock_signal of THRE: signal is "yes";

begin

	-- clock select
	clk16_raw <= brg(baud_sel);
	baud: PosEdge port map (reset, clk, clk16_raw, clk16);

	-- generate /16 clock
	process (reset, clk, clk16, mod16)
	begin
		if reset then
			mod16 <= (others => '0');
		elsif rising_edge(clk) then
			if clk16 = '1' then
				if mod16 = 15 then
					mod16 <= "0000";
				else
					mod16 <= mod16 + 1;
				end if;
			end if;
		end if;
	end process;

	rsel <= IOTact and (IOTdev = r_addr);
	IRQ <= IE and (printer_flag or keyb_flag);

	tsel <= IOTact and (IOTdev = t_addr);
	write <= tsel and (cpu_write_n = '0');

	-- manage the registers set by KIE
	-- the IOT is extended here for serial format and speed setting
	-- format:
	--     X X X X X X X X X X S I	set SE and IE
	process (reset, clk_write_n)
	begin
		if reset then
			IE <= '1';
			SE <= '0';
		elsif rising_edge(clk_write_n) then
			if rsel and (IOTcmd = KIE) then
				SE <= dx(10);
				IE <= dx(11);
			end if;
		end if;
	end process;

	-- c0/1/skip feedback
	process (rsel, iotcmd, keyb_flag)
	begin
		if rsel then

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

	-- put data out to the CPU when requested
	process (rsel, IOTread, RBR, se, framing_error, overrun_error, parity_error)
	begin
		if rsel and IOTread then
			dx(4 to 11) <= RBR;
			if SE = '1' then
				if parity_bits /= 0 then
					dx(0 to 3) <= (framing_error or overrun_error or parity_error) &
									  parity_error & framing_error & overrun_error;
				else
					dx(0 to 3) <= (framing_error or overrun_error) &
									  '0' & framing_error & overrun_error;
				end if;
			else
				dx(0 to 3) <= (others => '0');
			end if;
		else
			dx <= (others => 'Z');
		end if;
	end process;

	-- manage "keyboard flag"
	keyb_flag <= '1' when RBRF_1 /= RBRF_2 else '0';

	-- RBR is 'cleared' after IOT that resets flag
	process (rsel, clk_write_n, IOTcmd)
	begin
		if rising_edge(clk_write_n) then
			if rsel and ((IOTcmd = KCF) or (IOTcmd = KCC) or (IOTcmd = KRB)) then
				rclrflag <= true;
			else
				rclrflag <= false;
			end if;
		end if;
	end process;

	process (reset, clk_lxdar_n, rclrflag, RBRF_1)
	begin
		if reset then
			RBRF_2 <= '0';
		elsif rising_edge(clk_lxdar_n) then
			if rclrflag then
				RBRF_2 <= RBRF_1;
			end if;
		end if;
	end process;

	-- receive data
	---- 'vote' last three samples for start bit detection
	startdet <= (inpv = "000");

	-- generate "Request To Send".  This is sort of a misnomer, as
	-- the signal actually means "you may send now"
	rts <= '0' when (rbit = 0) or (RBRF_1 = RBRF_2) else '1';

	process (reset, clk, clk16, RBRF_2)
	begin
		if reset then

			rbit <= 0;
			RBRF_1 <= '0';
			inpv <= (others => '1');
			if parity_bits /= 0 then
				parity_error <= '0';
			end if;
			framing_error <= '0';
			overrun_error <= '0';
			samplet <= (others => '0');

		elsif rising_edge(clk) then

			if clk16 = '1' then

				inpv <= rxd & inpv(0 to 1);	-- keep last 3 samples

				if rbit = 0 then

					if startdet then

						rbit <= 1;						-- start receiving
						if parity_bits /= 0 then
							RR_parity <= '0';
						end if;
						samplet <= mod16 + "0111";	-- should be the middle of the baud period

					end if;

				elsif mod16 = samplet then

					if rbit = data_bits + parity_bits + 2 then	-- end of receive?
						
						-- set overrun if previous char hasn't been read
						if (overrun_error or keyb_flag) = '1' then
							overrun_error <= '1';
						else
							overrun_error <= '0';
						end if;

						-- check parity and set error if bad
						case parity is

							when Mark =>
								if RR(data_bits) /= '1' then
									parity_error <= '1';
								else
									parity_error <= '0';
								end if;

							when Space =>
								if RR(data_bits) /= '0' then
									parity_error <= '1';
								else
									parity_error <= '0';
								end if;

							when Odd =>
								if RR_parity /= '1' then
									parity_error <= '1';
								else
									parity_error <= '0';
								end if;

							when Even =>
								if RR_parity /= '0' then
									parity_error <= '1';
								else
									parity_error <= '0';
								end if;

							when None =>
								null;

						end case;

						-- transfer received byte into RBR and set flag
						RBRF_1 <= not RBRF_2;
						RBR <= RR(data_bits - 1 downto 0);
						
						-- check framing; this should be a stop bit
						if inpv(0) /= '1' then
							framing_error <= '1';
						else
							framing_error <= '0';
						end if;
	
						rbit <= 0;							-- receiver ready for another

					else

						-- update parity and shift in serial data bit
						case parity is

							when Odd | Even =>
								RR_parity <= RR_parity xor inpv(0);

							when others =>
								null;
				
						end case;

						RR <= inpv(0) & RR(RR'left downto 1);
						rbit <= rbit + 1;
					end if;
				end if;
			end if;
		end if;
	end process;

-- DEBUG
--   process (printer_flag, tsetflag, tclrflag, tsel, THRE, THRE_1, THRE_2, TRE)
--   begin
--      if DEBUG and (instance = 0) then
--         DEBUGIO(0) <= printer_flag;
--         if tsetflag then DEBUGIO(1) <= '1'; else DEBUGIO(1) <= '0'; end if;
--         if tclrflag then DEBUGIO(2) <= '1'; else DEBUGIO(2) <= '0'; end if;
--         if tsel     then DEBUGIO(3) <= '1'; else DEBUGIO(3) <= '0'; end if;
--         DEBUGIO(4) <= THRE;
--         DEBUGIO(5) <= THRE_1;
--         DEBUGIO(6) <= THRE_2;
--         if TRE      then DEBUGIO(7) <= '1'; else DEBUGIO(7) <= '0'; end if;
--      end if;
--   end process;
--

	tsetflag <= write and (IOTcmd = TFL);
	tclrflag <= write and ((IOTcmd = TCF) or (IOTcmd = TLS));

	-- manage baud rate, transmit buffer register
	process (reset, clk_write_n, tsel, THRE_2)
	begin
		if reset then
			THRE_1 <= '0';
			baud_sel <= default_baud_sel;
		elsif rising_edge(clk_write_n) then
			if tsel then
			
				case IOTcmd is

					when TSB =>
						baud_sel <= to_integer(unsigned(dx(7 to 11)));
				
					when TPC | TLS =>
						THR <= dx(4 to 11);
						THRE_1 <= not THRE_2;

					when others =>
						null;

				end case;

			end if;
		end if;
	end process;

	-- "printer flag" management
	THRE <= '1' when (THRE_1 = THRE_2) and (cts = '0') else '0';
	THRE_det: PosEdge port map (reset, clk, THRE, THRE_pe);

	process (reset, clk, tsetflag, tclrflag)
	begin
		if reset or tclrflag then
			printer_flag <= '0';
		elsif rising_edge(clk) then
			if (THRE_pe = '1') or tsetflag then
				printer_flag <= '1';
			end if;
		end if;
	end process;

	-- c0/1/skip feedback
	process (tsel, iotcmd, printer_flag, keyb_flag)
	begin
		if tsel then
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

	-- serial output
	txd <= TR(data_bits);
	TRE <= (tbit = 1 + data_bits + parity_bits + stop_bits);

	process (reset, clk, clk16, THRE_1, THRE)
	begin
		if reset then

			TR(data_bits) <= '1';
			tbit <= 1 + data_bits + parity_bits + stop_bits;
			THRE_2 <= '0';

		elsif rising_edge(clk) then

			if TRE then

				-- if buffered data, start it
				if THRE = '0' then
					tbit <= 0; 	-- thus TRE => '1'

					-- initialize parity.  In the case of Mark|Space, it will never change
					case parity is

						when Odd | Mark =>
							TR_parity <= '1';
					
						when Even | Space =>
							TR_parity <= '0';
					
						when others =>
							null;

					end case;

					TR <= THR & '0';
					sendt <= mod16 + "1111";
				end if;

			elsif (clk16 = '1') and (mod16 = sendt) then

				-- THRE sets one bit time after start
				if tbit = 0 then
					THRE_2 <= THRE_1;
				end if;


				tbit <= tbit + 1;

				-- if at the parity bit, send it out
				if (parity_bits /= 0) and (tbit = data_bits) then
					TR(data_bits) <= TR_parity;
				else
					-- shift bits out
					TR <= '1' & TR(0 to data_bits - 1);
					-- update parity
					case parity is

						when Odd | Even =>
							TR_parity <= TR_parity xor TR(data_bits - 1);
					
						when others =>
							null;

					end case;
				end if;

			end if;
		end if;
	end process;

end RTL;
