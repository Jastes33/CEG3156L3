 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SYSCONTROL IS
	PORT(
		i_inst : IN STD_logic_VECTOR(5 downto 0);
		o_EX : OUT STD_logic_VECTOR (3 downto 0);
		o_M : OUT STD_logic_VECTOR (2 downto 0);
		o_WB : OUT STD_logic_VECTOR (1 downto 0));
		
END SYSCONTROL;

ARCHITECTURE rtl OF SYSCONTROL IS

SIGNAL int_inst, int_Ninst : STD_logic_VECTOR(5 downto 0);

--R-FORMAT = 0 -> 	000000
--load = 35 -> 		100011
--store = 43 -> 		101011
--BEQ = 4 -> 			000100


BEGIN


int_inst <= i_inst;
int_Ninst <= (not i_inst);

o_EX(3) <= ((((int_ninst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_ninst(1)) and (int_ninst(0))));
o_EX(2) <= ((((int_ninst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_ninst(1)) and (int_ninst(0))));
o_EX(1) <= ((((int_ninst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_inst(2)))) and ((int_ninst(1)) and (int_ninst(0))));
o_EX(0) <= (((((int_inst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_inst(1)) and (int_inst(0)))) or ((((int_inst(5)) and (int_ninst(4))) and ((int_inst(3)) and (int_ninst(2)))) and ((int_inst(1)) and (int_inst(0)))));
o_M(2) <= ((((int_ninst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_inst(2)))) and ((int_ninst(1)) and (int_ninst(0))));
o_M(1) <= ((((int_inst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_inst(1)) and (int_inst(0))));
o_M(0) <= ((((int_inst(5)) and (int_ninst(4))) and ((int_inst(3)) and (int_ninst(2)))) and ((int_inst(1)) and (int_inst(0))));
o_WB(1) <= (((((int_ninst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_ninst(1)) and (int_ninst(0)))) or ((((int_inst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_inst(1)) and (int_inst(0)))));
o_WB(0) <= ((((int_inst(5)) and (int_ninst(4))) and ((int_ninst(3)) and (int_ninst(2)))) and ((int_inst(1)) and (int_inst(0))));
		
END rtl;