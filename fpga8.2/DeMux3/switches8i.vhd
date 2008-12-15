LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

-- Version 1.00 : 23 June 2008

entity switchesDeMux is
  generic (
      SYSCLKFREQ : integer;
      SSCKFREQ   : integer := 100
   );

  port (
      clk   : in std_logic;
      reset : in std_logic;

      -- Switches Interface

      SSER_N : in  std_logic; -- Switches Data
      SSCK   : out std_logic; -- Switches Clock
      SCL_N  : out std_logic; -- Reset switch shift register

      -- Registers to read from switches.

      SDF    : out std_logic_vector( 2 downto 0);
      SIF    : out std_logic_vector( 2 downto 0);
      SR     : out std_logic_vector(11 downto 0);
      PC     : out std_logic_vector(11 downto 0);
      START  : out std_logic;
      LADDR  : out std_logic;
      DEP    : out std_logic;
      EXAM   : out std_logic;
      CONT   : out std_logic;
      STOP   : out std_logic;
      SS     : out std_logic;
--    SI     : out std_logic; -- SI is implmented with STOP
      CONF   : out std_logic_vector(0 to 5)
   );
end switchesDeMux;

architecture behavioral of switchesDeMux is

   constant switchBits : integer := 8*4; -- 32 bits
--   constant FREQDIV    : integer := SYSCLKFREQ / (32*SSCKFREQ); -- BUGBUG: Why doesn't this work?
   constant FREQDIV    : integer := 10000;
   
   -- The external hardware presents SCF5 first, and SDF0 last.
   constant SDF0   : integer := 0;
   constant SDF1   : integer := 1;
   constant SDF2   : integer := 2;
   constant SIF0   : integer := 3;
   constant SIF1   : integer := 4;
   constant SIF2   : integer := 5;
   constant SSR0   : integer := 6;
   constant SSR1   : integer := 7;

   constant SSR2   : integer := 8;
   constant SSR3   : integer := 9;
   constant SSR4   : integer := 10;
   constant SSR5   : integer := 11;
   constant SSR6   : integer := 12;
   constant SSR7   : integer := 13;
   constant SSR8   : integer := 14;
   constant SSR9   : integer := 15;
   
   constant SSR10  : integer := 16;
   constant SSR11  : integer := 17;
   constant SSTART : integer := 18;
   constant SLADDR : integer := 19;
   constant SDEP   : integer := 20;
   constant SEXAM  : integer := 21;
   constant SCONT  : integer := 22;
   constant SSTOP  : integer := 23;

   constant SSS    : integer := 24;
   constant SSI    : integer := 25;
   constant SCF0   : integer := 26;
   constant SCF1   : integer := 27;
   constant SCF2   : integer := 28;
   constant SCF3   : integer := 29;
   constant SCF4   : integer := 30;
   constant SCF5   : integer := 31;

   signal switches    : std_logic_vector(0 to switchBits-1);
   signal SSCKCounter : integer := 0;
   signal counter     : integer := 0;
   signal ISI         : std_logic;
   signal ISS         : std_logic;
   signal ISTOP       : std_logic;
   signal OEXAM       : std_logic;
   signal ODEP        : std_logic;
   signal OSTART      : std_logic;
   signal OCONT       : std_logic;
   signal IEXAM       : std_logic;
   signal IDEP        : std_logic;
   signal ISTART      : std_logic;
   signal ICONT       : std_logic;
begin

   shift: process(clk)
   begin
      if (clk'event and clk = '1') then
         -- Every rising clk
         if (SSCKCounter < FREQDIV) then
            SSCK <= '1';
            SSCKCounter <= SSCKCounter + 1;
            IEXAM <= '0';
            IDEP <= '0';
            ISTART <= '0';
            ICONT <= '0';
         else
            -- Every FREQDIV clks we shift the input register or look at the result.
            SSCK <= '0';
            SSCKCounter <= 0;
            if (counter < switchBits) then
               counter <= counter + 1;
               -- Last one in is bit 0.  Input is active low.
               switches <= (not SSER_N) & switches(0 to switchBits-2);
               SCL_N <= '1';
            else
               -- The switches are shifted into their correct locations and we can inspect their values.
               counter <= 0;
               SCL_N <= '0';
               SR <= not switches(SSR0 to SSR11);
               CONF <= switches(SCF0 to SCF5);
               LADDR <= switches(SLADDR);
               SDF <= not switches(SDF0 to SDF2);
               SIF <= not switches(SIF0 to SIF2);
               PC <= not switches(SSR0 to SSR11);
               -- Some operations are idempotent, but EXAM, DEP, START, and CONT
               -- must be debounced.  We do that by sampling fairly slowly, then 
               -- detecting a rising edge.
               if (OEXAM = '0') and (switches(SEXAM) = '1') then 
                  IEXAM <= '1';
               else 
                  IEXAM <= '0';
               end if;
               OEXAM <= switches(SEXAM);
               if (ODEP = '0') and (switches(SDEP) = '1') then
                  IDEP <= '1';
               else
                  IDEP <= '0';
               end if;
               ODEP <= switches(SDEP);
               if (OSTART = '0') and (switches(SSTART) = '1') then
                  ISTART <= '1';
               else
                  ISTART <= '0';
               end if;
               OSTART <= switches(SSTART);
               if (OCONT = '0') and (switches(SCONT) = '1') then
                  ICONT <= '1';
               else
                  ICONT <= '0';
               end if;
               OCONT <= switches(SCONT);
               ISTOP <= switches(SSTOP);
               ISI <= switches(SSI);
               ISS <= switches(SSS);
               switches <= (others => '0'); -- What was I thinking here??
            end if;
         end if;
         -- Switches that stop the machine should not be debounced, as it is 
         -- too slow to notice SI and SS.  However, the process above only 
         -- gives us visibility of the switch values every debounce interval.
         -- What we do is remember the switches values in internal copies, then 
         -- use the remembered values to recalculate STOP and SS here every clock.
         if (ISTART or ICONT or IEXAM or IDEP) = '1' then
            STOP <= '0';
            SS   <= '0';
         else
            STOP <= (ISI or ISTOP);
            SS   <= ISS;
         end if;
      end if;
   end process;
   START <= ISTART;
   CONT <= ICONT;
   EXAM <= IEXAM;
   DEP <= IDEP;
end behavioral;
