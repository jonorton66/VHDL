library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
   port( A, B, Cin : in std_logic;
         sum, Cout : out std_logic);
end fullAdder;
--
architecture FullAdder of FullAdder is

   component HalfAdder is --import Half Adder entity
      port( A, B  : in std_logic;
        sum, Cout : out std_logic);
   end component;

   component orGate is --import OR Gate entity
      port( A, B : in std_logic;
             F : out std_logic);
   end component;
	
   signal halfTohalf, halfToOr1, halfToOr2: std_logic;

begin
   G1: HalfAdder port map(A, B, halfTohalf, halfToOr1);
   G2: HalfAdder port map(halfTohalf, Cin, sum, halfToOr2);
   G3: orGate port map(halfToOr1, halfToOr2, Cout);
end FullAdder;
