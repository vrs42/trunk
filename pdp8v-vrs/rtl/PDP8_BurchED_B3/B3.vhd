library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity B3 is
  Port (
     clkin : in std_logic;
     pbutton : in std_logic;
     led : out std_logic;
     
     VGAblue0 : out std_logic;
     VGAgreen0 : out std_logic;
     VGAred0 : out std_logic;
     VGAhsync : out std_logic;
     VGAvsync : out std_logic;
     
     PS2KBdata : in std_logic;
     PS2KBclk : in std_logic;
     
     RS232TxD : out std_logic;
     RS232RxD : in std_logic;

     DIP_SW1 : std_logic_vector (1 to 8);
     
     SRAMoe : out std_logic;
     SRAMwe : out std_logic;
     SRAMaddress : out std_logic_vector (0 to 14);
     SRAMdata : inout std_logic_vector (0 to 15);

     PPstrobe : in std_logic;
     PPdata : in std_logic_vector (7 downto 0);
     PPbusy : out std_logic
  );
end B3;

architecture struct of B3 is

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

      SRAMwe : out std_logic;
      SRAMoe : out std_logic;
      SRAMaddr : out std_logic_vector (0 to 14);
      SRAMdata : inout std_logic_vector (0 to 15);

      CONSOLErxd : in std_logic;
      CONSOLEtxd : out std_logic;

      TTY1rxd : in std_logic;
      TTY1txd : out std_logic;

      Pbuffer : in std_logic_vector (7 downto 0);
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

signal sysclk : std_logic;
signal dotclk : std_logic;

signal VGAred : std_logic;
signal VGAgreen : std_logic;
signal VGAblue : std_logic;
signal VGAhs : std_logic;
signal VGAvs : std_logic;

begin 

clks : clkdll_divide
   generic map ( CLOCK_RATIO => 2.0 )

   port map (
      clk_in => clkin,
--    clk_fast=> sysclk,
      clk_out => dotclk
   );
  
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
      VGAhsync => VGAhs,
      VGAvsync => VGAvs,
      VGAred => VGAred,
      VGAblue => VGAblue,
      VGAgreen => VGAgreen,

      PS2KBdata => PS2KBdata,
      PS2KBclk => PS2KBclk,

      CONFIG => DIP_SW1,
      
      SRAMwe => SRAMwe,
      SRAMoe => SRAMoe,
      SRAMaddr => SRAMaddress(0 to 14),
      SRAMdata => SRAMdata,

      CONSOLErxd => RS232Rxd,
      CONSOLEtxd => RS232TxD,

      TTY1rxd => '0', -- TT1rxd,
--    TTY1txd => TT1txd,

      Pbuffer => PPdata,
      Pbusy => PPbusy,
      Pstrobe => PPstrobe
   );

   led <= '0';  -- Turn LED on to show download succeeded

   -- These signals are buffered by a 74LS04 on the interface
   -- so they need inverting

   VGAred0 <= not VGAred;
   VGAgreen0 <= not VGAgreen;
   VGAblue0 <= not VGAblue;
   VGAhsync <= not VGAhs;
   VGAvsync <= not VGAvs;
  
end architecture struct;

