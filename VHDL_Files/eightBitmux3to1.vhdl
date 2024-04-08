LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightBitmux3to1 IS
	PORT(
		i_op00:IN STD_LOGIC_VECTOR(7 downto 0);
		i_op01:IN STD_LOGIC_VECTOR(7 downto 0);
		i_op10:IN STD_LOGIC_VECTOR(7 downto 0);
		i_sel: IN STD_LOGIC_VECTOR(1 downto 0);
		o_choice:OUT STD_LOGIC_VECTOR(7 downto 0));
END eightBitmux3to1;

Architecture rtl OF eightBitmux3to1 IS

SIGNAL int_choice : STD_LOGIC_VECTOR(7 downto 0);

COMPONENT eightBitmux2to1
	PORT(
		i_op0:IN STD_LOGIC_VECTOR(7 downto 0);
		i_op1:IN STD_LOGIC_VECTOR(7 downto 0);
		i_selection: IN STD_LOGIC;
		o_choice:OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;


BEGIN

op1 : eightBitmux2to1
	PORT MAP(
		i_op0 => i_op00,
		i_op1 => i_op01,
		i_selection => i_sel(0),
		o_choice => int_choice
		);

op2 : eightBitmux2to1
	PORT MAP(
		i_op0 => int_choice,
		i_op1 => i_op10,
		i_selection => i_sel(1),
		o_choice => o_choice
		);

END rtl;