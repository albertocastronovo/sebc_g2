--
-- A gate level 1 bit adder model.
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY gate_vh_adder IS 
    PORT(
        a     : IN    STD_LOGIC;
        b     : IN    STD_LOGIC;
        c_in  : IN    STD_LOGIC;
        sum   : OUT   STD_LOGIC;
        c_out : OUT   STD_LOGIC);
END gate_vh_adder;

ARCHITECTURE behv OF gate_vh_adder IS
BEGIN
    sum <= a XOR b XOR c_in;
    c_out <= (a AND b) OR (c_in AND (a XOR b));
END behv;
