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

      VGAdotclk  : in std_logic;
      VGAhsync   : out std_logic;
      VGAvsync   : out std_logic;
      VGAred     : out std_logic;
      VGAblue    : out std_logic;
      VGAgreen   : out std_logic;

      PS2KBdata  : in std_logic;
      PS2KBclk   : in std_logic;

      CONFIG     : in std_logic_vector (1 to 8);

      CONSOLErxd : in std_logic;
      CONSOLEtxd : out std_logic;
      CONSOLErts : out std_logic;

--      TTY1rxd    : in std_logic;
--      TTY1txd    : out std_logic;
--      TTY1rts    : out std_logic;

--
-- DeMux3 board's lights and switches interface.
--
      S3_SCLK     : out std_logic;
      S3_SSER_N   : in  std_logic; -- Switches are all active low!
      S3_SCL_N    : out std_logic;
      
      S3_LCLK     : out std_logic;
      S3_LSER     : out std_logic;
      S3_LCL_N    : out std_logic;
   
--
-- CAF style external reset.
--
      RESET_TRIG_N : out std_logic;
   
      Pbuffer     : in  std_logic_vector (7 downto 0);
      Pstrobe     : in  std_logic;
      Pbusy       : out std_logic
   );
end PDP8sys;

architecture struct of PDP8sys is

   -- The memory interface

   signal MEMrd       : std_logic;
   signal MEMwr       : std_logic;
   signal MEMdone     : std_logic;
   signal MEMbusreq   : std_logic := '1';
   signal MEMbusgrant : std_logic;
   signal MEMaddr     : std_logic_vector (0 to 14);
   signal MEMwdata    : std_logic_vector (0 to 11);
   signal MEMrdata    : std_logic_vector (0 to 11);

   -- The IO interface
	-- CPU Outputs, Peripheral Inputs
   signal IOaddr      : std_logic_vector (0 to 5);
   signal IOiop       : std_logic_vector (0 to 2);
   signal IOwdata     : std_logic_vector (0 to 11);
   signal IOstart     : std_logic;
   signal IOcaf       : std_logic;
   
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
   signal CPUcontrol  : std_logic_vector (CPUcontrolLength downto 0);
   signal CPUstate    : std_logic_vector (CPUstateLength downto 0);


component PDP8cpu
   Port (
      clk         : in std_logic;
      reset       : in std_logic;

      -- Memory Interface

      MEMrd       : out std_logic;
      MEMwr       : out std_logic;
      MEMdone     : in  std_logic;
      MEMbusreq   : in  std_logic;
      MEMbusgrant : out std_logic;
      MEMaddr     : out std_logic_vector (0 to 14);
      MEMwdata    : out std_logic_vector (0 to 11);
      MEMrdata    : in  std_logic_vector (0 to 11);

      -- IO interface
      IOstart     : out std_logic;
      IOcaf       : out std_logic;
      IOwdata     : out std_logic_vector (0 to 11);
      IOaddr      : out std_logic_vector (0 to 5);
      IOiop       : out std_logic_vector (0 to 2);

      IOinterrupt : in  std_logic;
      IOdevstatus : in  std_logic_vector (0 to 1);
      IOrdata     : in  std_logic_vector (0 to 11);
      IOdone      : in  std_logic;
      IOskip      : in  std_logic;

      -- Panel interface

      CPUcontrol  : in  std_logic_vector (CPUcontrolLength downto 0);
      CPUstate    : out std_logic_vector (CPUstateLength downto 0)
   );
end component PDP8cpu;


component PDP8mem
    Port (
       clk      : in std_logic;
       reset    : in std_logic;

       MEMrd    : in  std_logic;
       MEMwr    : in  std_logic;
       MEMdone  : out std_logic;
       MEMaddr  : in  std_logic_vector (0 to 14);
       MEMwdata : in  std_logic_vector (0 to 11);
       MEMrdata : out std_logic_vector (0 to 11)
    );
end component PDP8mem;

component PDP8panel
  generic (
     CLKFREQ : integer
  );
   Port (
      clk        : in  std_logic;
      reset      : in  std_logic;

--      CPUcontrol : out std_logic_vector (CPUCOntrolLength downto 0);
      CPUstate   : in  std_logic_vector (CPUstateLength downto 0);

      VGAhsync   : out std_logic;
      VGAvsync   : out std_logic;
      VGAred     : out std_logic;
      VGAblue    : out std_logic;
      VGAgreen   : out std_logic;

      PS2KBdata  : in  std_logic;
      PS2KBclk   : in  std_logic;

      CONFIG     : in std_logic_vector (1 to 8)
   );
