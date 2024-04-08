LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Fetch_inst IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END Fetch_inst;

ARCHITECTURE rtl OF Fetch_inst IS
	SIGNAL int_PC, int_PCdata : STD_LOGIC_VECTOR( 0 TO 7);


COMPONENT reg8 IS
	PORT(
		i_clear	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_data: IN STD_LOGIC_VECTOR(7 downto 0);
		o_Q			: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;

COMPONENT addSUB IS
	PORT(
	i_xx, i_yy : IN STD_logic_vector(0 to 7);
	--i_cinBit :IN STD_logic;
	i_operation: IN STD_logic;
	o_s:OUT STD_logic_vector(0 to 7);
	o_c:OUT STD_logic);
	
END COMPONENT;

BEGIN

pc : reg8
	PORT MAP(
		i_clear => '1',
		i_clock => i_Clock,
		i_enable => i_enable,
		i_data => int_PCData,
		o_Q => int_PC);

PCINC : addSUB
	PORT MAP(
	i_xx => int_PC,
	i_yy => ((5) => '1', others => '0'),
	i_operation => '0',
	o_s => int_PCdata);
	

END;
 
