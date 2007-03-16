--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vincent R. Slyngstad
--
-- Create Date:    11:40:54 09/15/06
-- Design Name:    PDP8 Infrastructure
-- Module Name:    posimux - structural
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--		Mux the wide Posibus signals onto a smaller bus.
--    This would be used in a CPU to map the Posibus 
--    logic onto the output pins.  (This reduces the 
--		pincount burden to support Posibus from 72 pins 
--		to 16 pins.)
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--		BUGBUG: The timing signals make no sense.  There's no single 
--			sampling moment when io_p1, io_p2, and io_p4 may all be 
--			sampled to determine the IOT timing!  For that to work, 
--			muxstate would have to completely cycle for every PDP-8 
--			timestate.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package posibus is
	type muxctl is array (0 to 2) of std_logic;
	constant PD_BAC    : muxctl := "000";
	constant PD_BMB    : muxctl := "001";
	constant PD_IM     : muxctl := "010";
	constant PD_STATUS : muxctl := "011";
	constant PD_CTL    : muxctl := "100";
	constant PD_BRK    : muxctl := "101";
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.posibus.all;

entity posimux is
    generic(tpd : time := 10 ns);
    port(
   -- A master clock is used to drive the mux selector.
        clka             : in    std_logic;

   -- Here is the Multiplexed bus (from/to the peripheral).
		  pd_l             : inout std_logic_vector(0 to 11) := "HHHHHHHHHHHH";
		  mx_h             : out   muxctl;

   -- For this unit "in" means coming to us from the CPU, 
   --	while "out" means going from us to the CPU (or device).

	-- Here are the unmultiplexed versions (from/to the CPU).
	-- (There should be 72 of these.)
        io_bac           : in    std_logic_vector(0 to 11); -- Posibus (Data out)
        io_bmb           : in    std_logic_vector(0 to 11); -- Posibus (Inst. out)
        io_bmb_l         : in    std_logic_vector(3 to  8); -- Posibus (Inst. out)
        io_p1            : in    std_logic;
        io_p2            : in    std_logic;
        io_p4            : in    std_logic;
        io_ts03          : in    std_logic;
        io_b_run         : in    std_logic;
        io_pwr_clr       : in    std_logic;
        io_im_l          : out   std_logic_vector(0 to 11); -- Posibus (Data in)
        io_int_rq_l      : out   std_logic;
        io_skp_rq_l      : out   std_logic;
        io_0_to_ac_l     : out   std_logic;
        db_addr_acc_l    : in    std_logic;   -- Data Break
        db_bwc0_l        : in    std_logic;   -- Data Break (Count has gone to zero)
        db_b_brk         : in    std_logic;   -- Data Break (Break Grant)
        db_ea_l          : out   std_logic_vector(0 to 2); -- Data Break (Extended Address)
        db_brk_rq_l      : out   std_logic;   -- Data Break (Break Request)
        db_data_in       : out   std_logic;   -- Data Break (Load or Store?)
        db_1_to_ca_inh_l : out   std_logic;   -- Data Break (Inhibit address increment)
        db_data_l        : out   std_logic_vector(0 to 11) -- Data Break (Data)
    );
end posimux;

architecture structural of posimux is
	signal muxstate       : muxctl := "000";
	signal nxtstate       : muxctl;
	signal s_in           : std_logic_vector(0 to 11) := "000000000000"; -- to peripheral
	signal s_out          : std_logic_vector(0 to 11) := "000000000000"; -- to cpu
	alias s_p1            : std_logic is s_in ( 0);
	alias s_p2            : std_logic is s_in ( 1);
	alias s_p4            : std_logic is s_in ( 2);
	alias s_ts03          : std_logic is s_in ( 3);
	alias s_b_run         : std_logic is s_in ( 4);
	alias s_pwr_clr       : std_logic is s_in ( 5);
   alias s_addr_acc_l    : std_logic is s_in ( 6); -- Data Break
   alias s_bwc0_l        : std_logic is s_in ( 7); -- Data Break (Count has gone to zero)
   alias s_b_brk         : std_logic is s_in ( 8); -- Data Break (Break Grant)
	alias s_int_rq_l      : std_logic is s_out( 0);
	alias s_skp_rq_l      : std_logic is s_out( 1);
	alias s_0_to_ac_l     : std_logic is s_out( 2);
   alias s_ea_l          : std_logic_vector(0 to 2) is s_out(3 to 5); -- Data Break (Extended Address)
   alias s_data_in       : std_logic is s_out( 6); -- Data Break (Load or Store?)
   alias s_brk_rq_l      : std_logic is s_out( 7); -- Data Break (Break Request)
   alias s_1_to_ca_inh_l : std_logic is s_out( 8); -- Data Break (Inhibit address increment)
