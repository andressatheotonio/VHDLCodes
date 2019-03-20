-- SISTEMAS DIGITAIS 20/03/2019
-- GERADOR DE PARIDADE 4 BITS
-- FEITO POR: ANDRESSA THEOTÔNIO

entity geradorparidade is
port (a,b,c,d: in bit;
		s: out bit);
end geradorparidade;

architecture gerador of geradorparidade is
begin

s <= a xor b xor c xor d;

end gerador;
