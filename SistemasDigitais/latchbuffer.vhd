-- SISTEMAS DIGITAIS 30/04/2019
-- LATCH COM BUFFER
-- FEITO POR: CALEBE OLIVEIRA
-- ADAPTADO POR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity latchbuffer is
port(r,s: in std_logic; -- entradas do latch RS
	  q, qb: buffer std_logic -- saídas do latch RS
);
end latchbuffer;

architecture arquitetura of latchbuffer is

begin

q<= not(not(s) and qb); -- q recebe a negação da operação and entre not(s) e !saída
qb<= not(not(r) and q); -- qb recebe a negação da operação and entre not(r) e saída

end arquitetura;
