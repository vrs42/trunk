LIBRARY IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Version 1.11 : 15 December 2003

use pdp8.all;

entity PDP8cpu is
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- Memory Interface

      MEMrd       : out std_logic;
      MEMwr       : out std_logic;
      MEMdone     : in  std_logic;
      MEMbusreq   : in  std_logic;
      MEMbusgrant : out std_logic;
      MEMaddr     : out std_logic_vector (0 to 14);
      MEMwdata    : out std_logic_vector (0 to 11);
      MEMrdata    : in  std_logic_vector (0 to 11);

      -- IO interface
      IOstart     : out std_logic;
      IOcaf       : out std_logic;      
      IOwdata     : out std_logic_vector (0 to 11);
      IOaddr      : out std_logic_vector (0 to 5);
      IOiop       : out std_logic_vector (0 to 2);

      IOinterrupt : in  std_logic;
      IOdone      : in  std_logic;
      IOskip      : in  std_logic;
      IOrdata     : in  std_logic_vector (0 to 11);
      IOdevstatus : in  std_logic_vector (0 to 1);
      
      -- Panel interface

      CPUcontrol  : in  std_logic_vector (CPUcontrolLength downto 0);
      CPUstate    : out std_logic_vector (CPUstateLength downto 0)
    );
end PDP8cpu;

architecture rtl  of PDP8cpu  is

    signal ma         : std_logic_vector (0 to 14); -- registre d'adresse memoire
    signal mb         : std_logic_vector (0 to 11); -- registre entree/sortie du memoire
    signal mrd        : std_logic;                  -- Signale pour lancer un cycle de lecture du memoire
    signal mwr        : std_logic;                  -- Signale pour lancer un cycle d'ecriture du memoire
    signal mbusgrant  : std_logic;
    signal lastMdone  : std_logic;
    
    signal io_addr    : std_logic_vector (0 to 5);
    signal io_iop     : std_logic_vector (0 to 2);
    signal io_start   : std_logic;
    signal io_timeout : std_logic;

    signal pc         : std_logic_vector(0 to 11); -- registre instruction suivante
    signal ir         : std_logic_vector(0 to 2);  -- instruction en cours
    signal lac        : std_logic_vector(0 to 12); -- registre accu avec link
    signal mq         : std_logic_vector(0 to 11); -- registre MQ (EAE)
    signal fault      : std_logic;
    signal run        : std_logic;
    signal pie        : std_logic_vector (0 to 2);
    signal laststatus : std_logic_vector (0 to 1);
    signal defer      : std_logic;
    
    signal ibuf       : std_logic_vector(0 to 2);
    signal ifld       : std_logic_vector(0 to 2);
    signal dfld       : std_logic_vector(0 to 2);
    signal iinhibit   : std_logic;
    signal savfld     : std_logic_vector(0 to 6);

    signal userflag   : std_logic;
    signal ubuf       : std_logic;
    signal userint    : std_logic;

    signal EAEmode    : std_logic;
    signal EAEop      : std_logic_vector (0 to 4);
    signal EAEscnt    : std_logic_vector (0 to 4);
    signal EAEgtf     : std_logic;
    
   type PROC_ETAT is (
      IDLE,
      CHERCHE,
      DECODE,
      INDIRECT,
      EXECUTE,
      OPR,
      IOT,
      EAESTART,
      EAESTEP
   );

    signal R_etat : PROC_ETAT;  -- Registre d'etat
    signal iocount : std_logic_vector (0 to 3);
    
begin  -- rtl

   CPUstate (CPUetat-4 downto 0) <= userint & userflag & ifld & dfld & 
      io_timeout & laststatus & io_iop & io_addr & pie(0) & run & fault & 
      ir & EAEop(1 to 4) & EAEmode & EAEscnt & mq & lac & pc & 
      not MEMbusreq & mbusgrant & (not MEMdone) & mrd & mwr & ma & mb;

   MEMbusgrant <= mbusgrant;

   IOaddr <= io_addr;
   IOiop <= io_iop;
   IOstart <= io_start;

   mem_if : process (clk)
   begin
      if clk'event and clk = '1' then
         if mbusgrant = '0' then
            MEMrd <= not mrd;
            MEMwr <= not mwr;
            MEMwdata <= mb;
            MEMaddr <= ma;
         else
