library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PDP8mem is
    Port (
       clk : in std_logic;
       reset : in std_logic;

       MEMrd : in std_logic;
       MEMwr : in std_logic;
       MEMdone : out std_logic;
       MEMaddr : in std_logic_vector (0 to 14);
       MEMwdata : in std_logic_vector (0 to 11);
       MEMrdata : out std_logic_vector (0 to 11);

       MEMromselect : in std_logic_vector (2 downto 0)
    );
end PDP8mem;

architecture rtl of PDP8mem is
   signal we : std_logic;
	signal zero_nibble : std_logic_vector(3 downto 0);

   signal dout0 : std_logic_vector (0 to 11);
   signal dout1 : std_logic_vector (0 to 11);
   signal dout2 : std_logic_vector (0 to 11);
   signal dout3 : std_logic_vector (0 to 11);

   signal romout : std_logic_vector (0 to 15);

   signal ena0 : std_logic;
   signal ena1 : std_logic;
   signal ena2 : std_logic;
   signal ena3 : std_logic;
   signal enarom : std_logic;
   signal romaddr : std_logic_vector (7 downto 0);

   signal MEMpending : std_logic;

   component RAMB4_S16
    generic (
      INIT_00, INIT_01, INIT_02, INIT_03, INIT_04, INIT_05,
      INIT_06, INIT_07, INIT_08, INIT_09, INIT_0A, INIT_0B,
      INIT_0C, INIT_0D, INIT_0E, INIT_0F : bit_vector (255 downto 0)
        := x"0000000000000000000000000000000000000000000000000000000000000000"
    );

    port (
      clk, we, en, rst : in std_logic;
      addr : in std_logic_vector(7 downto 0);
      di : in std_logic_vector(15 downto 0);
      do : out std_logic_vector(15 downto 0)
    );
  end component RAMB4_S16;


  component RAMB4_S4
    generic (
      INIT_00, INIT_01, INIT_02, INIT_03, INIT_04, INIT_05,
      INIT_06, INIT_07, INIT_08, INIT_09, INIT_0A, INIT_0B,
      INIT_0C, INIT_0D, INIT_0E, INIT_0F : bit_vector (255 downto 0)
        := x"0000000000000000000000000000000000000000000000000000000000000000"
    );

    port (
      clk, we, en, rst : in std_logic;
      addr : in std_logic_vector(9 downto 0);
      di : in std_logic_vector(3 downto 0);
      do : out std_logic_vector(3 downto 0)
    );
  end component RAMB4_S4;

begin

  RAM00 : RAMB4_S4
    generic map ( INIT_00 => x"00000000000000000000000000000000000000000000000000000000000000fb" )
--  generic map ( INIT_00 => x"0000000000000000000000000000000b4a426360000000aafea4F8eafea4F8ee" )
    port map (clk => clk, en => ena0, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
      di(3 downto 0) => MEMwdata(0 to 3), do(3 downto 0) => dout0(0 to 3) );

  RAM01 : RAMB4_S4
    generic map ( INIT_00 => x"00000000000000000000000000000000000000000000000000000000000000C0" )
--  generic map ( INIT_00 => x"0000000000000000000000000000000111222120000000001001C1001001C158" )
    port map ( clk => clk, en => ena0, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(4 to 7), do(3 downto 0) => dout0(4 to 7) );

  RAM02 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000001" )
