
library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic


entity FSM-ADDER is
port( 	A, B, C, D, E, F:	in std_logic_vector(15 downto 0);
	clock: 	in std_logic;
	reset:	in std_logic;
	O:	buffer std_logic
);
end	FSM-ADDER;

---------------------------------------------

architecture FSM_OPC of FSM-ADDER is

	COMPONENT dpadder
	port(   MUX00:  in std_logic_vector(15 downto 0);
        MUX01:  in std_logic_vector(15 downto 0);
        MUX02:  in std_logic_vector(15 downto 0);
        MUX03:  in std_logic_vector(15 downto 0);
        MUX10:  in std_logic_vector(15 downto 0);
        MUX11:  in std_logic_vector(15 downto 0);
        MUX12:  in std_logic_vector(15 downto 0);
        MUX13:  in std_logic_vector(15 downto 0);
        clock:  in std_logic;
        reset:  in std_logic;
        SEL00:  in std_logic;
        SEL01:  in std_logic;
        SEL10:  in std_logic;
        SEL11:  in std_logic;
        SUM:    out std_logic_vector(15 downto 0)
        );
	END COMPONENT;

	type states IS (s1, s2, s3, s4, s5);
	attribute enum_encoding : string;
	attribute enum_encoding OF states : type IS "100 110 011 001 000";
	signal CURRENT_STATE : states;
	signal NEXT_STATE : states;
	
	signal sel : std_logic_vector(0 to 3); -- selettore mux

begin

	adder: dpadder port map (MUX00 => A,
				MUX01 => O,
				MUX02 => B,
				MUX03 => C,
				MUX10 => D,
				MUX11 => E,
				MUX12 => F,
				MUX13 => O,
				clock => clock,
				reset => reset,
				SEL00 => sel(0),
				SEL01 => sel(1),
				SEL10 => sel(2),
				SEL11 => sel(3),
				SUM => O);

 	P_OPC : process(CLOCK, RESET)		
	begin
		
		if reset='1' then
	    	CURRENT_STATE <= S0;
		elsif (clock ='1' and clock'EVENT) then 
			CURRENT_STATE <= NEXT_STATE;
		end if;
	end process P_OPC;

	P_NEXT_STATE : process(CURRENT_STATE)
	begin
		case CURRENT_STATE is
			when s1 => NEXT_STATE <= s2;
			when s2 => NEXT_STATE <= s3;
			when s3 => NEXT_STATE <= s4;
			when s4 => NEXT_STATE <= s5;
			when others => NEXT_STATE <= s1;
		end case;	
	end process P_NEXT_STATE;

	
	P_OUTPUTS: process(CURRENT_STATE)
	begin
		sel <= others => '0';
		case CURRENT_STATE is
				
			when s2 => sel <= "0101" ;
			when s3 => sel <= "0111";
			when s4 => sel <= "1110";
			when s5 => sel <= "1010";
		end case; 	
	end process P_OUTPUTS;
end FSM_OPC;
 

configuration CFG_FSM_OPC of FSM-ADDER is
	for  FSM_OPC
	end for;
end CFG_FSM_OPC;