--            MEMrd <= 'Z';
--            MEMwr <= 'Z';
--            MEMaddr <= (others => 'Z');
--            MEMwdata <= (others => 'Z');
            MEMrd <= '1';
            MEMwr <= '1';
            MEMaddr <= (others => '1');
            MEMwdata <= (others => '1');
                        end if;
      end if;
   end process mem_if;   
   
   P_pdp8cpu: process (clk, reset, mbusgrant, mrd, mwr, mb, ma)
      variable tlac : std_logic_vector (0 to 12);
      variable mq11 : std_logic;
      variable noshift : std_logic;
   begin  -- process P_pdp8cpu

      if reset = '0' then                  -- asynchronous reset (active low)
         PC <= (others => '0');
         R_etat <= IDLE;
         mrd <= '0';
         mwr <= '0';
         mb <= (others => '0');
         ma <= (others => '0');
         mq <= (others => '0');
         ir <= (others => '0');
         lac <= (others => '0');
         fault <= '0';
         pie <= (others => '0');
         mbusgrant <= '0';
         io_start <= '1';
         io_timeout <= '0';
         io_addr <= (others => '0');
         io_iop <= (others => '0');
         IOcaf <= '0';
         laststatus <= "00";
         ifld <= "000";
         ibuf <= "000";
         dfld <= "000";
         iinhibit <= '0';
         userflag <= '0';
         ubuf <= '0';
         userint <= '0';
         defer <= '0';
         lastMdone <= '0';
         EAEmode <= '0';
         EAEscnt <= (others => '0');
         EAEgtf <= '0';
         
      elsif clk'event and (clk = '1') then  -- rising clock edge

      lastMdone <= MEMdone;
      
