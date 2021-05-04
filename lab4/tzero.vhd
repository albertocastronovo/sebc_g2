library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity tzero is
port (	ck : in std_logic;
	rst : in std_logic;
	A : in std_logic_vector(7 downto 0);
	B : out std_logic_vector(8 downto 0);
	C : out std_logic_vector(7 downto 0));
end tzero;

architecture behavioral of tzero is

signal AOLD, buss : std_logic_vector(7 downto 0);
signal AX : std_logic_vector(8 downto 0);
signal seq, seqold : std_logic;
signal seqtmp : std_logic;
begin

	seq <= seqold;
	
	pck: process(ck,rst)
	begin
	  if rst='1' then
	    AOLD <= (others => '0');
	    seqold <= '0';
	  elsif ck'event and ck='1' then
	    if seqtmp = '0' then
	      AOLD <= A;
	    end if;
	    seqold <= seqtmp;
	  end if;
	end process;
	
	buss <= AOLD;
	
	seq_control: process(A)
	begin
	  if (A != AOLD) then
	    AOLD <= A;
	    seqtmp <= '0';
	  else
	    seqtmp <= '1';
	  end if;
	end process;
	
	pdec: process(ck,rst)
	begin
	  if rst='1' then
	    C <= (others => '0');
	  elsif ck'event and ck='1' then
	    if seq='0' then
	      C <= buss;
	    else
	      C <= C+1;
	    end if;
	  end if;
	end process;
	
	B(7 downto 0) <= buss;
	B(8) <= seq;
	
end behavioral;
