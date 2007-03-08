LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity chargen is
   Port (
      clk : in std_logic;
      charsel : in std_logic_vector (5 downto 0);
      colsel,
      rowsel : in std_logic_vector (2 downto 0);
      dout : out std_logic_vector (7 downto 0)
   );
end chargen;

architecture rtl of chargen is
  signal ena : std_logic;

  component RAMB4_S8
    generic (
      INIT_00, INIT_01, INIT_02, INIT_03, INIT_04, INIT_05,
      INIT_06, INIT_07, INIT_08, INIT_09, INIT_0A, INIT_0B,
      INIT_0C, INIT_0D, INIT_0E, INIT_0F : bit_vector (255 downto 0)
	:= x"0000000000000000000000000000000000000000000000000000000000000000"
    );

    port (
      clk, we, en, rst : in std_logic;
      addr : in std_logic_vector(8 downto 0);
      di : in std_logic_vector (0 to 7);
      do : out std_logic_vector (0 to 7)
    );
  end component RAMB4_S8;

begin

  RAM0 : RAMB4_S8
    generic map (
		 --|    '3'        |     '2'       |     1 = '1'   |    0 = '0'
      INIT_00 => x"3c66607860663c007e060c3060663c007e1818181c1818003c66666666663c00",
		 --|    '7'        |     '6'       |     '5'       |      '4'
      INIT_01 => x"1818181830667e003c66663e06663c003c6660603e067e0060607e6668706000",
		 --|    'B'        |     'A'       |     '9'       |      '8'
      INIT_02 => x"3e66663e66663e006666667e66663c003c66607c66663c003c66663c66663c00",
		 --|    'F'        |     'E'       |     'D'       |      'C'
      INIT_03 => x"0606063e06067e007e06063e06067e003e66666666663e003c66060606663c00",
		 --|    'J'        |     'I'       |     'H'       |      'G'
      INIT_04 => x"0c1a181818187e003c18181818183c006666667e666666003c66667606663c00",
		 --|    'N'        |     'M'       |     'L'       |      'K'
      INIT_05 => x"6676766e6e6e66006666667e7e6642007e060606060606006666361e1e366600",
		 --|    'R'        |     'Q'       |     'P'       |      'O'
      INIT_06 => x"66361e3e66663e005c36766666663c000606063e66663e003c66666666663c00",
		 --|    'V'        |     'U'       |     'T'       |      'S'
      INIT_07 => x"18183c3c666666003c666666666666001818181818187e003c62603c06463c00",
		 --|    'Z'        |     'Y'       |     'X'       |      'W'
      INIT_08 => x"7e060c1830607e001818183c3c66660066663c183c66660042667e7e66666600",
		 --|    '-'        |     '/'       |     '.'       |      ' '
      INIT_09 => x"0000007e0000000002060c183060400018180000000000000000000000000000",
		 --|    '3'        |     '2'       |     '1'       |      '0'
      INIT_0A => x"3e20203e20203e003e02023e20203e0020202020202020003e22222222223e00",
		 --|    '7'        |     '6'       |     '5'       |      '4'
      INIT_0B => x"2020202020203e003e22223e02023e003e20203e02023e002020203e22222200",
		 --|    ' '        |     ' '       |     '9'       |      '8'
      INIT_0C => x"008080ff0000000000000000000000003e02023e22223e003e22223e22223e00",
		 --|    ' '        |     ' '       |     ' '       |      ':'
      INIT_0D => x"63636363000000000303030300000000181818ff000000001818000018180000",
		 --| 3b = lamp on  | 3a = lamp off |  39 : sw on   | 38 : sw off
      INIT_0E => x"3c7e7e7e7e3c00000000001818000000003c7e7e7e7e000000000000007e0000",
		 --| 3f : blank    |  3e :    ' '  |  3d :   ' '   | 3c :   ' '
      INIT_0F => x"0000000000000000000000000000000000000000000000000000000000000000"
    )

    port map (
      clk => clk,
      we => '0',
      en => ena,
      rst => '0',
      di => "00000000",

      addr(2 downto 0) => rowsel,
      addr(8 downto 3) => charsel,

      do => dout
     );

   process (clk) is
   begin
      if clk'event and clk = '0' then
	 if (colsel = "000") then
	    ena <= '1';
	 else
	    ena <= '0';
	 end if;
      end if;
   end process;

end architecture rtl;

