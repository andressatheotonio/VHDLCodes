-- SISTEMAS DIGITAIS 02/04/2019
-- SOMADOR/SUBTRATOR/MULTIPLICADOR/DIVISOR COM "INTEIROS"
-- FEITO POR: ANDRESSA THEOTÔNIO
-- PARA IR ATÉ 255 (FF), PRECISAMOS DE 8 BITS

entity addint is
port(a,b: in integer range 0 to 255;
	  s: out integer range 0 to 255);
end addint;

architecture add of addint is
begin

--s <= a+b;
--s <= a-b;
--s <= a*b;
s <= a/b;

end add;
