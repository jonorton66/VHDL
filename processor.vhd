library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- R0 - R7, RA, RB and RC are shown as outputs to help with debugging

entity processor is 
Port(
instruction: IN std_logic_vector(15 downto 0);
clk: IN std_logic;
R0, R1, R2, R3, R4, R5, R6, R7: OUT std_logic_vector(15 downto 0);
RA, RB, RC: buffer std_logic_vector(15 downto 0)
);
end entity;

architecture behavioral of processor is

component ALU
  port (
       A 		: in STD_LOGIC_VECTOR(15 downto 0);
       B 		: in STD_LOGIC_VECTOR(15 downto 0);
       Sel 		: in STD_LOGIC_VECTOR(2 downto 0);
       ResultVal : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component DECODER
  port (
       Input : in STD_LOGIC_VECTOR(3 downto 0);
       Output : out STD_LOGIC_VECTOR(8 downto 0)
  );
end component;
component mux
  port (
       I0 : in STD_LOGIC_VECTOR(3 downto 0);
       I1 : in STD_LOGIC_VECTOR(3 downto 0);
       Sel : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component registerfile
  port (
       CLK : in STD_LOGIC;
       DATI : in STD_LOGIC_VECTOR(15 downto 0);
       WE : in STD_LOGIC;
       regASel : in STD_LOGIC_VECTOR(3 downto 0);
       regBSel : in STD_LOGIC_VECTOR(3 downto 0);
       writeRegSel : in STD_LOGIC_VECTOR(3 downto 0);
       a : out STD_LOGIC_VECTOR(15 downto 0);
       b : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component Sign_Extend_8_to_16
  port (
       ExtendIn : in STD_LOGIC_VECTOR(7 downto 0);
       ExtendOut : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component smallmux
  port (
       I0 : in STD_LOGIC_VECTOR(15 downto 0);
       I1 : in STD_LOGIC_VECTOR(15 downto 0);
       Sel : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component SRAM
  port (
       Addr : in STD_LOGIC_VECTOR(7 downto 0);
       Clock : in STD_LOGIC;
       Data_in : in STD_LOGIC_VECTOR(15 downto 0);
       Read : in STD_LOGIC;
       Write : in STD_LOGIC;
       Data_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;

signal BUS1479 : STD_LOGIC;
signal BUS1424 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1515 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS1524 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS1533 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS1570 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS1595 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS1657 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS2463 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS2517 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS2527 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS2532 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS2537 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS2542 : STD_LOGIC_VECTOR (8 downto 0);
signal BUS2566 : STD_LOGIC_VECTOR (2 downto 0);
signal BUS2581 : STD_LOGIC_VECTOR (7 downto 0);
signal BUS2586 : STD_LOGIC_VECTOR (15 downto 0);
signal BUS2628 : STD_LOGIC_VECTOR (15 downto 0);

begin
	
BUS1479 <= clk;
BUS2628 <= instruction;
--BUS2463 <= R0;

U1 : DECODER
  port map(
       Input => BUS2628(15 downto 12),
       Output => BUS2542
  );

U2 : registerfile
  port map(
       CLK => BUS1479,
       DATI => BUS1657,
       WE => BUS2542(0),
       a => BUS1533,
       b => BUS1515,
       regASel => BUS2628(7 downto 4),
       regBSel => BUS1424,
       writeRegSel => BUS2628(11 downto 8)
  );

U3 : smallmux
  port map(
       I0 => BUS1515,
       I1 => BUS1570,
       O => BUS1524,
       Sel => BUS2542(1)
  );

U4 : SRAM
  port map(
       Addr => instruction(7 downto 0),
       Clock => BUS1479,
       Data_in => BUS1515,
       Data_out => BUS1595,
       Read => BUS2542(7),
       Write => BUS2542(2)
  );

U5 : ALU
  port map(
       A => BUS1533,
       B => BUS1524,
       Resultval => BUS2463,
       Sel => BUS2542(5 downto 3)
  );

U6 : smallmux
  port map(
       I0 => BUS2463,
       I1 => BUS1595,
       O => BUS1657,
       Sel => BUS2542(6)
  );

U7 : Sign_Extend_8_to_16
  port map(
       ExtendIn => BUS2628(7 downto 0),
       ExtendOut => BUS1570
  );

U9 : mux
  port map(
       I0(3) => BUS2628(11),
       I0(2) => BUS2628(10),
       I0(1) => BUS2628(9),
       I0(0) => BUS2628(8),
       I1(3) => BUS2628(3),
       I1(2) => BUS2628(2),
       I1(1) => BUS2628(1),
       I1(0) => BUS2628(0),
       O => BUS1424,
       Sel => BUS2542(8)
  );

end behavioral;
