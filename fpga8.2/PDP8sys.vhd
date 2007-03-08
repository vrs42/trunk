library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use PDP8.all;

entity PDP8sys is
   Generic (
      SYSCLKFREQ : integer;
      DOTCLKFREQ : integer
   );

   Port (
      sysclk     : in std_logic;
      
      reset      : in std_logic;

      VGAdotclk  : in  std_logic;
      VGAhsync   : out std_logic;
      VGAvsync   : out std_logic;
      VGAred     : out std_logic;
      VGAblue    : out std_logic;
      VGAgreen   : out std_logic;

      PS2KBdata  : in  std_logic;
      PS2KBclk   : in  std_logic;

      CONFIG     : in  std_logic_vector (1 to 8);

      LEDS       : out std_logic_vector (0 to 15);
      
      SRAMoe     : out std_logic;
      SRAMwe     : out std_logic;
      SRAMaddr   : out std_logic_vector (0 to 14);
      SRAMdata   : inout std_logic_vector (0 to 15);

      CONSOLErxd : in std_logic;
      CONSOLEtxd : out std_logic;
      CONSOLErts : out std_logic;

      TTY1rxd    : in std_logic;
      TTY1txd    : out std_logic;
      TTY1rts    : out std_logic;

      Pbuffer : in std_logic_vector (7 downto 0);
      Pbusy : out std_logic;
      Pstrobe : in std_logic
   );
end PDP8sys;

architecture struct of PDP8sys is

   -- The memory interface

   signal MEMrd : std_logic;
   signal MEMwr : std_logic;
   signal MEMdone : std_logic;
   signal MEMbusreq : std_logic := '1';
   signal MEMbusgrant : std_logic := '1';
   signal MEMaddr : std_logic_vector (0 to 14);
   signal MEMwdata : std_logic_vector (0 to 11);
   signal MEMrdata : std_logic_vector (0 to 11);

   signal MEMromselect : std_logic_vector (2 downto 0) := "001";

   -- The IO interface

   signal IOaddr : std_logic_vector (0 to 5);
   signal IOiop : std_logic_vector (0 to 2);
   signal IOwdata : std_logic_vector (0 to 11);
   signal IOstart : std_logic;
   signal IOcaf : std_logic;
      
	-- Peripheral outputs, CPU inputs, active low
   signal IOinterrupt : std_logic;
   signal IOdevstatus : std_logic_vector (0 to 1);
   signal IOrdata     : std_logic_vector (0 to 11);
   signal IOdone      : std_logic;
   signal IOskip      : std_logic;

	-- Console Keyboard / Printer, active low
   signal IOinterrupt_console : std_logic;
   signal IOdevstatus_console : std_logic_vector (0 to 1);
   signal IOrdata_console     : std_logic_vector (0 to 11);
   signal IOdone_console      : std_logic;
   signal IOskip_console      : std_logic;

	-- Secondary Perial Port, active low
   signal IOinterrupt_tty1 : std_logic;
   signal IOdevstatus_tty1 : std_logic_vector (0 to 1);
   signal IOrdata_tty1     : std_logic_vector (0 to 11);
   signal IOdone_tty1      : std_logic;
   signal IOskip_tty1      : std_logic;

	-- Realtime Clock, active low
   signal IOinterrupt_dk8 : std_logic;
   signal IOdevstatus_dk8 : std_logic_vector (0 to 1);
   signal IOrdata_dk8     : std_logic_vector (0 to 11);
   signal IOdone_dk8      : std_logic;
   signal IOskip_dk8      : std_logic;

	-- Paper tape Reader, active low
   signal IOinterrupt_rdr : std_logic;
   signal IOdevstatus_rdr : std_logic_vector (0 to 1);
   signal IOrdata_rdr     : std_logic_vector (0 to 11);
   signal IOdone_rdr      : std_logic;
   signal IOskip_rdr      : std_logic;

   -- The panel interface

   signal CPUcontrol : std_logic_vector (CPUcontrolLength downto 0);
   signal CPUstate : std_logic_vector (CPUstateLength downto 0);
   
component PDP8panel
  generic (
     CLKFREQ : integer
  );
   Port (
      clk : in std_logic;
      reset : in std_logic;

      CPUcontrol : out std_logic_vector (CPUCOntrolLength downto 0);
      CPUstate : in std_logic_vector (CPUstateLength downto 0);

      VGAhsync : out std_logic;
      VGAvsync : out std_logic;
      VGAred : out std_logic;
      VGAblue : out std_logic;
      VGAgreen : out std_logic;

      PS2KBdata : in std_logic;
      PS2KBclk : in std_logic;

      CONFIG : in std_logic_vector (1 to 8);
      
      LEDS : out std_logic_vector (0 to 15)
   );
