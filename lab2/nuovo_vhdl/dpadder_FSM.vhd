LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dpadder_FSM IS
	PORT(
		clock	: IN std_logic;
		reset	: IN std_logic;
		sel 	: OUT std_logic_vector(3 DOWNTO 0);
	);
END dpadder_FSM;

ARCHITECTURE behavioral OF dpadder_FSM IS

	TYPE state_type IS (s1, s2, s3, s4, s5);
	ATTRIBUTE enum_encoding	: string;
	ATTRIBUTE enum_encoding OF state_type	: TYPE IS "100 110 011 001 000";
	signal state	: state_type;



	BEGIN
		PROCESS(clock, reset)
			BEGIN
				IF reset = '1' THEN
					state <= s1;
				ELSIF(clock'EVENT AND clock = '1') THEN
					CASE state IS
						WHEN s1 =>
							state <= s2;
						WHEN s2 =>
							state <= s3;
						WHEN s3 =>
							state <= s4;
						WHEN s4 =>
							state <= s5;
						WHEN OTHERS =>
							state <= s1;
					END CASE;
		END PROCESS;
		
		PROCESS(state)
			BEGIN
				CASE state IS
					WHEN s1 =>
						sel <= "0000";
					WHEN s2 =>
						sel <= "0101";
					WHEN s3 =>
						sel <= "0111";
					WHEN s4 =>
						sel <= "1110";
					WHEN OTHERS =>
						sel <= "1010";
		END PROCESS;
		
END behavioral;

configuration CFG_dpadder_FSM of dpadder_FSM is
	for  behavioral
	end for;
end CFG_dpadder_FSM;
	