--      IOcaf <= 'Z';
      IOcaf <= '1';
      
      if fault = '1' then
      
      elsif (mbusgrant = '0') and ((mrd or mwr) = '1') then
        if (mrd and mwr) = '1' then
            fault <= '1';
        elsif (lastMdone = '1') and (MEMdone = '0') then
          if mrd = '1' then
             mb <= MEMrdata;
          end if;   

          mrd <= '0';
          mwr <= '0';
        end if;

      elsif (CPUcontrol(CPUSstep) = '1') and (CPUcontrol(CPUcontinue) = '0') then
         run <= '0';
      else

      case R_etat is

      when IDLE =>
         CPUstate(CPUetat downto CPUetat-3) <= CPU_Idle;

         run <= '0';
         if CPUcontrol(CPUexam) = '1' then
            mrd <= '1';
            ma <= ifld & pc;
            pc <= pc + 1;

         elsif CPUcontrol(CPUla) = '1' then
            mrd  <= '1';
            dfld <= CPUcontrol(CPUaddr   downto CPUaddr - 2);
            ifld <= CPUcontrol(CPUaddr-3 downto CPUaddr - 5);
            pc   <= CPUcontrol(CPUaddr-6 downto CPUaddr - 17);

         elsif CPUcontrol(CPUdep) = '1' then
            mwr <= '1';
            ma <= ifld & pc;
            mb <= CPUcontrol(CPUkeys downto CPUkeys - 11);
            pc <= pc + 1;

         elsif (CPUcontrol(CPUstart) or CPUcontrol(CPUcontinue)) = '1' then

            if CPUcontrol(CPUstart) = '1' then
               pc <= CPUcontrol(CPUaddr-3 downto CPUaddr - 14) + 1;
               ifld <= CPUcontrol(CPUaddr downto CPUaddr - 2);
               -- Copy ifld to ibuf and dfld, too.  2/25/2007 by vrs
               ibuf <= CPUcontrol(CPUaddr downto CPUaddr - 2);
               dfld <= CPUcontrol(CPUaddr downto CPUaddr - 2);
               -- End "Copy ifld"
               ma <= CPUcontrol(CPUaddr downto CPUaddr - 14);
               -- Lifted from CAF 2/25/2007 by vrs
               lac <= (others => '0');
               pie <= "000";
               EAEmode <= '0';
               userint <= '0';
               IOCaf <= '0';
               -- End "Lifted from CAF"
            else
               pc <= pc + 1;
               ma <= ifld & pc;
            end if;
            
            mrd <= '1';      -- bit indicateur de lecture actif
            run <= '1';
            R_etat <= DECODE;
         end if;

      when CHERCHE =>
         CPUstate(CPUetat downto CPUetat-3) <= CPU_Fetch;

         if (MEMbusreq = '0') or (mbusgrant = '1') then
            mbusgrant <= not MEMbusreq;
            
         elsif (CPUcontrol(CPUhalt) = '1') or (run = '0')  then
            R_etat <= IDLE;
            
         else
            pie(0 to 1) <= pie (1 to 2);
            
            if ((iinhibit = '0') and 
               (pie (0) = '1') and ((userint = '1') or (IOinterrupt = '0'))) then

                -- Save current state
                savfld <= userflag & ifld & dfld;
                ma <= (others => '0');
                mb <= pc;
                mwr <= '1';

                -- Establish new state
                userflag <= '0';
                ubuf <= '0';
                ifld <= "000";
                ibuf <= "000";
                dfld <= "000";
                pie <= "000";
                pc <= o"0001";

            else
               ma <= ifld & pc;         -- chargement de registre d'adresse
               mrd <= '1';       -- bit indicateur de lecture actif

               pc <= pc + 1 ;    -- increment PC
               
               R_etat <= DECODE;
            end if;

         end if;

      when DECODE =>
         CPUstate(CPUetat downto CPUetat-3) <= CPU_Decode;

         ir <= mb (0 to 2);

         case mb (0 to 2) is

         when o"7" => -- OPR	 
            if mb (3) = '0' then -- opr group 1
            
               if mb(4) = '1' then
                  lac(1 to 12) <= (others => mb(6));
               elsif mb (6) = '1' then
                  lac (1 to 12) <= not lac (1 to 12);
               end if;
               
               if mb(5) = '1' then
                  lac (0) <= mb (7);
               elsif mb (7) = '1' then
                  lac(0) <= not lac (0);
               end if;
                  
               if mb (8 to 11) = "0000" then
                  R_etat <= CHERCHE;          -- instruction suivantes
               else
                  R_etat <= OPR;
               end if;

            elsif mb (11) = '0' then     -- operate group 2
               if mb (4) = '1' then
                  lac(1 to 12) <= (others => '0');
               end if;
               
               if mb(8) = '0' then  -- SKP = 0 , normal skips
                  if ((mb(7) = '1') and (lac(0) = '1')) or  -- SNL
                     ((mb(6) = '1') and (lac(1 to 12) = 0)) or  -- SZA
                     ((mb(5) = '1') and (lac(1) = '1')) then  -- SMA
                     pc <= pc + 1;
                  end if;
               else
                  if ((mb(7) = '0') or (lac(0) = '0')) and  -- SNL
                     ((mb(6) = '0') or (lac(1 to 12) /= 0)) and  -- SZA
                     ((mb(5) = '0') or (lac(1) = '0')) then  -- SMA
                     pc <= pc + 1;
                  end if;
               end if;
               
               if mb (9 to 10) = "00" then
                  R_etat <= CHERCHE;          -- instruction suivantes
               elsif userflag = '1' then
                  userint <= '1';
                  R_etat <= CHERCHE;
               else   
                  R_etat <= OPR;
               end if;
            else			-- operate group 3
               if mb (4) = '1' then
                  lac (1 to 12) <= (others => '0');
               end if;

               if mb (5 to 10) = "000000" then
                  R_etat <= CHERCHE;          -- instruction suivantes
               else
                  EAEop <= EAEmode & mb(6) & mb (8 to 10);
                  R_etat <= OPR;
               end if;
            end if;

         when o"6" => -- IOT
            if userflag = '1' then
               userint <= '1';
               R_etat <= CHERCHE;
            else
               io_start <= '1';
               io_timeout <= '0';
               io_iop <= mb (9 to 11);
               io_addr <= mb (3 to 8);
               R_etat <= IOT;
            end if;

         when others =>                           -- Instruction necessite un adresse
         
            -- Develop the memory address in MA
            ma (8 to 14) <= mb (5 to 11);
            if mb(4) = '0' then
               ma (3 to 7) <= (others => '0');
            end if;

            if mb(3) = '1' then  --  indirect fetch address
               mrd <= '1';
               defer <= '1';
               R_etat <= INDIRECT;
            else
               case mb (0 to 2) is 

               when o"3" =>		-- DCA
                  mb <= lac(1 to 12);
                  lac (1 to 12) <= (others => '0');
                  mwr <= '1';
                  R_etat <= CHERCHE;

               when o"4"  =>		-- JMS
                  mb <= pc ;
                  mwr <= '1';
        
                  if mb (4) = '0' then -- page zero
                     pc <= 1 + ("00000" & mb (5 to 11));
                  else
                     pc <= 1 + (ma(3 to 7) & mb (5 to 11));
                  end if;   
                  
                  ifld <= ibuf;
                  userflag <= ubuf;
                  iinhibit <= '0';
                  
                  R_etat <= CHERCHE;

               when o"5" =>		-- JMP
                  pc (5 to 11) <= mb (5 to 11);
                  if mb (4) = '0' then
                     pc (0 to 4) <= (others => '0');
                  else
                     pc (0 to 4) <= ma (3 to 7);
                  end if;
                  
                  ifld <= ibuf;
                  userflag <= ubuf;
                  iinhibit <= '0';

                  R_etat <= CHERCHE;

               when o"0" | o"1" | o"2"  =>
                  mrd <= '1';
                  R_etat <= EXECUTE;

               when others =>
                  fault <= '1';
               end case;
            end if;
         end case;

      when INDIRECT =>
         CPUstate(CPUetat downto CPUetat-3) <= CPU_Indirect;

         defer <= '0';

         if (defer = '1') and (ma(3 to 11) = o"001") then
            mb <= mb + 1;
            mwr <= '1';
         else
            case ir is 
         
            when "011" =>		-- DCA
               ma <= dfld & mb;
               mb <= lac(1 to 12);
               mwr <= '1';
               
               lac <= (0 => lac(0), others => '0');

               R_etat <= CHERCHE;

            when "100" =>		-- JMS
               mb <= pc;
               ma <= ifld & mb;
               mwr <= '1';

               pc <= mb + 1 ;
            
               ifld <= ibuf;
               userflag <= ubuf;
               iinhibit <= '0';
            
               R_etat <= CHERCHE;

            when "101" =>		-- JMP
               pc <= mb;
            
               ifld <= ibuf;
               userflag <= ubuf;
               iinhibit <= '0';

               R_etat <= CHERCHE;

            when "000" | "001" | "010"  =>
               ma <= dfld & mb;
               mrd <= '1';
               R_etat <= EXECUTE;

            when "111" => 		-- EAE
               case EAEop(1 to 4) is 
               
               when "0010" |		-- MUY
                    "0011" =>		-- DVI
                  ma <= dfld & mb;
                  mrd <= '1';
                  EAEscnt <= "10100";
                  lac(0) <= '0';
                  R_etat <= EAESTEP;
               
               when "1001" =>		-- DAD
                  lac(0) <= '0';
                  ma <= dfld & mb;
                  mrd <= '1';
                  R_etat <= EAESTEP;   

               when "1010" =>		-- DST
                  ma <= dfld & mb;
                  mb <= mq;
                  mwr <= '1';
                  R_etat <= EAESTEP;

               when others =>
                  fault <= '1';
                  
               end case;
            when others =>
                fault <= '1';
            end case;
         end if;

      when EXECUTE =>
         CPUstate(CPUetat downto CPUetat-3) <= CPU_Execute;
     
         case ir is 
         
         when "000" =>		-- AND
            lac(1 to 12) <= lac(1 to 12) and mb;
            R_etat <= CHERCHE;

         when "001" =>		-- TAD
            lac <= lac + ('0' & mb);
            R_etat <= CHERCHE;

         when "010" =>		-- ISZ
            mb <= mb + 1 ;
            mwr <= '1';
            if mb = o"7777" then
               pc <= pc + 1;
            end if;
            R_etat <= CHERCHE;

         when others =>
            fault <= '1';
         end case;

      when IOT =>			-- IOT
         CPUstate(CPUetat downto CPUetat-3) <= CPU_IOT;

         laststatus <= "00";

         case mb(3 to 11) is
         when o"000" => -- SKON skip if interrupt system on
            if pie (2) = '1' then
               pc <= pc + 1;
               pie <= "000";
            end if;
            R_etat <= CHERCHE;
            
         when o"001" => -- ION interrupt turn on
            pie <= "011";
            R_etat <= CHERCHE;

         when o"002" => -- IOF interrupt turn off
            pie <= "000";
            R_etat <= CHERCHE;

         when o"003" => -- SRQ skip on interrupt request
            if (IOinterrupt = '0') or (userint = '1') then
               pc <= pc + 1;
            end if;
            R_etat <= CHERCHE;
            
         when o"004" => -- GTF get flags
            lac (1 to 12) <= 
               lac(0) & 
               EAEgtf &
               ((not IOinterrupt) or userint) & 
               '0' & -- (iinhibit or not pie (0)) &
               pie (1) & 
               savfld;
            R_etat <= CHERCHE;

         when o"005" => -- RTF restore flags
            lac(0) <= lac(1);
            EAEgtf <= lac(2);   
            dfld <= lac (10 to 12);
            ibuf <= lac(7 to 9);
            ubuf <= lac(6);
            
            pie <= "111";
            iinhibit <= '1';
            
            R_etat <= CHERCHE;

         when o"006" => -- SGT skip if greater then
            if EAEgtf = '1' then
               pc <= pc + 1;
            end if;   
            R_etat <= CHERCHE;

         when o"007" => -- CAF clear all flags
            lac <= (others => '0');
            pie <= "000";
            IOcaf <= '0';
            EAEmode <= '0';	    
            userint <= '0';

            R_etat <= CHERCHE;

         when o"201" | o"211" | o"221" | o"231" | o"241" | o"251" | o"261" | o"271" | 
              o"202" | o"212" | o"222" | o"232" | o"242" | o"252" | o"262" | o"272" | 
              o"203" | o"213" | o"223" | o"233" | o"243" | o"253" | o"263" | o"273" => 
            if mb(11) = '1' then -- CDF change data field
               dfld <= mb (6 to 8);  
            end if;
            
            if mb(10) = '1' then -- CIF change instruction field
               iinhibit <= '1';
               ibuf <= mb (6 to 8);
            end if;
            R_etat <= CHERCHE;

         when o"204" => -- CINT clear user interrupt
            userint <= '0';
            R_etat <= CHERCHE;

         when o"214" => -- RDF read data field
            lac (7 to 9) <= lac(7 to 9) or dfld;
            R_etat <= CHERCHE;

         when o"224" => -- RIF read instruction field
            lac (7 to 9) <= lac(7 to 9) or ifld;
            R_etat <= CHERCHE;

         when o"234" => -- RIB read instruction buffer
            lac (6 to 12) <= lac(6 to 12) or savfld;
            R_etat <= CHERCHE;

         when o"244" => -- RMF restore memory field
            ubuf <= savfld (0);
            ibuf <= savfld(1 to 3);
            dfld <= savfld(4 to 6);
            R_etat <= CHERCHE;

         when o"254" => -- SINT skip if user interrupt
            if userint = '1' then
               pc <= pc + 1;
            end if;   
            R_etat <= CHERCHE;

         when o"264" => -- CUF clear user flag
            ubuf <= '0';
            userflag <= '0';
            R_etat <= CHERCHE;

         when o"274" => -- SUF set user flag
            ubuf <= '1';
            iinhibit <= '1';
            R_etat <= CHERCHE;

         when others =>
            if io_start = '1' then	-- start of IO operation
               io_start <= '0';
               IOwdata <= lac(1 to 12);
               iocount <= "0000";
            elsif IOdone = '0' then	-- when done 
               io_start <= '1';
               lac(1 to 12) <= IOrdata;
               if IOskip = '1' then
                  pc <= pc + 1;
               end if;
               laststatus <= IOdevstatus;
               R_etat <= CHERCHE;
            else			-- otherwise wait
               if iocount = "1111" then
                  io_timeout <= '1';
                  R_etat <= CHERCHE;
               else
                  iocount <= iocount + 1;
               end if;
            end if;   
         end case;

      when OPR =>			-- OPR
         CPUstate(CPUetat downto CPUetat-3) <= CPU_OPR;

         if mb (3) = '0' then -- opr group 1
            
            if mb (11) = '1' then
               lac <= lac + 1;
               
               if mb (8 to 10) = "000" then
                  R_etat <= CHERCHE;          -- instruction suivantes
               else
                  mb (11) <= '0';
               end if;
            else
               case mb (8 to 10) is
               when "001" =>
                  lac <= lac(0) & lac (7 to 12) & lac (1 to 6);
                     
               when "010" =>
                  lac <= lac (1 to 12) & lac(0);
                     
               when "011" =>
                  lac <= lac (2 to 12) & lac(0 to 1);
                     
               when "100" =>
                  lac <= lac(12) & lac (0 to 11);
                     
               when "101" =>
                  lac <= lac(11 to 12) & lac (0 to 10);
                     
               when others =>
               end case;
               
               R_etat <= CHERCHE;          -- instruction suivantes
            end if;
            
         elsif mb (11) = '0' then     -- operate group 2

            if mb(9) = '1' then  -- OAS
               lac(1 to 12) <= lac(1 to 12) or CPUcontrol(CPUkeys downto CPUkeys-11);
            end if;

            if mb (10) = '1' then    --Halt
               R_etat <= IDLE;
            else
               R_etat <= CHERCHE;
            end if;
         else        -- Group 3
            if mb (5) = '1' then 	-- MQA
               if mb(7) = '1' then	-- MQL and MQA
                  lac(1 to 12) <= mq;
                  mq <= lac(1 to 12);
               else
                  lac(1 to 12) <= lac(1 to 12) or mq;
               end if;
            elsif mb(7) = '1' then	-- MQL
               mq <= lac (1 to 12);
               lac(1 to 12) <= (others => '0');
            end if;
            
            if EAEop(1 to 4) /= 0 then		-- EAE instruction....
               noshift := '0';
               
               if mb(6 to 11) = o"31" then	-- SWAB 
                  EAEmode <= '1';
                  R_etat <= CHERCHE;
                  
               elsif (mb(6 to 11) = o"47") then	-- SWBA
                  EAEmode <= '0';
                  EAEgtf <= '0';
                  R_etat <= CHERCHE;
               
               elsif EAEmode = '0' then -- mode A
                  EAEgtf <= '0';

                  if mb(6) = '1' then
                     EAEop(1) <= '0';
                     lac(8 to 12) <= lac(8 to 12) or EAEscnt;
                  end if;

                  case EAEop(2 to 4) is 
                  when "000" =>  	-- NOP
                     R_etat <= CHERCHE;

                  when "010" |		-- MUY mode A
                       "011" => 	-- DVI mode A
                     EAEscnt <= "10100";
                     ma <= ifld & pc;
                     mrd <= '1';
                     pc <= pc+1;
                     lac(0) <= '0';
                     R_etat <= EAESTEP;

                  when "100" => 	-- NMI
                     EAEscnt <= (others => '0');
                     if (lac(1) /= lac(2)) or ((lac(3 to 12) = 0) and (mq = 0)) then
                        R_etat <= CHERCHE;
                     else
                        R_etat <= EAESTEP;
                     end if;

                  when others =>
                     mrd <= '1';
                     ma <= ifld & pc;
                     pc <= pc+1;
                     R_etat <= EAESTART;
                  end case;   
               else  			-- mode B
                  case EAEop (1 to 4) is
                  when "1100" =>	-- DPSZ
                     if (lac(1 to 12) = 0) and (mq = 0) then
                        pc <= pc + 1;
                     end if;
                     R_etat <= CHERCHE;

                  when "0001" | 	-- ACS
                       "1000" |		-- SCA
                       "1101" | 	-- DPIC
                       "1110" =>	-- DCM
                     R_etat <= EAESTART;
                     
                  when "1111" =>	-- SAM
                     lac <= 1 + ('0' & mq) + ('0' & not lac(1 to 12));
                     if (mq(0) xor lac(1)) = '1' then
                        EAEgtf <= not mq(0);
                     elsif mq >= lac(1 to 12) then
                        EAEgtf <= '1';
                     else
                        EAEgtf <= '0';
                     end if;	  
                     R_etat <= CHERCHE;

                  when "0100" => -- NMI
                     EAEscnt <= (others => '0');
                     if (lac(1) /= lac(2)) or ((lac(3 to 12) = 0) and (mq = 0)) then
                        if (lac(1 to 12) = o"4000") and (mq = 0) then
                           lac(1) <= '0';
                        end if;   
                        R_etat <= CHERCHE;
                     else
                        R_etat <= EAESTEP;
                     end if;
                     
                  when "0101" |
                       "0110" |
                       "0111" =>
                     mrd <= '1';
                     ma <= ifld & pc;
                     pc <= pc + 1;
                     R_etat <= EAESTART;

                  when others =>
                     mrd <= '1';
                     ma <= ifld & pc;
                     pc <= pc + 1;
                     defer <= '1';
                     R_etat <= INDIRECT;
                  end case;
               end if;
            else
               R_etat <= CHERCHE;
            end if;
        end if;
        
      when EAESTART =>			-- OPR
         CPUstate(CPUetat downto CPUetat-3) <= CPU_OPR;

         case EAEop is

         when "00001" => -- SCL
            EAEscnt <= not mb(7 to 11);
            R_etat <= CHERCHE;

         when "00101" | "00110" | "00111" =>
            EAEscnt <= not mb(7 to 11);
            R_etat <= EAESTEP;

         when "10001" => 	-- ACS
            EAEscnt <= LAC(8 to 12);
            LAC(1 to 12) <= (others => '0');
            R_etat <= CHERCHE;
                     
         when "10101" =>	-- SHL
            EAEscnt <= not mb(7 to 11);
            if mb(7 to 11) = "00000" then
               R_etat <= CHERCHE;
            else
               R_etat <= EAESTEP;
            end if;
            
         when "10110" =>	-- ASR
            lac(0) <= lac(1);
            EAEscnt <= not mb(7 to 11);
            if mb(7 to 11) = "00000" then
               R_etat <= CHERCHE;
            else
               R_etat <= EAESTEP;
            end if;
            
         when "10111" =>	-- LSR
            lac(0) <= '0';
            EAEscnt <= not mb(7 to 11);
            if mb(7 to 11) = "00000" then
               R_etat <= CHERCHE;
            else
               R_etat <= EAESTEP;
            end if;
            
         when "11000" =>	-- SCA
            LAC(8 to 12) <= LAC(8 to 12) or EAEscnt;
            R_etat <= CHERCHE;

         when "11101" => -- DPIC
            mq <= lac(1 to 12) + 1;
            if lac(1 to 12) = o"7777" then
               lac <= ('0' & mq) + 1;
            else
               lac <= '0' & mq;
            end if;
            R_etat <= CHERCHE;

         when "11110" =>	-- DCM
           mq <= (not lac(1 to 12)) + 1;
           if lac(1 to 12) = 0 then
              lac <= ('0' & not mq) + 1;
           else 	
              lac <= '0' & not mq;
           end if;
           R_etat <= CHERCHE;

         when others =>
            fault <= '1';
            
         end case;

      when EAESTEP => 
      
         if EAEop(1) = '0' then
