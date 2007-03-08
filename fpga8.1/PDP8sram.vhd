library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee .std_logic_unsigned.all;

-- Version 0.05 : 5 October 2003

entity SRAM is
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- Memory Interface

      MEMrd : in std_logic;
      MEMwr : in std_logic;
      MEMaddr : in std_logic_vector (0 to 14);
      MEMwdata : in std_logic_vector (0 to 11);
      MEMdone : out std_logic;
      MEMrdata : out std_logic_vector (0 to 11);

      -- External interface

      CONFIG : in std_logic;
      speed : in std_logic_vector (0 to 2);
      
      SRAMoe : out std_logic;
      SRAMwe : out std_logic;
      SRAMaddr : out std_logic_vector (0 to 14);
      SRAMdata : inout std_logic_vector (0 to 15)
    );
end SRAM;


architecture rtl  of SRAM  is

   signal count : std_logic_vector (0 to 2);
   signal SRAMstate : std_logic_vector (0 to 1);
   
begin  -- rtl

   memrw : process (clk, reset)
   begin
      if reset = '0' then
	 SRAMstate <= "00";
         SRAMdata <= (others => 'Z');
         SRAMwe <= '1';
         SRAMoe <= '1';
	 
         MEMrdata <= (others => 'Z');
         MEMdone <= 'Z';
	 
      elsif clk'event and (clk = '1') then
      
         case SRAMstate is
	 
	 when "00" =>  -- idle
            if ((MEMrd xor MEMwr) = '1') and (MEMaddr (0 to 2) /= "000") then
	       if config = '1' then  -- full 32 Kw
                  SRAMaddr <= MEMaddr;
	          SRAMstate <= "01";
	       
	       else -- no extended memory memory
	          MEMrdata <= (others => '0');
	          SRAMstate <= "11";
		  
	       end if;
               if MEMwr = '0' then
                  SRAMdata <= MEMwdata (0 to 11) & "0000";
  	       end if;
	    end if;

	 when "01" =>
	    SRAMwe <= MEMwr;
	    SRAMoe <= MEMrd;
	    
            count <= speed;
            SRAMstate <= "10";
	    
	 when "10" =>   
	    if count = 0 then
               if MEMrd = '0' then
	          MEMrdata <= SRAMdata (0 to 11);
	       end if;
	       
	       SRAMstate <= "11";
	    else
	       count <= count - 1;
	    end if;

	 when "11" =>
            SRAMwe <= '1';
            SRAMoe <= '1';
            SRAMdata <= (others => 'Z');
	    
            if (MEMrd and MEMwr) = '1' then	    
               SRAMstate <= "00";
  	       Memdone <= 'Z';
   	       MEMrdata <= (others => 'Z');
	    else
               MEMdone <= '0';
	    end if;   
	       
	 when others =>
	    SRAMstate <= "00";
	    
         end case;      
      end if;
   end process memrw;
end rtl ;

