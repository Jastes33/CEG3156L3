LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY PCblock IS
	PORT(
	
		i_clear,i_branch		: IN	STD_LOGIC;
		i_clock, i_PCh			: IN	STD_LOGIC;
		i_Enable					: IN STD_LOGIC;
		i_adder 					: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_inst					: OUT	STD_LOGIC_VECTOR(31 downto 0);
		o_adder 					: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END PCblock;

ARCHITECTURE rtl OF PCblock IS

SIGNAL int_pc, int_mux, int_adder : STD_LOGIC_VECTOR(7 downto 0);

COMPONENT MEM_INST 
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_ADDR		: IN	STD_LOGIC_VECTOR(7 downto 0);
		i_clock		: IN	STD_LOGIC;
		o_INTS      : OUT	STD_LOGIC_VECTOR(31 DOWNTO 0));

END COMPONENT;

COMPONENT addSUB
	PORT(
	i_xx, i_yy : IN STD_logic_vector(0 to 7);
	--i_cinBit :IN STD_logic;
	i_operation: IN STD_logic;
	o_s:OUT STD_logic_vector(0 to 7);
	o_c:OUT STD_logic);
	
END COMPONENT;

COMPONENT eightBitmux2to1
	PORT(
		i_op0:IN STD_LOGIC_VECTOR(7 downto 0);
		i_op1:IN STD_LOGIC_VECTOR(7 downto 0);
		i_selection: IN STD_LOGIC;
		o_choice:OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT reg8
	PORT(
		i_clear	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Enable			: IN STD_LOGIC;
		i_data: IN STD_LOGIC_VECTOR(7 downto 0);
		o_Q			: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;

BEGIN

PC : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_pCh,
		i_data => int_mux,
		o_Q => int_pc
		);

pcmux : eightBitmux2to1
	PORT MAP(
		i_op0 => int_adder,
		i_op1 => i_adder,
		i_selection => i_branch,
		o_choice => int_mux
		);

inc : addSUB
	PORT MAP(
	i_xx => int_pc,
	i_yy(0) => '0',
	i_yy(1) => '0',
	i_yy(2) => '1',
	i_yy(3) => '0',
	i_yy(4) => '0',
	i_yy(5) => '0',
	i_yy(6) => '0',
	i_yy(7) => '0',
	i_operation => '0',
	o_s => int_adder
	);
	
instunit : MEM_INST 
	PORT MAP(
		i_resetBar => i_enable,
		i_ADDR => int_pc,
		i_clock => i_clock,
		o_INTS => o_inst
		);

o_adder <= int_adder;

END rtl;