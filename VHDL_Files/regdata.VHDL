LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regdata IS
	PORT(
		i_read1, i_read2, i_write, i_waddr: IN STD_LOGIC_VECTOR(7 downto 0);
		i_regwrite : IN STD_LOGIC;
		i_clear		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_data1, o_data2 : OUT STD_LOGIC_VECTOR(7 downto 0));
		
END regdata;

ARCHITECTURE rtl OF regdata IS

		SIGNAL int_op0,int_op1,int_op2,int_op3,int_op4,int_op5,int_op6,int_op7: STD_LOGIC_VECTOR(7 downto 0);
		SIGNAL int_op8,int_op9,int_op10,int_op11,int_op12,int_op13,int_op14,int_op15: STD_LOGIC_VECTOR(7 downto 0);
		SIGNAL int_readA, int_readB, int_write : STD_LOGIC_VECTOR (15 downto 0);

COMPONENT reg8
	PORT(
		i_clear	: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_Enable			: IN STD_LOGIC;
		i_data: IN STD_LOGIC_VECTOR(7 downto 0);
		o_Q			: OUT	STD_LOGIC_VECTOR(7 downto 0));
		
END COMPONENT;

COMPONENT decoder_4to16
    Port (
        i_in : in STD_LOGIC_VECTOR (3 downto 0);
        o_out : out STD_LOGIC_VECTOR (15 downto 0)
    );
end COMPONENT;

COMPONENT eightBitmux16by2to1
	PORT(
		in_op0,in_op1,in_op2,in_op3,in_op4,in_op5,in_op6,in_op7:IN STD_LOGIC_VECTOR(7 downto 0);
		in_op8,in_op9,in_op10,in_op11,in_op12,in_op13,in_op14,in_op15:IN STD_LOGIC_VECTOR(7 downto 0);
		i_selection: IN STD_LOGIC_VECTOR(15 downto 0);
		o_choice:OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

BEGIN

readA : decoder_4to16
    Port MAP(
        i_in => i_read1(3 downto 0),
        o_out => int_readA
    );
	 
readAmux : eightBitmux16by2to1
	PORT MAP(
		in_op0 => int_op0,
		in_op1 => int_op1,
		in_op2 => int_op2,
		in_op3 => int_op3,
		in_op4 => int_op4,
		in_op5 => int_op5,
		in_op6 => int_op6,
		in_op7 => int_op7,
		in_op8 => int_op8,
		in_op9 => int_op9,
		in_op10 => int_op10,
		in_op11 => int_op11,
		in_op12 => int_op12,
		in_op13 => int_op13, 
		in_op14 => int_op14,
		in_op15 => int_op15,
		i_selection => int_readA,
		o_choice => o_data1
		);
	 
readB : decoder_4to16
    Port MAP(
        i_in => i_read2(3 downto 0),
        o_out => int_readB
		  );

readBmux : eightBitmux16by2to1
	PORT MAP(
		in_op0 => int_op0,
		in_op1 => int_op1,
		in_op2 => int_op2,
		in_op3 => int_op3,
		in_op4 => int_op4,
		in_op5 => int_op5,
		in_op6 => int_op6,
		in_op7 => int_op7,
		in_op8 => int_op8,
		in_op9 => int_op9,
		in_op10 => int_op10,
		in_op11 => int_op11,
		in_op12 => int_op12,
		in_op13 => int_op13, 
		in_op14 => int_op14,
		in_op15 => int_op15,
		i_selection => int_readB,
		o_choice => o_data2
		);
	 
writeA : decoder_4to16
    Port MAP(
        i_in => i_waddr(3 downto 0),
        o_out => int_write
    );

A : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(0),
		i_data => i_write,
		o_Q => int_op0
);
B : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(1),
		i_data => i_write,
		o_Q => int_op1
);
C : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(2),
		i_data => i_write,
		o_Q => int_op2
);
D : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(3),
		i_data => i_write,
		o_Q => int_op3 
);
E : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(4),
		i_data => i_write,
		o_Q => int_op4
);
F : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(5),
		i_data => i_write,
		o_Q => int_op5 
);
G : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(6),
		i_data => i_write,
		o_Q => int_op6
);
H : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(7),
		i_data => i_write,
		o_Q => int_op7
);
I : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(8),
		i_data => i_write,
		o_Q => int_op8
);
J : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(9),
		i_data => i_write,
		o_Q => int_op9
);
K : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(10),
		i_data => i_write,
		o_Q => int_op10
);
L : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(11),
		i_data => i_write,
		o_Q => int_op11
);
M : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(12),
		i_data => i_write,
		o_Q => int_op12 
);
N : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(13),
		i_data => i_write,
		o_Q => int_op13
);
O : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(14),
		i_data => i_write,
		o_Q => int_op14
);
P : reg8
	PORT MAP(
		i_clear => i_clear,
		i_clock => i_clock,
		i_Enable => int_write(15),
		i_data => i_write,
		o_Q => int_op15
);

END rtl;