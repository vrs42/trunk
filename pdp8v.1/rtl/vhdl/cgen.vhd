LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

package cgen is

constant char0 : std_logic_vector (5 downto 0) := "000000";
constant char1 : std_logic_vector (5 downto 0) := "000001";
constant char2 : std_logic_vector (5 downto 0) := "000010";
constant char3 : std_logic_vector (5 downto 0) := "000011";
constant char4 : std_logic_vector (5 downto 0) := "000100";
constant char5 : std_logic_vector (5 downto 0) := "000101";
constant char6 : std_logic_vector (5 downto 0) := "000110";
constant char7 : std_logic_vector (5 downto 0) := "000111";
constant char8 : std_logic_vector (5 downto 0) := "001000";
constant char9 : std_logic_vector (5 downto 0) := "001001";

constant charA : std_logic_vector (5 downto 0) := "001010";
constant charB : std_logic_vector (5 downto 0) := "001011";
constant charC : std_logic_vector (5 downto 0) := "001100";
constant charD : std_logic_vector (5 downto 0) := "001101";
constant charE : std_logic_vector (5 downto 0) := "001110";
constant charF : std_logic_vector (5 downto 0) := "001111";
constant charG : std_logic_vector (5 downto 0) := "010000";
constant charH : std_logic_vector (5 downto 0) := "010001";
constant charI : std_logic_vector (5 downto 0) := "010010";
constant charJ : std_logic_vector (5 downto 0) := "010011";
constant charK : std_logic_vector (5 downto 0) := "010100";
constant charL : std_logic_vector (5 downto 0) := "010101";
constant charM : std_logic_vector (5 downto 0) := "010110";
constant charN : std_logic_vector (5 downto 0) := "010111";
constant charO : std_logic_vector (5 downto 0) := "011000";
constant charP : std_logic_vector (5 downto 0) := "011001";
constant charQ : std_logic_vector (5 downto 0) := "011010";
constant charR : std_logic_vector (5 downto 0) := "011011";
constant charS : std_logic_vector (5 downto 0) := "011100";
constant charT : std_logic_vector (5 downto 0) := "011101";
constant charU : std_logic_vector (5 downto 0) := "011110";
constant charV : std_logic_vector (5 downto 0) := "011111";
constant charW : std_logic_vector (5 downto 0) := "100000";
constant charX : std_logic_vector (5 downto 0) := "100001";
constant charY : std_logic_vector (5 downto 0) := "100010";
constant charZ : std_logic_vector (5 downto 0) := "100011";

constant ch_space : std_logic_vector (5 downto 0) := "100100";
constant ch_dot : std_logic_vector (5 downto 0) := "100101";
constant ch_slash : std_logic_vector (5 downto 0) := "100110";
constant ch_dash  : std_logic_vector (5 downto 0) := "100111";

constant ch_colon : std_logic_vector (5 downto 0) := "110100";

constant ch_tee   : std_logic_vector (5 downto 0) := "110101";
constant ch_lend  : std_logic_vector (5 downto 0) := "110110";
constant ch_rend  : std_logic_vector (5 downto 0) := "110111";


constant odigit : std_logic_vector (2 downto 0) := "101";

constant cb_lamp : std_logic_vector (5 downto 1) := "11101";
constant cb_switch : std_logic_vector (5 downto 1) := "11100";




end package cgen;
