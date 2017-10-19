
library ieee;
use ieee.std_logic_1164.all;

entity halfAdder is
   port( A, B : in std_logic;
    sum, Cout : out std_logic);
end halfAdder;

architecture HalfAdder of HalfAdder is

   component andGate is -- import AND Gate
      port( A, B : in std_logic;
               F : out std_logic);
   end component;

   component xorGate is -- import XOR Gate
     port( A, B : in std_logic;
              F : out std_logic);
   end component;

begin
  G1 : xorGate port map(A, B, sum);
  G2 : andGate port map(A, B, Cout);
end halfAdder;