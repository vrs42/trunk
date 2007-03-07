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

  constant width   : integer := 8;
  constant memsize : integer := 512;
  signal rvect : std_logic_vector(255 downto 0);
  signal rdata : std_logic_vector(width-1 downto 0);
  signal addr  : std_logic_vector(8 downto 0);

  type rom_array is array(0 to 15) of std_logic_vector (255 downto 0);

  constant rom_data : rom_array :=
  ( 
      --|    '3'        |     '2'       |     1 = '1'   |    0 = '0'
      x"3c66607860663c007e060c3060663c007e1818181c1818003c66666666663c00",
      --|    '7'        |     '6'       |     '5'       |      '4'
      x"1818181830667e003c66663e06663c003c6660603e067e0060607e6668706000",
      --|    'B'        |     'A'       |     '9'       |      '8'
      x"3e66663e66663e006666667e66663c003c66607c66663c003c66663c66663c00",
      --|    'F'        |     'E'       |     'D'       |      'C'
      x"0606063e06067e007e06063e06067e003e66666666663e003c66060606663c00",
      --|    'J'        |     'I'       |     'H'       |      'G'
      x"0c1a181818187e003c18181818183c006666667e666666003c66667606663c00",
      --|    'N'        |     'M'       |     'L'       |      'K'
      x"6676766e6e6e66006666667e7e6642007e060606060606006666361e1e366600",
      --|    'R'        |     'Q'       |     'P'       |      'O'
      x"66361e3e66663e005c36766666663c000606063e66663e003c66666666663c00",
      --|    'V'        |     'U'       |     'T'       |      'S'
      x"18183c3c666666003c666666666666001818181818187e003c62603c06463c00",
      --|    'Z'        |     'Y'       |     'X'       |      'W'
      x"7e060c1830607e001818183c3c66660066663c183c66660042667e7e66666600",
      --|    '-'        |     '/'       |     '.'       |      ' '
      x"0000007e0000000002060c183060400018180000000000000000000000000000",
      --|    '3'        |     '2'       |     '1'       |      '0'
      x"3e20203e20203e003e02023e20203e0020202020202020003e22222222223e00",
      --|    '7'        |     '6'       |     '5'       |      '4'
      x"2020202020203e003e22223e02023e003e20203e02023e002020203e22222200",
      --|    ' '        |     ' '       |     '9'       |      '8'
      x"008080ff0000000000000000000000003e02023e22223e003e22223e22223e00",
      --|    ' '        |     ' '       |     ' '       |      ':'
      x"63636363000000000303030300000000181818ff000000001818000018180000",
      --| 3b = lamp on  | 3a = lamp off |  39 : sw on   | 38 : sw off
      x"3c7e7e7e7e3c00000000001818000000003c7e7e7e7e000000000000007e0000",
      --| 3f : blank    |  3e :    ' '  |  3d :   ' '   | 3c :   ' '
      x"0000000000000000000000000000000000000000000000000000000000000000"
  );
begin

  process (clk, colsel, rowsel, charsel, rvect) is
  variable rvect_index : integer;
  variable i : integer;
    begin
    addr(2 downto 0) <= rowsel;
    addr(8 downto 3) <= charsel;
    rvect <= rom_data(conv_integer(addr(8 downto 5))); 
	 rvect_index := conv_integer(addr(4 downto 0))*width;
    rdata <= rvect( rvect_index+width-1 downto rvect_index);

    if clk'event and clk = '0' then
      if (colsel = "000") then
		  for i in 0 to width-1	loop
          dout(i) <= rdata(width-1-i);
        end loop;
      end if;
    end if;
  end process;

end architecture rtl;

