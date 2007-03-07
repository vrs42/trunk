library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee .std_logic_unsigned.all;


entity PDP8dk8 is
   generic (
      IFREQ : integer;   
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
end PDP8dk8;


architecture rtl  of PDP8dk8  is

   signal io_done : std_logic;

   signal clockflag : std_logic;
   signal clockenable : std_logic;

   signal clockcounter : std_logic_vector (20 downto 0);

   constant CLOCKCOUNT : integer := CLKFREQ/IFREQ;
   
begin  -- rtl

  C_IO : process (clk, io_done, clockflag, reset, clockenable)
  begin
     if io_done = '1' then
        IOdone <= '0';
     else
	IOdone <= 'Z';
     end if;

     if (clockflag = '1') and (clockenable = '1') then
        IOinterrupt <= '0';
     else
        IOinterrupt <= 'Z';
     end if;

     if reset = '0' then
        clockflag <= '0';
        clockenable <= '0';
	io_done <= '0';
	
     elsif clk'event and (clk = '1') then

        if IOcaf = '0' then
	   clockflag <= '0';
	   clockenable <= '0';
	end if;   
     
        if clockcounter = CLOCKCOUNT then
	   clockcounter <= (others => '0');
	   clockflag <= '1';
	else
	   clockcounter <= clockcounter + 1;
	end if;   
     
        if IOaddr = o"13" then
        if (IOstart = '0') and (io_done = '0') then

           IOdevstatus <= clockenable & clockflag; 
	   
           case IOiop is
	   when o"1" => -- CLEI enable clock interrrupt
	      IOskip <= '0';
              IOrdata <= IOwdata;
	      clockenable <= '1';

	   when o"2" => -- CLED disable clock interrrupt
	      IOskip <= '0';
              IOrdata <= IOwdata;
	      clockenable <= '0';

	   when o"3" => -- CLSK skip on clock flag and cler flag
              IOrdata <= IOwdata;
	      IOskip <= clockflag;
	      clockflag <= '0';

	   when others =>
	      IOskip <= '0';
	      IOrdata <= IOwdata;
	   end case;

	   io_done <= '1';
	else
	   io_done <= '0';
	end if;
	else
           IOrdata <= (others => 'Z');
	   IOskip <= 'Z';
	   IOdevstatus <= "ZZ";

	end if;
	
     end if;	
  end process C_IO;
  
end rtl ;



