library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee .std_logic_unsigned.all;
--
--TELETYPE KEYBOARD/READER
--
--                                            Time (usec.)
--KCF      6030  Clear Keyboard/Reader Flag,          1.2
--               do not start Reader
--KSF      6031  Skip if Keyboard/Reader Flag = 1     1.2
--KCC      6032  Clear AC and Keyboard/Reader         1.2
--               Flag, set Reader run
--KRS      6034  Read Keyboard/Reader Buffer Static   1.2
--KIE      6035  AC 11 to Keyboard/Reader Interrupt   1.2
--               Enable F.F.
--KRB      6036  Clear AC, Read Keyboard Buffer       1.2
--               Clear Keyboard Flags 
--
--TELETYPE TELEPRINTER/PUNCH
--
--SPF      6040  Set Teleprinter/Punch Flag           1.2
--TSF      6041  Skip if Teleprinter/Punch Flag = 1   1.2
--TCF      6042  Clear Teleprinter/Punch Flag         1.2
--TPC      6044  Load Teleprinter/Punch Buffer        1.2
--               Select and Print
--SPI      6045  Skip if Teletype Interrupt           1.2
--TLS      6046  Load Teleprinter/Punch Buffer,       1.2
--               Select and Print and Clear
--               Teleprinter/Punch Flag
--

-- Version 0.05 : 5 October 2003
-- Version 0.06 : 23 February 2007

entity PDP8tty is
  generic (
     KBaddr : std_logic_vector(0 to 5);
     SCRaddr : std_logic_vector(0 to 5);
     BAUDrate0 : integer := 9600;
     BAUDrate1 : integer := 2400;
     BAUDrate2 : integer := 300;
     BAUDrate3 : integer := 110;
     CLKFREQ : integer
  );
  
  port (
      clk         : in std_logic;
      reset       : in std_logic;

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
      IOskip      : out std_logic;

      -- External data source
      
      Config      : in  std_logic_vector (1 downto 0);
      
      RXD         : in  std_logic;
      TXD         : out std_logic;
		RTS         : out std_logic
    );
end PDP8tty;


architecture rtl  of PDP8tty  is

   constant BAUD0 : integer := (CLKFREQ/BAUDrate0)/2;
   constant BAUD1 : integer := (CLKFREQ/BAUDrate1)/2;
   constant BAUD2 : integer := (CLKFREQ/BAUDrate2)/2;
   constant BAUD3 : integer := (CLKFREQ/BAUDrate3)/2;

   signal BAUD : integer;
   
   signal ttoflag  : std_logic;
   signal ttodone  : std_logic;
   signal ttobusy  : std_logic;
   signal ttonew   : std_logic;
   signal ttobuff  : std_logic_vector (0 to 7);
   signal ttoshift : std_logic_vector (0 to 10);
   signal ttocount : std_logic_vector(0 to 18);
   signal ttoclr   : std_logic;
   
   signal ttiflag  : std_logic;
   signal ttirun   : std_logic;
   signal ttidone  : std_logic;
   signal ttistarting : std_logic;
   signal ttishift : std_logic_vector (0 to 8);
   signal ttibuff  : std_logic_vector (0 to 7);
   signal tticount : std_logic_vector(0 to 18);

   signal tty_ienable : std_logic;   
   signal io_done : std_logic;

begin  -- rtl

   baudset : process (config)
   begin
      case Config is
      when "00" => 
         BAUD <= BAUD0;
      when "01" => 
         BAUD <= BAUD1;
      when "10" => 
         BAUD <= BAUD2;
      when others => 
         BAUD <= BAUD3;
      end case;
   end process baudset;
   
   tti : process (clk, reset)
   begin
      if reset = '0' then
	      ttidone     <= '0';
	      ttistarting <= '1';
			ttibuff     <= (others => '0');
			ttishift    <= "100000000";
			tticount    <= (others => '0');

      elsif clk'event and (clk = '1') then

         ttidone <= '0';

	      if ttirun = '1' then
            if (ttistarting and RxD) = '1' then
	            tticount <= conv_std_logic_vector (BAUD, 19); -- half a bit
	         elsif tticount = (BAUD+BAUD) then
               tticount <= (others => '0');
	            if ttistarting = '1' then 	-- middle of start bit
	               ttistarting <= '0';
		            ttishift <= "100000000";
	            elsif ttishift(8) = '1' then 	-- middle of stop bit
	               ttistarting <= '1';
		            if RxD = '1' then
		               ttidone <= '1';
		               ttibuff <= ttishift(0 to 7);
		            else   			-- frame error ???
		            end if;
	            else				-- middle of next bit
	               ttishift <= RxD & ttishift(0 to 7);
	            end if;
	         else
               tticount <= tticount + 1;
	         end if;    
         end if;
      end if;
   end process tti;


   tto : process (clk, reset, IOcaf)
   begin
      if (reset = '0') or (IOcaf = '0') then
	      ttodone  <= '0';
	      ttobusy  <= '0';
	      ttoshift <= (others => '0');
	      TxD      <= '1';
-- Fix TLS after CAF bug 2/26/2007 by vrs
--        ttocount <= (others => '0');
          ttocount <= conv_std_logic_vector(BAUD+BAUD, 19);