--          Moved up 2/28/2007 by vrs
            EAEscnt <= EAEscnt + 1;
--          End "Moved up"
            if EAEscnt = "11111" then
               noshift := EAEmode;
               R_etat <= CHERCHE;
--             Kludge EAEscnt for mode B 2/28/2007 by vrs
               if EAEop(0) = '1' then
                   EAEscnt <= EAEscnt;
               end if;
--             End "Kludge EAEscnt"
            end if;
         
--          Moved up 2/28/2007 by vrs
--          EAEscnt <= EAEscnt + 1; moved up vrs
--          End "Moved up"
         end if;
         
         case EAEop(1 to 4) is
         when "0010" =>  -- MUY
            
            if mq(11) = '1' then
               tlac := lac + ('0' & mb);
            else
               tlac := lac;
            end if;
            
            lac <= '0' & tlac(0 to 11);
            mq <= tlac(12) & mq(0 to 10);

         when "0011" =>  -- IDV
         
            if EAEscnt = "10100"  then  -- first cycle : check for oflo
               tlac := ('0' & lac(1 to 12)) - ('0' & mb);
               if tlac(0) = '0' then
                  tlac := '1' & lac(1 to 12);
                  mq11 := '1';
                  R_etat <= CHERCHE;
               else
                  tlac := (lac(1 to 12) & mq(0)) - ('0' & mb);
                  mq11 := not tlac(0);
               end if;
            else
               if lac(0) = '0' then
                  tlac := (lac(1 to 12) & mq(0)) - ('0' & mb);
               else
                  tlac := (lac(1 to 12) & mq(0)) + ('0' & mb);
               end if;	  
               mq11 := not tlac(0);
            end if;

            mq <= mq(1 to 11) & mq11;
            
            if (EAEscnt = "11111") and (tlac(0) = '1') then -- last cycle
               lac(1 to 12) <= tlac(1 to 12) + mb;
               lac(0) <= '0';
            else
               lac <= tlac;
            end if;	  

         when "0100" | "0101" =>  -- lsh, nmi

            if (EAEop(4) = '0') and 
               ((lac(2) /= lac(3)) or ((lac(4 to 12) = 0) and (mq = 0))) then
               R_etat <= CHERCHE;
            end if;
        
            if noshift = '0' then
               lac <= lac(1 to 12) & mq(0);
               mq <= mq(1 to 11) & '0';
            end if;
            
         when "0110" | "0111" => -- lsr asr
            if noshift = '0' then
               if EAEop(4) = '0' then
                  lac(0 to 1) <= lac(1) & lac(1);
               else
                  lac(0 to 1) <= "00";
               end if;
            
               lac(2 to 12) <= lac(1 to 11);
               mq <= lac(12) & mq(0 to 10);
               if EAEmode = '1' then
                  EAEgtf <= mq(11);
               end if;
            end if;
            
         when "1001" => -- DAD
            lac <= ('0' & mq) + ('0' & mb) + lac(0);
            mq <= lac(1 to 12);
            if EAEop(0) = '1' then
               ma(3 to 14)  <= ma(3 to 14) + 1;
               mrd <= '1';
               EAEop(0) <= '0';
            else
               R_etat <= CHERCHE;
            end if;
         
         when "1010" =>	-- DST
            ma(3 to 14)  <= ma(3 to 14) + 1;
            mb <= lac(1 to 12);
            mwr <= '1';
            R_etat <= CHERCHE;
            
         when others =>
            fault <= '1';
         end case;
         
      when others =>
         fault <= '1';
      end case;
    end if;
    end if;
  end process P_pdp8cpu;

end rtl ;
