library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PDP8_XSA_3S1000 is
  Port (
     CLK100        : in  std_logic;	-- 100 MHz clock
     SW2_N         : in  std_logic; -- active-low pushbutton 
     SW3_N         : in  std_logic; -- active-low pushbutton

     PS2_CLK       : in  std_logic; 
     PS2_DAT 		 : in  std_logic;

	  STATUS_LED    : out std_logic_vector(6 downto 0);
	  VGA_BLUE      : out std_logic_vector(2 downto 0);
	  VGA_GREEN     : out std_logic_vector(2 downto 0);
	  VGA_RED       : out std_logic_vector(2 downto 0);
	  VGA_HSYNC_N   : out std_logic;
	  VGA_VSYNC_N   : out std_logic;

	  RS232_TXD     : out std_logic;
	  RS232_RXD	    : in  std_logic;

	  ethernet_cs_n : out std_logic
  );
end PDP8_XSA_3S1000;

architecture struct of PDP8_XSA_3S1000 is

   component PDP8sys is
   Generic (
      SYSCLKFREQ : integer;
      DOTCLKFREQ : integer
   );
   
   Port (
      sysclk : in std_logic;
      reset : in std_logic;

      VGAdotclk : in std_logic;
      VGAhsync : out std_logic;
      VGAvsync : out std_logic;
      VGAred : out std_logic;
      VGAblue : out std_logic;
      VGAgreen : out std_logic;

      PS2KBdata : in std_logic;
      PS2KBclk : in std_logic;

      CONFIG : in std_logic_vector (1 to 8);
      CONSOLErxd : in std_logic;
      CONSOLEtxd : out std_logic;

      TTY1rxd : in std_logic;
      TTY1txd : out std_logic
   );
end component PDP8sys;

component clkdll_divide is
   generic ( CLOCK_RATIO : real );

   port (
      clk_in : in std_logic;
      clk_out : out std_logic;
      clk_fast : out std_logic
   );
end component clkdll_divide;

signal VGAred : std_logic;
signal VGAgreen : std_logic;
signal VGAblue : std_logic;

signal sysclk : std_logic;
signal dotclk : std_logic;
signal DIP_SW1 : std_logic_vector(1 to 8) := "00001001"; -- 9600 Bd 
signal pbutton : std_logic;

begin 

clks : clkdll_divide
   generic map ( CLOCK_RATIO => 4.0 )

   port map (
      clk_in => CLK100,
--      clk_fast=> sysclk,
      clk_out => dotclk
   );

-- the intention is to allow the main system to run at 50Mhz while the video
-- generation runs at 25 MHz. There are some implementation issues regarding
-- the interface bettween the two which preclude that working at this time
   sysclk <= dotclk;

PDP8 : PDP8sys   
   generic map (
      SYSCLKFREQ => 25000000,
      DOTCLKFREQ => 25000000
   )
   port map (
      sysclk     => sysclk,
      reset      => pbutton,
      
      VGAdotclk  => dotclk,
      VGAhsync   => VGA_HSYNC_N,
      VGAvsync   => VGA_VSYNC_N,
      VGAred     => VGAred,
      VGAblue    => VGAblue,
      VGAgreen   => VGAgreen,

      PS2KBdata  => PS2_DAT,
      PS2KBclk   => PS2_CLK,

      CONFIG     => DIP_SW1,

      CONSOLErxd => RS232_RXD,
      CONSOLEtxd => RS232_TXD,

      -- With an appropriately modified RS232 cable, the CTS and RTS signals
      -- can be used to drive the RxD and TxD of a second terminal
      -- enable the next two lines and remove the subsequent one
      
--    TT1rxd     => RS232cts,
--    TT1txd     => RS232rts,
      TTY1rxd    => '0'
   );
  
   VGA_RED(0)    <= VGAred;
   VGA_RED(1)    <= VGAred;
   VGA_RED(2)    <= VGAred;
   VGA_GREEN(0)  <= VGAgreen;
   VGA_GREEN(1)  <= VGAgreen;
   VGA_GREEN(2)  <= VGAgreen;
   VGA_BLUE(0)   <= VGAblue;
   VGA_BLUE(1)   <= VGAblue;
   VGA_BLUE(2)   <= VGAblue;

	pbutton       <= SW2_N;
	STATUS_LED    <= "1111111";	
	ethernet_cs_n <= '1';

end architecture struct;