-- End "Fix TLS after CAF bug"

      elsif clk'event and (clk = '1') then

         if (ttoclr = '1') then
	         ttodone <= '0';
	      end if;   

	      if ttocount = (BAUD+BAUD) then
	         if ttonew = '1' then
	            ttoshift <= "11" & ttobuff & '0';
	            ttodone <= '0';
	            ttobusy <= '1';
	         elsif ttoshift = 0 then
	            ttobusy <= '0';
	            if ttobusy = '1' then
	               ttodone <= '1';
	            end if;	  
	         else   
	            TxD <= ttoshift (10);
	            ttocount <= (others => '0');
  	            ttoshift <= '0' & ttoshift (0 to 9);
            end if;
	      else
 	         ttocount <= ttocount + 1;
         end if;
      end if;
   end process tto;

   iobus : process (clk, reset, IOcaf)
   begin
     if (reset = '0') or (IOcaf = '0') then
--        IOdone <= 'Z';
--        IOinterrupt <= 'Z';
        IOdone <= '1';
        IOinterrupt <= '1';
      	
     elsif clk'event and clk = '1' then
     
        if io_done = '1' then
           IOdone <= '0';
        else
--           IOdone <= 'Z';
           IOdone <= '1';
        end if;
	
        if (tty_ienable and (ttoflag or ttiflag)) = '1' then
           IOinterrupt <= '0';
        else
--           IOinterrupt <= 'Z';
           IOinterrupt <= '1';
        end if;
	
     end if;
  end process iobus;


  tty_IO : process (clk, reset, IOcaf)
  begin

     if (reset = '0') or (IOcaf = '0') then
	     io_done <= '0';
	
	     ttonew <= '0';
	     ttoflag <= '0';
	     ttoclr <= '1';
	
	     ttiflag <= '0';
--	     ttirun <= '0';
	     ttirun <= '1';
	
        tty_ienable <= reset;

     elsif clk'event and (clk = '1') then

        ttoclr <= '0';
	
        if ttodone = '0' then
	        ttonew <= '0';
	     else
	        ttoflag <= '1';
        end if;   
		
	     if ttidone = '1' then
	        ttiflag <= '1';
	        ttirun <= '0'; 
	     end if;   
	
        if (IOstart = '0') and (io_done = '0') then
  	        if IOaddr = SCRaddr then  -- TTY printer or screen
   	        IOdevstatus <= ttoflag & ttodone;

              case IOiop is
	           when o"0" => -- TFL set printer flag
	              ttoflag <= '1';
                 IOrdata <= IOwdata;
	              IOskip <= '0';
		 
	           when o"1" => -- TSF skip on printer flag
	              IOskip <= ttoflag;
                 IOrdata <= IOwdata;

	           when o"2" => -- TCF clear printer flag
	              ttoflag <= '0';
		           ttoclr <= '1';
                 IOrdata <= IOwdata;
	              IOskip <= '0';
		 
	           when o"4" => -- TPC load print buffer and print
	              ttobuff <= IOwdata (4 to 11);
	              ttonew <= '1';
                 IOrdata <= IOwdata;
	              IOskip <= '0';
		 
	           when o"5" => -- TSK skip on printer or keyboard interrupt
	              IOskip <= tty_ienable and (ttoflag or ttiflag);
                 IOrdata <= IOwdata;
	      
	           when o"6" => -- TLS load print sequence
	              ttobuff <= IOwdata (4 to 11);
	              ttoflag <= '0';
	              ttonew <= '1';	      
                 IOrdata <= IOwdata;
	              IOskip <= '0';
	
	           when o"7" => -- debug
                 IOrdata <= ttonew & ttoshift;
	              IOskip <= '0';
		 
	           when others =>
                 IOrdata <= IOwdata;
	              IOskip <= '0';
	           end case;

	           io_done <= '1';
	      
  	        elsif IOaddr = KBaddr then  -- Teletype keyboard
			     -- John Kent 23rd Feb 2007
   	        IOdevstatus <= ttiflag & ttidone;
	
              case IOiop is
	           when o"0" => -- KCF clear keyboard flag
	              ttiflag <= '0';
		           ttirun <= '1';
	              IOskip <= '0';
                 IOrdata <= IOwdata;
		 
	           when o"1" => -- KSF skip on keyboard flag
	              IOskip <= ttiflag;
                 IOrdata <= IOwdata;
		 
	           when o"2" => -- KCC clear keyboard flag
	              ttiflag <= '0';
		           ttirun <= '1';
	              IOskip <= '0';
                 IOrdata <= (others => '0');
		 
	           when o"4" => -- KRS read keyboard buffer static
                 IOrdata <= IOwdata or ("0000" & ttibuff);
	              IOskip <= ttiflag;
	      
	           when o"5" => -- KIE Set/clear interrupt enable
	              tty_ienable <= IOwdata (11);
	              IOskip <= '0';
                 IOrdata <= IOwdata;
		 
	           when o"6" => -- KRB read keyboard buffer dynamic
	              ttiflag <= '0';
		           ttirun <= '1';
	              IOskip <= '0';
                 IOrdata <= "0000" & ttibuff;

	           when o"7" => -- debug
                 IOrdata <= ttiflag & ttidone & ttistarting & ttirun & ttishift (1 to 8);
	              IOskip <= '0';

	           when others =>
                 IOrdata <= IOwdata;
	              IOskip <= '0';
	           end case;

	           io_done <= '1';
	        else
--	           IOrdata <= (others => 'Z');
--	           IOskip <= 'Z';
--	           IOdevstatus <= "ZZ";
	           IOrdata <= (others => '1');
	           IOskip <= '1';
	           IOdevstatus <= "11";

	        end if;
        else
	        io_done <= '0';
	     end if;
     end if;
	  RTS <= not ttirun;
  end process tty_IO;

end rtl ;



