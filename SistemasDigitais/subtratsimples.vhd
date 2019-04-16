-- SUBTRATOR UTILIZANDO RIPPLE CARRY
-- SISTEMAS DIGITAIS 16/04/2019
-- FEITO POR ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity subtratsimples is
generic(n: integer := 4);
	port(a,b: in std_logic_vector(n-1 downto 0);
		  m: in std_logic;
		  cout: out std_logic;
		  s: out std_logic_vector(n-1 downto 0));
end subtratsimples;

architecture sub of subtratsimples is

component addnbits is
generic(n: integer := 4);
port(a,b: in std_logic_vector(n-1 downto 0);
	s: out std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	cout: out std_logic
);
end component;

signal bs: std_logic_vector(n-1 downto 0);

begin

laco: FOR i IN 0 to n-1 generate
	bs(i) <= b(i) xor m;
end generate;

subadd: addnbits port map(a, bs, s, m, cout);

end sub;

