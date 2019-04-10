-- SISTEMAS DIGITAIS 02/05/2019
-- CARRY RIPPLE ADDER OF N BITS
-- FEITO POR: CALEBE OLIVEIRA
library ieee;
use ieee.std_logic_1164.all;

entity addnbits is
generic(n: integer :=8);
port(a,b: in std_logic_vector(n-1 downto 0);
	s: out std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	cout: out std_logic
);
end addnbits;

architecture arquitetura of addnbits is
component ADD1b is 
port (a: in std_logic;
		b: in std_logic;
		cin: in std_logic;
		cout: out std_logic;
		s: out std_logic
);
end component;

signal carry: std_logic_vector(n downto 0);

begin

carry(0)<=cin;
cout<=carry(n);

laco: FOR i IN 0 to n-1 generate
	adds: ADD1b port map(a(i), b(i), carry(i), carry(i+1), s(i));
end generate;

end arquitetura;
