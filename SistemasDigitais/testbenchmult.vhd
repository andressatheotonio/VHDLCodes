-- testbench multiplicador
-- 30/05/2019

library ieee;
use ieee.std_logic_1164.all;

entity testbenchmult is 
end testbenchmult;

architecture func of testbenchmult is 


component mult is 
generic (m:integer :=4); -- bits do multiplicador
port(a,b:in std_logic_vector(m-1 downto 0);
	  s:out std_logic_vector(2*m-1 downto 0));
end component;

signal a,b:std_logic_vector(3 downto 0);
signal s:std_logic_vector(7 downto 0);

begin 

x:mult port map(a,b,s);

a <= "0010",
     "0100" after 100 ns,
	  "0011" after 200 ns,
	  "0011" after 300 ns,
	  "0000" after 400 ns;
	  
b <= "0000",
     "0001" after 100 ns,
	  "0111" after 200 ns,
	  "0010" after 300 ns,
	  "0000" after 400 ns;

end func;
