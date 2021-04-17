LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fsmadder IS
	PORT(
		A, B, C, D, E, F	: IN std_logic_vector(15 DOWNTO 0);
		clock, reset		: IN std_logic;
		O			: BUFFER std_logic_vector(15 DOWNTO 0)
	);
END fsmadder;

ARCHITECTURE structural OF fsmadder IS

	COMPONENT dpadder_FSM
		PORT(
			clock	: IN std_logic;
			reset	: IN std_logic;
			sel 	: OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT datapath_adder
		PORT(
			MUX00	: IN std_logic_vector(15 DOWNTO 0);
			MUX01	: IN std_logic_vector(15 DOWNTO 0);
			MUX02	: IN std_logic_vector(15 DOWNTO 0);
			MUX03	: IN std_logic_vector(15 DOWNTO 0);
			MUX10	: IN std_logic_vector(15 DOWNTO 0);
			MUX11	: IN std_logic_vector(15 DOWNTO 0);
			MUX12	: IN std_logic_vector(15 DOWNTO 0);
			MUX13	: IN std_logic_vector(15 DOWNTO 0);
			clock	: IN std_logic;
			reset	: IN std_logic;
			SEL00	: IN std_logic;
			SEL01	: IN std_logic;
			SEL10	: IN std_logic;
			SEL11	: IN std_logic;
			SUM	: OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL sel	: std_logic_vector(3 DOWNTO 0);
	
	BEGIN
		fsm		: dpadder_FSM PORT MAP(
			clock 	=> clock,
			reset 	=> reset,
			sel 	=> sel
			);
			
		datapath	: datapath_adder PORT MAP(
			MUX00 => A,
			MUX01 => O,
			MUX02 => B,
			MUX03 => C,
			MUX10 => D,
			MUX11 => E,
			MUX12 => F,
			MUX13 => O,
			clock => clock,
			reset => reset,
			SEL00 => sel(3),
			SEL01 => sel(2),
			SEL10 => sel(1),
			SEL11 => sel(0),
			SUM => O
			);
			
END structural;

configuration CFG_fsmadder of fsmadder is
	for  structural
	end for;
end CFG_fsmadder;