end component PDP8Panel;

component PDP8dk8 is   -- clock
  generic (
     IFREQ : integer := 50;
     CLKFREQ : integer
  );
  port (
      clk         : in  std_logic;
      reset       : in  std_logic;

      -- IO interface
      IOstart     : in  std_logic;
      IOwdata     : in  std_logic_vector(0 to 11);
      IOaddr      : in  std_logic_vector (0 to 5);
      IOiop       : in  std_logic_vector (0 to 2);
      IOcaf       : in  std_logic;

      IOinterrupt : out std_logic;      
      IOrdata     : out std_logic_vector(0 to 11);
      IOdevstatus : out std_logic_vector (0 to 1);
      IOdone      : out std_logic;
      IOskip      : out std_logic
    );
end component PDP8dk8;

component PDP8tty
  generic (
     KBaddr   : std_logic_vector (0 to 5) := o"03";
     SCRaddr  : std_logic_vector (0 to 5) := o"04";
     BAUDrate : integer;
     CLKFREQ  : integer
  );
  
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- IO interface
      IOstart     : in  std_logic;
      IOwdata     : in  std_logic_vector (0 to 11);
      IOaddr      : in  std_logic_vector (0 to 5);
      IOiop       : in  std_logic_vector (0 to 2);
      IOcaf       : in  std_logic;
      
      IOinterrupt : out std_logic;
      IOdevstatus : out std_logic_vector (0 to 1);
      IOrdata     : out std_logic_vector (0 to 11);
      IOdone      : out std_logic;
      IOskip      : out std_logic;

      -- External data source
      
      Config      : in std_logic_vector ( 1 downto 0);
      
      CtS         : out std_logic;
      RxD         : in std_logic;
      TxD         : out std_logic
    );
end component PDP8tty;


component PDP8rdr
  port (
      clk         : in  std_logic;
      reset       : in  std_logic;

      -- IO interface
      IOstart     : in  std_logic;
      IOwdata     : in  std_logic_vector (0 to 11);
      IOaddr      : in  std_logic_vector (0 to 5);
      IOiop       : in  std_logic_vector (0 to 2);
      IOcaf       : in  std_logic;

      IOinterrupt : out std_logic;
      IOdevstatus : out std_logic_vector (0 to 1);
      IOrdata     : out std_logic_vector (0 to 11);
      IOdone      : out std_logic;
      IOskip      : out std_logic;

      -- External data source
      Pbuffer     : in  std_logic_vector (7 downto 0);
      Pstrobe     : in  std_logic;
      Pbusy       : out std_logic
    );
end component PDP8rdr;

component lightsMux 
  port (
      clk   : in std_logic;
      reset : in std_logic;

      -- Lights Interface

      LSER  : out std_logic; -- Lights Data
      LCLK  : out std_logic; -- Lights Clock
      LCL_N : out std_logic; -- Lights Reset

      -- Registers to display

      PC    : in  std_logic_vector(11 downto 0);
      MA    : in  std_logic_vector(11 downto 0);
      MB    : in  std_logic_vector(11 downto 0);
      AC    : in  std_logic_vector(11 downto 0);
      MQ    : in  std_logic_vector(11 downto 0);
      DFLD  : in  std_logic_vector( 2 downto 0);
      IFLD  : in  std_logic_vector( 2 downto 0);
      SC    : in  std_logic_vector( 4 downto 0);
      LINK  : in  std_logic;
      IR    : in  std_logic_vector( 2 downto 0);
      STATE : in  std_logic_vector( 3 downto 0);
      ION   : in  std_logic;
      RUN   : in  std_logic
   );
end component lightsMux;

component switchesDeMux is
   generic (
      SYSCLKFREQ : integer;
      SSCKFREQ   : integer := 10000
   );
   port (
      clk   : in std_logic;
      reset : in std_logic;

      -- Switches Interface

      SSER_N : in  std_logic; -- Switches Data
      SSCK   : out std_logic; -- Switches Clock
      SCL_N  : out  std_logic; -- Reset

      -- Registers to read from switches.

      SDF   : out std_logic_vector( 2 downto 0);
      SIF   : out std_logic_vector( 2 downto 0);
      SR    : out std_logic_vector(11 downto 0);
      PC    : out std_logic_vector(11 downto 0);
      START : out std_logic;
      LADDR : out std_logic;
      DEP   : out std_logic;
      EXAM  : out std_logic;
      CONT  : out std_logic;
      STOP  : out std_logic;
      SS    : out std_logic;
--    SI    : out std_logic; -- Implemented with STOP.
      CONF  : out std_logic_vector(0 to 5)
   );
