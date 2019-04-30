library ieee;
use ieee.std_logic_1164.all;

entity latchinho is
port(r,s: in std_logic;
	  q, qb: out std_logic);
	  -- podemos utilizar variáveis do tipo buffer quando temos realimentação
	  -- q, qb: buffer std_logic
end latchinho;

architecture funcao of latchinho is
signal state: std_logic;
begin

-- q <= (not s) nand qb;
-- qb <= (not r) nand q;

q <= state;
qb <= not state;

process(r,s)
begin

	if(r = '1') then 
		state <= '0';
	elsif(s = '1') then
		state <= '1';
	end if;

end process;

end funcao;
