LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

USE PDP8.all;

-- Version 1.00 : 23 June 2008

entity lightsMux is

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
end lightsMux;

architecture behavioral of lightsMux is

   constant LightsBits : integer := 8*12; -- 96 bits (89 used)
   
   constant LDF0   : integer := 0;
   constant LSC0   : integer := 1;
   constant LDF1   : integer := 2;
   constant LSC1   : integer := 3;
   constant LDF2   : integer := 4;
   constant LSC2   : integer := 5;
   constant LIF0   : integer := 6;
   constant LSC3   : integer := 7;
   constant LIF1   : integer := 8;
   constant LSC4   : integer := 9;
   constant LIF2   : integer := 10;
   constant LLINK  : integer := 11;
   constant LUA0   : integer := 12; -- Unassigned
   constant LUA1   : integer := 13; -- Unassigned
   constant LUA2   : integer := 14; -- Unassigned
   constant LUA3   : integer := 15; -- Unassigned
   
   constant LPC0   : integer := 16;
   constant LMA0   : integer := 17;
   constant LMB0   : integer := 18;
   constant LAC0   : integer := 19;
   constant LMQ0   : integer := 20;
   constant LPC1   : integer := 21;
   constant LMA1   : integer := 22;
   constant LMB1   : integer := 23;
   constant LAC1   : integer := 24;
   constant LMQ1   : integer := 25;
   constant LPC2   : integer := 26;
   constant LMA2   : integer := 27;
   constant LMB2   : integer := 28;
   constant LAC2   : integer := 29;
   constant LMQ2   : integer := 30;
   constant LPC3   : integer := 31;
   constant LMA3   : integer := 32;
   constant LMB3   : integer := 33;
   constant LAC3   : integer := 34;
   constant LMQ3   : integer := 35;
   constant LPC4   : integer := 36;
   constant LMA4   : integer := 37;
   constant LMB4   : integer := 38;
   constant LAC4   : integer := 39;
   constant LMQ4   : integer := 40;
   constant LPC5   : integer := 41;
   constant LMA5   : integer := 42;
   constant LMB5   : integer := 43;
   constant LAC5   : integer := 44;
   constant LMQ5   : integer := 45;
   constant LUA4   : integer := 46; -- Unassigned
   constant LUA5   : integer := 47; -- Unassigned
   
   constant LPC6   : integer := 48;
   constant LMA6   : integer := 49;
   constant LMB6   : integer := 50;
   constant LAC6   : integer := 51;
   constant LMQ6   : integer := 52;
   constant LPC7   : integer := 53;
   constant LMA7   : integer := 54;
   constant LMB7   : integer := 55;
   constant LAC7   : integer := 56;
   constant LMQ7   : integer := 57;
   constant LPC8   : integer := 58;
   constant LMA8   : integer := 59;
   constant LMB8   : integer := 60;
   constant LAC8   : integer := 61;
   constant LMQ8   : integer := 62;
   constant LPC9   : integer := 63;
   constant LMA9   : integer := 64;
   constant LMB9   : integer := 65;
   constant LAC9   : integer := 66;
   constant LMQ9   : integer := 67;
   constant LPC10  : integer := 68;
   constant LMA10  : integer := 69;
   constant LMB10  : integer := 70;
   constant LAC10  : integer := 71;
   constant LMQ10  : integer := 72;
   constant LPC11  : integer := 73;
   constant LMA11  : integer := 74;
   constant LMB11  : integer := 75;
   constant LAC11  : integer := 76;
   constant LMQ11  : integer := 77;
   constant LUA6   : integer := 78; -- Unassigned
   constant LJMS   : integer := 79;
   
   constant LDCA   : integer := 80;
   constant LISZ   : integer := 81;
   constant LTAD   : integer := 82;
   constant LAND   : integer := 83;
   constant LIOT   : integer := 84;
   constant LFETCH : integer := 85;
   constant LBREAK : integer := 86;
   constant LOPR   : integer := 87;
   constant LJMP   : integer := 88;
   constant LPAUSE : integer := 89;
   constant LRUN   : integer := 90;
   constant LION   : integer := 91;
   constant LCA    : integer := 92;
   constant LWC    : integer := 93;
   constant LEXEC  : integer := 94;
   constant LDEFER : integer := 95;
   constant LRCK   : integer := 96; -- Receive complete clock.

   signal lights   : std_logic_vector(0 to lightsBits); -- Needs an extra for LRCK.
   signal sr       : std_logic_vector(0 to lightsBits); -- Needs an extra for LRCK.
   signal counter  : integer := 0;
   signal IAND     : std_logic;
   signal ITAD     : std_logic;
   signal IISZ     : std_logic;
   signal IDCA     : std_logic;
   signal IJMS     : std_logic;
   signal IJMP     : std_logic;
   signal IIOT     : std_logic;
   signal IOPR     : std_logic;
   signal FETCH    : std_logic;
   signal EXEC     : std_logic;
   signal DEFER    : std_logic;
   signal WC       : std_logic;
   signal CA       : std_logic;
   signal BREAK    : std_logic;
   signal PAUSE    : std_logic;