begin
   nxtstate <= "001" when muxstate = "000"
	else        "010" when muxstate = "001"
	else        "011" when muxstate = "010"
	else        "100" when muxstate = "011"
	else        "101" when muxstate = "100"
	else        "000";
	muxstate <= nxtstate when clka'event and clka = '1';
	mx_h <= muxstate;

-- Some states require inputs to be latched.
   io_im_l   <= pd_l when muxstate = PD_IM;
   s_out     <= pd_l when muxstate = PD_STATUS;
	db_data_l <= pd_l when muxstate = PD_BRK and s_data_in = '1';

-- Other states just copy outputs onto the bus.
   pd_l <= io_bac when muxstate = PD_BAC
	else    io_bmb when muxstate = PD_BMB
	else    s_in   when muxstate = PD_CTL
	else    not(io_bmb) when muxstate = PD_BRK and s_data_in = '0'
	else    "ZZZZZZZZZZZZ";

-- Copy the aliased data to the CPU.
   io_0_to_ac_l <= s_0_to_ac_l;
   io_skp_rq_l <= s_skp_rq_l;
	io_int_rq_l <= s_int_rq_l;
   db_brk_rq_l <= s_brk_rq_l;
	db_ea_l <= s_ea_l;
	db_data_in <= s_data_in;
	db_1_to_ca_inh_l <= s_1_to_ca_inh_l;

-- Assemble the vector of control signals from the CPU.
	s_p1 <= io_p1;
	s_p2 <= io_p2;
	s_p4 <= io_p4;
	s_b_run <= io_b_run;
	s_ts03 <= io_ts03;
	s_pwr_clr <= io_pwr_clr;
	s_addr_acc_l <= db_addr_acc_l;
	s_bwc0_l <= db_bwc0_l;
	s_b_brk <= db_b_brk;

-- io_bmb_l is unused
end structural;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.posibus.all;

entity posidmux is
    generic(tpd : time := 10 ns);
    port(

   -- Here is the Multiplexed bus (from/to the peripheral).
		  pd_l             : inout std_logic_vector(0 to 11) := "HHHHHHHHHHHH";
		  mx_h             : in    muxctl;

   -- For this unit "in" means coming to us from the I/O device, 
   --	while "out" means going from us to the device (or CPU).

	-- Here are the unmultiplexed versions (from/to the device).
	-- (There should be 72 of these.)
        io_bac           : buffer std_logic_vector(0 to 11); -- Posibus (Data out)
        io_bmb           : buffer std_logic_vector(0 to 11); -- Posibus (Inst. out)
        io_bmb_l         : buffer std_logic_vector(3 to  8); -- Posibus (Inst. out)
        io_p1            : out   std_logic;
        io_p2            : out   std_logic;
        io_p4            : out   std_logic;
        io_ts03          : out   std_logic;
        io_b_run         : out   std_logic;
        io_pwr_clr       : out   std_logic;
	     io_im_l          : in    std_logic_vector(0 to 11) := "HHHHHHHHHHHH"; -- Posibus (Data in)
        io_int_rq_l      : in    std_logic;
        io_skp_rq_l      : in    std_logic;
        io_0_to_ac_l     : in    std_logic;
        db_addr_acc_l    : out   std_logic;   -- Data Break
        db_bwc0_l        : out   std_logic;   -- Data Break (Count has gone to zero)
        db_b_brk         : out   std_logic;   -- Data Break (Break Grant)
        db_ea_l          : in    std_logic_vector(0 to 2) := "HHH"; -- Data Break (Extended Address)
        db_brk_rq_l      : in    std_logic;   -- Data Break (Break Request)
        db_data_in       : in    std_logic;   -- Data Break (Load or Store?)
        db_1_to_ca_inh_l : in    std_logic;   -- Data Break (Inhibit address increment)
        db_data_l        : inout std_logic_vector(0 to 11) := "HHHHHHHHHHHH" -- Data Break (Data)
    );
