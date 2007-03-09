-- VGA Video Sync generation

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY VGASYNC IS
   generic (
      HSYNC, HFPORCH, HACTIVE, HBPORCH : positive;
 	   HPOLARITY : std_logic;

      VSYNC, VFPORCH, VACTIVE, VBPORCH : positive;
	   VPOLARITY : std_logic
   );

   port (
      clk : IN STD_LOGIC;

      VGAblank : OUT STD_LOGIC;
      VGAhsync : OUT STD_LOGIC;
      VGAvsync : OUT STD_LOGIC;
      pixel_row,
      pixel_column : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END VGASYNC;

ARCHITECTURE video OF VGASYNC IS
   SIGNAL
      V_blank,
      H_blank : STD_LOGIC;

   SIGNAL
      h_count,
      v_count : STD_LOGIC_VECTOR(9 DOWNTO 0);

   BEGIN
      VGAblank <= V_blank OR H_blank;  -- Blanking is V or H blank
      pixel_column <= h_count;
      pixel_row <= v_count;

   PROCESS -- Generate Horizontal and Vertical Timing Signals for Video Signal
   BEGIN
      WAIT UNTIL (clk'EVENT) AND (clk = '1');
        IF (h_count = (HACTIVE + HFPORCH + HSYNC + HBPORCH)) THEN
	   h_count <= "0000000000";
	   H_blank <= '0';
	   IF (v_count = (VACTIVE + VFPORCH + VSYNC + VBPORCH)) THEN
	      v_count <= "0000000000";
	      V_blank <= '0';
	   ELSE
             if v_count = VACTIVE then
                V_blank <= '1';
	     end if;

             if v_count = (VACTIVE + VFPORCH) then
	        VGAvsync <= not VPOLARITY;
	     end if;

	     if v_count = (VACTIVE + VFPORCH + VSYNC) then
	        VGAvsync <= VPOLARITY;
	     end if;

             v_count <= v_count + 1;
	   END IF;
	ELSE
	   if h_count = HACTIVE then
	      H_blank <= '1';
	   end if;

           if h_count = (HACTIVE + HFPORCH) then
	      VGAhsync <= not HPOLARITY;
	   end if;

	   if h_count = (HACTIVE + HFPORCH + HSYNC) then
	      VGAhsync <= HPOLARITY;
	   end if;

           h_count <= h_count + 1;
	END IF;
   END PROCESS;
END video;


