LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

-- Version 1.00 : 12 Novemebr 2003

USE cgen.all;
USE pdp8.all;

entity PDP8panel is
   Generic (
      CLKFREQ : integer
   );
   Port (
      clk : in std_logic;
      reset : in std_logic;

      CPUcontrol : out std_logic_vector (CPUcontrolLength downto 0);
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
end PDP8panel;

architecture rtl of PDP8panel is

   constant ir_row : integer := 7;
   constant em_row    : integer := ir_row + 4;

   constant pc_row    : integer := em_row + 5;
   constant lac_row   : integer := pc_row + 4;
   
   constant mq_row    : integer := lac_row + 5;
   constant eae_row   : integer := mq_row + 4;
   
   constant ma_row    : integer := eae_row + 5;
   constant mb_row    : integer := ma_row + 3;
   
   constant io_row    : integer := mb_row + 6;
   
   constant addr_row  : integer := io_row + 7;
   constant keys_row  : integer := addr_row + 5;

   constant title_col : integer := 6;
   constant v_col     : integer := 71;
   constant r_col     : integer := 60;
   constant delta     : integer := 4;

   constant hedge     : integer := 530;

   constant KEY_START : std_logic_vector (8 downto 0) := o"167";  -- NumLock
   constant KEY_CONT  : std_logic_vector (8 downto 0) := o"512";  -- /
   constant KEY_HALT  : std_logic_vector (8 downto 0) := o"174";  -- *
   constant KEY_SSTEP : std_logic_vector (8 downto 0) := o"173";  -- -

   constant KEY_DATA  : std_logic_vector (8 downto 0) := o"165";  -- 8
   constant KEY_ADDR  : std_logic_vector (8 downto 0) := o"175";  -- 9
   constant KEY_READ  : std_logic_vector (8 downto 0) := o"532";  -- Enter
   constant KEY_RNEXT : std_logic_vector (8 downto 0) := o"171";  -- +
   constant KEY_WRITE : std_logic_vector (8 downto 0) := o"161";  -- .
   
   constant KEY_0     : std_logic_vector (8 downto 0) := o"160";  -- 0
   constant KEY_1     : std_logic_vector (8 downto 0) := o"151";  -- 1
   constant KEY_2     : std_logic_vector (8 downto 0) := o"162";  -- 2
   constant KEY_3     : std_logic_vector (8 downto 0) := o"172";  -- 3
   constant KEY_4     : std_logic_vector (8 downto 0) := o"153";  -- 4
   constant KEY_5     : std_logic_vector (8 downto 0) := o"163";  -- 5
   constant KEY_6     : std_logic_vector (8 downto 0) := o"164";  -- 6 
   constant KEY_7     : std_logic_vector (8 downto 0) := o"154";  --7
   
   signal
      cred,
      cblue,
      cgreen,
      bred,
      bblue,
      bgreen,
      fg,
      VGAblank : std_logic;
  
   signal
      charbits : std_logic_vector (7 downto 0);

   signal
      charsel : std_logic_vector (5 downto 0);

   signal
      pixel_row,
      pixel_col : std_logic_vector (9 downto 0);

   signal
      char_row,
      char_col : std_logic_vector (6 downto 0);

   signal
      kb_state,
      kb_done : std_logic;

   signal kb_scancode : std_logic_vector (9 downto 0);
   signal enterdata : std_logic;

   signal switches : std_logic_vector (11 downto 0);
   signal addrkeys : std_logic_vector (14 downto 0);
   signal SwitchHalt : std_logic;
   signal HaltLatch : std_logic_vector(0 to 1);
   signal SwitchSStep : std_logic;

   component VGASYNC
    generic (

      -- Video parameters from : 
      --    http://www.hut.fi/Misc/Electronics/faq/vga2rgb/calc.html

      -- 640 * 480 60Hz :  25.17 MHz
      HSYNC : positive := 96;
      HBPORCH : positive := 48;
      HACTIVE : positive := 640;
      HFPORCH : positive := 16;
      HPOLARITY : std_logic := '1';

      VSYNC : positive := 2;
      VBPORCH : positive := 31;
      VACTIVE : positive := 480;
      VFPORCH : positive := 11;
      VPOLARITY : std_logic := '1'

      -- 640 * 480 85Hz :  36.00 MHz
--      HSYNC : positive := 48;
--      HBPORCH : positive := 112;
--      HACTIVE : positive := 640;
--      HFPORCH : positive := 32;
--      HPOLARITY : std_logic := '1';

--      VSYNC : positive := 3;
--      VBPORCH : positive := 25;
--      VACTIVE : positive := 480;
--      VFPORCH : positive := 1;
--      VPOLARITY : std_logic := '1'

      -- 800 * 600 60Hz : 40.00 MHz 
--      HSYNC : positive := 128;
--      HBPORCH : positive := 88;
--      HACTIVE : positive := 800;
--      HFPORCH : positive := 40;
--      HPOLARITY : std_logic := '0';

--      VSYNC : positive := 4;
--      VBPORCH : positive := 23;
--      VACTIVE : positive := 600;
--      VFPORCH : positive := 1;
--      VPOLARITY : std_logic := '0'
    );

    PORT(
       clk : IN STD_LOGIC;

       VGAblank,
       VGAhsync,
       VGAvsync : OUT STD_LOGIC;

       pixel_row,
       pixel_column : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
   END component VGASYNC;

   component PS2kb
      Port (
            reset,
            clk_25Mhz,
            kb_data,
            kb_clk : in std_logic;
            kb_done : out std_logic;
            kb_scancode  : out std_logic_vector (9 downto 0)
      );

    end component PS2kb;

   component chargen 
   Port (
      clk : in std_logic;
      charsel : in std_logic_vector (5 downto 0);
      colsel,
      rowsel : in std_logic_vector (2 downto 0);
      dout : out std_logic_vector (7 downto 0)
   );
 end component chargen;


begin

   LEDS <= CPUstate (CPUrun) & "00" & CPUstate(CPUlink downto CPUlink - 12);

   kb :  PS2kb
      Port map (
            reset => reset,
            clk_25Mhz => clk,
            kb_data => PS2KBdata,
            kb_clk => PS2kbclk,
            kb_done => kb_done,
            kb_scancode  => kb_scancode
      );

   sync : VGASYNC
      port map (
         clk => clk,

         VGAblank => VGAblank,
         VGAhsync => VGAhsync,
         VGAvsync => VGAvsync,

         pixel_row => pixel_row,
         pixel_column => pixel_col
      );

   cgen : chargen port map (
      clk => clk,
      charsel => charsel,
      colsel => pixel_col(2 downto 0),
      rowsel => pixel_row(2 downto 0),
      dout => charbits
   );

   char_col <= pixel_col(9 downto 3);
   char_row <= pixel_row(9 downto 3);

   CPUcontrol (CPUkeys downto CPUkeys-11) <= switches (11 downto 0);
   CPUcontrol (CPUaddr downto CPUaddr - 14) <= addrkeys (14 downto 0);

   process begin

      wait until (clk'event) AND (clk = '1');

      case conv_integer (char_row (6 downto 0)) is

      when  2 => -- title
      
         cred <= '1';
	 cgreen <= '1';
	 cblue <= '1';
	 
         case conv_integer (char_col) is
	 when title_col + 1 =>
            charsel <= charP;
	 when title_col + 2 =>
            charsel <= charD;
	 when title_col + 3 =>
            charsel <= charP;
	 when title_col + 4 =>
            charsel <= ch_dash;
	 when title_col + 5 =>
            charsel <= char8;
	 when title_col + 6 =>
            charsel <= ch_slash;
	 when title_col + 7 =>
            charsel <= charV;

	 when title_col + 9 =>
            charsel <= "000" & CPUversion (3 to 5);
	 when title_col + 10 =>
            charsel <= ch_dot;
	 when title_col + 11 =>
            charsel <= "000" & CPUversion (6 to 8);
	 when title_col + 12 =>
            charsel <= "000" & CPUversion (9 to 11);
	    
	 when others =>
            charsel <= CH_SPACE;
         end case;

      when ir_row - 2 =>  -- IR title
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

	 case conv_integer (char_col) is 
	 
	 when (r_col - delta*12) - 1 =>
	    charsel <= charR;
	 when (r_col - delta*12) + 0 =>
	    charsel <= charU;
	 when (r_col - delta*12) + 1 =>
	    charsel <= charN;
	 
	 when (r_col - delta*10) - 1 =>
	    charsel <= charP;
	 when (r_col - delta*10) + 0 =>
	    charsel <= charI;
	 when (r_col - delta*10) + 1 =>
	    charsel <= charE;
	 
	 when (r_col - delta*8) + 4 =>
	    charsel <= charI;
	 when (r_col - delta*8) + 5 =>
	    charsel <= charR;
	 
	 when (r_col - delta * 1) - 3 =>
	    charsel <= charS;
	 when (r_col - delta * 1) - 2 =>
	    charsel <= charT;
	 when (r_col - delta * 1) - 1 =>
	    charsel <= charA;
	 when (r_col - delta * 1) + 0 =>
	    charsel <= charT;
	 when (r_col - delta * 1) + 1 =>
	    charsel <= charE;
	 
	 when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when ir_row =>  -- IR and state

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;

         case conv_integer (char_col) is
         when v_col-4 =>
            charsel <= charI;
         when v_col-3 =>
            charsel <= charR;
	    
	 when v_col + 0 =>
	    case CPUstate (CPUir downto CPUir-2) is
	    when "000" =>  -- AND
               charsel <= charA;
	    when "001" =>  -- TAD
               charsel <= charT;
	    when "010" =>  -- ISZ
               charsel <= charI;
	    when "011" =>  -- DCA
               charsel <= charD;
	    when "100" =>  -- JMS
               charsel <= charJ;
	    when "101" =>  -- JMP
               charsel <= charJ;
	    when "110" =>  -- IOT
               charsel <= charI;
	    when "111" =>  -- OPR
               charsel <= charO;
            when others =>
               charsel <= CH_SPACE;
	    end case;
	 
         when v_col+1 =>
	    case CPUstate (CPUir downto CPUir-2) is
	    when "000" =>  -- AND
               charsel <= charN;
	    when "001" =>  -- TAD
               charsel <= charA;
	    when "010" =>  -- ISZ
               charsel <= charS;
	    when "011" =>  -- DCA
               charsel <= charC;
	    when "100" =>  -- JMS
               charsel <= charM;
	    when "101" =>  -- JMP
               charsel <= charM;
	    when "110" =>  -- IOT
               charsel <= charO;
	    when "111" =>  -- OPR
               charsel <= charP;
            when others =>
               charsel <= CH_SPACE;
	    end case;

	 when v_col+2 =>
	    case CPUstate (CPUir downto CPUir-2) is
	    when "000" =>  -- AND
               charsel <= charD;
	    when "001" =>  -- TAD
               charsel <= charD;
	    when "010" =>  -- ISZ
               charsel <= charZ;
	    when "011" =>  -- DCA
               charsel <= charA;
	    when "100" =>  -- JMS
               charsel <= charS;
	    when "101" =>  -- JMP
               charsel <= charP;
	    when "110" =>  -- IOT
               charsel <= charT;
	    when "111" =>  -- OPR
               charsel <= charR;
            when others =>
               charsel <= CH_SPACE;
	    end case;

         when v_col+4 =>
	    case CPUstate (CPUetat downto CPUetat - 3) is
	    
	    when CPU_Idle =>
	       charsel <= ch_dash;
	    when CPU_Fetch =>
	       charsel <= charF;
	    when CPU_Decode | CPU_Indirect =>
	       charsel <= charD;
	    when CPU_Execute | CPU_OPR | CPU_IOT =>
	       charsel <= charX;
	    when others => 
	       charsel <= CH_SPACE;
	    end case;   
         when v_col+5 =>
	    case CPUstate (CPUetat downto CPUetat - 3) is
	    
	    when CPU_OPR =>
	       charsel <= charO;
	    when CPU_IOT =>
	       charsel <= charI;
	    when others => 
	       charsel <= CH_SPACE;
	    end case;   

         when r_col - delta*12 =>
            charsel <= cb_lamp & CPUstate (CPUrun);

         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUpie);

	 when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUir);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUir-1);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUir-2);

         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUetat);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUetat-1);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUetat-2);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUetat-3);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when em_row - 2 =>  -- PC title
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

	 case conv_integer (char_col) is 
	 
	 when r_col - delta*1 -1 =>
	    charsel <= charD;
	 when r_col - delta*1 -0 =>
	    charsel <= charF;
	 when r_col - delta*1 +1 =>
	    charsel <= charL;
	 when r_col - delta*1 +2 =>
	    charsel <= charD;
	    
	 when r_col - delta*4 -1 =>
	    charsel <= charI;
	 when r_col - delta*4 -0 =>
	    charsel <= charF;
	 when r_col - delta*4 +1 =>
	    charsel <= charL;
	 when r_col - delta*4 +2 =>
	    charsel <= charD;
	    
	 when r_col - delta*6 -1 =>
	    charsel <= charU;
	 when r_col - delta*6 -0 =>
	    charsel <= charI;
	 when r_col - delta*6 +1 =>
	    charsel <= charF;
	    
	 when r_col - delta*8 -1 =>
	    charsel <= charU;
	 when r_col - delta*8 -0 =>
	    charsel <= charF;
	 when r_col - delta*8 +1 =>
	    charsel <= charL;
	    
	    
	 when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when em_row =>  -- PC

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
	 
         case conv_integer (char_col) is

         when v_col-4 =>
            charsel <= charE;
         when v_col-3 =>
            charsel <= charM;
         when v_col-1 =>
            charsel <= charI;
         when v_col =>
            charsel <= "000" & CPUstate (CPUif downto CPUif-2);
         when v_col+2 =>
            charsel <= charD;
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUdf downto CPUdf-2);

         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUuf);
	    
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUui);
	    
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (CPUif);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUif-1);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUif-2);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUdf);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUdf-1);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUdf-2);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when pc_row - 2 =>  -- PC title
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

	 if conv_integer (char_col) = (r_col - delta * 6) + 2 then
	    charsel <= charP;
	 elsif conv_integer (char_col) = (r_col - delta * 6) + 3 then
	    charsel <= charC;
	 else
	    charsel <= CH_SPACE;
	 end if;
	 
      when pc_row =>  -- PC

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
	 
         case conv_integer (char_col) is

         when v_col-4 =>
            charsel <= charP;
         when v_col-3 =>
            charsel <= charC;
         when v_col =>
            charsel <= "000" & CPUstate (CPUpc downto CPUpc-2);
         when v_col+1 =>
            charsel <= "000" & CPUstate (CPUpc-3 downto CPUpc-5);
         when v_col+2 =>
            charsel <= "000" & CPUstate (CPUpc-6 downto CPUpc-8);
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUpc-9 downto CPUpc-11);

         when r_col - delta*11 =>
            charsel <= cb_lamp & CPUstate (CPUpc);
         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUpc-1);
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUpc-2);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUpc-3);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUpc-4);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUpc-5);
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (CPUpc-6);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUpc-7);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUpc-8);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUpc-9);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUpc-10);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUpc-11);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when lac_row - 2 =>  -- LAC title
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

	 case conv_integer (char_col) is 
	 
	 when r_col - delta*12 -1 =>
	    charsel <= charL;
	 when r_col - delta*12 -0 =>
	    charsel <= charN;
	 when r_col - delta*12 +1 =>
	    charsel <= charK;
	    
	 when (r_col - delta * 6) + 2 =>
	    charsel <= charA;
	 when (r_col - delta * 6) + 3 =>
	    charsel <= charC;
	    
	 when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when lac_row =>  -- LAC

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
      
         case conv_integer (char_col) is
         when v_col-4 =>
            charsel <= charA;
         when v_col-3 =>
            charsel <= charC;
         when v_col =>
            charsel <= "000" & CPUstate (CPUac downto CPUac-2);
         when v_col+1 =>
            charsel <= "000" & CPUstate (CPUac-3 downto CPUac-5);
         when v_col+2 =>
            charsel <= "000" & CPUstate (CPUac-6 downto CPUac-8);
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUac-9 downto CPUac-11);

         when r_col - delta*12 =>
            charsel <= cb_lamp & CPUstate (CPUlink);
         when r_col - delta*11 =>
            charsel <= cb_lamp & CPUstate (CPUac);
         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUac-1);
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUac-2);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUac-3);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUac-4);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUac-5);
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (CPUac-6);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUac-7);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUac-8);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUac-9);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUac-10);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUac-11);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when mq_row - 2 =>  -- MQ title
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

	 if conv_integer (char_col) = (r_col - delta * 6) + 2 then
	    charsel <= charM;
	 elsif conv_integer (char_col) = (r_col - delta * 6) + 3 then
	    charsel <= charQ;
	 else
	    charsel <= CH_SPACE;
	 end if;
	 
      when mq_row =>  -- MQ

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
      
         case conv_integer (char_col) is

         when v_col-4 =>
            charsel <= charM;
         when v_col-3 =>
            charsel <= charQ;
         when v_col+0 =>
            charsel <= "000" & CPUstate (CPUmq downto CPUmq-2);
         when v_col+1 =>
            charsel <= "000" & CPUstate (CPUmq-3 downto CPUmq-5);
         when v_col+2 =>
            charsel <= "000" & CPUstate (CPUmq-6 downto CPUmq-8);
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUmq-9 downto CPUmq-11);

         when r_col - delta*11 =>
            charsel <= cb_lamp & CPUstate (CPUmq);
         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUmq-1);
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUmq-2);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUmq-3);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUmq-4);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUmq-5);
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (CPUmq-6);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUmq-7);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUmq-8);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUmq-9);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUmq-10);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUmq-11);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when eae_row - 2 =>  -- EAE
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

         case conv_integer (char_col) is
         when r_col - delta*10 =>
            charsel <= charM;
	    
         when r_col - delta*7-2 =>
            charsel <= charO;
         when r_col - delta*7-1 =>
            charsel <= charP;
	    
         when r_col - delta*2-1 =>
            charsel <= charC;
         when r_col - delta*2 =>
            charsel <= charN;
         when r_col - delta*2+1 =>
            charsel <= charT;

         when others =>
            charsel <= CH_SPACE;
         end case;
	 
      when eae_row =>  -- EAE

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
      
         case conv_integer (char_col) is

         when v_col-5 =>
            charsel <= charE;
         when v_col-4 =>
            charsel <= charA;
         when v_col-3 =>
            charsel <= charE;
         
	 when v_col+0 =>
	    if CPUstate(CPUem) = '1' then
	       charsel <= charB;
	    else
	       charsel <= charA;
	    end if;

	 when v_col+2 =>
            charsel <= "0000" & CPUstate (CPUsc downto CPUsc-1);
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUsc-2 downto CPUsc-4);

         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUem);
	    
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUeae);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUeae-1);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUeae-2);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUeae-3);

	 when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUsc);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUsc-1);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUsc-2);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUsc-3);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUsc-4);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when ma_row - 2 =>  -- MA title
         cred <= '1';
         cgreen <= '1';
	 cblue <= '1';

         case conv_integer (char_col) is
         when (r_col-delta*5)-6 =>
            charsel <= charM;
         when (r_col-delta*5)-5 =>
            charsel <= charE;
         when (r_col-delta*5)-4 =>
            charsel <= charM;
         when (r_col-delta*5)-3 =>
            charsel <= charO;
         when (r_col-delta*5)-2 =>
            charsel <= charR;
         when (r_col-delta*5)-1 =>
            charsel <= charY;
         when (r_col-delta*5)+1 =>
            charsel <= charI;
         when (r_col-delta*5)+2 =>
            charsel <= ch_slash;
         when (r_col-delta*5)+3 =>
            charsel <= charF;
	 when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when ma_row =>  -- MA

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
      
         case conv_integer (char_col) is

         when v_col-4 =>
            charsel <= charM;
         when v_col-3 =>
            charsel <= charA;
         when v_col-1 =>
            charsel <= "000" & CPUstate (CPUma downto CPUma-2);
         when v_col+0 =>
            charsel <= "000" & CPUstate (CPUma-3 downto CPUma-5);
         when v_col+1 =>
            charsel <= "000" & CPUstate (CPUma-6 downto CPUma-8);
         when v_col+2 =>
            charsel <= "000" & CPUstate (CPUma-9 downto CPUma-11);
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUma-12 downto CPUma-14);

         when r_col - delta*14 =>
            charsel <= cb_lamp & CPUstate (CPUma);
         when r_col - delta*13 =>
            charsel <= cb_lamp & CPUstate (CPUma-1);
         when r_col - delta*12 =>
            charsel <= cb_lamp & CPUstate (CPUma-2);
         when r_col - delta*11 =>
            charsel <= cb_lamp & CPUstate (CPUma-3);
         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUma-4);
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUma-5);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUma-6);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUma-7);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUma-8);
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (CPUma-9);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUma-10);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUma-11);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUma-12);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUma-13);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUma-14);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when mb_row =>  -- MB

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
      
         case conv_integer (char_col) is
         when v_col-4 =>
            charsel <= charM;
         when v_col-3 =>
            charsel <= charB;
         when v_col =>
            charsel <= "000" & CPUstate (CPUmb downto CPUmb-2);
         when v_col+1 =>
            charsel <= "000" & CPUstate (CPUmb-3 downto CPUmb-5);
         when v_col+2 =>
            charsel <= "000" & CPUstate (CPUmb-6 downto CPUmb-8);
         when v_col+3 =>
            charsel <= "000" & CPUstate (CPUmb-9 downto CPUmb-11);

         when r_col - delta*14 =>
            if CPUstate (CPUmc-1) = '1' then
               charsel <= charG;
            elsif CPUstate (CPUmc) = '1' then
               charsel <= charA;
	    else
	       charsel <= CH_SPACE;
            end if;

         when r_col - delta*13 =>
            if CPUstate (CPUmc-2) = '1' then
               charsel <= charD;
	    else
	       charsel <= CH_SPACE;
            end if;

         when r_col - delta*12 =>
            if CPUstate (CPUmc-4) = '1' then
               charsel <= charW;
            elsif CPUstate (CPUmc-3) = '1' then
               charsel <= charR;
	    else
	       charsel <= CH_SPACE;
            end if;

         when r_col - delta*11 =>
            charsel <= cb_lamp & CPUstate (CPUmb);
         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (CPUmb-1);
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUmb-2);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUmb-3);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUmb-4);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUmb-5);
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (CPUmb-6);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (CPUmb-7);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (CPUmb-8);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (CPUmb-9);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (CPUmb-10);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (CPUmb-11);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when io_row - 2 =>  -- IO titles
         cred <= '1';
         cgreen <= '1';
         cblue <= '1';
      
         case conv_integer (char_col) is
         when (r_col-delta*1)-1 =>
            charsel <= charI;
         when (r_col-delta*1)+0 =>
            charsel <= charO;
         when (r_col-delta*1)+1 =>
            charsel <= charT;

         when (r_col-delta*5)-5 =>
            charsel <= charI;
         when (r_col-delta*5)-4 =>
            charsel <= charO;
         when (r_col-delta*5)-2 =>
            charsel <= charA;
         when (r_col-delta*5)-1 =>
            charsel <= charD;
         when (r_col-delta*5)+0 =>
            charsel <= charD;
         when (r_col-delta*5)+1 =>
            charsel <= charR;

         when (r_col-delta*10)-1 =>
            charsel <= charS;
         when (r_col-delta*10)+0 =>
            charsel <= charT;
         when (r_col-delta*10)+1 =>
            charsel <= charA;
	    
         when others =>
            charsel <= CH_SPACE;
         end case;
      
      when io_row =>  -- IO

         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '1';
            cgreen <= '0';
	    cblue <= '0';
         end if;
      
         case conv_integer (char_col) is
         when v_col-4 =>
            charsel <= charI;
         when v_col-3 =>
            charsel <= charO;
         when v_col =>
            charsel <= "000" & CPUstate (IOaddress downto IOaddress-2);
         when v_col+1 =>
            charsel <= "000" & CPUstate (IOaddress-3 downto IOaddress-5);
         when v_col+3 =>
            charsel <= "000" & CPUstate (IOop downto IOop-2);

         when r_col - delta*11 =>
            charsel <= cb_lamp & CPUstate (IOto-0);
	    
         when r_col - delta*10 =>
            charsel <= cb_lamp & CPUstate (IOstatus-0);
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (IOstatus-1);

	 when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (IOaddress-0);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (IOaddress-1);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (IOaddress-2);
         when r_col - delta*5 =>
            charsel <= cb_lamp & CPUstate (IOaddress-3);
         when r_col - delta*4 =>
            charsel <= cb_lamp & CPUstate (IOaddress-4);
         when r_col - delta*3 =>
            charsel <= cb_lamp & CPUstate (IOaddress-5);
         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (Ioop-0);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (IOop-1);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (IOop-2);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when keys_row-2 =>
      
         case conv_integer (char_col) is
	 
	 when r_col - delta*14 - 1 =>
            cred <= '1';
            cblue <= '1';
            cgreen <= '1';
            charsel <= charH;
         when r_col - delta*14 + 0 =>
            charsel <= charL;
         when r_col - delta*14 + 1 =>
            charsel <= charT;
         
	 when r_col - delta*12 - 3 =>
            charsel <= charS;
         when r_col - delta*12 - 2 =>
            charsel <= charS;
         when r_col - delta*12 - 1 =>
            charsel <= charT;
         
         when r_col - delta*6 - 1 =>
            cred <= not enterdata;
	    cgreen <= '1';
	    cblue <= not enterdata;
            charsel <= charD;
         when r_col - delta*6 + 0 =>
            charsel <= charA;
         when r_col - delta*6 + 1 =>
            charsel <= charT;
         when r_col - delta*6 + 2 =>
            charsel <= charA;
         when r_col - delta*6 + 4 =>
            charsel <= charK;
         when r_col - delta*6 + 5 =>
            charsel <= charE;
         when r_col - delta*6 + 6=>
            charsel <= charY;
         when r_col - delta*6 + 7 =>
            charsel <= charS;

	 when others =>
            charsel <= CH_SPACE;
	 end case;
	 
      when keys_row =>  -- KEYS
      
         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '0';
            cgreen <= '0';
	    cblue <= '1';
         end if;

         case conv_integer (char_col) is

         when v_col - 5 =>
            charsel <= charD;
         when v_col - 4 =>
            charsel <= charA;
         when v_col - 3 =>
            charsel <= charT;
	    
         when v_col + 0 =>
            charsel <= "000" & switches (11 downto 9);
         when v_col + 1 =>
            charsel <= "000" & switches (8 downto 6);
         when v_col + 2 =>
            charsel <= "000" & switches (5 downto 3);
         when v_col + 3 =>
            charsel <= "000" & switches (2 downto 0);

         when r_col - delta*14 =>
            charsel <= cb_switch & SwitchHalt;

	 when r_col - delta*12 - 2 =>
            charsel <= cb_switch & SwitchSstep;

         when r_col - delta*11=>
            charsel <= cb_switch & switches (11);
         when r_col - delta*10 =>
            charsel <= cb_switch & switches (11 - 1);
         when r_col - delta*9 =>
            charsel <= cb_switch & switches (11 - 2);
         when r_col - delta*8 =>
            charsel <= cb_switch & switches (11 - 3);
         when r_col - delta*7 =>
            charsel <= cb_switch & switches (11 - 4);
         when r_col - delta*6 =>
            charsel <= cb_switch & switches (11 - 5);
         when r_col - delta*5 =>
            charsel <= cb_switch & switches (11 - 6);
         when r_col - delta*4 =>
            charsel <= cb_switch & switches (11 - 7);
         when r_col - delta*3 =>
            charsel <= cb_switch & switches (11 - 8);
         when r_col - delta*2 =>
            charsel <= cb_switch & switches (11 - 9);
         when r_col - delta*1 =>
            charsel <= cb_switch & switches (11 - 10);
         when r_col - delta*0 =>
            charsel <= cb_switch & switches (11 - 11);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when addr_row-2 =>
         if conv_integer (char_col) > (r_col - delta*6 -3) then
            cred <= enterdata;
            cgreen <= '1';
	    cblue <= enterdata;
         else
            cred <= '1';
            cgreen <= '1';
	    cblue <= '1';
         end if;

         case conv_integer (char_col) is

         when r_col - delta*6 - 3 =>
            charsel <= charA;
         when r_col - delta*6 - 2 =>
            charsel <= charD;
         when r_col - delta*6 - 1 =>
            charsel <= charD;
         when r_col - delta*6 + 0 =>
            charsel <= charR;
         when r_col - delta*6 + 1 =>
            charsel <= charE;
         when r_col - delta*6 + 2 =>
            charsel <= charS;
         when r_col - delta*6 + 3 =>
            charsel <= charS;
         when r_col - delta*6 + 4 =>
            charsel <= CH_SPACE;
         when r_col - delta*6 + 5 =>
            charsel <= charK;
         when r_col - delta*6 + 6 =>
            charsel <= charE;
         when r_col - delta*6 + 7 =>
            charsel <= charY;
         when r_col - delta*6 + 8 =>
            charsel <= charS;

	 when others =>
            charsel <= CH_SPACE;
	 end case;
	 
      when addr_row =>  -- ADDRESS KEYS
      
         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '0';
            cgreen <= '0';
	    cblue <= '1';
         end if;

         case conv_integer (char_col) is

         when v_col - 5 =>
            charsel <= charA;
         when v_col - 4 =>
            charsel <= charD;
         when v_col - 3 =>
            charsel <= charR;
         when v_col - 1 =>
            charsel <= "000" & addrkeys (14 downto 12);
         when v_col + 0 =>
            charsel <= "000" & addrkeys (11 downto 9);
         when v_col + 1 =>
            charsel <= "000" & addrkeys (8 downto 6);
         when v_col + 2 =>
            charsel <= "000" & addrkeys (5 downto 3);
         when v_col + 3 =>
            charsel <= "000" & addrkeys (2 downto 0);

	 when r_col - delta*14 =>
            charsel <= cb_switch & addrkeys (14 - 0);
         when r_col - delta*13 =>
            charsel <= cb_switch & addrkeys (14 - 1);
         when r_col - delta*12 =>
            charsel <= cb_switch & addrkeys (14 - 2);
         when r_col - delta*11 =>
            charsel <= cb_switch & addrkeys (14 - 3);
         when r_col - delta*10 =>
            charsel <= cb_switch & addrkeys (14 - 4);
         when r_col - delta*9 =>
            charsel <= cb_switch & addrkeys (14 - 5);
         when r_col - delta*8 =>
            charsel <= cb_switch & addrkeys (14 - 6);
         when r_col - delta*7 =>
            charsel <= cb_switch & addrkeys (14 - 7);
         when r_col - delta*6 =>
            charsel <= cb_switch & addrkeys (14 - 8);
         when r_col - delta*5 =>
            charsel <= cb_switch & addrkeys (14 - 9);
         when r_col - delta*4 =>
            charsel <= cb_switch & addrkeys (14 - 10);
         when r_col - delta*3 =>
            charsel <= cb_switch & addrkeys (14 - 11);
         when r_col - delta*2 =>
            charsel <= cb_switch & addrkeys (14 - 12);
         when r_col - delta*1 =>
            charsel <= cb_switch & addrkeys (14 - 13);
         when r_col - delta*0 =>
            charsel <= cb_switch & addrkeys (14 - 14);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when keys_row + 3 =>
         if pixel_col > hedge then
            cred <= '0';
            cgreen <= '0';
	    cblue <= '0';
         else
            cred <= '0';
            cgreen <= '0';
	    cblue <= '1';
         end if;

         case conv_integer (char_col) is

         when v_col + 0 =>
            charsel <= "00000" & kb_scancode(9);
         when v_col + 1 =>
            charsel <= "000" &kb_scancode(8 downto 6);
         when v_col + 2 =>
            charsel <= "000" & kb_scancode(5 downto 3);
         when v_col + 3 =>
            charsel <= "000" & kb_scancode(2 downto 0);

	 when r_col - 0 =>
	    charsel <= cb_switch & config(8); 
	 when r_col - 2 =>
	    charsel <= cb_switch & config(7); 
	 when r_col - 4 =>
	    charsel <= cb_switch & config(6); 
	 when r_col - 6 =>
	    charsel <= cb_switch & config(5); 
	 when r_col - 8 =>
	    charsel <= cb_switch & config(4); 
	 when r_col - 10 =>
	    charsel <= cb_switch & config(3); 
	 when r_col - 12 =>
	    charsel <= cb_switch & config(2); 
	 when r_col - 14 =>
	    charsel <= cb_switch & config(1); 
         when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when others =>
         charsel <= CH_SPACE;
      end case;

      case pixel_col (2 downto 0) is
      when "111" =>
         fg <= charbits (1);

      when "110" =>
         fg <= charbits (2);

      when "101" =>
         fg <= charbits (3);

      when "100" =>
         fg <= charbits (4);

      when "011" =>
         fg <= charbits (5);

      when "010" =>
         fg <= charbits (6);

      when "001" =>
         fg <= charbits (7);

      when others =>
         fg <= '0';
      end case;

         if (((conv_integer (pixel_row) > ((lac_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((lac_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8)))
         or (((conv_integer (pixel_row) > ((ir_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((ir_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8))) then
	    if conv_integer (pixel_col) = 0 then
	       bred <= '0';
	       bgreen <= '0';
	       bblue <= '0';
	    elsif conv_integer (pixel_col) = ((r_col -12 * delta) * 8) then
	       bred <= '1';
	       bgreen <= '1';
	       bblue <= '0';
	    end if;   
         elsif (((conv_integer (pixel_row) > ((ma_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((ma_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8)))
         or (((conv_integer (pixel_row) > ((addr_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((addr_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8))) then
	    if conv_integer (pixel_col) = 0 then
	       bred <= '0';
	       bgreen <= '0';
	       bblue <= '0';
	    elsif conv_integer (pixel_col) = ((r_col -14 * delta) * 8) then
	       bred <= '1';
	       bgreen <= '1';
	       bblue <= '0';
	    end if;   
         elsif ((conv_integer (pixel_row) > ((ir_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((ir_row * 8) + 12)))
	 or ((conv_integer (pixel_row) > ((addr_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((addr_row * 8) + 12)))  
         or ((conv_integer (pixel_row) > ((keys_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((keys_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((lac_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((lac_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((eae_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((eae_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((mq_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((mq_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((pc_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((pc_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((em_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((em_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((ma_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((ma_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((mb_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((mb_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((io_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((io_row * 8) + 12))) 
	 then 
	 
         case conv_integer (pixel_col) is
         when ((r_col - 2 * delta) * 8) |
              ((r_col - 8 * delta) * 8)  =>
	    bred <= '1';
	    bgreen <= '1';
	    bblue <= '0';

	 when 0 | 
	      ((r_col + 1 * delta) * 8) | 
	      ((r_col - 5 * delta) * 8) | 
	      ((r_col - 11 * delta) * 8) |
	      ((r_col - 17 * delta) * 8) =>
	    bred <= '0';
	    bgreen <= '0';
	    bblue <= '0';

	 when others =>

	 end case;
	 else
	    bred <= '0';
	    bgreen <= '0';
	    bblue <= '0';
	 
         end if;
  end process;

  process begin
      wait until (clk'event) AND (clk = '1');

      CPUcontrol(CPUmrd) <= '0';
      CPUcontrol(CPUmrdnext) <= '0';
      CPUcontrol(CPUwrhere) <= '0';
      CPUcontrol(CPUstart) <= '0';
      CPUcontrol(CPUcontinue) <= '0';
      CPUcontrol(CPUhalt) <= SwitchHalt;
      CPUcontrol(CPUSstep) <= SwitchSstep;

      kb_state <= kb_done;

      if (kb_state = '0') and (kb_done = '1') then
         case kb_scancode is

         when '0' & KEY_START =>
            SwitchSstep <= '0';
            CPUcontrol(CPUstart) <= '1';

         when '0' & KEY_CONT =>
            CPUcontrol(CPUcontinue) <= '1';

         when '0' & KEY_HALT =>
	    if HaltLatch = "00" then
               SwitchHalt <= not SwitchHalt;
	    end if;
            HaltLatch <= HaltLatch(1) & '1';
	    
         when '1' & KEY_HALT =>
	    HaltLatch <= "00";
	    if (HaltLatch(0) = '0') and (SwitchHalt = '1') then 
	       SwitchHalt <= '0';
	    end if;
	       
         when '0' & KEY_SSTEP =>
            SwitchSstep <= not SwitchSstep;

         when '0' & KEY_READ =>
            CPUcontrol(CPUmrd) <= '1';

         when '0' & KEY_RNEXT =>
            CPUcontrol(CPUmrdnext) <= '1';

         when '0' & KEY_WRITE =>
            CPUcontrol (CPUwrhere) <= '1';

         when '1' & KEY_WRITE =>
            CPUcontrol(CPUmrdnext) <= '1';

         when '0' & KEY_ADDR =>
            addrkeys <= (others => '0');
            enterdata <= '0';

         when '0' & KEY_DATA => 
            switches <= (others => '0');
            enterdata <= '1';

         when '0' & KEY_7 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "111";
            else
               addrkeys <= addrkeys(11 downto 0) & "111";
            end if;

         when '0' & KEY_6 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "110";
            else
               addrkeys <= addrkeys(11 downto 0) & "110";
            end if;

         when '0' & KEY_5 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "101";
            else
               addrkeys <= addrkeys(11 downto 0) & "101";
            end if;

         when '0' & KEY_4 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "100";
            else
               addrkeys <= addrkeys(11 downto 0) & "100";
            end if;

         when '0' & KEY_3 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "011";
            else
               addrkeys <= addrkeys(11 downto 0) & "011";
            end if;

         when '0' & KEY_2 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "010";
            else
               addrkeys <= addrkeys(11 downto 0) & "010";
            end if;

         when '0' & KEY_1 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "001";
            else
               addrkeys <= addrkeys(11 downto 0) & "001";
            end if;

         when '0' & KEY_0 =>
            if enterdata = '1' then
               switches <= switches(8 downto 0) & "000";
            else
               addrkeys <= addrkeys(11 downto 0) & "000";
            end if;

         when others =>
	 
         end case;
      end if;

      if (fg = '1') then
         VGAred <= (cred and not VGAblank); 
         VGAgreen <= (cgreen and not VGAblank); 
         VGAblue <= (cblue and not VGAblank); 
      elsif conv_integer (pixel_col) < hedge then
         VGAred <= (bred and not VGAblank); 
         VGAgreen <= (bgreen and not VGAblank); 
         VGAblue <= (bblue and not VGAblank);
      else
         VGAred <= (CPUstate (CPUfault) and not VGAblank); 
         VGAgreen <= ((not CPUstate (CPUfault)) and not VGAblank);
         VGAblue <= ('0' and not VGAblank); 
      end if;
      end process;
end rtl;
