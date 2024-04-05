LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regID_EX IS
	PORT(
		i_WB :IN STD_LOGIC_VECTOR(1 downto 0);
		i_M : IN STD_LOGIC_VECTOR(2 downto 0);
		i_EX : IN STD_LOGIC_VECTOR (3 downto 0);
		i_addr,i_readA,i_readB : IN STD_LOGIC_VECTOR(7 downto 0);
		i_instA :IN STD_LOGIC_VECTOR(31 downto 0);
		i_instB, i_instC :IN STD_LOGIC_VECTOR(4 downto 0);
	
		i_clear		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		i_Enable		: IN STD_LOGIC;
		
		o_WB :OUT STD_LOGIC_VECTOR(1 downto 0);
		o_M : OUT STD_LOGIC_VECTOR(2 downto 0);
		o_EX : OUT STD_LOGIC_VECTOR (3 downto 0);
		o_addr,o_readA,o_readB : OUT STD_LOGIC_VECTOR(7 downto 0);
		o_instA :OUT STD_LOGIC_VECTOR(31 downto 0);
		o_instB, o_instC :OUT STD_LOGIC_VECTOR(4 downto 0));
		
END regID_EX;

ARCHITECTURE rtl OF regID_EX IS

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
ControlB : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data(7 downto 4) => i_EX,
		i_data(3) => '0',
		i_data(2) => '0',
		i_data(1) => '0',
		i_data(0) => '0',
		o_Q(7 downto 4) => o_EX
		);

address : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_addr,
		o_Q => o_addr
		);
		

readdataA : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_readA,
		o_Q => o_readA
		);
		

readdataB : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_readB,
		o_Q => o_readB
		);
		

Areg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_instA(31 downto 24),
		o_Q => o_instA(31 downto 24)
		);
		

Breg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_instA(23 downto 16),
		o_Q => o_instA(23 downto 16)
		);		
		
Creg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_instA(15 downto 8),
		o_Q => o_instA(15  downto 8)
		);
		

Dreg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_instA(7 downto 0),
		o_Q => o_instA(7 downto 0)
		);
		
instB : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data(7 downto 3) => i_instB,
		i_data(2) => '0',
		i_data(1) => '0',
		i_data(0) => '0',
		o_Q => o_instB
		);
		

instC : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data(7 downto 3) => i_instC,
		i_data(2) => '0',
		i_data(1) => '0',
		i_data(0) => '0',
		o_Q => o_instC
		);
		



END rtl;