Library ieee;
USE ieee.std_logic_1164.all;

--1. If (ID/EX.MemRead & ((ID/EX.RegisterRt = IF/ID.RegisterRs) or (ID/EX.RegisterRt = IF/ID.RegisterRt))) <-- lw stall (hazard detected)
--2  If (IF/ID.op = 000100 AND data1 == data2) <--branch stall
--3  If (MEM/WB.WriteRegister = IF/ID.rt OR MEM/WB.WriteRegister = IF/ID.rs) AND (MEM/WB.RegWrite)	<-- lw stall


Entity HazardDetect is
    Port ( 
        ID_EX_MemRead : in std_logic;
        MEM_WB_RegWrite : in std_logic;
        ID_EX_RegRt : in std_logic_vector(4 downto 0);
        IF_ID_RegRt : in std_logic_vector(4 downto 0);
        IF_ID_RegRs : in std_logic_vector(4 downto 0);
        MEM_WB_WriteReg: in std_logic_vector(4 downto 0);
        IF_ID_op : in std_logic_vector(5 downto 0);
        PC_Write : out std_logic;
        IF_ID_Write : out std_logic;
        ControlMux : out std_logic

    );
End HazardDetect;

Architecture rtl of HazardDetect is

	SIGNAL int_ops : STD_logic_vector(5 downto 0);
    SIGNAL hazard1, hazard2: std_logic;

Begin

int_ops(0)<='0';
int_ops(1)<='0';
int_ops(2)<='1';
int_ops(3)<='0';
int_ops(4)<='0';
int_ops(5)<='0';

    hazard1 <= (((((ID_EX_RegRt(4) xnor IF_ID_RegRs(4))AND(ID_EX_RegRt(3) xnor IF_ID_RegRs(3)))AND((ID_EX_RegRt(2) xnor IF_ID_RegRs(2))AND(ID_EX_RegRt(1) xnor IF_ID_RegRs(1))))AND(ID_EX_RegRt(0) xnor IF_ID_RegRs(0)))OR((((ID_EX_RegRt(4) xnor IF_ID_RegRt(4))AND(ID_EX_RegRt(3) xnor IF_ID_RegRt(3)))AND((ID_EX_RegRt(2) xnor IF_ID_RegRt(2))AND(ID_EX_RegRt(1) xnor IF_ID_RegRt(1))))AND((ID_EX_RegRt(0) xnor IF_ID_RegRt(0))AND ID_EX_MemRead)));
    
	 
	 hazard2 <= ((((ID_EX_RegRt(4) xnor IF_ID_RegRt(4))AND(ID_EX_RegRt(3) xnor IF_ID_RegRt(3)))AND((ID_EX_RegRt(2) xnor IF_ID_RegRt(2))AND(ID_EX_RegRt(1) xnor IF_ID_RegRt(1))))AND((ID_EX_RegRt(0) xnor IF_ID_RegRt(0))AND(IF_ID_op(2) and  int_ops(2))));

    PC_Write <= (((not hazard1) OR (not hazard2)) AND (not ID_EX_MemRead));
    IF_ID_Write <= (((not hazard1) OR (not hazard2)) AND (not ID_EX_MemRead));
    ControlMux <= ID_EX_MemRead AND (hazard1 or hazard2);

End rtl;