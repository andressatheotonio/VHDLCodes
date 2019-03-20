-- SISTEMAS DIGITAIS 20/03/2019
-- SIGNALS
-- FEITO POR: ANDRESSA THEOTÔNIO

entity casca is
port(a,b,c: in bit;
	  s: out bit);
end casca;

architecture miolo of casca is
-- signals são como segmentos de fio, variáveis intermediárias para facilitar a escrita das expressões lógicas
signal porta_and: bit;
begin

porta_and <= a and b;
s <= porta_and xor c;

end miolo;
