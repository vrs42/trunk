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
   constant CPUaddr :     integer :=  CPUstart + 18;
   constant CPUkeys :     integer :=  CPUaddr + 12;
   constant CPUla   :     integer :=  CPUkeys + 1;
   constant CPUexam :     integer :=  CPUla + 1;
   constant CPUdep  :     integer :=  CPUexam + 1;
   constant CPUcontinue : integer :=  CPUdep + 1;
   constant CPUsstep :    integer :=  CPUcontinue + 1;
   constant CPUcontrolLength : integer := CPUsstep;

-- CPUstate index defintions

   constant CPUmb :    integer := 11;
   constant CPUma :    integer := 26;
   constant CPUmc :    integer := 31;
   constant CPUpc :    integer := 43;
   constant CPUac :    integer := 55;
   constant CPUlink :  integer := 56;
   constant CPUmq :    integer := 68;
   constant CPUsc :    integer := 73;
   constant CPUem :    integer := 74;
   constant CPUeae :   integer := 78;
   constant CPUir :    integer := 81;
   constant CPUfault : integer := 82;
   constant CPUrun :   integer := 83;
   constant CPUpie :   integer := 84;
   constant IOaddress :integer := 90;
   constant IOop :     integer := 93;
   constant IOstatus : integer := 95;
   constant IOto :     integer := 96;
   
   constant CPUdf :     integer := 99;
   constant CPUif :     integer := 102;
   constant CPUuf :     integer := 103;
   constant CPUui :     integer := 104;
   
   constant CPUetat :  integer := 108;
   constant CPUstateLength :   integer := CPUetat;
  
   constant CPU_Idle      : std_logic_vector (0 to 3) := "0000";
   constant CPU_Fetch     : std_logic_vector (0 to 3) := "0001";
   constant CPU_Decode    : std_logic_vector (0 to 3) := "0010";
   constant CPU_Indirect  : std_logic_vector (0 to 3) := "0011";
   constant CPU_Execute   : std_logic_vector (0 to 3) := "0100";
   constant CPU_OPR       : std_logic_vector (0 to 3) := "0101";
   constant CPU_IOT       : std_logic_vector (0 to 3) := "0110";

end package pdp8;

