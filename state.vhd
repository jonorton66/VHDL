-------------------------------------------------------------------------------
--
-- Title       : \3state\
-- Design      : 3state
-- Author      : Jon
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\3state\3state\src\3state.vhd
-- Generated   : Sat Jan 18 13:40:22 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {\3state\} architecture {\3state\}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity \state\ is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 c : in STD_LOGIC;
		 d : out STD_LOGIC;
		 f : out STD_LOGIC
	     );
end \state\;

--}} End of automatically maintained section

architecture \state\ of \state\ is
begin

d<= (a and b);
f<= (d or not c);

end \state\;
