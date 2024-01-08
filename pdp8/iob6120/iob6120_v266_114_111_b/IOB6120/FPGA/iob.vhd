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

entity iob is
	port
	(clk_in: in std_logic;	-- 29.4912 MHz

	-- CPU bus interface
	cpu_ioclr_n : in std_logic;
	dx : inout std_logic_vector(0 to 11);
	clk_write_n_raw : in std_logic;			-- async
	cpu_read_n : in std_logic;
	cpu_sr_read_n : in std_logic;
	cpu_sr_write_n : in std_logic;
	clk_lxdar_n_raw : in std_logic;			-- async
	cpu_c0_n : out std_logic;
	cpu_c1_n : out std_logic;
	cpu_skip_n : out std_logic;
	cpu_intreq_n : out std_logic;
	cpu_intgrnt_n : inout std_logic;
	cpreq_n: inout std_logic;

	-- serial ports
	txd : out std_logic_vector(0 to NUMUARTS-1);
	rxd : in std_logic_vector(0 to NUMUARTS-1);

	-- LPT port
	lpt_ack: in std_logic;
	lpt_busy_n: in std_logic;
	lpt_paper_end_n: in std_logic;
	lpt_select_in_n: in std_logic;
	lpt_error: in std_logic;
	lpt_strobe: out std_logic;
	lpt_ddir: out std_logic;
	lpt_data: inout std_logic_vector(7 downto 0);
	lpt_init: out std_logic;
		
	-- Keyboard
	kb_clk: inout std_logic;
	kb_data: inout std_logic;

	-- VGA
	vga_RGB: out RGB;
	vga_HS: out std_logic;
	vga_VS: out std_logic;

	-- speaker
	spkr: out std_logic;

	-- real-time clock
	rtc_sclk: out std_logic;
	rtc_io: inout std_logic;
	rtc_rst: out std_logic;

	-- bits for custom applications
	iobits: inout std_logic_vector(0 to 35);

	-- special purpose
	reprogram: inout std_logic);	-- drive low to restart FPGA configuration

-- clock frequency and pin assignments, Xilinx-specific.
-- put here rather than UCF so they don't get lost
-- don't allow use of config pins for I/O by assigning to dummy signals

---- input clock
attribute period: string;
attribute period of clk_in : signal is "29.4912 MHz";

---- assign pins to match PCB
attribute loc: string;
attribute clock_buffer : string; 
attribute pullup : string;

attribute loc of clk_in : signal is "P88";
attribute loc of clk_lxdar_n_raw : signal is "P18";
attribute loc of clk_write_n_raw : signal is "P15";
attribute loc of cpu_c0_n : signal is "P79";
attribute loc of cpu_c1_n : signal is "P80";
attribute loc of cpu_intreq_n : signal is "P96";
attribute loc of cpu_ioclr_n : signal is "P87";
attribute loc of cpu_read_n : signal is "P78";
attribute loc of cpu_skip_n : signal is "P76";
attribute loc of cpu_sr_read_n : signal is "P77";
attribute loc of cpu_sr_write_n : signal is "P101";
attribute loc of dx : signal is "P122 P132 P129 P131 P67 P62" &
										  " P60 P57 P49 P46 P44 P39";
attribute loc of kb_clk : signal is "P138";
attribute pullup of kb_clk : signal is "yes";
attribute loc of kb_data : signal is "P133";
attribute pullup of kb_data : signal is "yes";
attribute loc of lpt_ack : signal is "P91";
attribute loc of lpt_busy_n : signal is "P121";
attribute loc of lpt_data : signal is "P66 P63 P59 P56 P51 P43 P47 P38";
attribute loc of lpt_ddir : signal is "P28";
attribute loc of lpt_error : signal is "P137";
attribute loc of lpt_init : signal is "P7";
attribute loc of lpt_paper_end_n : signal is "P136";
attribute loc of lpt_select_in_n : signal is "P124";
attribute loc of lpt_strobe : signal is "P10";
attribute loc of reprogram : signal is "P85";
attribute loc of rxd : signal is "P23 P26 P27";
attribute loc of txd : signal is "P11 P21 P115";
attribute loc of vga_hs : signal is "P117";
attribute loc of vga_rgb : signal is "P99 P126 P120";
attribute loc of vga_vs : signal is "P102";
attribute loc of cpu_intgrnt_n : signal is "P141";
attribute loc of cpreq_n : signal is "P113";
attribute loc of iobits : signal is "P12 P5 P3 P20 P103 P93 P100 P94 P19 " &
											"P13 P4 P6 P134 P114 P139 P116 P74 P64 " &
											"P42 P84 P83 P40 P48 P65 P130 P123 P140 " &
											"P118 P75 P41 P58 P86 P22 P29 P50 P54";
