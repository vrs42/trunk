LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;


entity clkdll_divide is
   generic ( CLOCK_RATIO : real );

   port (
      clk_in : in std_logic;
      clk_out : out std_logic;
      clk_fast : out std_logic
   );
end clkdll_divide;

architecture Behavioral of clkdll_divide is

component CLKDLL
   generic (CLKDV_DIVIDE : real);
   port (
      CLKIN, CLKFB, RST : in STD_LOGIC;
      CLK0, CLK90, CLK180, CLK270, CLK2X, CLKDV, LOCKED : out std_logic
   );
end component;

component IBUFG
   port (
      I : in std_logic;
      O : out std_logic
   );
end component;

component BUFG
   port (
      I : in std_logic;
      O : out std_logic 
   );
end component;


signal CLKIN, CLK : std_logic;
signal CLK0, CLKDV : std_logic;
signal gnd : std_logic := '0';

   
begin

   ibufg_1 : IBUFG port map (I => clk_in, O => CLKIN);
   
   clkdll_1 : CLKDLL
      generic map (CLKDV_DIVIDE => CLOCK_RATIO)
      port map (
         CLKIN => CLKIN, 
	 CLKFB => CLK, 
	 RST => gnd,
         CLK0 => CLK0, 
	 CLKDV => CLKDV 
--	 LOCKED => LOCKED
      );

      
   clk0_bufg_1 : BUFG port map (I => CLK0, O => CLK);
   clkdv_bufg_1 : BUFG port map (I => CLKDV, O => clk_out);

   clk_fast <= CLK;
	gnd      <= '0';
   
end Behavioral;
