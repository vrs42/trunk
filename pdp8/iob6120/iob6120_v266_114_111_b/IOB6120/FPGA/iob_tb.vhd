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

-- VHDL Test Bench Created from source file iob.vhd -- 18:26:00 12/23/2002
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use work.IOB_Config.ALL;
use work.Image_Pkg.ALL;


ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	constant SERBIT: time := 104.167 us;

	COMPONENT iob
	PORT(
		clk_in : IN std_logic;
		cpu_ioclr_n : IN std_logic;
		clk_write_n_raw : IN std_logic;
		cpu_read_n : IN std_logic;
		cpu_sr_read_n : IN std_logic;
		cpu_sr_write_n : IN std_logic;
		clk_lxdar_n_raw : IN std_logic;
		cpu_intgrnt_n : INOUT std_logic;
		rxd : IN std_logic_vector(0 to 2);
		lpt_ack : IN std_logic;
		lpt_busy_n : IN std_logic;
		lpt_paper_end_n : IN std_logic;
		lpt_select_in_n : IN std_logic;
		lpt_error : IN std_logic;    
		dx : INOUT std_logic_vector(0 to 11);
		lpt_data : INOUT std_logic_vector(7 downto 0);
		cpu_c0_n : OUT std_logic;
		cpu_c1_n : OUT std_logic;
		cpu_skip_n : OUT std_logic;
		cpu_intreq_n : OUT std_logic;
		txd : OUT std_logic_vector(0 to 2);
		lpt_strobe : OUT std_logic;
		lpt_ddir : OUT std_logic;
		lpt_init : OUT std_logic;
		kb_clk: inout std_logic;
		kb_data: inout std_logic;
		vga_RGB: out std_logic_vector(0 to 2);
		vga_HS: out std_logic;
		vga_VS: out std_logic;
		iobits: inout std_logic_vector(0 to 35);
		reprogram: inout std_logic;	-- drive low to restart FPGA configuration
		cpreq_n: inout std_logic
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL cpu_ioclr_n :  std_logic;
	SIGNAL dx :  std_logic_vector(0 to 11);
	SIGNAL clk_write_n :  std_logic;
	SIGNAL cpu_read_n :  std_logic;
	SIGNAL cpu_sr_read_n :  std_logic;
	SIGNAL cpu_sr_write_n :  std_logic;
	SIGNAL clk_lxdar_n :  std_logic;
	SIGNAL cpu_c0_n :  std_logic;
	SIGNAL cpu_c1_n :  std_logic;
	SIGNAL cpu_skip_n :  std_logic;
	SIGNAL cpu_intreq_n :  std_logic;
	SIGNAL cpu_intgrnt_n :  std_logic;
	SIGNAL txd :  std_logic_vector(0 to 2);
	SIGNAL rxd :  std_logic_vector(0 to 2);
	SIGNAL lpt_ack :  std_logic;
	SIGNAL lpt_busy_n :  std_logic;
	SIGNAL lpt_paper_end_n :  std_logic;
	SIGNAL lpt_select_in_n :  std_logic;
	SIGNAL lpt_error :  std_logic;
	SIGNAL lpt_strobe :  std_logic;
	SIGNAL lpt_ddir :  std_logic;
	SIGNAL lpt_data :  std_logic_vector(7 downto 0);
	SIGNAL lpt_init :  std_logic;
	SIGNAL reprogram :  std_logic;
	SIGNAL kb_clk: std_logic;
	SIGNAL kb_data: std_logic;
	SIGNAL vga_RGB: std_logic_vector(0 to 2);
	SIGNAL vga_HS: std_logic;
	SIGNAL vga_VS: std_logic;
	SIGNAL iobits: std_logic_vector(0 to 35);
	SIGNAL cpreq_n: std_logic;


	-- send a bit from the simulated keyboard
	procedure kbbitout( v: in std_logic; signal clk, data: inout std_logic ) is
	begin
		data <= v;
		wait for 20 us;
		clk <= '0';
		wait for 40 us;
		clk <= '1';
		wait for 20 us;
	end kbbitout;

	-- receive a byte from the host
	procedure kbturn(signal clk, data: inout std_logic) is
	begin
		wait until clk /= '0';
		for b in 1 to 10 loop
			clk <= '1';
			wait for 20 us;
			clk <= '0';
			wait for 40 us;
			clk <= '1';
			wait for 20 us;
		end loop;
		data <= '0';
		wait for 20 us;
		clk <= '0';
		wait for 40 us;
		clk <= '1';
		wait for 20 us;
		data <= '1';
		wait for 20 us;
		data <= 'Z';
		clk <= 'Z';
	end kbturn;

	-- send a byte from the device
	procedure kbbyteout( v: in std_logic_vector(7 downto 0); signal clk, data: inout std_logic ) is
	variable parity: std_logic := '1';
	variable timeout: time;
	begin
		wait for 150 us;
		clk <= '1';
		kbbitout('0', clk, data);
		for n in 0 to 7 loop
			kbbitout(v(n), clk, data);
			parity := parity xor v(n);
		end loop;
		kbbitout(parity, clk, data);
		kbbitout('1', clk, data);
		data <= 'Z';
		clk <= 'Z';
	end kbbyteout;

	-- simulate the CPU doing an IOT cycle
	-- returns the data read values, or U when no read
	-- returns skip flag
	procedure IOT
		(cmd: in std_logic_vector(0 to 11);
		 data: in std_logic_vector(0 to 11);
		 rdata: out std_logic_vector(0 to 11);
		 rskip: out std_logic;
		 signal dx: inout std_logic_vector(0 to 11);
		 signal clk_lxdar_n: out std_logic;
		 signal clk_write_n: out std_logic;
		 signal cpu_read_n: out std_logic;
		 signal cpu_c0_n: in std_logic;
		 signal cpu_c1_n: in std_logic;
		 signal cpu_skip_n: in std_logic) is
	variable c0, c1: boolean;
	begin
		rdata := (others => 'U');
		rskip := 'U';

		dx <= cmd;
		wait for 125 ns;
		clk_lxdar_n <= '0';
		wait for 180 ns;
		dx <= (others => 'Z');
		wait for 20 ns;
		clk_write_n <= '0';
		wait for 175 ns;
		dx <= data;
		wait for 200 ns;
		-- sample c0/c1/skip at rising edge of write_n --
		rskip := not cpu_skip_n;
		c0 := cpu_c0_n = '0';
		c1 := cpu_c1_n = '0';
		clk_write_n <= '1';
		wait for 127 ns;
		dx <= (others => 'Z');
		wait for 200 ns;
		if c1 then	-- read cycle requested
			-- c0 means "OR with AC" but we don't use that here
			cpu_read_n <= '0';
			wait for 425 ns;
			rdata := dx;
			cpu_read_n <= '1';
			wait for 220 ns;
		else
			wait for 200 ns;
		end if;
		clk_lxdar_n <= '1';
		wait for 392 ns;
	end IOT;

	procedure receive_char
		( addr: in std_logic_vector(0 to 5);
		 signal dx: inout std_logic_vector(0 to 11);
		 signal clk_lxdar_n: out std_logic;
		 signal clk_write_n: out std_logic;
		 signal cpu_read_n: out std_logic;
		 signal cpu_c0_n: in std_logic;
		 signal cpu_c1_n: in std_logic;
		 signal cpu_skip_n: in std_logic) is
	variable rdata: std_logic_vector(0 to 11);
	variable rskip: std_logic;
	begin
		wait for 1 us;
		IOT(O"6" & addr & O"1", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
		if rskip = '1' then
			wait for 12 us;
			IOT(O"6" & addr & O"6", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
			REPORT "## Received char on dev " & OctImage(addr) & " = "  & Image(rdata) & " ##";
		end if;
	end receive_char;

	procedure send_char
		( addr: in std_logic_vector(0 to 5);
		  data: in std_logic_vector(0 to 11);
		 signal dx: inout std_logic_vector(0 to 11);
		 signal clk_lxdar_n: out std_logic;
		 signal clk_write_n: out std_logic;
		 signal cpu_read_n: out std_logic;
		 signal cpu_c0_n: in std_logic;
		 signal cpu_c1_n: in std_logic;
		 signal cpu_skip_n: in std_logic) is
	variable rdata: std_logic_vector(0 to 11);
	variable rskip: std_logic;
	variable timeout: time;
	begin
		-- wait for output ready
		timeout := now + 12 ms;	-- down to 110 baud
		loop
			IOT(O"6" & addr & O"1", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
			exit when (rskip = '1') or (now > timeout);
		end loop;

		if now > timeout then
			report "*** send_char timeout on dev " & OctImage(addr) & " ***";
		else
			wait for 12 us;
			IOT(O"6" & addr & O"6", data, rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
		end if;

	end send_char;

	procedure send_string
		( addr: in std_logic_vector(0 to 5);
		  s: string;
		 signal dx: inout std_logic_vector(0 to 11);
		 signal clk_lxdar_n: out std_logic;
		 signal clk_write_n: out std_logic;
		 signal cpu_read_n: out std_logic;
		 signal cpu_c0_n: in std_logic;
		 signal cpu_c1_n: in std_logic;
		 signal cpu_skip_n: in std_logic) is
	variable rdata: std_logic_vector(0 to 11);
	variable rskip: std_logic;
	variable timeout: time;
	begin
		for i in s'range loop
			send_char(addr, std_logic_vector(to_unsigned(Character'pos(s(i)), dx'length)), dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
		end loop;
	end send_string;


BEGIN

	uut: iob PORT MAP(
		clk_in => clk,
		cpu_ioclr_n => cpu_ioclr_n,
		dx => dx,
		clk_write_n_raw => clk_write_n,
		cpu_read_n => cpu_read_n,
		cpu_sr_read_n => cpu_sr_read_n,
		cpu_sr_write_n => cpu_sr_write_n,
		clk_lxdar_n_raw => clk_lxdar_n,
		cpu_c0_n => cpu_c0_n,
		cpu_c1_n => cpu_c1_n,
		cpu_skip_n => cpu_skip_n,
		cpu_intreq_n => cpu_intreq_n,
		cpu_intgrnt_n => cpu_intgrnt_n,
		txd => txd,
		rxd => rxd,
		lpt_ack => lpt_ack,
		lpt_busy_n => lpt_busy_n,
		lpt_paper_end_n => lpt_paper_end_n,
		lpt_select_in_n => lpt_select_in_n,
		lpt_error => lpt_error,
		lpt_strobe => lpt_strobe,
		lpt_ddir => lpt_ddir,
		lpt_data => lpt_data,
		lpt_init => lpt_init,
		kb_clk => kb_clk,
		kb_data => kb_data,
		vga_RGB => vga_RGB,
		vga_HS => vga_HS,
		vga_VS => vga_VS,
		iobits => iobits,
		cpreq_n => cpreq_n,
		reprogram => reprogram
	);



	clock_stimulus : process
	begin
		clk <= '1';
		wait for 16954.2100694448 ps;
		clk <= '0';
		wait for 16954.2100694448 ps;
	end process;


	keyboard_stimulus: process
	begin
		kb_data <= 'Z';
		kb_clk <= 'Z';

		-- we know that we will be sent the LED data, 2 bytes and then we ack it
		wait until kb_clk = '0';
		kbturn(kb_clk, kb_data);
		kbturn(kb_clk, kb_data);
		kbbyteout("11111010", kb_clk, kb_data); -- ack

		-- 'a' key
		kbbyteout("00011100", kb_clk, kb_data);

		-- F1 key (two code sequence)
		kbbyteout("00000101", kb_clk, kb_data);

		-- shift down
		kbbyteout("01011001", kb_clk, kb_data);
		-- 'A' key
		kbbyteout("00011100", kb_clk, kb_data);
		-- shift up
		kbbyteout("11110000", kb_clk, kb_data);
		kbbyteout("01011001", kb_clk, kb_data);

		-- up arrow (ext) -> (two code sequence)
		kbbyteout("11100000", kb_clk, kb_data);
		kbbyteout("01110101", kb_clk, kb_data);

		wait;
	end process;

	receive_stimulus: process
	begin
		-- transmit a couple of serial characters
		-- !!! expand to other ports, string to send
		rxd <= (others => '1');
		wait for 2 us;
		rxd(0) <= '0';
		wait for SERBIT;
		rxd(0) <= '1';
		wait for 3*SERBIT;
		rxd(0) <= '0';
		wait for 5*SERBIT;
		rxd(0) <= '1';
		wait for SERBIT;

		rxd <= (others => '1');
		wait for 2 us;
		rxd(0) <= '0';
		wait for SERBIT;
		rxd(0) <= '0';
		wait for 2*SERBIT;
		rxd(0) <= '1';
		wait for 3*SERBIT;
		rxd(0) <= '0';
		wait for 3*SERBIT;
		rxd(0) <= '1';
		wait for SERBIT;

		wait;
	end process;

tb : PROCESS
	variable rdata: std_logic_vector(0 to 11);
	variable rskip: std_logic;
BEGIN
	-- start in reset
	cpu_ioclr_n <= '0';

	-- initial state of all inputs
	dx <= (others => 'Z');
	clk_write_n <= '1';
	cpu_read_n <= '1';
	cpu_sr_read_n <= '1';
	cpu_sr_write_n <= '1';
	clk_lxdar_n <= '1';
	lpt_ack <= '0';
	lpt_busy_n <= '1';
	lpt_paper_end_n <= '0';
	lpt_select_in_n <= '0';
	lpt_error <= '0';


	-- release reset
	wait for 500 ns;
	cpu_ioclr_n <= '1';
	wait for 1500 ns;

	-- make sure the output flags are set
	IOT(O"6660", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
	IOT(O"6310", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
	IOT(O"6330", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
	IOT(O"6350", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
	IOT(O"6370", O"0000", rdata, rskip, dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);

	-- write a character to serial out
	send_char(O"31", O"0125", dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
	-- write another character to serial port, testing double-buffering
	send_char(O"31", O"0125", dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);

	-- print a test message to the VT-52
	send_string
			(O"37",
				"First line " & so & " Inverse " & si &
				lf & "lf" & cr & "cr" & cr & lf & "Third Line" & lf & lf & lf &
				"*" & esc & "D" & esc & "D<" & esc & "A^" & esc & "B>" & esc & "B" & esc & "D" & esc & "Dv" &
				esc & "Y0#Line 16, Col 3",
			dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);

	-- simulate a polling loop looking for received characters
	while true loop
		wait for 26 us;
		receive_char(O"30", dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
		receive_char(O"32", dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
		receive_char(O"34", dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
		receive_char(O"36", dx, clk_lxdar_n, clk_write_n, cpu_read_n, cpu_c0_n, cpu_c1_n, cpu_skip_n);
	end loop;

END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
