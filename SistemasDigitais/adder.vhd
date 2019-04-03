-- SOMADOR "FEIJÃO COM ARROZ" USANDO NUMERIC_STD (ALTO NÍVEL)
-- DATA: 03/04/19
-- FEITO POR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	generic(n: integer := 8);
	port(a,b: in std_logic_vector(n-1 downto 0);
		  s: out std_logic_vector(n-1 downto 0)
		  );
end adder;

architecture add of adder is
begin

s <= std_logic_vector(signed(a) + signed(b));

end add;