end component PDP8Panel;

component PDP8dk8 is   -- clock
  generic (
     IFREQ : integer := 50;
     CLKFREQ : integer
  );
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- IO interface
      IOinterrupt : out std_logic;
      
      IOstart : in std_logic;
      IOwdata : in std_logic_vector(0 to 11);
      IOaddr : in std_logic_vector (0 to 5);
      IOiop : in std_logic_vector (0 to 2);
      IOcaf : in std_logic;

      IOrdata : out std_logic_vector(0 to 11);
      IOdevstatus : out std_logic_vector (0 to 1);
      IOdone : out std_logic;
      IOskip : out std_logic
    );
end component PDP8dk8;

component PDP8rdr
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- IO interface
      IOstart : in std_logic;
      IOwdata : std_logic_vector (0 to 11);
      IOaddr : in std_logic_vector (0 to 5);
      IOiop : in std_logic_vector (0 to 2);

      IOinterrupt : out std_logic;
      IOdevstatus : out std_logic_vector (0 to 1);
      IOrdata : out std_logic_vector (0 to 11);
      IOdone : out std_logic;
      IOskip : out std_logic;
      IOcaf : in std_logic;

      -- External data source
      Pbuffer : in std_logic_vector (7 downto 0);
      Pstrobe : in std_logic;
      Pbusy : out std_logic
    );
end component PDP8rdr;

component PDP8tty
  generic (
     KBaddr : std_logic_vector (0 to 5) := o"03";
     SCRaddr : std_logic_vector (0 to 5) := o"04";
     BAUDrate : integer;
     CLKFREQ : integer
  );
  
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- IO interface
      IOstart : in std_logic;
      IOwdata : std_logic_vector (0 to 11);
      IOaddr : in std_logic_vector (0 to 5);
      IOiop : in std_logic_vector (0 to 2);
      IOcaf : in std_logic;
      
      IOinterrupt : out std_logic;
      IOdevstatus : out std_logic_vector (0 to 1);
      IOrdata : out std_logic_vector (0 to 11);
      IOdone : out std_logic;
      IOskip : out std_logic;

      -- External data source
      
      Config : in std_logic_vector ( 1 downto 0);
      
      RxD : in std_logic;
      TxD : out std_logic
    );
end component PDP8tty;


begin

cpu : PDP8cpu
   port map (
      clk => sysclk,
      reset => reset,

      -- Memory Interface
      MEMrd => MEMrd,
      MEMwr => MEMwr,
      MEMdone => MEMdone,
      MEMbusreq => MEMbusreq,
      MEMbusgrant => MEMbusgrant,
      MEMaddr => MEMaddr,
      MEMwdata => MEMwdata,
      MEMrdata => MEMrdata,

      -- IO interface
      IOstart => IOstart,
      IOcaf => IOcaf,
      IOwdata => IOwdata,
      IOaddr => IOaddr,
      IOiop => IOiop,

      IOinterrupt => IOinterrupt,
      IOdevstatus => IOdevstatus,
      IOrdata => IOrdata,
      IOdone => IOdone,
      IOskip => IOskip,

      -- Panel interface
      CPUcontrol => CPUcontrol,
      CPUstate => CPUstate
   );


mem : PDP8mem
   port map (
      clk => sysclk,
      reset => reset,

      MEMrd => MEMrd,
      MEMwr => MEMwr,
      MEMdone => MEMdone,
      MEMaddr => MEMaddr,
      MEMwdata => MEMwdata,
      MEMrdata => MEMrdata,
   );


panel : PDP8panel
   Generic map (
      CLKFREQ => DOTCLKFREQ
   )   
      
   Port map (
      clk => VGAdotclk,
      reset => reset,

      CPUcontrol => CPUcontrol,
      CPUstate => CPUstate,

      VGAhsync => VGAHsync,
      VGAvsync => VGAVsync,
      VGAred => VGAred,
      VGAblue => VGAblue,
      VGAgreen => VGAgreen,

      PS2KBdata => PS2KBdata,
      PS2KBclk => PS2KBclk,

      CONFIG => CONFIG
   );


xram : sram
   port map (
      clk => sysclk,
      reset => reset,

      -- Memory Interface
      MEMrd => MEMrd,
      MEMwr => MEMwr,
      MEMdone => MEMdone,
      MEMaddr => MEMaddr,
      MEMwdata => MEMwdata,
      MEMrdata => MEMrdata,

      -- External interface
      config => config(5),
      speed => config(6 to 8),
      
      SRAMoe => SRAMoe,
      SRAMwe => SRAMwe,
      SRAMaddr => SRAMaddr,
      SRAMdata => SRAMdata
    );
   
