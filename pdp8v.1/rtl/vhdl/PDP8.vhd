LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

-- Version 1.00 : 12 November 2003

package pdp8 is

constant CPUversion : std_logic_vector (0 to 11) := o"0124";

component DRAM is
  port (
      clk : in std_logic;
      reset: in std_logic;

      -- Memory Interface

      MEMrd : in std_logic;
      MEMwr : in std_logic;
      MEMdone : out std_logic;
      MEMaddr : in std_logic_vector (0 to 14);
      MEMwdata : in std_logic_vector (0 to 11);
      MEMrdata : out std_logic_vector (0 to 11);

      -- IO interface
      IOinterrupt : out std_logic;
      
      IOstart : in std_logic;
      IOwdata : in std_logic_vector(0 to 11);
      IOaddr : in std_logic_vector (0 to 5);
      IOiop : in std_logic_vector (0 to 2);
      
      IOrdata : out std_logic_vector(0 to 11);
      IOdevstatus : out std_logic_vector (0 to 1);
      IOdone : out std_logic;
      IOskip : out std_logic;
      
      -- External interface
      DRAMcas : out std_logic;
      DRAMras : out std_logic;
      DRAMwe : out std_logic;
      DRAMaddr : out std_logic_vector (0 to 11);
      DRAMdata : inout std_logic_vector (0 to 15);
      DRAMpw : out std_logic_vector (0 to 1);
      DRAMpr : in std_logic_vector (0 to 1)
   );
end component DRAM;

component SRAM
    Port (
       clk : in std_logic;
       reset : in std_logic;

       MEMrd : in std_logic;
       MEMwr : in std_logic;
       MEMdone : out std_logic;
       MEMaddr : in std_logic_vector (0 to 14);
       MEMwdata : in std_logic_vector (0 to 11);
       MEMrdata : out std_logic_vector (0 to 11);
       
       -- External interface
       CONFIG : in std_logic;
       speed : in std_logic_vector (0 to 2);
       
       SRAMwe : out std_logic;
       SRAMoe : out std_logic;
       SRAMaddr : out std_logic_vector (0 to 14);
       SRAMdata : inout std_logic_vector (0 to 15)
    );
end component SRAM;


   -- CPUcontrol index definitions

   constant CPUhalt :     integer :=  0;
   constant CPUstart :    integer :=  CPUhalt+1;
   constant CPUkeys :     integer :=  CPUstart + 12;
   constant CPUmrd :      integer :=  CPUkeys + 1;
   constant CPUmrdnext :  integer :=  CPUmrd + 1;
   constant CPUwrhere :   integer :=  CPUmrdnext + 1;
   constant CPUcontinue : integer :=  CPUwrhere + 1;
   constant CPUsstep :    integer :=  CPUcontinue + 1;
   constant CPUlxa :      integer :=  CPUsstep + 1;

   constant CPUcontrolLength : integer := CPUlxa;


   -- CPUstate index defintions

   constant CPUmb    : integer := -1       + 12;
   constant CPUma    : integer := CPUmb    + 15;
   constant CPUgrant : integer := CPUma    +  1;
   constant CPUpc    : integer := CPUgrant + 12;
   constant CPUac    : integer := CPUpc    + 12;
   constant CPUlink  : integer := CPUac    +  1;
   constant CPUmq    : integer := CPUlink  + 12;
   constant CPUsc    : integer := CPUmq    +  5;
   constant CPUem    : integer := CPUsc    +  1;
   constant CPUeae   : integer := CPUem    +  4;
   constant CPUir    : integer := CPUeae   +  3;
   constant CPUfault : integer := CPUir    +  1;
   constant CPUrun   : integer := CPUfault +  1;
   constant CPUpie   : integer := CPUrun   +  1;

   constant IOstatus : integer := CPUpie   +  2;
   constant IOto     : integer := IOstatus +  1;
   
   constant CPUdf    : integer := IOto     +  3;
   constant CPUif    : integer := CPUdf    +  3;
   constant CPUuf    : integer := CPUif    +  1;
   constant CPUui    : integer := CPUuf    +  1;
   
   constant CPUetat  : integer := CPUui    +  4;

   constant CPUstateLength :   integer := CPUetat;
   
   constant CPU_Idle      : std_logic_vector (0 to 3) := "0000";
   constant CPU_Fetch     : std_logic_vector (0 to 3) := "0001";
   constant CPU_Decode    : std_logic_vector (0 to 3) := "0010";
   constant CPU_Indirect  : std_logic_vector (0 to 3) := "0011";
   constant CPU_Execute   : std_logic_vector (0 to 3) := "0100";
   constant CPU_OPR       : std_logic_vector (0 to 3) := "0101";
   constant CPU_IOT       : std_logic_vector (0 to 3) := "0110";
   constant CPU_EAE1      : std_logic_vector (0 to 3) := "0111";
   constant CPU_EAEN      : std_logic_vector (0 to 3) := "1000";

end package pdp8;

