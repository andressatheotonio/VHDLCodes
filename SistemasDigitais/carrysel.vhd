--CARRY SELECT ADDER
--SISTEMAS DIGITAIS 10/4/2019
--FEITO POR ANDRESSA THEOTONIO

library ieee;
use ieee.std_logic_1164.all;

entity carrysel is
generic(n: integer := 8);

port(cin: in std_logic;
	  cout: out std_logic;
	  s: out std_logic_vector(n-1 downto 0);
	  in1, in2: in std_logic_vector(n-1 downto 0));
	  
end carrysel;

architecture func of carrysel is

component addnbits is

port(a,b: in std_logic_vector(3 downto 0);
	  s: out std_logic_vector(3 downto 0);
	  cin: in std_logic;
	  cout: out std_logic);
	  
end component;

component mux is

port(a,b,c: in std_logic;
		s: out std_logic);
		
end component;


signal entradaA1, entradaA2, entradaB1, entradaB2: std_logic_vector(3 downto 0);
signal saidaadd1, saidaadd2, saidaadd3: std_logic_vector(3 downto 0);
signal cout1, cout2, cout3: std_logic;

begin

entradaA1(0) <= in1(0);
entradaA1(1) <= in1(1);
entradaA1(2) <= in1(2);
entradaA1(3) <= in1(3);

entradaA2(0) <= in1(4);
entradaA2(1) <= in1(5);
entradaA2(2) <= in1(6);
entradaA2(3) <= in1(7);

entradaB1(0) <= in2(0);
entradaB1(1) <= in2(1);
entradaB1(2) <= in2(2);
entradaB1(3) <= in2(3);

entradaB2(0) <= in2(4);
entradaB2(1) <= in2(5);
entradaB2(2) <= in2(6);
entradaB2(3) <= in2(7);

add1: addnbits port map(entradaA1,entradaB1,saidaadd1,cin,cout1);
add2: addnbits port map(entradaA2,entradaB2,saidaadd2,'1',cout2);
add3: addnbits port map(entradaA2,entradaB2,saidaadd3,'0',cout3);


mux1: mux port map(saidaadd2(0),saidaadd3(0),cout1,s(4));
mux2: mux port map(saidaadd2(1),saidaadd3(1),cout1,s(5));
mux3: mux port map(saidaadd2(2),saidaadd3(2),cout1,s(6));
mux4: mux port map(saidaadd2(3),saidaadd3(3),cout1,s(7));
muxao: mux port map(cout2, cout3, cout1, cout);

end func;
