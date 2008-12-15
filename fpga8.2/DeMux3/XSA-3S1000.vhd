library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PDP8_XSA_3S1000 is
  Port (
      CLK100      : in  std_logic; -- 100 MHz clock
      SW2_N       : in  std_logic; -- active-low pushbutton reset

      PS2_CLK     : in  std_logic; 
      PS2_DAT 	   : in  std_logic;

--      STATUS_LED  : out std_logic_vector(6 downto 0);
      VGA_BLUE    : out std_logic_vector(2 downto 0);
      VGA_GREEN   : out std_logic_vector(2 downto 0);
      VGA_RED     : out std_logic_vector(2 downto 0);
      VGA_HSYNC_N : out std_logic;
      VGA_VSYNC_N : out std_logic;
   
      RS232_TXD   : out std_logic;
      RS232_RXD   : in  std_logic;
      RS232_RTS   : out std_logic;
--      RS232_CTS   : in  std_logic;
   
----
---- IDE Interface
----
--      IDE_CS0_N   : out std_logic;
--      IDE_CS1_N   : out std_logic;
--      IDE_IRQ     : in  std_logic;
--      IDE_DMACK_N : out std_logic;
--      IDE_IORDY   : in  std_logic;
--      IDE_DMARQ   : in  std_logic;
--   
----
---- Slot1, Slot2 Interfaces.
----
--      CLK         : out std_logic;
--      SLOT1_CS_N  : out std_logic;
--      SLOT2_CS_N  : out std_logic;
--      SLOT1_IRQ   : in  std_logic;
--      SLOT2_IRQ   : in  std_logic;
--      I2C_SCL     : in  std_logic;
--      I2C_SDA     : in  std_logic;
--   
----
---- Common address/data bus for IDE, SLOT1, and SLOT2.
----
--      PB_IOR_N    : out std_logic;
--      PB_IOW_N    : out std_logic;
--      PB_A        : out std_logic_vector(0 to 4);
--      PB_D        : inout std_logic_vector(0 to 15);
--   
----
---- DeMux3 board's SD card interface.
----
--      SD_CLK      : out std_logic;
--      SD_CD_N     : in  std_logic;
--      SD_WP       : in  std_logic;
--      SD_CMD      : out std_logic;
--      SD_DAT0     : inout std_logic;
--      SD_DAT1     : inout std_logic;
--      SD_DAT2     : inout std_logic;
--      SD_DAT3     : inout std_logic;
--   
--
-- DeMux3 board's lights and switches interface.
--
      S3_SCLK     : out std_logic;
      S3_SSER_N   : in  std_logic;
      S3_SCL_N    : out std_logic;
      S3_LCLK     : out std_logic;
      S3_LSER     : out std_logic;
      S3_LCL_N    : out std_logic;
   
--
-- CAF style external reset.
--
      RESET_TRIG_N   : out std_logic;
   
      ethernet_cs_n  : out std_logic
  );
end PDP8_XSA_3S1000;

architecture struct of PDP8_XSA_3S1000 is

   component PDP8sys is
   Generic (
      SYSCLKFREQ : integer;
      DOTCLKFREQ : integer
   );
   
   Port (
      sysclk      : in std_logic;
      reset       : in std_logic;

      VGAdotclk   : in std_logic;
      VGAhsync    : out std_logic;
      VGAvsync    : out std_logic;
      VGAred      : out std_logic;
      VGAblue     : out std_logic;
      VGAgreen    : out std_logic;

      PS2KBdata   : in std_logic;
      PS2KBclk    : in std_logic;

      CONFIG      : in std_logic_vector (1 to 8);

      CONSOLErxd  : in std_logic;
      CONSOLEtxd  : out std_logic;
      CONSOLErts  : out std_logic;

--      TTY1rxd     : in std_logic;
--      TTY1txd     : out std_logic;
--      TTY1rts     : out std_logic;

--
-- DeMux3 board's lights and switches interface.
--
      S3_SCLK     : out std_logic;
      S3_SSER_N   : in  std_logic;
      S3_SCL_N    : out std_logic;
      S3_LCLK     : out std_logic;
      S3_LSER     : out std_logic;
      S3_LCL_N    : out std_logic;

      Pbuffer     : in  std_logic_vector (7 downto 0);
      Pstrobe     : in  std_logic;
      Pbusy       : out std_logic
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

signal VGAred   : std_logic;
signal VGAgreen : std_logic;
signal VGAblue  : std_logic;

signal sysclk   : std_logic;
signal dotclk   : std_logic;
signal pbutton  : std_logic;

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

      CONFIG     => "00001001",

      CONSOLErxd => RS232_RXD,
      CONSOLEtxd => RS232_TXD,
      CONSOLErts => RS232_RTS,
--    CONSOLEcts => RS232_CTS,

      -- With an appropriately modified RS232 cable, the CTS and RTS signals
      -- can be used to drive the RxD and TxD of a second terminal
      -- enable the next two lines and remove the subsequent one
      
--      TTY1rxd    => '1',
      
--    TT1rxd     => RS232_CTS,
--    TT1txd     => RS232_RTS,
--    TT1rts     => RS232_RTS,
--    TT1cts     => RS232_CTS,

      S3_SCLK    => S3_SCLK,
      S3_SSER_N  => S3_SSER_N,
      S3_SCL_N   => S3_SCL_N,

      S3_LCLK    => S3_LCLK,
      S3_LSER    => S3_LSER,
      S3_LCL_N   => S3_LCL_N,

      Pbuffer    => (others => '0'),
      Pstrobe    => '0'
--      Pbusy		  => Pbusy
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
--     STATUS_LED    <= "1111111";

---- Disable the IDE interface for now.
--	IDE_CS0_N <= '1';
--	IDE_CS1_N <= '1';
--	IDE_DMACK_N <= '1';
--
----
---- Disable Slot1, Slot2 Interfaces for now.
----
--	CLK <= '1';
--	SLOT1_CS_N <= '1';
--	SLOT2_CS_N <= '1';
--
----
---- Disable Common address/data bus.
----
--	PB_IOR_N <= '1';
--	PB_IOW_N <= '1';
--	PB_A <= (others => '1');
--
----
---- Disable DeMux3 board's SD card interface.
----
--	SD_CLK <= '1';
--	SD_CMD <= '1';

--
-- CAF style external reset.
--
	RESET_TRIG_N <= '1';
	
	ethernet_cs_n <= '1';

end architecture struct;

