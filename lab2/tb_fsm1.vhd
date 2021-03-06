library IEEE;

use IEEE.std_logic_1164.all;
		


entity TBFSM is
end TBFSM;

architecture TEST of TBFSM is

	signal a, b, c, d, e, f: std_logic_vector(15 downto 0);
	signal T_CLOCK: std_logic;
	signal T_RESET: std_logic;
	signal T_OUT: std_logic_vector(15 downto 0);

	component fsmadder IS
	PORT(
		A, B, C, D, E, F	: IN std_logic_vector(15 DOWNTO 0);
		clock, reset		: IN std_logic;
		O			: BUFFER std_logic_vector(15 DOWNTO 0)
	);
	
	end component;



begin

	U_fsm_opc: fsmadder
	Port Map (a, b, c, d, e, f, T_CLOCK, T_RESET, T_OUT );
	
	a <= (others => '0');
	b <= (others => '0');
	c <= (others => '0');
	d <= (others => '0');
	e <= (others => '0');
	f <= (others => '0');
	
	process
	begin
		T_CLOCK <= '1';			-- clock cycle 6 ns
		wait for 3 ns;
		T_CLOCK <= '0';
		wait for 3 ns;
	end process;
	
		T_RESET <= '1' after 2 ns, '0' after 10 ns;
		
end TEST;

-------------------------------

configuration CFG_TB of TBFSM is
	for TEST
	end for;
end CFG_TB;

