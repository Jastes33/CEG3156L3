LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg16ext32 IS
	PORT(
		i_Gclear	: IN	STD_LOGIC;
		i_Gclock			: IN	STD_LOGIC;
		i_GEnable			: IN STD_LOGIC;
		i_Gdata: IN STD_LOGIC_VECTOR(15 downto 0);
		o_GQ			: OUT	STD_LOGIC_VECTOR(31 downto 0));
		
END reg16ext32;

ARCHITECTURE rtl OF reg16ext32 IS

	SIGNAL int_Q : STD_LOGIC;
	
COMPONENT reg8 IS
	PORT(
		i_clear	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Enable			: IN STD_LOGIC;
		i_data: IN STD_LOGIC_VECTOR(7 downto 0);
		o_Q			: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;

BEGIN

int_Q <= i_Gdata(15);

A : reg8
	PORT MAP(
		i_clear => i_Gclear,
		i_clock => i_Gclock,
		i_Enable => i_GEnable,
		i_data => i_Gdata(7 downto 0),
		o_Q => o_GQ(7 downto 0)
		);

B : reg8
	PORT MAP(
		i_clear => i_Gclear,
		i_clock => i_Gclock,
		i_Enable => i_GEnable,
		i_data => i_Gdata(15 downto 8),
		o_Q => o_GQ(15 downto 8)
		);

C : reg8
	PORT MAP(
		i_clear => i_Gclear,
		i_clock => i_Gclock,
		i_Enable => i_GEnable,
		i_data => (others => int_Q),
		o_Q => o_GQ(23 downto 16)
		);

D : reg8
	PORT MAP(
		i_clear => i_Gclear,
		i_clock => i_Gclock,
		i_Enable => i_GEnable,
		i_data => (others => int_Q),
		o_Q => o_GQ(31 downto 24)
		);



END rtl;