end posidmux;

architecture structural of posidmux is
	signal s_in           : std_logic_vector(0 to 11) := "000000000000"; -- to peripheral
	signal s_out          : std_logic_vector(0 to 11) := "000000000000"; -- to cpu
   signal s_data_l       : std_logic_vector(0 to 11) := "HHHHHHHHHHHH"; -- Data Break (Data)
	alias s_p1            : std_logic is s_in ( 0);
	alias s_p2            : std_logic is s_in ( 1);
	alias s_p4            : std_logic is s_in ( 2);
	alias s_ts03          : std_logic is s_in ( 3);
	alias s_b_run         : std_logic is s_in ( 4);
	alias s_pwr_clr       : std_logic is s_in ( 5);
   alias s_addr_acc_l    : std_logic is s_in ( 6); -- Data Break
   alias s_bwc0_l        : std_logic is s_in ( 7); -- Data Break (Count has gone to zero)
   alias s_b_brk         : std_logic is s_in ( 8); -- Data Break (Break Grant)
	alias s_int_rq_l      : std_logic is s_out( 0);
	alias s_skp_rq_l      : std_logic is s_out( 1);
	alias s_0_to_ac_l     : std_logic is s_out( 2);
   alias s_ea_l          : std_logic_vector(0 to 2) is s_out(3 to 5); -- Data Break (Extended Address)
   alias s_data_in       : std_logic is s_out( 6); -- Data Break (Load or Store?)
   alias s_brk_rq_l      : std_logic is s_out( 7); -- Data Break (Break Request)
   alias s_1_to_ca_inh_l : std_logic is s_out( 8); -- Data Break (Inhibit address increment)
begin

-- Some states require CPU outputs to be latched.
	io_bac <= pd_l when mx_h = PD_BAC
	else      io_bac;
	io_bmb <= pd_l when mx_h = PD_BMB
	else      io_bmb;
	io_bmb_l <= not(pd_l(3 to 8)) when mx_h = PD_BMB
	else      io_bmb_l;
	s_in   <= pd_l when mx_h = PD_CTL
	else      s_in;
	s_data_l <= pd_l      when mx_h = PD_BRK and s_data_in = '0'
	else        db_data_l when db_data_in = '1'
	else        s_data_l;

-- Others require us to present data to the MUX.
   pd_l <= io_im_l   when mx_h = PD_IM
	else    s_out     when mx_h = PD_STATUS
	else    s_data_l  when mx_h = PD_BRK and s_data_in = '1'
	else    "ZZZZZZZZZZZZ";

-- Copy the aliased data to the CPU.
   s_0_to_ac_l <= io_0_to_ac_l;
   s_skp_rq_l <= io_skp_rq_l;
	s_int_rq_l <= io_int_rq_l;
   s_brk_rq_l <= db_brk_rq_l;
	s_ea_l <= db_ea_l;
	s_data_in <= db_data_in;
	s_1_to_ca_inh_l <= db_1_to_ca_inh_l;
--	s_data_l <= db_data_l when db_data_in = '1';

-- Assemble the vector of control signals from the CPU.
	io_p1 <= s_p1;
	io_p2 <= s_p2;
	io_p4 <= s_p4;
	io_b_run <= s_b_run;
	io_ts03 <= s_ts03;
	io_pwr_clr <= s_pwr_clr;
	db_addr_acc_l <= s_addr_acc_l;
	db_bwc0_l <= s_bwc0_l;
	db_b_brk <= s_b_brk;
	db_data_l <= s_data_l when db_data_in = '0' else "ZZZZZZZZZZZZ";
end structural;