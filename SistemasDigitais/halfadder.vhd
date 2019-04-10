-- ESTRUTURA DE UM HALF ADDER (CORRIGIDO)
-- DATA: 03/04/19
-- FEITO POR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
port(a,b: in std_logic;
     g,p: out std_logic);
end halfadder;

architecture hadd of halfadder is
begin

g <= a and b;
p <= a xor b;

end hadd;
