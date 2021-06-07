LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rca_vh_adder IS 
    GENERIC (N : integer:=8);
    PORT(
        in1     : IN    std_logic_vector(N-1 downto 0);
        in2     : IN    std_logic_vector(N-1 downto 0);
	c_in    : IN    std_logic;
	c_out   : OUT   std_logic;
        res     : OUT   std_logic_vector(N-1 downto 0));
END rca_vh_adder;

ARCHITECTURE struct OF rca_vh_adder IS

SIGNAL carry : std_logic_vector(N downto 0);

COMPONENT gate_vh_adder
PORT(
        a     : IN    STD_LOGIC;
        b     : IN    STD_LOGIC;
        c_in  : IN    STD_LOGIC;
        sum   : OUT   STD_LOGIC;
        c_out : OUT   STD_LOGIC);
END COMPONENT;

BEGIN

	carry(0) <= c_in;
	fa_i : for i in 0 to N-1 generate
	    fa_x : gate_vh_adder port map (in1(i), in2(i), carry(i), res(i), carry(i+1));
	end generate;
	c_out <= carry(N);
    
END struct;