rtclock : PDP8dk8
   generic map (
      IFREQ => 50,
      CLKFREQ => SYSCLKFREQ
   )
   
   port map (
      clk => sysclk,
      reset => reset,

      -- IO interface
      IOstart => IOstart,
      IOwdata => IOwdata,
      IOaddr => IOaddr,
      IOiop => IOiop,
      IOcaf => IOcaf,
      
      IOinterrupt => IOinterrupt_dk8,
      IOrdata => IOrdata_dk8,
      IOdone => IOdone_dk8,
      IOskip => IOskip_dk8,
      IOdevstatus => IOdevstatus_dk8
);


ptr : PDP8rdr
   port map (
      clk => sysclk,
      reset => reset,

      -- IO interface
      IOstart => IOstart,
      IOwdata => IOwdata,
      IOaddr => IOaddr,
      IOiop => IOiop,
      IOcaf => IOcaf,
      
      IOinterrupt => IOinterrupt_rdr,
      IOrdata => IOrdata_rdr,
      IOdone => IOdone_rdr,
      IOskip => IOskip_rdr,
      IOdevstatus => IOdevstatus_rdr,

      -- External interface
      Pbuffer => Pbuffer,
      Pbusy => Pbusy,
      Pstrobe => Pstrobe
    );


console : entity PDP8tty
   generic map (
      KBaddr => o"03",
      SCRaddr => o"04",
      BAUDrate0 => 9600,
      BAUDrate1 => 2400,
      BAUDrate2 => 1200,
      BAUDrate3 => 110,
      CLKFREQ => SYSCLKFREQ
   )
   
   port map (
      clk => sysclk,
      reset => reset,

      -- IO interface
      IOstart => IOstart,

      IOwdata => IOwdata,
      IOaddr => IOaddr,
      IOiop => IOiop,
      IOcaf => IOcaf,
      
      IOinterrupt => IOinterrupt_console,
      IOrdata => IOrdata_console,
      IOdone => IOdone_console,
      IOskip => IOskip_console,
      IOdevstatus => IOdevstatus_console,

      -- External interface
      
      Config => CONFIG (3 to 4),
      TxD => CONSOLEtxd,
      RxD => CONSOLErxd,
		RTS => CONSOLErts
    );

tty1 : entity PDP8tty
   generic map (
      KBaddr => o"40",		-- Normal 2nd TTY address
      SCRaddr => o"41",
      BAUDrate0 => 9600,
      BAUDrate1 => 2400,
      BAUDrate2 => 1200,
      BAUDrate3 => 110,
      CLKFREQ => SYSCLKFREQ
   )
   
   port map (
      clk => sysclk,
      reset => reset,

      -- IO interface
      IOstart => IOstart,

      IOwdata => IOwdata,
      IOaddr => IOaddr,
      IOiop => IOiop,
      IOcaf => IOcaf,
      
      IOinterrupt => IOinterrupt_tty1,
      IOrdata => IOrdata_tty1,
      IOdone => IOdone_tty1,
      IOskip => IOskip_tty1,
      IOdevstatus => IOdevstatus_tty1,

      -- External interface
      
      Config => "00",
      TxD => TTY1txd,
      RxD => TTY1rxd,
		RTS => TTY1rts
    );

--
-- Active low signals
--
PDP8connect : process( IOinterrupt_console, IOinterrupt_tty1, IOinterrupt_dk8, IOinterrupt_rdr,
                     IOdevstatus_console, IOdevstatus_tty1, IOdevstatus_dk8, IOdevstatus_rdr,
                     IOrdata_console    , IOrdata_tty1    , IOrdata_dk8,	  IOrdata_rdr,
                     IOdone_console     , IOdone_tty1     , IOdone_dk8,		  IOdone_rdr,
                     IOskip_console     , IOskip_tty1     , IOskip_dk8,      IOskip_rdr ) is
begin
   IOinterrupt <= IOinterrupt_console and IOinterrupt_tty1 and IOinterrupt_dk8 and IOinterrupt_rdr;
   IOdevstatus	<=	IOdevstatus_console and IOdevstatus_tty1 and IOdevstatus_dk8 and IOdevstatus_rdr;
   IOrdata     <=	IOrdata_console     and IOrdata_tty1     and IOrdata_dk8     and IOrdata_rdr;
   IOdone      <= IOdone_console      and IOdone_tty1      and IOdone_dk8      and IOdone_rdr;
   IOskip      <= IOskip_console      and IOskip_tty1      and IOskip_dk8      and IOskip_rdr;
end process;
    
end architecture struct;