--  generic map ( INIT_00 => x"000000000000000000000000000000088d2128100000002a04a2086208220800" )
    port map ( clk => clk, en => ena0, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(8 to 11), do(3 downto 0) => dout0(8 to 11) );


  RAM10 : RAMB4_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map (clk => clk, en => ena1, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(0 to 3), do(3 downto 0) => dout1(0 to 3) );

  RAM11 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk, en => ena1, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(4 to 7), do(3 downto 0) => dout1(4 to 7) );

  RAM12 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk, en => ena1, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(8 to 11), do(3 downto 0) => dout1(8 to 11) );


  RAM20 : RAMB4_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk, en => ena2, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
      di(3 downto 0) => MEMwdata(0 to 3), do(3 downto 0) => dout2(0 to 3) );

  RAM21 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk, en => ena2, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(4 to 7), do(3 downto 0) => dout2(4 to 7) );

  RAM22 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk, en => ena2, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(8 to 11), do(3 downto 0) => dout2(8 to 11) );


  RAM30 : RAMB4_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk, en => ena3, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
      di(3 downto 0) => MEMwdata(0 to 3), do(3 downto 0) => dout3(0 to 3) );

  RAM31 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk, en => ena3, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(4 to 7), do(3 downto 0) => dout3(4 to 7) );

  RAM32 : RAMB4_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk, en => ena3, we => we, rst => '0', addr(9 downto 0) => MEMaddr(5 to 14),
       di(3 downto 0) => MEMwdata(8 to 11), do(3 downto 0) => dout3(8 to 11) );

  ROM : RAMB4_S16
     generic map (
        -- Rom  0  :   7700 : left right scan
        --             7740 : AC counter
        --             7756 : TTY RIM loader
                      --|17 |16 |15 |14 |13 |12 |11 |10 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
           INIT_00 => x"00000ac30ac90f100e040FC008d00e060ac30f100e080FC008d00e500f280f84",
                     -- |37 |36 |35 |34 |33 |32 |31 |30 |27 |26 |25 |24 |23 |22 |21 |20 |
           INIT_01 => x"00000000000000000bd004d00ad504dd0ad504de0e0002dc06dd03d006dc0000",
                     -- |57 |56 |55 |54 |53 |52 |51 |50 |47 |46 |45 |44 |43 |42 |41 |40 |
           INIT_02 => x"0c090c0c00000000000000000000000000000000000000000ae00ae104e40e01",
                     -- |77 |76 |75 |74 |73 |72 |71 |70 |67 |66 |65 |64 |63 |62 |61 |60 |
           INIT_03 => x"000000000aef06fe07fe0f100c0e0af70c090e060afc0f480e060e460c0e0aef")

--    port map ( clk => clk, en => enarom, we => we, rst => '0', addr => romaddr,
--       di(15 downto 12) => x"0", di(11 downto 0) => MEMwdata (0 to 11), do => romout(0 to 15) );

    port map ( clk => clk, en => enarom, we => we, rst => '0', addr => romaddr,
       di(11 downto 0) => MEMwdata (0 to 11), di(15 downto 12) => zero_nibble, 
       do(11 downto 0) => romout(0 to 11), do(15 downto 12) => open);

   romaddr <= "00" & MEMaddr(9 to 14);

rdwr : process (clk, reset) is
   begin
	zero_nibble <= x"0";
      if reset = '0' then
         MEMpending <= '0';

         ena0 <= '0';
         ena1 <= '0';
         ena2 <= '0';
         ena3 <= '0';
         enarom <= '0';
         we <= '0';
         MEMdone <= 'Z';
	 MEMrdata <= (others => 'Z');

      elsif clk'event AND (clk = '0') then
         if MEMpending = '1' then
            MEMdone <= '0';
            if ena0 = '1' then
               MEMrdata <= dout0;
            elsif ena1 = '1' then
               MEMrdata <= dout1;
            elsif ena2 = '1' then
               MEMrdata <= dout2;
            elsif ena3 = '1' then
               MEMrdata <= dout3;
            elsif enarom = '1' then
               MEMrdata <= romout(0 to 11);
            else
               MEMrdata <= o"7402";
            end if;

            we <= '0';

            if (MEMrd and MEMwr) = '1' then
               MEMpending <= '0';
	       ena0 <= '0';
	       ena1 <= '0';
	       ena2 <= '0';
	       ena3 <= '0';
	       enarom <= '0';
               MEMdone <= 'Z';
               MEMrdata <= (others => 'Z');
            end if;
         elsif ((MEMrd xor MEMwr) = '1') and (MEMaddr(0 to 2) = "000") then
            case MEMaddr(3 to 4) is
            when "00" =>
               ena0 <= '1';
            when "01" =>
               ena1 <= '1';
            when "10" =>
               ena2 <= '1';
            when "11" =>
               if (MEMaddr(5 to 8) = "1111") then -- and (MEMromselect(2) = '1') then
                  enarom <= '1';
               else
                  ena3 <= '1';
               end if;
            when others =>
            end case;

            MEMpending <= '1';
            we <= not MEMwr;
         end if;
      end if;
   end process rdwr;

end architecture rtl;

