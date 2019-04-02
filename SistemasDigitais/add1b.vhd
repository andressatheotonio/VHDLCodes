-- SISTEMAS DIGITAIS 27/03/2019
-- CARRY RIPPLE ADDER
-- FEITO POR: CALEBE OLIVEIRA
-- ADAPTADO POR: ANDRESSA THEOTONIO

library ieee;
use ieee.std_logic_1164.all;

entity add1b is 
port (a: in std_logic;
		b: in std_logic;
		cin: in std_logic;
		cout: out std_logic;
		s: out std_logic
);
end add1b;


architecture arquitetura of add1b is
signal c: std_logic;
begin 
	c <= a xor b;
	cout <= (a and b) or (cin and c);
	s <= c xor cin;
end arquitetura; 
