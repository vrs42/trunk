library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity B5X300 is
  Port (
  
     -- Fixed signals on B5X300
     
     clkin : in std_logic;
     pbutton : in std_logic;
     led : out std_logic;
     
     -- IO connector module module : Connector G
     
     VGAblue0 : out std_logic;
     VGAblue1 : out std_logic;
     VGAgreen0 : out std_logic;
     VGAgreen1 : out std_logic;
     VGAred0 : out std_logic;
     VGAred1 : out std_logic;
     VGAhsync : out std_logic;
     VGAvsync : out std_logic;
     
     PS2KBdata : in std_logic;
     PS2KBclk : in std_logic;
     
     MouseData : in std_logic;
     MouseClk : in std_logic;
     
     Buzzer : out std_logic;
     
     RS232TxD : out std_logic;
     RS232RxD : in std_logic;
     RS232CTS : in std_logic;
     RS232RTS : out std_logic;
     
     -- DIP switch module : Connector C
     
     DIP_SW1 : std_logic_vector (1 to 8);
     DIP_SW2 : std_logic_vector (1 to 8);
     
     -- SRAM module : Connector A-B
     
     SRAMweu : out std_logic;
     SRAMwel : out std_logic;
     SRAMce : out std_logic;
     SRAMaddress : out std_logic_vector (0 to 16);
     SRAMdata : inout std_logic_vector (0 to 15);
     
     -- Compact Flash module : Conenctors E-F

     -- Slecet one of the following to lines to make the LEDS appear 
     -- in the "right" order"
--   BLEDS : out std_logic_vector(0 to 15);
     BLEDS : out std_logic_vector (15 downto 0);
     
     -- Parallel port input : Connector H
     
     PPstrobe : in std_logic;
     PPdata : in std_logic_vector (7 downto 0);
     PPbusy : out std_logic
  );
end B5X300;

architecture struct of B5X300 is

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

      LEDS : out std_logic_vector (0 to 15);
      CONFIG : in std_logic_vector (1 to 8);

      SRAMwe : out std_logic;
      SRAMoe : out std_logic;
      SRAMaddr : out std_logic_vector (0 to 14);
      SRAMdata : inout std_logic_vector (0 to 15);

      CONSOLErxd : in std_logic;
      CONSOLEtxd : out std_logic;

      TTY1rxd : in std_logic;
      TTY1txd : out std_logic;

      Pbuffer : in std_logic_vector (0 to 7);
      Pbusy : out std_logic;
      Pstrobe : in std_logic
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
   
signal SRAMwe : std_logic; 

signal sysclk : std_logic;
signal dotclk : std_logic;

begin 

clks : clkdll_divide
   generic map ( CLOCK_RATIO => 2.0 )

   port map (
      clk_in => clkin,
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
      sysclk => sysclk,
      reset => pbutton,
      
      VGAdotclk => dotclk,
      VGAhsync => VGAhsync,
      VGAvsync => VGAvsync,
      VGAred => VGAred,
      VGAblue => VGAblue,
      VGAgreen => VGAgreen,

      PS2KBdata => PS2KBdata,
      PS2KBclk => PS2KBclk,

      CONFIG => DIP_SW1,
      LEDS => BLEDS,
      
      SRAMwe => SRAMwe,
--    SRAMoe => SRAMce,
      SRAMaddr => SRAMaddress(0 to 14),
      SRAMdata => SRAMdata,

      CONSOLErxd => RS232Rxd,
      CONSOLEtxd => RS232TxD,

      -- With an appropriately modified RS232 cable, the CTS and RTS signals
      -- can be used to drive the RxD and TxD of a second terminal
      -- enable the next two lines and remove the subsequent one
      
--    TT1rxd => RS232cts,
--    TT1txd => RS232rts,
      TTY1rxd => '0',

      Pbuffer => PPdata,
      Pbusy => PPbusy,
      Pstrobe => PPstrobe
   );
  
   led <= '1';  -- Turn LED on to show download succeeded
  
   VGAred0 <= VGAred;
   VGAred1 <= VGAred;
   VGAgreen0 <= VGAgreen;
   VGAgreen1 <= VGAgreen;
   VGAblue0 <= VGAblue;
   VGAblue1 <= VGAblue;
  
   SRAMce <= '0';  -- Use ce = 0 ie Jumper A in position 1-2
   SRAMwel <= SRAMwe;
   SRAMweu <= SRAMwe;
   SRAMaddress(15 to 16) <= "00";

end architecture struct;

