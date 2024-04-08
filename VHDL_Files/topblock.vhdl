 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY topblock IS
	PORT(
		i_valsel, i_instsel : IN STD_LOGIC_VECTOR(2 downto 0);
		i_GClock, i_GReset : IN STD_LOGIC;
		o_branchout, o_zeroOut, o_memwriteout, o_regwriteOut : OUT STD_LOGIC;
		o_muxout : OUT STD_LOGIC_VECTOR(7 downto 0);
		o_instructionOUT : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
		
END topblock;

ARCHITECTURE rtl OF topblock IS

COMPONENT PCblock
	PORT(
	
		i_clear,i_branch		: IN	STD_LOGIC;
		i_clock, i_PCh			: IN	STD_LOGIC;
		i_Enable					: IN STD_LOGIC;
		i_adder 					: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_inst					: OUT	STD_LOGIC_VECTOR(31 downto 0);
		o_adder 					: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;
COMPONENT regIF_ID
	PORT(
		i_adder 		: IN	STD_LOGIC_VECTOR(7 downto 0);
		i_clear		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		i_Enable		: IN STD_LOGIC;
		i_data		: IN STD_LOGIC_VECTOR(31 downto 0);
		o_data		: OUT	STD_LOGIC_VECTOR(31 downto 0);
		o_adder 		: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;
COMPONENT SYSCONTROL
	PORT(
		i_inst : IN STD_logic_VECTOR(5 downto 0);
		o_EX : OUT STD_logic_VECTOR (3 downto 0);
		o_M : OUT STD_logic_VECTOR (2 downto 0);
		o_WB : OUT STD_logic_VECTOR (1 downto 0));
		
END COMPONENT;
COMPONENT regdata
	PORT(
		i_read1, i_read2, i_write, i_waddr: IN STD_LOGIC_VECTOR(7 downto 0);
		i_regwrite : IN STD_LOGIC;
		i_clear		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_data1, o_data2 : OUT STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;
begin 



end rtl;