attribute loc of spkr : signal is "P95";
attribute loc of rtc_rst : signal is "P112";
attribute loc of rtc_sclk : signal is "P68";
attribute loc of rtc_io : signal is "P30";

end iob;

architecture RTL of iob is

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

	component KL8JA is
		generic
			(r_addr: DevID;
		 	 t_addr: DevID;
			 stop_bits: integer;
			 data_bits: integer;
			 parity: ParitySel;
			 default_baud_sel: integer;
          instance: integer);
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
			dx : inout std_logic_vector(0 to 11);
			cpu_write_n : in std_logic;
			clk_write_n : in std_logic;
			clk_lxdar_n : in std_logic;
			IOTread : in boolean;
			cpu_c0_n : out std_logic;
			cpu_c1_n : out std_logic;
			cpu_skip_n : out std_logic;

			-- communication
			IRQ: out std_logic;

			-- serial port
			txd : out std_logic;
			rxd : in std_logic;
			rts : out std_logic;
			cts : in std_logic
			);
	end component;

	component LC8E is
		generic
			(print_addr: DevID);
		port
			(reset: in boolean;							-- true when reset (IOCLR)
			 IOTact: in boolean;							-- true when in IOT (LXDAR)
			 IOTdev: in DevID;							-- latched IOT device code
			 IOTcmd: in DevCmd;							-- latched IOT command

		 	 cpu_write_n : in std_logic;
			 clk_write_n : in std_logic;
			 dx : inout std_logic_vector(7 downto 0);
			 cpu_skip_n : out std_logic;
			 pIRQ: out std_logic;

			 -- LPT port
			 lpt_ack: in std_logic;
			 lpt_busy_n: in std_logic;
			 lpt_paper_end_n: in std_logic;
			 lpt_select_in_n: in std_logic;
			 lpt_error: in std_logic;
			 lpt_strobe: buffer std_logic;
			 lpt_ddir: out std_logic;
			 lpt_data: inout std_logic_vector(7 downto 0);
			 lpt_init: out std_logic);
	end component;

	component VT52 is
		port
		  (-- addresses
			keyb_addr: in DevID;
		   print_addr: in DevID;

			-- clocks
			clk : in std_logic;
			clkdiv24: in std_logic;
			vidclk: in std_logic;

			--DEBUGIO: inout std_logic_vector(0 to 11);

			-- CPU bus interface
			reset : in boolean;
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
			vga_RGB: out std_logic_vector(0 to 2);
			vga_HS: out std_logic;
			vga_VS: out std_logic;
		 
		 	-- bell
		 	bell: out boolean;
		 
		   -- break
		   break: out boolean);
	end component;

	component RTC is
		generic
			(addr: DevID := RTCBASE);
		port
			(reset: in boolean;
			 clk: in std_logic;	-- system clk
			 timebase: in std_logic;	-- counting clock 4800 Hz

			 -- CPU bus interface
			 IOTact: in boolean;
			 IOTdev: in DevID;
			 IOTcmd: in DevCmd;

		 	 cpu_write_n : in std_logic;
			 clk_write_n : in std_logic;
			 dx11 : in std_logic;
			 cpu_skip_n : out std_logic;
			 IRQ: out std_logic);
	end component;

	component DS1302ClkCal is
		generic
			(addr: DevID := CLKCALBASE);
		port
			( -- clocks
			 clk: in std_logic;
			 bitclk: in std_logic;

			 -- CPU bus interface
			 reset : in boolean;
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

			 -- I/O
			 RST_n : out std_logic;
			 SCLK : out std_logic;
			 SIO : inout std_logic);
	end component;

attribute INIT : string;

-- registers & signals shared between all devices

signal cpu_ioclr: std_logic;
signal reset: boolean;							-- true when reset (IOCLR)
signal resetctr: integer range 0 to 7;

