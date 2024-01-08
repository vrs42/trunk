-- 'Bucket Brigade' FIFO  
-- 16 deep
-- 8-bit data
--
-- Version : 1.00
-- Version Date : 14th October 2002
--
-- Start of design entry : 14th October 2002
--
-- Ken Chapman
-- Xilinx Ltd
-- Benchmark House
-- 203 Brooklands Road
-- Weybridge
-- Surrey KT13 ORH
-- United Kingdom
--
-- chapman@xilinx.com
--
-- Made width generic - jim kearney 1/29/2003
--
------------------------------------------------------------------------------------
--
-- NOTICE:
--
-- Copyright Xilinx, Inc. 2002.   This code may be contain portions patented by other 
-- third parites.  By providing this core as one possible implementation of a standard,
-- Xilinx is making no representation that the provided implementation of this standard 
-- is free from any claims of infringement by any third party.  Xilinx expressly 
-- disclaims any warranty with respect to the adequacy of the implementation, including 
-- but not limited to any warranty or representation that the implementation is free 
-- from claims of any third party.  Futhermore, Xilinx is providing this core as a 
-- courtesy to you and suggests that you contact all third parties to obtain the 
-- necessary rights to use this implementation.
--
------------------------------------------------------------------------------------
--
-- Library declarations
--
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library unisim;
use unisim.vcomponents.all;
--
------------------------------------------------------------------------------------
--
-- Main Entity for BBFIFO_16xN
--
entity bbfifo_16xN is
    Generic (      WIDTH : integer := 8 );
    Port (       data_in : in std_logic_vector(WIDTH-1 downto 0);
                data_out : out std_logic_vector(WIDTH-1 downto 0);
                   reset : in std_logic;               
                   write : in std_logic; 
                    read : in std_logic;
                    full : out std_logic;
               half_full : out std_logic;
            data_present : out std_logic;
                     clk : in std_logic);
    end bbfifo_16xN;
--
------------------------------------------------------------------------------------
--
-- Start of Main Architecture for BBFIFO_16xN
--	 
architecture low_level_definition of bbfifo_16xN is
--
------------------------------------------------------------------------------------
--
------------------------------------------------------------------------------------
--
-- Signals used in BBFIFO_16xN
--
------------------------------------------------------------------------------------
--
signal pointer             : std_logic_vector(3 downto 0);
signal next_count          : std_logic_vector(3 downto 0);
signal half_count          : std_logic_vector(3 downto 0);
signal count_carry         : std_logic_vector(2 downto 0);

signal pointer_zero        : std_logic;
signal pointer_full        : std_logic;
signal decode_data_present : std_logic;
signal data_present_int    : std_logic;
signal valid_write         : std_logic;
--
--
------------------------------------------------------------------------------------
--
-- Attributes to define LUT contents during implementation 
-- The information is repeated in the generic map for functional simulation--
--
------------------------------------------------------------------------------------
--
attribute INIT : string; 
attribute INIT of zero_lut      : label is "0001";
attribute INIT of full_lut      : label is "8000";
attribute INIT of dp_lut        : label is "BFA0";
attribute INIT of valid_lut     : label is "C4";
--
------------------------------------------------------------------------------------
--
-- Start of BBFIFO_16xN circuit description
--
------------------------------------------------------------------------------------
--	
begin

  -- SRL16E data storage

  data_width_loop: for i in 0 to WIDTH-1 generate
  --
  attribute INIT : string; 
  attribute INIT of data_srl : label is "0000"; 
  --
  begin

     data_srl: SRL16E
     --translate_off
     generic map (INIT => X"0000")
     --translate_on
     port map(   D => data_in(i),
                CE => valid_write,
               CLK => clk,
                A0 => pointer(0),
                A1 => pointer(1),
                A2 => pointer(2),
                A3 => pointer(3),
                 Q => data_out(i) );

  end generate data_width_loop;
 
  -- 4-bit counter to act as data pointer
  -- Counter is clock enabled by 'data_present'
  -- Counter will be reset when 'reset' is active
  -- Counter will increment when 'valid_write' is active

  count_width_loop: for i in 0 to 3 generate
  --
  attribute INIT : string; 
  attribute INIT of count_lut : label is "6606"; 
  --
  begin

     register_bit: FDRE
     port map ( D => next_count(i),
                Q => pointer(i),
               CE => data_present_int,
                R => reset,
                C => clk);

     count_lut: LUT4
     --translate_off
     generic map (INIT => X"6606")
     --translate_on
     port map( I0 => pointer(i),
               I1 => read,
               I2 => pointer_zero,
               I3 => write,
                O => half_count(i));

     lsb_count: if i=0 generate
     begin

       count_muxcy: MUXCY
       port map( DI => pointer(i),
                 CI => valid_write,
                  S => half_count(i),
                  O => count_carry(i));
       
       count_xor: XORCY
       port map( LI => half_count(i),
                 CI => valid_write,
                  O => next_count(i));

     end generate lsb_count;

     mid_count: if i>0 and i<3 generate
     begin

       count_muxcy: MUXCY
       port map( DI => pointer(i),
                 CI => count_carry(i-1),
                  S => half_count(i),
                  O => count_carry(i));
       
       count_xor: XORCY
       port map( LI => half_count(i),
                 CI => count_carry(i-1),
                  O => next_count(i));

     end generate mid_count;

     upper_count: if i=3 generate
     begin

       count_xor: XORCY
       port map( LI => half_count(i),
                 CI => count_carry(i-1),
                  O => next_count(i));

     end generate upper_count;

  end generate count_width_loop;


  -- Detect when pointer is zero and maximum

  zero_lut: LUT4
  --translate_off
    generic map (INIT => X"0001")
  --translate_on
  port map( I0 => pointer(0),
            I1 => pointer(1),
            I2 => pointer(2),
            I3 => pointer(3),
             O => pointer_zero );


  full_lut: LUT4
  --translate_off
    generic map (INIT => X"8000")
  --translate_on
  port map( I0 => pointer(0),
            I1 => pointer(1),
            I2 => pointer(2),
            I3 => pointer(3),
             O => pointer_full );


  -- Data Present status

  dp_lut: LUT4
  --translate_off
    generic map (INIT => X"BFA0")
  --translate_on
  port map( I0 => write,
            I1 => read,
            I2 => pointer_zero,
            I3 => data_present_int,
             O => decode_data_present );

  dp_flop: FDR
  port map ( D => decode_data_present,
             Q => data_present_int,
             R => reset,
             C => clk);

  -- Valid write signal

  valid_lut: LUT3
  --translate_off
    generic map (INIT => X"C4")
  --translate_on
  port map( I0 => pointer_full,
            I1 => write,
            I2 => read,
             O => valid_write );


  -- assign internal signals to outputs

  full <= pointer_full;  
  half_full <= pointer(3);  
  data_present <= data_present_int;

end low_level_definition;

------------------------------------------------------------------------------------
--
-- END OF FILE BBFIFO_16xN.VHD
--
------------------------------------------------------------------------------------


