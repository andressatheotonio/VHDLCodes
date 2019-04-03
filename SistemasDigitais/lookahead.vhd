--CODIGO DE UM SOMADOR CARRY LOOK AHEAD PARA CORREÇÃO
--FEITO POR: ANDRESSA THEOTÔNIO
--03/04/19

library ieee;
use ieee.std_logic_1164.all;

entity lookahead is
generic(n: integer := 4);
port(cin: in std_logic;
	  g,p: in std_logic_vector(n-1 downto 0);
	  s: out std_logic_vector(n-1 downto 0));
end lookahead;

architecture lahead of lookahead is

component halfadder is
generic(n: integer := 4);
port(a,b: in std_logic_vector(n-1 downto 0);
     g,p: out std_logic_vector(n-1 downto 0));
end component;

signal c: std_logic_vector(3 downto 0);

begin

c(0) <= g(0) or (p(0) and cin);
c(1) <= g(1) or (p(1) and (g(0) or (p(0) and cin)));
c(2) <= g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))));
c(3) <= g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))));

s(0) <= c(0) xor p(0);
s(1) <= c(1) xor p(1);
s(2) <= c(2) xor p(2);
s(3) <= c(3) xor p(3);

end lahead;