attribute INIT of resetctr: signal is "0";

signal clk_lxdar_n_unsync, clk_lxdar_n, cpu_lxdar_n: std_logic;
signal clk_write_n_unsync, clk_write_n, cpu_write_n: std_logic;

attribute CLOCK_SIGNAL : string;
attribute CLOCK_SIGNAL of clk_lxdar_n : signal is "yes";
attribute CLOCK_SIGNAL of clk_write_n : signal is "yes";

attribute USELOWSKEWLINES : string;
attribute USELOWSKEWLINES of cpu_lxdar_n : signal is "yes";
attribute USELOWSKEWLINES of cpu_write_n : signal is "yes";

signal IOTact: boolean;							-- true when in IOT (LXDAR)
signal IOTdev: DevID;							-- latched IOT device code
signal IOTcmd: DevCmd;							-- latched IOT command
signal IOTread: boolean;						-- true during IOT read cycle

signal clk, clk0, clkfb, clkdiv24: std_logic;
signal prescale: integer range 0 to 23;
signal brg: unsigned(18 downto 0);			-- baud rate generator
signal brg1: unsigned(9 downto 0);			-- /24 based rates
signal brg2: unsigned(15 downto 0);			-- /1 based rates

signal bell: boolean;							-- terminal bell
signal break: boolean;							-- terminal break

attribute clock_signal of clk : signal is "yes";
attribute clock_signal of clkdiv24 : signal is "yes";
attribute clock_signal of brg : signal is "yes";
attribute clock_signal of brg1 : signal is "yes";
attribute clock_signal of brg2 : signal is "yes";

signal uIRQ: unsigned(0 to NUMUARTS-1);	-- masked flags from the serial ports
signal uIRQ_all: std_logic;
signal pIRQ: std_logic;							-- masked flag from the printer port
signal vIRQ: std_logic;							-- masked flag from VT52
signal rtcIRQ: std_logic;						-- masked flag from RTC

-- dummy switch register registers & signals 

signal switchreg: std_logic_vector(0 to 11);
signal sr_write: std_logic;

-- system configuration and test signals

signal SPCunlock: std_logic;
signal VT52_kb, VT52_pr: DevID;
signal testdata: std_logic_vector(0 to 11);
signal testread: boolean;
signal reprogram_int: boolean;

signal init_counter: integer range 0 to 2;
attribute INIT of init_counter: signal is "0";

begin

-----------------------------------------------------------------------------------------
-- drive our internal clock through a clock DLL
-----------------------------------------------------------------------------------------

	clk1: clkdll port map (RST => cpu_ioclr, CLKIN => clk_in,
							  CLK0 => clk0, CLKFB => clk);

	cknet: BUFG port map (I => clk0, O => clk);

-----------------------------------------------------------------------------------------
-- generate our own reset pulse in addition to the one from the system,
-- particularly in case of reconfiguration
-----------------------------------------------------------------------------------------

reset <= (cpu_ioclr_n = '0') or (resetctr /= 7);

-- this depends on resetctr = 0 on configuration

process (clk, resetctr)
begin
	if rising_edge(clk) then
		if resetctr /= 7 then
			resetctr <= resetctr + 1;
		end if;
	end if;
end process;

-----------------------------------------------------------------------------------------
-- create non-clock versions of some clock nets, and synchronize them to
-- our system clock.  This is done because in some places we use their
-- edges, and others their levels, and FPGAs have separate routing for these
-- two types of signals
-----------------------------------------------------------------------------------------

lxdaribuf: IBUFG port map (I => clk_lxdar_n_raw, O => clk_lxdar_n_unsync);
writeibuf: IBUFG port map (I => clk_write_n_raw, O => clk_write_n_unsync);
lxdarbufg: BUFG port map (I => cpu_lxdar_n, O => clk_lxdar_n);
writebufg: BUFG port map (I => cpu_write_n, O => clk_write_n);

process (reset, clk, clk_lxdar_n_unsync, clk_write_n_unsync)
begin
	if reset then
		cpu_lxdar_n <= '1';
		cpu_write_n <= '1';
	elsif rising_edge(clk) then
		cpu_lxdar_n <= clk_lxdar_n_unsync;
		cpu_write_n <= clk_write_n_unsync;
	end if;
end process;

