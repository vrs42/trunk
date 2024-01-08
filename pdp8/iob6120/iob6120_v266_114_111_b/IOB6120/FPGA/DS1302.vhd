library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

use work.IOB_Config.ALL;

entity DS1302ClkCal is
	generic
	(
	addr: DevID := CLKCALBASE
	);
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
	SIO : inout std_logic
	);
end DS1302ClkCal;

architecture RTL of DS1302ClkCal is

type States is (Idle, Leader1, Leader2, SendCmd, RcvData, SendData, Trailer);

signal data_reg, cmd_reg: std_logic_vector(0 to 7);

signal bitctr: unsigned(3 downto 0);
signal state : States;

signal rw: std_logic;
signal wrcmd_1, wrcmd_2: std_logic;
signal wrdata_1, wrdata_2: std_logic;

begin

-- async bus interface
process (IOTact, IOTdev, IOTcmd, cpu_write_n, IOTread, state, data_reg)
begin
	if IOTact and (IOTDev = addr) then 
	
		if (cpu_write_n = '0') and (IOTcmd = CCRD) then
			cpu_c0_n <= '0';
			cpu_c1_n <= '0';
		else
			cpu_c0_n <= 'Z';
			cpu_c1_n <= 'Z';
		end if;

		if (cpu_write_n = '0') and (IOTcmd = CCSK) and (state = Idle) then
			cpu_skip_n <= '0';
		else
			cpu_skip_n <= 'Z';
		end if;

		if IOTread then
			dx <= "0000" & data_reg;
		else
			dx <= (others => 'Z');
		end if;

	else
		cpu_c0_n <= 'Z';
		cpu_c1_n <= 'Z';
		cpu_skip_n <= 'Z';
		dx <= (others => 'Z');
	end if;
end process;

-- sync bus interface
process (reset, IOTact, IOTdev, IOTcmd, clk_write_n, wrcmd_2, wrdata_2)
begin
	if reset then

		wrcmd_1 <= '0';
		wrdata_1 <= '0';

	elsif rising_edge(clk_write_n) then

		if IOTact and (IOTDev = addr) then

			case IOTcmd is

				when CCCM =>
					wrcmd_1 <= not wrcmd_2;

				when CCWR =>
					wrdata_1 <= not wrdata_2;

				when others =>
					null;

			end case;
		end if;
	end if;
end process;

-- state machine
process (state, bitctr, cmd_reg, data_reg)
begin
	case state is

		when Idle =>
			SCLK <= 'Z';
			RST_n <= '0';
			SIO <= 'Z';

		when Leader1 =>
			SCLK <= '0';
			RST_n <= '0';
			SIO <= '0';

		when Leader2 =>
			SCLK <= '0';
			RST_n <= '1';
			SIO <= '0';

		when SendCmd =>
			RST_n <= '1';
			SCLK <= bitctr(0);
			SIO <= cmd_reg(7);

		when RcvData =>
			RST_n <= '1';
			SCLK <= bitctr(0);
			SIO <= 'Z';
		
		when SendData =>
			RST_n <= '1';
			SCLK <= bitctr(0);
			SIO <= data_reg(7);

		when Trailer =>
			SCLK <= '0';
			RST_n <= '1';
			SIO <= '0';

	end case;
end process;

process (reset, clk, bitclk, state, dx, wrcmd_1, wrdata_1)
begin

	if reset then

		wrcmd_2 <= '0';
		wrdata_2 <= '0';
		data_reg <= (others => '0');

	elsif rising_edge(clk) then

		if wrcmd_2 /= wrcmd_1 then

			cmd_reg <= dx(4 to 11);
			rw <= dx(11);
			wrcmd_2 <= wrcmd_1;
			state <= Leader1;
			bitctr <= "0000";

		elsif wrdata_2 /= wrdata_1 then

			data_reg <= dx(4 to 11);
			wrdata_2 <= wrdata_1;

		elsif bitclk = '1' then

			case state is

				when Idle =>
					null;

				when Leader1 =>
					state <= Leader2;

				when Leader2 =>
					state <= SendCmd;

				when SendCmd =>
					bitctr <= bitctr + 1;
					if bitctr = "1111" then
						if rw = '0' then
							state <= SendData;
						else
							state <= RcvData;
						end if;
					else
						if bitctr(0) = '1' then
							cmd_reg(1 to 7) <= cmd_reg(0 to 6);
						end if;
					end if;

				when RcvData =>
					bitctr <= bitctr + 1;
					if bitctr = "1111" then
						state <= Trailer;
					else
						if bitctr(0) = '0' then
							data_reg <= SIO & data_reg(0 to 6);
						end if;
					end if;
		
				when SendData =>
					bitctr <= bitctr + 1;
					if bitctr = "1111" then
						state <= Trailer;
					else
						if bitctr(0) = '1' then
							data_reg <= '0' & data_reg(0 to 6);
						end if;
					end if;

				when Trailer =>
					state <= Idle;

			end case;

		end if;

	end if;

end process;



end RTL;