begin
   -- Display CPU major state
   stat: process(clk)
   begin
      if (clk'event and clk = '1') then
         case STATE is
            when CPU_Idle     => --FETCH <= '1';
                                 --DEFER <= '0';
                                 --EXEC  <= '0';
                                 null;
            when CPU_Fetch    => FETCH <= '1';
                                 DEFER <= '0';
                                 EXEC  <= '0';
            when CPU_Decode   => FETCH <= '0';
                                 DEFER <= '1';
            when CPU_Indirect => FETCH <= '0';
                                 DEFER <= '1';
            when others       => FETCH <= '0';
                                 DEFER <= '0';
                                 EXEC  <= '1';
         end case;
      end if;
   end process;
   PAUSE <= '1' when (STATE = CPU_IOT) else '0';

   -- Continuously display IR
   lights(LAND) <= '1' when (IR = "000") else '0';
   lights(LTAD) <= '1' when (IR = "001") else '0';
   lights(LISZ) <= '1' when (IR = "010") else '0';
   lights(LDCA) <= '1' when (IR = "011") else '0';
   lights(LJMS) <= '1' when (IR = "100") else '0';
   lights(LJMP) <= '1' when (IR = "101") else '0';
   lights(LIOT) <= '1' when (IR = "110") else '0';
   lights(LOPR) <= '1' when (IR = "111") else '0';

   WC    <= '0'; -- Not implemented yet.
   CA    <= '0'; -- Not implemented yet.
   BREAK <= '0'; -- Not implemented yet.

   lights(LDF0) <= dfld(2);
   lights(LSC0) <= sc(4);
   lights(LDF1) <= dfld(1);
   lights(LSC1) <= sc(3);
   lights(LDF2) <= dfld(0);
   lights(LSC2) <= sc(2);
   lights(LIF0) <= ifld(2);
   lights(LSC3) <= sc(1);
   lights(LIF1) <= ifld(1);
   lights(LSC4) <= sc(0);
   lights(LIF2) <= ifld(0);
   lights(LLINK) <= LINK;
   lights(LUA0) <= '1';
   lights(LUA1) <= '1';
   lights(LUA2) <= '1';
   lights(LUA3) <= '1';

   lights(LPC0) <= pc(11);
   lights(LMA0) <= ma(11);
   lights(LMB0) <= mb(11);
   lights(LAC0) <= ac(11);
   lights(LMQ0) <= mq(11);
   lights(LPC1) <= pc(10);
   lights(LMA1) <= ma(10);
   lights(LMB1) <= mb(10);
   lights(LAC1) <= ac(10);
   lights(LMQ1) <= mq(10);
   lights(LPC2) <= pc(9);
   lights(LMA2) <= ma(9);
   lights(LMB2) <= mb(9);
   lights(LAC2) <= ac(9);
   lights(LMQ2) <= mq(9);
   lights(LPC3) <= pc(8);
   lights(LMA3) <= ma(8);
   lights(LMB3) <= mb(8);
   lights(LAC3) <= ac(8);
   lights(LMQ3) <= mq(8);
   lights(LPC4) <= pc(7);
   lights(LMA4) <= ma(7);
   lights(LMB4) <= mb(7);
   lights(LAC4) <= ac(7);
   lights(LMQ4) <= mq(7);
   lights(LPC5) <= pc(6);
   lights(LMA5) <= ma(6);
   lights(LMB5) <= mb(6);
   lights(LAC5) <= ac(6);
   lights(LMQ5) <= mq(6);
   lights(LUA4) <= '1';
   lights(LUA5) <= '1';

   lights(LPC6) <= pc(5);
   lights(LMA6) <= ma(5);
   lights(LMB6) <= mb(5);
   lights(LAC6) <= ac(5);
   lights(LMQ6) <= mq(5);
   lights(LPC7) <= pc(4);
   lights(LMA7) <= ma(4);
   lights(LMB7) <= mb(4);
   lights(LAC7) <= ac(4);
   lights(LMQ7) <= mq(4);
   lights(LPC8) <= pc(3);
   lights(LMA8) <= ma(3);
   lights(LMB8) <= mb(3);
   lights(LAC8) <= ac(3);
   lights(LMQ8) <= mq(3);
   lights(LPC9) <= pc(2);
   lights(LMA9) <= ma(2);
   lights(LMB9) <= mb(2);
   lights(LAC9) <= ac(2);
   lights(LMQ9) <= mq(2);
   lights(LPC10) <= pc(1);
   lights(LMA10) <= ma(1);
   lights(LMB10) <= mb(1);
   lights(LAC10) <= ac(1);
   lights(LMQ10) <= mq(1);
   lights(LPC11) <= pc(0);
   lights(LMA11) <= ma(0);
   lights(LMB11) <= mb(0);
   lights(LAC11) <= ac(0);
   lights(LMQ11) <= mq(0);
   lights(LUA6) <= '1';
   lights(LFETCH) <= FETCH;
   lights(LBREAK) <= BREAK;
   lights(LPAUSE) <= PAUSE;
   lights(LRUN) <= RUN;
   lights(LION) <= ION;
   lights(LCA) <= CA;
   lights(LWC) <= WC;
   lights(LEXEC) <= EXEC;
   lights(LDEFER) <= DEFER;
   lights(LRCK) <= '1'; -- Must be '1', must be first out.

   shift: process(clk)
   begin
      if (clk'event and clk = '1') then
         if (counter < lightsBits) then
            sr <= '0' & sr(0 to lightsBits-1);
            counter <= counter + 1;
            LCL_N <= '1';
         elsif (counter > lightsBits) then 
            sr <= lights;
            counter <= 0;
            LCL_N <= '0';
         else
            counter <= counter + 1;
            -- Wait one clock for the lights to latch the shifted data.
         end if;
      end if;
   end process;

   LCLK <= clk;
   LSER <= sr(lightsBits);
    
end behavioral;
