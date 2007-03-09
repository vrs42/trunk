library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee .std_logic_unsigned.all;
--
-- Version 0.05 : 5 October 2003
-- HIGH SPEED PERFORATED TAPE READER--TYPE PR8-E
-- 
-- RPE      6010  Set Interrupt Enable for Reader      1.2
--                and Punch
-- RSF      6011  Skip if Reader Flag = 1              1.2
-- RRB      6012  Read Reader Buffer and Clear Flag    1.2
-- RCF      6014  Clear Flag and Buffer and            1.2
--                Fetch Character
-- RCC      6016  Read Reader Buffer, Clear Flag and
--                Buffer, and Fetch Character
-- PCE      6020  Clear interrupt Enable for Reader    1.2
--                and Punch
--
entity PDP8rdr is
  port (
      clk         : in  std_logic;
      reset       : in  std_logic;

      -- IO interface
      
      IOstart     : in  std_logic;
      IOwdata     : in  std_logic_vector(0 to 11);
      IOaddr      : in  std_logic_vector(0 to 5);
      IOiop       : in  std_logic_vector(0 to 2);
      IOcaf       : in  std_logic;
      
      IOinterrupt : out std_logic;
      IOrdata     : out std_logic_vector(0 to 11);
      IOdevstatus : out std_logic_vector(0 to 1);
      IOdone      : out std_logic;
      IOskip      : out std_logic;

      -- External data source
      
      Pbuffer     : in  std_logic_vector(7 downto 0);
      Pstrobe     : in  std_logic;
      Pbusy       : out std_logic
    );
end PDP8rdr;


architecture rtl  of PDP8rdr  is

   signal rdrflag     : std_logic;
   signal rdrbuffer   : std_logic_vector (0 to 11);
   signal rdrstart    : std_logic;
   signal rdrclear    : std_logic;
   signal rdr_ienable : std_logic;
   
   signal io_done     : std_logic;

   signal rbuff       : std_logic_vector (0 to 2);
   signal rstate      : std_logic_vector (0 to 1);
   
begin  -- rtl

   Pbusy <= not rdrstart;
      
   Read : process (clk, reset)
   begin
      if reset = '0' then
         rstate <= "00";
         rbuff <= "000";
	 
      elsif clk'event and clk = '1' then

         rbuff <= rbuff (1 to 2) & (not Pstrobe);
	 
	      if (rdrclear = '1') or (IOcaf = '0') then
	         rdrflag <= '0';
	      end if;   
	 
         case rstate is	 
	      when "00" =>
	         if rdrstart = '1' then
	            rstate <= "01";
	         end if;
	    
         when "01" =>
            if rbuff = "111" then
	            rdrbuffer <= "0000" & Pbuffer (7 downto 0);
               rstate <= "10";
	         end if;
	    
         when "10" =>
	         if rbuff = "000" then
     	         rdrflag <= '1';
               rstate <= "00";
	         end if;
	    
	      when others =>
	         rstate <= "00";
	      end case;
      end if;
   end process Read;

  R_IO : process (clk, io_done, rdrflag, rdr_ienable, reset)
  begin
     if io_done = '1' then
        IOdone <= '0';
     else
--        IOdone <= 'Z';
        IOdone <= '1';
     end if;

     if (rdrflag and rdr_ienable) = '1' then
        IOinterrupt <= '0';
     else
--        IOinterrupt <= 'Z';
        IOinterrupt <= '1';
     end if;

     if reset = '0' then
        io_done <= '0';
        rdr_ienable <= '0';
        rdrstart <= '0';
	
     elsif clk'event and (clk = '1') then

        if rstate = "10" then
            rdrstart <= '0';
        end if;   

	     rdrclear <= '0';

	     if (IOaddr = o"01") or (IOaddr = o"02") then
           if (IOstart = '0') and (io_done = '0') then

	           IOdevstatus <= rdr_ienable & rdrflag; 
	      
      	     if (IOaddr = o"02") and (IOiop = o"0") then
                 rdr_ienable <= '1';
                 IOrdata <= IOwdata or rdrbuffer;
	              IOskip <= '0';
	           elsif (IOaddr = o"01") then 
	   
                 case IOiop is
	              when o"0" => -- RPE set reader/punch interrupt enable
	                 rdr_ienable <= '1';
                    IOrdata <= IOwdata or rdrbuffer;
	                 IOskip <= '0';

	              when o"1" => -- RSF skip on reader flag
	                 IOskip <= rdrflag;
                    IOrdata <= IOwdata;
	   
	              when o"2" => -- RRB read reader buffer
		              rdrclear <= '1';
                    IOrdata <= IOwdata or rdrbuffer;
	                 IOskip <= '0';
	      
	              when o"4" => -- RFC reader fetch character
		              rdrclear <= '1';
		              rdrstart <= '1';
                    IOrdata <= IOwdata;
	                 IOskip <= '0';
	   
	              when o"6" => --
		              rdrclear <= '1';
	                 rdrstart <= '1';
                    IOrdata <= IOwdata or rdrbuffer;
	                 IOskip <= '0';
	      
	              when o"7" => -- internal status
                    IOrdata <= rdrstart & rdrflag & rstate & Pbuffer (7 downto 0);
	                 IOskip <= '0';

	              when others =>
                    IOrdata <= IOwdata;
	                 IOskip <= '0';
	              end case;
              end if;
	   
	           io_done <= '1';
	        else
	           io_done <= '0';
	        end if;
        else
--         IOrdata <= (others => 'Z');
--         IOskip <= 'Z';
--         IOdevstatus <= "ZZ";
           IOrdata <= (others => '1');
	        IOskip <= '1';
	        IOdevstatus <= "11";

        end if;
     end if;	
  end process R_IO;
  
end rtl ;



