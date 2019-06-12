- Data: 30/04/2019
-- Sistemas Digitais
-- Multiplicador

library ieee;
use ieee.std_logic_1164.all;


entity mult is 
generic (m:integer :=4); -- qtd de bits das entradas do multiplicador
port(a,b:in std_logic_vector(m-1 downto 0); -- entradas do multiplicador
	  s:out std_logic_vector((2*m)-1 downto 0)); -- saída do multiplicador, o dobro de bits
end mult;


architecture op of mult is 

component adder is -- adicionando o somador
generic(n: integer := m); -- qtd de bits das entradas do multiplicador, com coerência
port(a,b: in std_logic_vector(n-1 downto 0); -- entradas do somador
     s: out std_logic_vector(n-1 downto 0); -- saídas do somador
	  cout: out std_logic); -- carry out
end component;

type matrix is array (0 to m-1) of std_logic_vector(m-1 downto 0); -- o tipo matriz
signal produto: matrix; --- matriz que guardará a multiplicacao entre todos os bits de a com todos os bits de b;
signal s_som:matrix; -- saida dos somadores
signal enter_som:matrix; -- entrada dos somadores
signal couts: std_logic_vector(m-1 downto 0); -- carry dos somadores


begin

loop1: for linha in 0 to m-1 generate -- for aninhado fazendo o produto entre os bits de a e b
			loop2: for coluna in 0 to m-1 generate
				produto(linha)(coluna) <= a(linha) and b(coluna);
		end generate;
end generate;

s_som(0)<=produto(0); -- a primeira linha da saída dos somadores vai receber a primeira linha da matriz produto
couts(0)<='0'; -- o primeiro índice do carry dos somadores recebe 0

loop3: for i in 0 to m-2 generate  -- for utilizado para preencher a matriz de entrada dos somadores 
		enter_som(i) <= couts(i) & s_som(i)(m-1 downto 1); -- calculando a entrada do somador
		somador:adder port map ( a => enter_som(i), -- entrada 1 do somador
					 b => produto(i+1), -- entrada 2 do somador
					 s => s_som(i+1), -- saída do somador
					 cout=>couts(i+1)); -- carry out

		s(i)<=s_som(i)(0); -- preenchendo o vetor de saída do multiplicador de 0 até m-2
end generate;
s(2*m-1)<= couts(m-1); -- preenchendo o último índice da saída do multiplicador
s(2*m-2 downto 2*m-2-(m-1))<= s_som(m-1); -- preenchendo o vetor de saída do multiplicador do penúltimo 	
	
end op;
