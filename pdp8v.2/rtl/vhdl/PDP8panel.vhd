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
   type color is array(0 to 2) of std_logic;
   constant BLACK  : color := "000";
   constant RED    : color := "100";
   constant GREEN  : color := "010";
   constant BLUE   : color := "001";
   constant CYAN   : color := "011";
   constant MAGENTA: color := "101";
   constant YELLOW : color := "110";
   constant WHITE  : color := "111";
   
   constant BG1    : color := BLACK;    -- Unhighlighted background
   constant BG2    : color := RED;      -- Highlighted background
   constant TEXT   : color := WHITE;    -- Standard Text
   constant TEXTALT: color := GREEN;    -- Selected Text
   constant LAMP   : color := YELLOW;   -- Indicator lamp color
   constant SWITCH : color := BLUE;     -- Input data color
   constant SIDEBAR: color := GREEN;    -- Sidebar background

   constant vdelta    : integer := 4;

   constant pc_row    : integer := vdelta*3;

   constant ma_row    : integer := pc_row + vdelta;
   constant mb_row    : integer := ma_row + vdelta;

   constant lac_row   : integer := mb_row + vdelta;
   constant mq_row    : integer := lac_row + vdelta;

   constant eae_row   : integer := mq_row + vdelta;
   
   constant keys_row  : integer := eae_row + 2*vdelta;

   constant title_col : integer := 6;
   constant delta     : integer := 3;   -- Width of a lamp
   constant r_col     : integer := 17*delta + 1;
   constant o_col     : integer := r_col + delta;
   constant s_col     : integer := o_col + delta + 3;
   constant i_col     : integer := s_col + delta + 5;
   
   constant hedge     : integer := 640;

   constant KEY_START : std_logic_vector (8 downto 0) := o"167";  -- NumLock
   constant KEY_CONT  : std_logic_vector (8 downto 0) := o"512";  -- /
   constant KEY_HALT  : std_logic_vector (8 downto 0) := o"174";  -- *
   constant KEY_SSTEP : std_logic_vector (8 downto 0) := o"173";  -- -

   constant KEY_BOOT  : std_logic_vector (8 downto 0) := o"165";  -- 8
   constant KEY_LXA   : std_logic_vector (8 downto 0) := o"175";  -- 9
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
   
   signal ccolor   : color;
   signal bcolor   : color;
   alias  cred     : std_logic is ccolor(0);
   alias  cgreen   : std_logic is ccolor(1);
   alias  cblue    : std_logic is ccolor(2);
   alias  bred     : std_logic is bcolor(0);
   alias  bgreen   : std_logic is bcolor(1);
   alias  bblue    : std_logic is bcolor(2);
   signal fg       : std_logic;
   signal VGAblank : std_logic;
  
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

   signal switches : std_logic_vector (11 downto 0);
   signal SwitchHalt : std_logic;
   signal HaltLatch : std_logic_vector(0 to 1);
   signal SwitchSStep : std_logic;
   
   signal ir_display : std_logic;

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
            kb_scancode  : out std_logic_vector (9 downto 0);
            kb_led : in std_logic_vector(0 to 2)
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
            kb_led => "000",
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

   ir_display <= '0' when CPUstate (CPUetat downto CPUetat-3) = CPU_Idle
            else '0' when CPUstate (CPUetat downto CPUetat-3) = CPU_Fetch
            else '1';

   process begin

      wait until (clk'event) AND (clk = '1');

      case conv_integer (char_row (6 downto 0)) is

      when  2 => -- title
      
         ccolor <= TEXT;
	 
         case conv_integer (char_col) is
	 when title_col +  1 => charsel <= charP;
	 when title_col +  2 => charsel <= charD;
	 when title_col +  3 => charsel <= charP;
	 when title_col +  4 => charsel <= ch_dash;
	 when title_col +  5 => charsel <= char8;
	 when title_col +  6 => charsel <= ch_slash;
	 when title_col +  7 => charsel <= charV;

	 when title_col +  9 => charsel <= "000" & CPUversion (3 to 5);
	 when title_col + 10 => charsel <= ch_dot;
	 when title_col + 11 => charsel <= "000" & CPUversion (6 to 8);
	 when title_col + 12 => charsel <= "000" & CPUversion (9 to 11);
	    
	 when others         => charsel <= CH_SPACE;
         end case;

      when pc_row - 2 =>  -- PC title
         ccolor <= TEXT;

         case conv_integer (char_col) is
         
             when r_col-delta*16 +0 => charsel <= charD;
             when r_col-delta*16 +1 => charsel <= charF;
                
             when r_col-delta*13 +0 => charsel <= charI;
             when r_col-delta*13 +1 => charsel <= charF;

             when (r_col-delta*5)-9 => charsel <= charP;
             when (r_col-delta*5)-8 => charsel <= charR;
             when (r_col-delta*5)-7 => charsel <= charO;
             when (r_col-delta*5)-6 => charsel <= charG;
             when (r_col-delta*5)-5 => charsel <= charR;
             when (r_col-delta*5)-4 => charsel <= charA;
             when (r_col-delta*5)-3 => charsel <= charM;
         
             when (r_col-delta*5)-1 => charsel <= charC;
             when (r_col-delta*5)+0 => charsel <= charO;
             when (r_col-delta*5)+1 => charsel <= charU;
             when (r_col-delta*5)+2 => charsel <= charN;
             when (r_col-delta*5)+3 => charsel <= charT;
             when (r_col-delta*5)+4 => charsel <= charE;
             when (r_col-delta*5)+5 => charsel <= charR;
             
             when others =>
                charsel <= CH_SPACE;
         end case;
	 
      when pc_row =>  -- PC

         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= LAMP;
         end if;
	 
         case conv_integer (char_col) is

         when r_col - delta*17 =>
            charsel <= cb_lamp & CPUstate (CPUdf);
         when r_col - delta*16 =>
            charsel <= cb_lamp & CPUstate (CPUdf-1);
         when r_col - delta*15 =>
            charsel <= cb_lamp & CPUstate (CPUdf-2);

         when r_col - delta*14 =>
            charsel <= cb_lamp & CPUstate (CPUif);
         when r_col - delta*13 =>
            charsel <= cb_lamp & CPUstate (CPUif-1);
         when r_col - delta*12 =>
            charsel <= cb_lamp & CPUstate (CPUif-2);

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

         when o_col + 0 => ccolor <= LAMP; case CPUstate (CPUir downto CPUir-2) is when "000" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 2 => ccolor <= LAMP; charsel <= charA;
         when o_col + 3 => ccolor <= TEXT; charsel <= charN;
         when o_col + 4 => ccolor <= TEXT; charsel <= charD;
         when o_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;

         when s_col + 0 => ccolor <= LAMP; case CPUstate (CPUetat downto CPUetat-3) is when CPU_Idle => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 2 => ccolor <= LAMP; charsel <= charI;
         when s_col + 3 => ccolor <= TEXT; charsel <= charD;
         when s_col + 4 => ccolor <= TEXT; charsel <= charL;
         when s_col + 5 => ccolor <= TEXT; charsel <= charE;
         when s_col + 6 => ccolor <= TEXT; charsel <= CH_SPACE;

         when i_col + 0 => ccolor <= LAMP; charsel <= cb_lamp & CPUstate (CPUrun);
         when i_col + 2 => ccolor <= LAMP; charsel <= charR;
         when i_col + 3 => ccolor <= TEXT; charsel <= charU;
         when i_col + 4 => ccolor <= TEXT; charsel <= charN;
         when i_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;

      when lac_row - 2 =>  -- LAC title

	 case conv_integer (char_col) is 
	 
	 when r_col - delta*12 -2 => charsel <= charL;
	 when r_col - delta*12 -1 => charsel <= charI;
	 when r_col - delta*12 -0 => charsel <= charN;
	 when r_col - delta*12 +1 => charsel <= charK;
	    
	 when (r_col - delta * 6) - 4 => charsel <= charA;
	 when (r_col - delta * 6) - 3 => charsel <= charC;
	 when (r_col - delta * 6) - 2 => charsel <= charC;
	 when (r_col - delta * 6) - 1 => charsel <= charU;
	 when (r_col - delta * 6) - 0 => charsel <= charM;
	 when (r_col - delta * 6) + 1 => charsel <= charU;
	 when (r_col - delta * 6) + 2 => charsel <= charL;
	 when (r_col - delta * 6) + 3 => charsel <= charA;
	 when (r_col - delta * 6) + 4 => charsel <= charT;
	 when (r_col - delta * 6) + 5 => charsel <= charO;
	 when (r_col - delta * 6) + 6 => charsel <= charR;

         when o_col + 0 => ccolor <= TEXT; case CPUstate (CPUir downto CPUir-2) is when "101" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when o_col + 2 => ccolor <= LAMP; charsel <= charJ;
         when o_col + 3 => ccolor <= TEXT; charsel <= charM;
         when o_col + 4 => ccolor <= TEXT; charsel <= charP;

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_OPR => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when s_col + 2 => ccolor <= LAMP; charsel <= charO;
         when s_col + 3 => ccolor <= TEXT; charsel <= charP;
         when s_col + 4 => ccolor <= TEXT; charsel <= charR;

         when i_col + 0 => ccolor <= TEXT; charsel <= cb_lamp & CPUstate (CPUui);
         when i_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when i_col + 2 => ccolor <= LAMP; charsel <= charT;
         when i_col + 3 => ccolor <= TEXT; charsel <= charR;
         when i_col + 4 => ccolor <= TEXT; charsel <= charA;
         when i_col + 5 => ccolor <= TEXT; charsel <= charP;
         when i_col + 6 => ccolor <= TEXT; charsel <= CH_SPACE;

	 when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when lac_row =>  -- LAC

         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= LAMP;
         end if;
      
         case conv_integer (char_col) is

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

         when o_col + 0 => ccolor <= TEXT; case CPUstate (CPUir downto CPUir-2) is when "110" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when o_col + 2 => ccolor <= LAMP; charsel <= charI;
         when o_col + 3 => ccolor <= TEXT; charsel <= charO;
         when o_col + 4 => ccolor <= TEXT; charsel <= charT;
         when o_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_IOT => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when s_col + 2 => ccolor <= LAMP; charsel <= charP;
         when s_col + 3 => ccolor <= TEXT; charsel <= charA;
         when s_col + 4 => ccolor <= TEXT; charsel <= charU;
         when s_col + 5 => ccolor <= TEXT; charsel <= charS;
         when s_col + 6 => ccolor <= TEXT; charsel <= charE;
         when s_col + 7 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;

      when mq_row - 2 =>  -- MQ title
         ccolor <= TEXT;

         case conv_integer (char_col) is

	 when r_col - delta *16 + 1 => charsel <= charS;
	 when r_col - delta *16 + 2 => charsel <= charT;
	 when r_col - delta *16 + 3 => charsel <= charE;
	 when r_col - delta *16 + 4 => charsel <= charP;

	 when r_col - delta *16 + 6 => charsel <= charC;
	 when r_col - delta *16 + 7 => charsel <= charO;
	 when r_col - delta *16 + 8 => charsel <= charU;
	 when r_col - delta *16 + 9 => charsel <= charN;
	 when r_col - delta *16 +10 => charsel <= charT;
	 when r_col - delta *16 +11 => charsel <= charE;
	 when r_col - delta *16 +12 => charsel <= charR;

	 when r_col - delta * 6 - 8 => charsel <= charM;
	 when r_col - delta * 6 - 7 => charsel <= charU;
	 when r_col - delta * 6 - 6 => charsel <= charL;
	 when r_col - delta * 6 - 5 => charsel <= charT;
	 when r_col - delta * 6 - 4 => charsel <= charI;
	 when r_col - delta * 6 - 3 => charsel <= charP;
	 when r_col - delta * 6 - 2 => charsel <= charL;
	 when r_col - delta * 6 - 1 => charsel <= charI;
	 when r_col - delta * 6 - 0 => charsel <= charE;
	 when r_col - delta * 6 + 1 => charsel <= charR;

	 when r_col - delta * 6 + 3 => charsel <= charQ;
	 when r_col - delta * 6 + 4 => charsel <= charU;
	 when r_col - delta * 6 + 5 => charsel <= charO;
	 when r_col - delta * 6 + 6 => charsel <= charT;
	 when r_col - delta * 6 + 7 => charsel <= charI;
	 when r_col - delta * 6 + 8 => charsel <= charE;
	 when r_col - delta * 6 + 9 => charsel <= charN;
	 when r_col - delta * 6 + 10 => charsel <= charT;

         when o_col + 0 => ccolor <= TEXT; case CPUstate (CPUir downto CPUir-2) is when "111" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when o_col + 2 => ccolor <= LAMP; charsel <= charO;
         when o_col + 3 => ccolor <= TEXT; charsel <= charP;
         when o_col + 4 => ccolor <= TEXT; charsel <= charR;

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_EAE1 => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when s_col + 2 => ccolor <= LAMP; charsel <= charE;
         when s_col + 3 => ccolor <= TEXT; charsel <= charA;
         when s_col + 4 => ccolor <= TEXT; charsel <= charE;
         when s_col + 5 => ccolor <= TEXT; charsel <= char1;

         when i_col + 0 => ccolor <= TEXT; charsel <= cb_lamp & CPUstate (CPUfault);
         when i_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when i_col + 2 => ccolor <= LAMP; charsel <= charF;
         when i_col + 3 => ccolor <= TEXT; charsel <= charA;
         when i_col + 4 => ccolor <= TEXT; charsel <= charU;
         when i_col + 5 => ccolor <= TEXT; charsel <= charL;
         when i_col + 6 => ccolor <= TEXT; charsel <= charT;
         when i_col + 7 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others => charsel <= CH_SPACE;
         
         end case;
	 
      when mq_row =>  -- MQ

         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= LAMP;
         end if;
      
         case conv_integer (char_col) is

	 when r_col - delta*16 => charsel <= cb_lamp & CPUstate (CPUsc);
         when r_col - delta*15 => charsel <= cb_lamp & CPUstate (CPUsc-1);
         when r_col - delta*14 => charsel <= cb_lamp & CPUstate (CPUsc-2);
         when r_col - delta*13 => charsel <= cb_lamp & CPUstate (CPUsc-3);
         when r_col - delta*12 => charsel <= cb_lamp & CPUstate (CPUsc-4);

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

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_EAEN => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 2 => ccolor <= LAMP; charsel <= charE;
         when s_col + 3 => ccolor <= TEXT; charsel <= charA;
         when s_col + 4 => ccolor <= TEXT; charsel <= charE;
         when s_col + 5 => ccolor <= TEXT; charsel <= charN;
         when s_col + 6 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;

      when ma_row - 2 =>  -- MA title

         case conv_integer (char_col) is
         
         when (r_col-delta*5)-8 => charsel <= charM; ccolor <= TEXT;
         when (r_col-delta*5)-7 => charsel <= charE;
         when (r_col-delta*5)-6 => charsel <= charM;
         when (r_col-delta*5)-5 => charsel <= charO;
         when (r_col-delta*5)-4 => charsel <= charR;
         when (r_col-delta*5)-3 => charsel <= charY;
         
         when (r_col-delta*5)-1 => charsel <= charA;
         when (r_col-delta*5)-0 => charsel <= charD;
         when (r_col-delta*5)+1 => charsel <= charD;
         when (r_col-delta*5)+2 => charsel <= charR;
         when (r_col-delta*5)+3 => charsel <= charE;
         when (r_col-delta*5)+4 => charsel <= charS;
         when (r_col-delta*5)+5 => charsel <= charS;

         when o_col - 1 => ccolor <= TEXT;
         when o_col + 0 => ccolor <= LAMP; case CPUstate (CPUir downto CPUir-2) is when "001" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 2 => ccolor <= LAMP; charsel <= charT;
         when o_col + 3 => ccolor <= TEXT; charsel <= charA;
         when o_col + 4 => ccolor <= TEXT; charsel <= charD;
         when o_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;

         when s_col + 0 => ccolor <= LAMP; case CPUstate (CPUetat downto CPUetat-3) is when CPU_Fetch => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 2 => ccolor <= LAMP; charsel <= charF;
         when s_col + 3 => ccolor <= TEXT; charsel <= charE;
         when s_col + 4 => ccolor <= TEXT; charsel <= charT;
         when s_col + 5 => ccolor <= TEXT; charsel <= charC;
         when s_col + 6 => ccolor <= TEXT; charsel <= charH;
         when s_col + 7 => ccolor <= TEXT; charsel <= CH_SPACE;

         when i_col + 0 => ccolor <= LAMP; charsel <= cb_lamp & CPUstate (CPUpie);
         when i_col + 2 => ccolor <= LAMP; charsel <= charI;
         when i_col + 3 => ccolor <= TEXT; charsel <= charO;
         when i_col + 4 => ccolor <= TEXT; charsel <= charN;
         when i_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;
	
        when others =>
	    charsel <= CH_SPACE;
	 end case;
	 
      when ma_row =>  -- MA

         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= LAMP;
         end if;
      
         case conv_integer (char_col) is

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

         when o_col + 0 => ccolor <= TEXT; case CPUstate (CPUir downto CPUir-2) is when "010" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 2 => ccolor <= LAMP; charsel <= charI;
         when o_col + 3 => ccolor <= TEXT; charsel <= charS;
         when o_col + 4 => ccolor <= TEXT; charsel <= charZ;
         when o_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_Decode => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 2 => ccolor <= LAMP; charsel <= charD;
         when s_col + 3 => ccolor <= TEXT; charsel <= charE;
         when s_col + 4 => ccolor <= TEXT; charsel <= charC;
         when s_col + 5 => ccolor <= TEXT; charsel <= charO;
         when s_col + 6 => ccolor <= TEXT; charsel <= charD;
         when s_col + 7 => ccolor <= TEXT; charsel <= charE;
         when s_col + 8 => ccolor <= TEXT; charsel <= CH_SPACE;

--       when i_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_IOT => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
--       when i_col + 2 => ccolor <= LAMP; charsel <= charP;
--       when i_col + 3 => ccolor <= TEXT; charsel <= charA;
--       when i_col + 4 => ccolor <= TEXT; charsel <= charU;
--       when i_col + 5 => ccolor <= TEXT; charsel <= charS;
--       when i_col + 6 => ccolor <= TEXT; charsel <= charE;
--       when i_col + 7 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;

      when mb_row - 2 =>  -- MB title

         case conv_integer (char_col) is

         when (r_col-delta*5)-8 => charsel <= charM;
         when (r_col-delta*5)-7 => charsel <= charE;
         when (r_col-delta*5)-6 => charsel <= charM;
         when (r_col-delta*5)-5 => charsel <= charO;
         when (r_col-delta*5)-4 => charsel <= charR;
         when (r_col-delta*5)-3 => charsel <= charY;
         
         when (r_col-delta*5)-1 => charsel <= charB;
         when (r_col-delta*5)-0 => charsel <= charU;
         when (r_col-delta*5)+1 => charsel <= charF;
         when (r_col-delta*5)+2 => charsel <= charF;
         when (r_col-delta*5)+3 => charsel <= charE;
         when (r_col-delta*5)+4 => charsel <= charR;

         when o_col + 0 => ccolor <= TEXT; case CPUstate (CPUir downto CPUir-2) is when "011" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when o_col + 2 => ccolor <= LAMP; charsel <= charD;
         when o_col + 3 => ccolor <= TEXT; charsel <= charC;
         when o_col + 4 => ccolor <= TEXT; charsel <= charA;

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_Indirect => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when s_col + 2 => ccolor <= LAMP; charsel <= charD;
         when s_col + 3 => ccolor <= TEXT; charsel <= charE;
         when s_col + 4 => ccolor <= TEXT; charsel <= charF;
         when s_col + 5 => ccolor <= TEXT; charsel <= charE;
         when s_col + 6 => ccolor <= TEXT; charsel <= charR;
         when s_col + 7 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;
         
      when mb_row =>  -- MB

         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= LAMP;
         end if;
      
         case conv_integer (char_col) is

         when r_col - delta*14 =>
--            if CPUstate (CPUmc-1) = '1' then
--               charsel <= charG;
--            elsif CPUstate (CPUmc) = '1' then
--               charsel <= charA;
--            else
--               charsel <= CH_SPACE;
--            end if;

--         when r_col - delta*13 =>
--            if CPUstate (CPUmc-2) = '1' then
--               charsel <= charD;
--            else
--               charsel <= CH_SPACE;
--            end if;

--         when r_col - delta*12 =>
--            if CPUstate (CPUmc-4) = '1' then
--               charsel <= charW;
--            elsif CPUstate (CPUmc-3) = '1' then
--               charsel <= charR;
--            else
--               charsel <= CH_SPACE;
--            end if;

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

         when o_col + 0 => ccolor <= TEXT; case CPUstate (CPUir downto CPUir-2) is when "100" => charsel <= cb_lamp & ir_display; when others => charsel <= cb_lamp & '0'; end case;
         when o_col + 2 => ccolor <= LAMP; charsel <= charJ;
         when o_col + 3 => ccolor <= TEXT; charsel <= charM;
         when o_col + 4 => ccolor <= TEXT; charsel <= charS;
         when o_col + 5 => ccolor <= TEXT; charsel <= CH_SPACE;

         when s_col + 0 => ccolor <= TEXT; case CPUstate (CPUetat downto CPUetat-3) is when CPU_Execute => charsel <= cb_lamp & '1'; when others => charsel <= cb_lamp & '0'; end case;
         when s_col + 2 => ccolor <= LAMP; charsel <= charE;
         when s_col + 3 => ccolor <= TEXT; charsel <= charX;
         when s_col + 4 => ccolor <= TEXT; charsel <= charE;
         when s_col + 5 => ccolor <= TEXT; charsel <= charC;
         when s_col + 6 => ccolor <= TEXT; charsel <= CH_SPACE;

         when i_col + 0 => ccolor <= TEXT; charsel <= cb_lamp & CPUstate (CPUuf);
         when i_col + 2 => ccolor <= LAMP; charsel <= charU;
         when i_col + 3 => ccolor <= TEXT; charsel <= charS;
         when i_col + 4 => ccolor <= TEXT; charsel <= charE;
         when i_col + 5 => ccolor <= TEXT; charsel <= charR;
         when i_col + 6 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;

      when eae_row - 2 =>  -- IO titles
         ccolor <= TEXT;
      
         case conv_integer (char_col) is

         when (r_col-delta*12)   => charsel <= charB;

         when (r_col-delta*6)-6 => charsel <= charE;
         when (r_col-delta*6)-5 => charsel <= charA;
         when (r_col-delta*6)-4 => charsel <= charE;

         when (r_col-delta*6)-2 => charsel <= charO;
         when (r_col-delta*6)-1 => charsel <= charP;

         when (r_col-delta*1)-1 => charsel <= charS;
         when (r_col-delta*1)+0 => charsel <= charT;
         when (r_col-delta*1)+1 => charsel <= charA;
	    
         when s_col + 0 => ccolor <= TEXT; charsel <= cb_lamp & CPUstate (CPUgrant);
         when s_col + 1 => ccolor <= LAMP; charsel <= CH_SPACE;
         when s_col + 2 => ccolor <= LAMP; charsel <= charB;
         when s_col + 3 => ccolor <= TEXT; charsel <= charR;
         when s_col + 4 => ccolor <= TEXT; charsel <= charE;
         when s_col + 5 => ccolor <= TEXT; charsel <= charA;
         when s_col + 6 => ccolor <= TEXT; charsel <= charK;
         when s_col + 7 => ccolor <= TEXT; charsel <= CH_SPACE;

         when others =>
            charsel <= CH_SPACE;
         end case;
      
      when eae_row =>  -- IO

         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= LAMP;
         end if;
      
         case conv_integer (char_col) is

         when r_col - delta*12 =>
            charsel <= cb_lamp & CPUstate (CPUem);
	    
         when r_col - delta*9 =>
            charsel <= cb_lamp & CPUstate (CPUeae);
         when r_col - delta*8 =>
            charsel <= cb_lamp & CPUstate (CPUeae-1);
         when r_col - delta*7 =>
            charsel <= cb_lamp & CPUstate (CPUeae-2);
         when r_col - delta*6 =>
            charsel <= cb_lamp & CPUstate (CPUeae-3);

         when r_col - delta*2 =>
            charsel <= cb_lamp & CPUstate (IOto-0);
         when r_col - delta*1 =>
            charsel <= cb_lamp & CPUstate (IOstatus-0);
         when r_col - delta*0 =>
            charsel <= cb_lamp & CPUstate (IOstatus-1);

         when others =>
            charsel <= CH_SPACE;
         end case;

      when keys_row-2 =>
      
         case conv_integer (char_col) is
	 
         when r_col + delta*2 + 1 => charsel <= charS;
         when r_col + delta*2 + 2 => charsel <= charI;
         
         when r_col + delta*4 + 1 => charsel <= charS;
         when r_col + delta*4 + 2 => charsel <= charS;
         
         when r_col - delta*6 - 5 =>
            ccolor <= GREEN;         charsel <= charS;
         when r_col - delta*6 - 4 => charsel <= charW;
         when r_col - delta*6 - 3 => charsel <= charI;
         when r_col - delta*6 - 2 => charsel <= charT;
         when r_col - delta*6 - 1 => charsel <= charC;
         when r_col - delta*6 + 0 => charsel <= charH;
         
         when r_col - delta*6 + 2 => charsel <= charR;
         when r_col - delta*6 + 3 => charsel <= charE;
         when r_col - delta*6 + 4 => charsel <= charG;
         when r_col - delta*6 + 5 => charsel <= charI;
         when r_col - delta*6 + 6 => charsel <= charS;
         when r_col - delta*6 + 7 => charsel <= charT;
         when r_col - delta*6 + 8 => charsel <= charE;
         when r_col - delta*6 + 9 => charsel <= charR;

	 when others =>
            charsel <= CH_SPACE;
	 end case;
	 
      when keys_row =>  -- KEYS
      
         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= SWITCH;
         end if;

         case conv_integer (char_col) is

         when r_col + delta*2 + 2 =>
            charsel <= cb_switch & SwitchHalt;

         when r_col + delta*4 + 2 =>
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

      when keys_row + 3 =>
         if pixel_col > hedge then
            ccolor <= BG1;
         else
            ccolor <= BG1; -- SWITCHES (suppress config display)
         end if;

         case conv_integer (char_col) is

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
         or (((conv_integer (pixel_row) > ((eae_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((eae_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8))) then
	    if conv_integer (pixel_col) = 0 then
	       bcolor <= BG1;
	    elsif conv_integer (pixel_col) = ((r_col -12 * delta) * 8) then
	       bcolor <= BG2;
	    end if;   
         elsif (((conv_integer (pixel_row) > ((ma_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((ma_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8)))
         or (((conv_integer (pixel_row) > ((pc_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((pc_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8)))
         or (((conv_integer (pixel_row) > ((mq_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((mq_row * 8) + 12))) and
	    (conv_integer (pixel_col) < ((r_col - 11 * delta)* 8))) then
	    if conv_integer (pixel_col) = 0 then
	       bcolor <= BG1;
	    elsif conv_integer (pixel_col) = ((r_col -14 * delta) * 8) then
	       bcolor <= BG2;
	    end if;   
         elsif ((conv_integer (pixel_row) > ((keys_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((keys_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((lac_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((lac_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((mq_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((mq_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((pc_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((pc_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((ma_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((ma_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((mb_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((mb_row * 8) + 12))) 
         or ((conv_integer (pixel_row) > ((eae_row * 8) - 4)) and 
	    (conv_integer (pixel_row) < ((eae_row * 8) + 12))) 
	 then 
	 
         case conv_integer (pixel_col) is
         when ((r_col - 2 * delta) * 8) |
              ((r_col - 8 * delta) * 8)  =>
	    bcolor <= BG2;

	 when 0 | 
	      ((r_col + 1 * delta) * 8) | 
	      ((r_col - 5 * delta) * 8) | 
	      ((r_col - 11 * delta) * 8) |
	      ((r_col - 17 * delta) * 8) =>
	    bcolor <= BG1;

	 when others =>

	 end case;
	 else
	    bcolor <= BG1;
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
      CPUcontrol(CPUlxa) <= '0';

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

         when '1' & KEY_LXA =>
            CPUcontrol(CPUlxa) <= '1';

         when '0' & KEY_7 =>
            switches <= switches(8 downto 0) & "111";

         when '0' & KEY_6 =>
            switches <= switches(8 downto 0) & "110";

         when '0' & KEY_5 =>
            switches <= switches(8 downto 0) & "101";

         when '0' & KEY_4 =>
            switches <= switches(8 downto 0) & "100";

         when '0' & KEY_3 =>
            switches <= switches(8 downto 0) & "011";

         when '0' & KEY_2 =>
            switches <= switches(8 downto 0) & "010";

         when '0' & KEY_1 =>
            switches <= switches(8 downto 0) & "001";

         when '0' & KEY_0 =>
            switches <= switches(8 downto 0) & "000";

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