-----------------------------------------------------------------------------------------
-- utility and shared logic
-----------------------------------------------------------------------------------------

cpu_intgrnt_n <= 'Z';

-- common IOT decoding

cpu_ioclr <= not cpu_ioclr_n;


-- latch IOT device and command at start of LXDAR
process (clk_lxdar_n)
begin
	if falling_edge(clk_lxdar_n) then
		IOTdev <= unsigned(dx(3 to 8));
		IOTcmd <= unsigned(dx(9 to 11));
	end if;
end process;

IOTact <= (cpu_lxdar_n = '0');

-- here we stretch the read signal from when it is active
-- until the end of LXDAR; IM6120 wants IOT read data
-- up to end of LXDAR, not READ, according to the timing chart

process (reset, IOTact, clk, cpu_read_n)
begin
	if reset or not IOTact then
		IOTread <= false;
	elsif rising_edge(clk) then
		if cpu_read_n = '0' then
			IOTread <= true;
		end if;
	end if;
end process;

--- control IOTs: initiate reprogram, set VT52 address, tests

reprogram <= '0' when reprogram_int else 'Z';

  -- async read part of test logic
process (IOTread, IOTdev, IOTcmd, testdata)
begin
	if IOTread and (IOTdev = SPCBASE) then
		dx <= testdata;
	else
		dx <= (others => 'Z');
	end if;
end process;

  -- async write part of test logic
process (IOTact, IOTdev, cpu_write_n, dx, IOTcmd)
begin
	if IOTact and (IOTdev = SPCBASE) and (cpu_write_n = '0') then

		case IOTcmd is

			when SPCTESTSIGNALS =>
				if dx(9) = '1' then
					cpu_c0_n <= '0';
				else
					cpu_c0_n <= 'Z';
				end if;
				if dx(10) = '1' then
					cpu_c1_n <= '0';
				else
					cpu_c1_n <= 'Z';
				end if;
				if dx(11) = '1' then
					cpu_skip_n <= '0';
				else
					cpu_skip_n <= 'Z';
				end if;

			when SPCTESTBUS | SPCVERSION | SPCUNLOCKKEY =>
				cpu_c0_n <= '0';
				cpu_c1_n <= '0';
				cpu_skip_n <= 'Z';

			when others =>
				cpu_c0_n <= 'Z';
				cpu_c1_n <= 'Z';
				cpu_skip_n <= 'Z';

		end case;

	else
		cpu_c0_n <= 'Z';
		cpu_c1_n <= 'Z';
		cpu_skip_n <= 'Z';
	end if;
end process;

  -- sync write part of test logic, and config functions
