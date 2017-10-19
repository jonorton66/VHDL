library ieee;
use ieee.std_logic_1164.all;

entity orGate is 
   port(	A, B : in std_logic;
            F : out std_logic);
end orGate;

architecture func of orGate is 
begin
   F <= A or B;
end func;
