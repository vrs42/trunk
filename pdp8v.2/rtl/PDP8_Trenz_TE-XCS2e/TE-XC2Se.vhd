library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TEXC2Se is
  Port (
     -- Fixed signals on DigiLab2e
     
     clk25 : in std_logic;
     clk48 : in std_logic;
     pbutton : in std_logic;
     led : out std_logic;
     
     RS232TxD : out std_logic;
     RS232RxD : in std_logic;
     RS232CTS : in std_logic;
     RS232RTS : out std_logic;

     PPstrobe : in std_logic;
     PPdata : in std_logic_vector (7 downto 0);
     PPbusy : out std_logic;

     SRAM_ble : out std_logic;
     SRAM_bhe : out std_logic;
     SRAM_oe : out std_logic;
     SRAM_cs : out std_logic;
     SRAMaddress : out std_logic_vector (0 to 16);
     SRAMdata : inout std_logic_vector (0 to 15);
     WE : out std_logic;
     
     -- DIO1 peripherla board

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
     
--   BLEDS : out std_logic(1 to 8);
     
     DIP_SW1 : in std_logic_vector (1 to 8)
     
--   BUTTON : in std_logic_vector (1 to 4)
     
  );
end TEXC2Se;



architecture struct of TEXC2Se is

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

      LEDS : out std_logic_vector (0 to 15);
      
      SRAMoe : out std_logic;
      SRAMwe : out std_logic;
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


signal reset : std_logic;

signal sys_config : std_logic_vector(1 to 8);

   signal VGAred, VGAgreen, VGAblue : std_logic;

begin 

PDP8 : PDP8sys   
   generic map (
      SYSCLKFREQ => 48000000,
      DOTCLKFREQ => 25000000
   )

   port map (
      sysclk => clk48,
      reset => Pbutton,

      VGAdotclk => clk25,
      VGAhsync => VGAhsync,
      VGAvsync => VGAvsync,
      VGAred => VGAred,
      VGAblue => VGAblue,
      VGAgreen => VGAgreen,

      PS2KBdata => PS2KBdata,
      PS2KBclk => PS2KBclk,

      CONFIG => sys_config,
--    LEDS => BLEDS,
  
  
      SRAMwe => WE,
      SRAMoe => SRAM_oe,
      SRAMaddr => SRAMaddress(1 to 15),
      SRAMdata => SRAMdata,

      CONSOLErxd => RS232Rxd,
      CONSOLEtxd => RS232TxD,

      TTY1rxd => '0',
--    TTY1txd => '0',

      Pbuffer => PPdata,
      Pbusy => PPbusy,
      Pstrobe => PPstrobe
   );
  
   led <= '1';  -- Turn LED on to show download succeeded
   sys_config <= "00001001";
   VGAred0 <= not VGAred;
   VGAred1 <= not VGAred;
   VGAgreen0 <= not VGAgreen;
   VGAgreen1 <= not VGAgreen;
   VGAblue0 <= not VGAblue;
   VGAblue1 <= not VGAblue;

   SRAM_ble <= '0';
   SRAM_bhe <= '0';
   SRAM_cs <= '0';
   SRAMaddress(16) <= '0';
   
end architecture struct;

