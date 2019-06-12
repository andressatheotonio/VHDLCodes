-- SISTEMAS DIGITAIS 30/04/2019
-- LATCH COM PROCESS
-- FEITO POR: CALEBE OLIVEIRA
-- ADAPTADO POR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity latcheprocess is
port(r,s: in std_logic; -- entradas do latch D
	  q, qb: buffer std_logic -- saídas do latch D
);
end latcheprocess;

architecture arquitetura of latcheprocess is

signal state: std_logic; -- signal que será atribuído a saída

begin

q<= state; -- atribuindo o signal a saída
qb<= not(state); -- atribuindo o !signal a !saída

process(r, s)
begin
	if(r = '1') then -- funcionamento do reset
		state <= '0';
	elsif (s = '1') then -- funcionamento do set
		state <='1';
	end if;
end process; 

end arquitetura;
