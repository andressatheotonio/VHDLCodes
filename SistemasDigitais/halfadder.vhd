-- ESTRUTURA DE UM HALF ADDER PARA CORREÇÃO
-- DATA: 03/04/19
-- FEITO POR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
generic(n: integer := 4);
port(a,b: in std_logic_vector(n-1 downto 0);
     g,p: out std_logic_vector(n-1 downto 0));
end halfadder;

architecture hadd of halfadder is
begin

g(0) <= a(0) and b(0);
p(0) <= a(0) xor b(0);

g(1) <= a(1) and b(1);
p(1) <= a(1) xor b(1);

g(2) <= a(2) and b(2);
p(2) <= a(2) xor b(2);

g(3) <= a(3) and b(3);
p(3) <= a(3) xor b(3);

end hadd;
