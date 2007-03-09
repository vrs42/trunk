library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PS2kb is

  Port (
    reset,
    clk_25Mhz,
    kb_data,
    kb_clk : in std_logic;
    kb_done : out std_logic;
    kb_scancode  : out std_logic_vector (9 downto 0);
    kb_led : in std_logic_vector(0 to 2)
  );

end PS2kb;

architecture kbscan of PS2kb is

   constant cbuff : integer := 4;
   constant cvalue : std_logic_vector (0 to cbuff) := (0 => '1', others => '0');
   
   signal parity : std_logic;
   signal rlsflag : std_logic;
   signal augflag : std_logic;
   signal last_clk : std_logic_vector (0 to cbuff);
   signal scanshift : std_logic_vector (9 downto 0);

   signal reading : std_logic := '1';
   signal led_state : std_logic_vector(0 to 2);
   
begin

   scan : process (clk_25Mhz, reset)
   begin
      if (reset = '0') then
	 last_clk <= (others => '1');
	 kb_done <= '0';
	 parity <= '0';
	 augflag <= '0';
	 rlsflag <= '0';
	 scanshift <= "1111111111";
      elsif clk_25Mhz'event and (clk_25Mhz = '1') then

	 last_clk <= last_clk (1 to cbuff) & kb_clk;

	 if (kb_clk = '0') and (last_clk = cvalue) then
	    if reading = '1' then
	       if scanshift(0) = '0' then -- end of character frame
	          if (kb_data and parity) = '1' then -- stop bit and parity OK
		     if scanshift(8 downto 1) = X"F0" then
		        rlsflag <= '1';
		     elsif scanshift(8 downto 1) = X"E0" then
		        augflag <= '1';
		     else
		        kb_done <= '1';
                        kb_scancode <=  rlsflag & augflag & scanshift (8 downto 1);
		        augflag <= '0';
		        rlsflag <= '0';
		     end if;
	          else  -- ignore on parity error
	             augflag <= '0';
		     rlsflag <= '0';
	          end if;

	          parity <= '0';

		  if led_state /= kb_led then
	             reading <= '0';
		     scanshift <= "0111101101";  -- command code 0xED
		  else
     	             scanshift <= (others => '1');
	          end if;   

	       else -- shift bit in
	          kb_done <= '0';
	          parity <= parity xor kb_data;
	          scanshift <= kb_data & scanshift (9 downto 1);
	       end if;
	    else -- sending
	       if led_state /= kb_led then
	          scanshift <= '1' & not (kb_led(0) xor kb_led(1) xor kb_led(2)) & "00000" & led_state; 
		  led_state <= kb_led;
	       else
	          reading <= '1';
   	          scanshift <= (others => '1');
	       end if;
	    end if;
	 end if;
      end if;

   end process;
end kbscan;