end component switchesDeMux;


begin

cpu : PDP8cpu
   port map (
      clk         => sysclk,
      reset       => reset,

      -- Memory Interface
      MEMrd       => MEMrd,
      MEMwr       => MEMwr,
      MEMdone     => MEMdone,
      MEMbusreq   => MEMbusreq,
      MEMbusgrant => MEMbusgrant,
      MEMaddr     => MEMaddr,
      MEMwdata    => MEMwdata,
      MEMrdata    => MEMrdata,

      -- IO interface
		-- CPU Outputs
      IOstart     => IOstart,
      IOcaf       => IOcaf,      
      IOwdata     => IOwdata,
      IOaddr      => IOaddr,
      IOiop       => IOiop,

      -- IO interface
		-- CPU Inputs
      IOinterrupt => IOinterrupt,
      IOdevstatus => IOdevstatus,
      IOrdata     => IOrdata,
      IOdone      => IOdone,
      IOskip      => IOskip,

      -- Panel interface
      CPUcontrol  => CPUcontrol,
      CPUstate    => CPUstate
   );


mem : PDP8mem
   port map (
      clk          => sysclk,
      reset        => reset,

      MEMrd        => MEMrd,
      MEMwr        => MEMwr,
      MEMdone      => MEMdone,
      MEMaddr      => MEMaddr,
      MEMwdata     => MEMwdata,
      MEMrdata     => MEMrdata
   );

panel : PDP8panel
   Generic map (
      CLKFREQ => DOTCLKFREQ
   )   
      
   Port map (
      clk        => VGAdotclk,
      reset      => reset,

--      CPUcontrol => CPUcontrol,
      CPUstate   => CPUstate,

      VGAhsync   => VGAHsync,
      VGAvsync   => VGAVsync,
      VGAred     => VGAred,
      VGAblue    => VGAblue,
      VGAgreen   => VGAgreen,

      PS2KBdata  => PS2KBdata,
      PS2KBclk   => PS2KBclk,

      CONFIG     => CONFIG
   );
   
rtclock : PDP8dk8
   generic map (
      IFREQ => 50,
      CLKFREQ => SYSCLKFREQ
   )
   
   port map (
      clk         => sysclk,
      reset       => reset,

      -- IO interface
		-- Peripheral inputs
      IOstart     => IOstart,
      IOwdata     => IOwdata,
      IOaddr      => IOaddr,
      IOiop       => IOiop,
      IOcaf       => IOcaf,
      
      -- IO interface
		-- Peripheral outputs
      IOinterrupt => IOinterrupt_dk8,
      IOrdata     => IOrdata_dk8,
      IOdone      => IOdone_dk8,
      IOskip      => IOskip_dk8,
      IOdevstatus => IOdevstatus_dk8
);


console : entity PDP8tty
   generic map (
      KBaddr    => o"03",
      SCRaddr   => o"04",
      BAUDrate0 => 9600,
      BAUDrate1 => 2400,
      BAUDrate2 => 1200,
      BAUDrate3 => 110,
      CLKFREQ   => SYSCLKFREQ
   )
   
   port map (
      clk         => sysclk,
      reset       => reset,

      -- IO interface
		-- Peripheral inputs
      IOstart     => IOstart,
      IOwdata     => IOwdata,
      IOaddr      => IOaddr,
      IOiop       => IOiop,
      IOcaf       => IOcaf,
      
      -- IO interface
		-- Peripheral outputs
      IOinterrupt => IOinterrupt_console,
      IOrdata     => IOrdata_console,
      IOdone      => IOdone_console,
      IOskip      => IOskip_console,
      IOdevstatus => IOdevstatus_console,

      -- External interface
      
      Config      => CONFIG (3 to 4),
      TXD         => CONSOLEtxd,
      RXD         => CONSOLErxd,
      RTS         => CONSOLErts
    );

