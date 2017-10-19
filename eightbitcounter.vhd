library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity Switches_LEDs is
    Port ( LED : out  STD_LOGIC_VECTOR(7 downto 0);
    CLK : in STD_LOGIC );
end Switches_LEDs;
 
 
architecture Behavioral of Switches_LEDs is
 
signal counter : STD_LOGIC_VECTOR(26 downto 0) := (others => '0'); 
 
begin
 
clk_proc: process(CLK)
 begin
  if rising_edge(CLK) then
   counter <= counter + 1;
   LED(7 downto 0) <= counter(26 downto 19);
  end if;
 end process;
  
end Behavioral;