process (reset, clk_write_n, dx)
begin
	if reset then

		reprogram_int <= false;
		SPCunlock <= '0';

	elsif rising_edge(clk_write_n) then

		-- the first time any write of any kind happens, init
		-- the VT52 port address.  We don't want this to happen
		-- on reset, because then we'd lose the console
		if init_counter = 0 then
			VT52_pr <= VT52PBASE;	-- initial addresses
			VT52_kb <= VT52KBASE;
			init_counter <= 1;
		end if;

		-- FPGA control functions are protected here:
		-- the configuration changing IOTs require that
		-- an SPCUNLOCKKEY IOT be done first
		if IOTact then
			SPCunlock <= '0';
		end if;

		if IOTact and (IOTdev = SPCBASE) then

			case IOTCmd is

				when SPCVERSION =>
					testdata <= std_logic_vector(to_unsigned(VERSION, dx'length));

				when SPCUNLOCKKEY =>
					if dx = O"5253" then
						SPCunlock <= '1';
					end if;

					-- configuration
					testdata(0 to 1) <= std_logic_vector(to_unsigned(NUMUARTS, 2));
					testdata(2 to 2) <= std_logic_vector(to_unsigned(boolean'pos(PARPTOBASE /= O"00"), 1));
					testdata(3 to 3) <= std_logic_vector(to_unsigned(boolean'pos(VT52KBASE /= O"00"), 1));
					testdata(4 to 4) <= std_logic_vector(to_unsigned(boolean'pos(PIOBASE /= O"00"), 1));
					testdata(5 to 5) <= std_logic_vector(to_unsigned(boolean'pos(RTCBASE /= O"00"), 1));
					testdata(6 to 6) <= std_logic_vector(to_unsigned(boolean'pos(CLKCALBASE /= O"00"), 1));
					testdata(7 to 7) <= std_logic_vector(to_unsigned(boolean'pos(XYBASE /= O"00"), 1));

					-- interrupts
					testdata( 8) <= pIRQ;
					testdata( 9) <= vIRQ;
					testdata(10) <= uIRQ_all;
					testdata(11) <= rtcIRQ;

				when SPCREPROG => 	-- initiate our own reprogramming
					if SPCunlock = '1' then
						reprogram_int <= (dx = O"1234");
					end if;

				when SPCSETCON =>
					if SPCunlock = '1' then
						VT52_kb  <= DevID(dx( 0 to  5));
						VT52_pr <= DevID(dx( 6 to 11));
					end if;

				when SPCTESTSIGNALS =>
					testdata <= O"5252";

				when SPCTESTBUS =>
					testdata <= not dx;

				when others =>
					null;

			end case;

		end if;
	end if;
end process;

---- bring CPU IRQ low when printer or serial ports request it
uIRQ_all <= '1' when uIRQ /= 0 else '0';

cpu_intreq_n <= '0' when pIRQ = '1' or
								 vIRQ = '1' or	 
								 uIRQ_all = '1' or
								 rtcIRQ = '1'
					 else 'Z';

-- baud rate generator for uarts

-- to simplify the circuit, we use one oscillator for both
-- the video and the serial clocks.  The frequency chosen
-- is one that's close to the required video dot clock and
-- also dividable down to max_baud_rate*16 with little or no
-- error (2% is the max we want).  As it happens, the fairly
-- standard 29.4912MHz oscillator meets both these criteria
-- pretty well.

-- The baud rate clock is 38400*16, which is the input clock / 24.
-- we then divide this by powers of two for the various baud rates;
-- the UARTs tap these dividers by indexing into the brg() array.
-- the /24 clock is also exposed for places that a slower clock
-- is useful, like delay counters.

process (reset, clk)
begin
	if reset then
		brg1 <= (others => '0');
		brg2 <= (others => '0');
		prescale <= 0;
		clkdiv24 <= '0';
	elsif rising_edge(clk) then

		brg2 <= brg2 + 1;

		if prescale = 23 then
			prescale <= 0;
			clkdiv24 <= '1';
			brg1 <= brg1 + 1;
		else
			prescale <= prescale + 1;
			clkdiv24 <= '0';
		end if;

	end if;
end process;

-- here the various rate dividers are mapped to the VT278 baud codes:
brg(0)  <= brg2(14);	-- 50 (56.25)
brg(1)  <= brg1(9);	-- 75
brg(2)  <= brg2(13);	-- 110 (112.5)
brg(3)  <= '0';		-- 134.5, not supported
brg(4)  <= brg1(8);	-- 150
brg(5)  <= brg1(7);	-- 300
brg(6)  <= brg1(6);	-- 600
brg(7)  <= brg1(5);	-- 1200
brg(8)  <= brg2(9);	-- 1800
brg(9)  <= '0';		-- 2000, not supported
brg(10) <= brg1(4);	-- 2400
brg(11) <= brg2(8);	-- 3600
brg(12) <= brg1(3);	-- 4800
brg(13) <= brg2(7);	-- 7200
brg(14) <= brg1(2);	-- 9600
brg(15) <= brg1(1);	-- 19200
brg(16) <= brg1(0);	-- 38400
brg(17) <= brg2(4);	-- 56400
brg(18) <= brg2(3);	-- 115200

-----------------------------------------------------------------------------------------
-- switch register dummy implementation - just a latch
-----------------------------------------------------------------------------------------

--process (cpu_sr_read_n, dx, switchreg)
--begin
--	if cpu_sr_read_n = '0' then
--		dx <= switchreg;
--	else
--		dx <= (others => 'Z');
--	end if;
--end process;

--sr_w_detect: PosEdge port map (reset, clk, cpu_sr_write_n, sr_write);

--process (clk, sr_write)
--begin
--	if rising_edge(clk) then
--		if sr_write = '1' then
--			switchreg <= dx;
--		end if;
--	end if;
--end process;

-----------------------------------------------------------------------------------------
-- KL8JA serial ports
-----------------------------------------------------------------------------------------

KL8JAs: for idx in 0 to NUMUARTS-1 generate

begin

	sp: KL8JA
		generic map
		(r_addr		=> UARTIBASE(idx),			-- settings from iob_cfg.vhd package
		 t_addr		=> UARTOBASE(idx),
		 data_bits	=> DataBitsSetting(idx),
		 stop_bits	=> StopBitsSetting(idx),
		 parity		=> ParitySetting(idx),
		 default_baud_sel
						=> BaudRateSetting(idx),

		 instance => idx)
		port map
		(clk => clk, reset => reset,
       --DEBUGIO => iobits(12 to 23),
		 brg => brg,
		 IOTact => IOTact, IOTdev => IOTdev, IOTread => IOTread,
		 IOTcmd => IOTcmd, dx => dx,
		 cpu_write_n => cpu_write_n, clk_write_n => clk_write_n,
		 clk_lxdar_n => clk_lxdar_n,
		 cpu_c0_n => cpu_c0_n, cpu_c1_n => cpu_c1_n, cpu_skip_n => cpu_skip_n,
		 IRQ => uIRQ(idx),
		 txd => txd(idx), rxd => rxd(idx),
		 rts => open, cts => '0');

end generate;

-----------------------------------------------------------------------------------------
-- LC8E printer interface with Centronics output
-----------------------------------------------------------------------------------------

parpt_if: if PARPTOBASE /= O"00" generate
signal lpt_strobe_i: std_logic;
signal dx_lpt: std_logic_vector(7 downto 0);
begin

lpt_strobe <= lpt_strobe_i;

-- output 7 bit ASCII to the printer.  A lot of software (like OS/8)
-- sets the upper bit, which results in funny characters on modern
-- printers.
lpt: for bit in 7 downto 0 generate
begin
	dx_lpt(bit) <= '0' when bit = 7 else dx(11 - bit);
end generate;

pp: LC8E
	generic map
		(print_addr => PARPTOBASE)
	port map
		(reset => reset, IOTact => IOTact,
		 cpu_write_n => cpu_write_n, clk_write_n => clk_write_n,
		 IOTdev => IOTdev, IOTcmd => IOTcmd,
		 dx => dx_lpt,
		 cpu_skip_n => cpu_skip_n, pIRQ => pIRQ,
		 lpt_ack => lpt_ack, lpt_busy_n => lpt_busy_n,
		 lpt_paper_end_n => lpt_paper_end_n,
		 lpt_select_in_n => lpt_select_in_n, lpt_error => lpt_error,
		 lpt_strobe => lpt_strobe_i, lpt_ddir => lpt_ddir,
		 lpt_data => lpt_data, lpt_init => lpt_init);

end generate;

-----------------------------------------------------------------------------------------
-- VT52 via KL8E interface
-----------------------------------------------------------------------------------------

vt52_if: if (VT52PBASE /= O"00") and (VT52KBASE /= O"00") generate
begin

vt: VT52
	port map
		(keyb_addr => VT52_kb, print_addr => VT52_pr,
		 reset => reset, clk => clk, clkdiv24 => clkdiv24, vidclk => clk,
		 --DEBUGIO => iobits(0 to 11),
		 IOTact => IOTact, IOTdev => IOTdev, IOTcmd => IOTcmd,
		 cpu_write_n => cpu_write_n, clk_write_n => clk_write_n,
		 IOTread => IOTread, dx => dx,
		 cpu_c0_n => cpu_c0_n, cpu_c1_n => cpu_c1_n,
		 cpu_skip_n => cpu_skip_n, IRQ => vIRQ,
		 kb_clk => kb_clk, kb_data => kb_data,
		 vga_RGB => vga_RGB, vga_HS => vga_HS, vga_VS => vga_VS,
		 bell => bell, break => break);

spkr <= brg(2) when bell else '0';
cpreq_n <= '0' when break else 'Z';

end generate;

-----------------------------------------------------------------------------------------
-- RTC IOTs
-----------------------------------------------------------------------------------------

rtc_if: if RTCBASE /= O"00" generate
begin

theclock: RTC
	generic map
		(addr => RTCBASE)
	port map
		(reset => reset, clk => clk,
		 timebase => BRG(0),
		 IOTact => IOTact, IOTdev => IOTdev, IOTcmd => IOTcmd,
		 cpu_write_n => cpu_write_n, clk_write_n => clk_write_n,
		 dx11 => dx(11),
		 cpu_skip_n => cpu_skip_n, IRQ => rtcIRQ);

end generate;

-----------------------------------------------------------------------------------------
-- Clock/Calendar IOTs
-----------------------------------------------------------------------------------------

clkcal_if: if CLKCALBASE /= O"00" generate
begin

theCalendar: DS1302ClkCal
	generic map
		(addr => CLKCALBASE)
	port map
		(clk => clk, bitclk => clkdiv24, reset => reset,
		 IOTact => IOTact, IOTread => IOTread,
		 IOTdev => IOTdev, IOTcmd => IOTcmd,
		 cpu_write_n => cpu_write_n, clk_write_n => clk_write_n,
		 cpu_c0_n => cpu_c0_n, cpu_c1_n => cpu_c1_n,
		 dx => dx, cpu_skip_n => cpu_skip_n,
		 RST_n => rtc_rst, SCLK => rtc_sclk, SIO => rtc_io);

end generate;

-----------------------------------------------------------------------------------------
-- Port bits IOT
-- for now, just implement programmable I/O ports, 3x 12 bit
-----------------------------------------------------------------------------------------

iobits_if: if (PIOBASE /= O"00") and (not DEBUG) generate

	signal bits_bank: integer range 0 to 2;
	signal bits_sel: boolean;
	signal bits_OD : std_logic_vector(iobits'range);
	signal bits_out: std_logic_vector(iobits'range);

begin

	bits_sel <= IOTact and (IOTdev = PIOBASE);

	-- each I/O pin has two control bits:
	--		bits_OD = 0 for push/pull, else it is open drain
	--		bits_out = 0 to drive 0, else it is driven 1 or Z (depending on bits_OD)
	--	thus:
	--		00	drive 0
	--		01	drive 1
	--		10	drive 0
	--		11	drive 'Z' (input) (initial setting)
	process (bits_out, bits_OD)
	begin
		for i in iobits'range loop
			if bits_out(i) = '1' then
				if bits_OD(i) = '1' then
					iobits(i) <= 'Z';
				else
					iobits(i) <= '1';
				end if;
			else
				iobits(i) <= '0';
			end if;
		end loop;
	end process;

	-- reading
	process (bits_sel, IOTcmd, cpu_write_n, IOTread, bits_bank, iobits)
	begin
		if bits_sel and (IOTcmd = PIOGETBITS) then

			if cpu_write_n = '0' then
				cpu_c0_n <= '0';
				cpu_c1_n <= '0';
			else
				cpu_c0_n <= 'Z';
				cpu_c1_n <= 'Z';
			end if;

			if IOTread then
				case bits_bank is
					when 0 => dx <= iobits( 0 to 11);
					when 1 => dx <= iobits(12 to 23);
					when 2 => dx <= iobits(24 to 35);
				end case;
			else
				dx <= (others => 'Z');
			end if;

		else

			cpu_c0_n <= 'Z';
			cpu_c1_n <= 'Z';
			dx <= (others => 'Z');

		end if;
	end process;

	-- writing
	process (reset, clk_write_n, bits_sel, IOTact, IOTcmd, dx)
	begin
		if reset then
			bits_out <= (others => '1');	-- all inputs on reset
			bits_OD  <= (others => '1');
			bits_bank <= 0;
		elsif rising_edge(clk_write_n) then
			if bits_sel and IOTact then

				case IOTcmd is

					when PIOSETBANK =>	-- select bank
						bits_bank <= to_integer(unsigned(dx(10 to 11)));

					when PIOSETBITS => -- write bits
						case bits_bank is
							when 0 => bits_out( 0 to 11) <= dx;
							when 1 => bits_out(12 to 23) <= dx;
							when 2 => bits_out(24 to 35) <= dx;
						end case;

					when PIOSETOD => -- set Open Drain
						case bits_bank is
	 						when 0 => bits_OD( 0 to 11) <= dx;
	 						when 1 => bits_OD(12 to 23) <= dx;
	 						when 2 => bits_OD(24 to 35) <= dx;
	 					end case;

					when others =>
						null;

				end case;
			end if;
		end if;
	end process;

end generate; -- if PIOBASE /= O"00"

end RTL;
