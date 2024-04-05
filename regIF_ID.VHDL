LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regIF_ID IS
	PORT(
		i_adder 		: IN	STD_LOGIC_VECTOR(7 downto 0);
		i_clear		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		i_Enable		: IN STD_LOGIC;
		i_data		: IN STD_LOGIC_VECTOR(31 downto 0);
		o_data		: OUT	STD_LOGIC_VECTOR(31 downto 0);
		o_adder 		: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END regIF_ID;

ARCHITECTURE rtl OF regIF_ID IS

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
		i_Enable => i_enable,
		i_data => i_adder,
		o_Q => o_adder
		);
		

Areg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_data(31 downto 24),
		o_Q => o_data(31 downto 24)
		);
		

Breg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_data(23 downto 16),
		o_Q => o_data(23 downto 16)
		);
		

Creg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_data(15 downto 8),
		o_Q => o_data(15  downto 8)
		);
		

Dreg : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => i_enable,
		i_data => i_data(7 downto 0),
		o_Q => o_data(7 downto 0)
		);
		

		



END rtl;