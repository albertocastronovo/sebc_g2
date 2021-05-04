
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_fsmadder is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_fsmadder;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fsmadder.all;

entity fsmadder is

   port( A, B, C, D, E, F : in std_logic_vector (15 downto 0);  clock, reset : 
         in std_logic;  O : inout std_logic_vector (15 downto 0));

end fsmadder;

architecture SYN_structural of fsmadder is

   component datapath_adder
      port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
            std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10,
            SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));
   end component;
   
   component dpadder_FSM
      port( clock, reset : in std_logic;  sel : out std_logic_vector (3 downto 
            0));
   end component;
   
   signal sel_3_port, sel_2_port, sel_1_port, sel_0_port : std_logic;

begin
   
   fsm : dpadder_FSM port map( clock => clock, reset => reset, sel(3) => 
                           sel_3_port, sel(2) => sel_2_port, sel(1) => 
                           sel_1_port, sel(0) => sel_0_port);
   datapath : datapath_adder port map( MUX00(15) => A(15), MUX00(14) => A(14), 
                           MUX00(13) => A(13), MUX00(12) => A(12), MUX00(11) =>
                           A(11), MUX00(10) => A(10), MUX00(9) => A(9), 
                           MUX00(8) => A(8), MUX00(7) => A(7), MUX00(6) => A(6)
                           , MUX00(5) => A(5), MUX00(4) => A(4), MUX00(3) => 
                           A(3), MUX00(2) => A(2), MUX00(1) => A(1), MUX00(0) 
                           => A(0), MUX01(15) => O(15), MUX01(14) => O(14), 
                           MUX01(13) => O(13), MUX01(12) => O(12), MUX01(11) =>
                           O(11), MUX01(10) => O(10), MUX01(9) => O(9), 
                           MUX01(8) => O(8), MUX01(7) => O(7), MUX01(6) => O(6)
                           , MUX01(5) => O(5), MUX01(4) => O(4), MUX01(3) => 
                           O(3), MUX01(2) => O(2), MUX01(1) => O(1), MUX01(0) 
                           => O(0), MUX02(15) => B(15), MUX02(14) => B(14), 
                           MUX02(13) => B(13), MUX02(12) => B(12), MUX02(11) =>
                           B(11), MUX02(10) => B(10), MUX02(9) => B(9), 
                           MUX02(8) => B(8), MUX02(7) => B(7), MUX02(6) => B(6)
                           , MUX02(5) => B(5), MUX02(4) => B(4), MUX02(3) => 
                           B(3), MUX02(2) => B(2), MUX02(1) => B(1), MUX02(0) 
                           => B(0), MUX03(15) => C(15), MUX03(14) => C(14), 
                           MUX03(13) => C(13), MUX03(12) => C(12), MUX03(11) =>
                           C(11), MUX03(10) => C(10), MUX03(9) => C(9), 
                           MUX03(8) => C(8), MUX03(7) => C(7), MUX03(6) => C(6)
                           , MUX03(5) => C(5), MUX03(4) => C(4), MUX03(3) => 
                           C(3), MUX03(2) => C(2), MUX03(1) => C(1), MUX03(0) 
                           => C(0), MUX10(15) => D(15), MUX10(14) => D(14), 
                           MUX10(13) => D(13), MUX10(12) => D(12), MUX10(11) =>
                           D(11), MUX10(10) => D(10), MUX10(9) => D(9), 
                           MUX10(8) => D(8), MUX10(7) => D(7), MUX10(6) => D(6)
                           , MUX10(5) => D(5), MUX10(4) => D(4), MUX10(3) => 
                           D(3), MUX10(2) => D(2), MUX10(1) => D(1), MUX10(0) 
                           => D(0), MUX11(15) => E(15), MUX11(14) => E(14), 
                           MUX11(13) => E(13), MUX11(12) => E(12), MUX11(11) =>
                           E(11), MUX11(10) => E(10), MUX11(9) => E(9), 
                           MUX11(8) => E(8), MUX11(7) => E(7), MUX11(6) => E(6)
                           , MUX11(5) => E(5), MUX11(4) => E(4), MUX11(3) => 
                           E(3), MUX11(2) => E(2), MUX11(1) => E(1), MUX11(0) 
                           => E(0), MUX12(15) => F(15), MUX12(14) => F(14), 
                           MUX12(13) => F(13), MUX12(12) => F(12), MUX12(11) =>
                           F(11), MUX12(10) => F(10), MUX12(9) => F(9), 
                           MUX12(8) => F(8), MUX12(7) => F(7), MUX12(6) => F(6)
                           , MUX12(5) => F(5), MUX12(4) => F(4), MUX12(3) => 
                           F(3), MUX12(2) => F(2), MUX12(1) => F(1), MUX12(0) 
                           => F(0), MUX13(15) => O(15), MUX13(14) => O(14), 
                           MUX13(13) => O(13), MUX13(12) => O(12), MUX13(11) =>
                           O(11), MUX13(10) => O(10), MUX13(9) => O(9), 
                           MUX13(8) => O(8), MUX13(7) => O(7), MUX13(6) => O(6)
                           , MUX13(5) => O(5), MUX13(4) => O(4), MUX13(3) => 
                           O(3), MUX13(2) => O(2), MUX13(1) => O(1), MUX13(0) 
                           => O(0), clock => clock, reset => reset, SEL00 => 
                           sel_3_port, SEL01 => sel_2_port, SEL10 => sel_1_port
                           , SEL11 => sel_0_port, SUM(15) => O(15), SUM(14) => 
                           O(14), SUM(13) => O(13), SUM(12) => O(12), SUM(11) 
                           => O(11), SUM(10) => O(10), SUM(9) => O(9), SUM(8) 
                           => O(8), SUM(7) => O(7), SUM(6) => O(6), SUM(5) => 
                           O(5), SUM(4) => O(4), SUM(3) => O(3), SUM(2) => O(2)
                           , SUM(1) => O(1), SUM(0) => O(0));

end SYN_structural;