--tty1 : entity PDP8tty
--   generic map (
--      KBaddr    => o"40",		-- Normal 2nd TTY address
--      SCRaddr   => o"41",
--      BAUDrate0 => 9600,
--      BAUDrate1 => 2400,
--      BAUDrate2 => 1200,
--      BAUDrate3 => 110,
--      CLKFREQ   => SYSCLKFREQ
--   )
--   
--   port map (
--      clk         => sysclk,
--      reset       => reset,
--
--      -- IO interface
--		-- Peripheral inputs
--      IOstart     => IOstart,
--      IOwdata     => IOwdata,
--      IOaddr      => IOaddr,
--      IOiop       => IOiop,
--      IOcaf       => IOcaf,
--      
--      -- IO interface
--		-- Peripheral outputs
--      IOinterrupt => IOinterrupt_tty1,
--      IOrdata     => IOrdata_tty1,
--      IOdone      => IOdone_tty1,
--      IOskip      => IOskip_tty1,
--      IOdevstatus => IOdevstatus_tty1,
--
--      -- External interface
--      
--      Config      => "00",
--      TXD         => TTY1txd,
--      RXD         => TTY1rxd,
--      RTS         => TTY1rts
--    );
--

ptr : PDP8rdr
   port map (
      clk         => sysclk,
      reset       => reset,

      -- IO interface
      IOstart     => IOstart,
      IOwdata     => IOwdata,
      IOaddr      => IOaddr,
      IOiop       => IOiop,
      IOcaf       => IOcaf,
      
      IOinterrupt => IOinterrupt_rdr,
      IOrdata     => IOrdata_rdr,
      IOdone      => IOdone_rdr,
      IOskip      => IOskip_rdr,
      IOdevstatus => IOdevstatus_rdr,

      -- External interface
      Pbuffer     => Pbuffer,
      Pbusy       => Pbusy,
      Pstrobe     => Pstrobe
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

--
-- Drive DeMux3 board's lights and switches interface.
--
lights : lightsMux
   port map (
      clk   => sysclk,
      reset => reset,

      -- Lights Interface
      LSER  => S3_LSER,
      LCLK  => S3_LCLK,
      LCL_N => S3_LCL_N,

      -- Registers to display
      PC    => CPUstate(CPUpc   downto CPUpc-11),
      MA    => CPUstate(CPUma-3 downto CPUma-14),
      MB    => CPUstate(CPUmb   downto CPUmb-11),
      AC    => CPUstate(CPUac   downto CPUac-11),
      MQ    => CPUstate(CPUmq   downto CPUmq-11),
      DFLD  => CPUstate(CPUdf   downto CPUdf-2),
      IFLD  => CPUstate(CPUif   downto CPUif-2),
      SC    => CPUstate(CPUsc   downto CPUsc-4),
      LINK  => CPUstate(CPUlink),
      IR    => CPUstate(CPUir   downto CPUir-2),
      STATE => CPUstate(CPUetat downto CPUetat-3),
      ION   => CPUstate(CPUpie),
      RUN   => CPUstate(CPUrun)
   );

switches: switchesDeMux
  generic map (
      SYSCLKFREQ => 10000000
   )
  port map (
      clk   => sysclk, -- Must match lightsmux!
      reset => reset,

      -- Switches Interface

      SSER_N => S3_SSER_N,
      SSCK   => S3_SCLK,
      SCL_N  => S3_SCL_N,

      -- Registers to read from switches.

      SDF   => CPUcontrol(CPUaddr   downto CPUaddr-2),
      SIF   => CPUcontrol(CPUaddr-3 downto CPUaddr-5),
      PC    => CPUcontrol(CPUaddr-6 downto CPUaddr-17),
      SR    => CPUcontrol(CPUkeys downto CPUkeys-11),
      START => CPUcontrol(CPUstart),
      CONT  => CPUcontrol(CPUcontinue),
      STOP  => CPUcontrol(CPUhalt),
      SS    => CPUcontrol(CPUSstep),
      LADDR => CPUcontrol(CPUla),
      DEP   => CPUcontrol(CPUdep), -- Needs to trigger EXAM afterwards
      EXAM  => CPUcontrol(CPUexam)
--    SI    => CPUcontrol(CPUhalt), -- SI is implemented as a non-momentary "stop"
--      CONF  => CONFIG(1 to 6)
   );
   
   RESET_TRIG_N <= IOCaf;

end architecture struct;
