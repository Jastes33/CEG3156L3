LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regEX_MEM IS
	PORT(
		i_WB :IN STD_LOGIC_VECTOR(1 downto 0);
		i_M : IN STD_LOGIC_VECTOR(2 downto 0);
		i_addr,i_ALU,i_readB : IN STD_LOGIC_VECTOR(7 downto 0);
		i_instA :IN STD_LOGIC_VECTOR(4 downto 0);
		
		i_clear,i_zero		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		i_Enable		: IN STD_LOGIC;
		
		o_WB :OUT STD_LOGIC_VECTOR(1 downto 0);
		o_M : OUT STD_LOGIC_VECTOR(2 downto 0);
		o_addr,o_ALU,o_readB : OUT STD_LOGIC_VECTOR(7 downto 0);
		o_instA :OUT STD_LOGIC_VECTOR(31 downto 0);
		o_zero		: OUT	STD_LOGIC);
		
END regEX_MEM;

ARCHITECTURE rtl OF regEX_MEM IS

COMPONENT reg8
	PORT(
		i_clear	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Enable			: IN STD_LOGIC;
		i_data: IN STD_LOGIC_VECTOR(7 downto 0);
		o_Q			: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;

BEGIN
ControlA : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data(7 downto 6) => i_WB,
		i_data(5 downto 3) => i_M,
		i_data(2) => '0',
		i_data(1) => '0',
		i_data(0) => '0',
		o_Q(7 downto 6) => o_WB,
		o_Q(5 downto 3) => o_M
		);

address : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_addr,
		o_Q => o_addr
		);
		
ALUA : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_ALU,
		o_Q => o_ALU
		);
		

readdataB : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_readB,
		o_Q => o_readB
		);
		


		
instB : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data(7 downto 3) => i_instA,
		i_data(2) => '0',
		i_data(1) => '0',
		i_data(0) => i_zero,
		o_Q => o_instA,
		o_Q(0) => o_zero
		);
		


		



END rtl;