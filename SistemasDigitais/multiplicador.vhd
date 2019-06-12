- Data: 30/04/2019
-- Sistemas Digitais
-- Multiplicador

library ieee;
use ieee.std_logic_1164.all;


entity mult is 
generic (m:integer :=4); -- bits do multiplicador
port(a,b:in std_logic_vector(m-1 downto 0); 
	  s:out std_logic_vector((2*m)-1 downto 0));
end mult;


architecture op of mult is 

component adder is
generic(n: integer := m);
port(a,b: in std_logic_vector(n-1 downto 0);
     s: out std_logic_vector(n-1 downto 0);
	  cout: out std_logic);
end component;

type matrix is array (0 to m-1) of std_logic_vector(m-1 downto 0); 
signal produto: matrix; --- multiplicacao entre todos os bits de a com todos os bits de b;
signal s_som:matrix; -- saida dos somadores
signal enter_som:matrix; -- entrada dos somadores
signal couts: std_logic_vector(m-1 downto 0); -- carry dos somadores


begin

loop1: for linha in 0 to m-1 generate
			loop2: for coluna in 0 to m-1 generate
				produto(linha)(coluna)<=a(linha)and b(coluna);
		end generate;
end generate;

s_som(0)<=produto(0);
couts(0)<='0';

loop3: for i in 0 to m-2 generate 
		enter_som(i) <= couts(i) & s_som(i)(m-1 downto 1);
		somador:adder port map ( a => enter_som(i),
										 b => produto(i+1),
										 s => s_som(i+1),
										 cout=>couts(i+1));
	s(i)<=s_som(i)(0);
end generate;
s(2*m-1)<= couts(m-1);
s(2*m-2 downto 2*m-2-(m-1))<= s_som(m-1);	
	
end op;
