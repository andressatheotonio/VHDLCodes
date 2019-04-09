--CODIGO DE UM SOMADOR CARRY LOOK AHEAD PARA CORREÇÃO
--FEITO POR: ANDRESSA THEOTÔNIO
--03/04/19

library ieee;
use ieee.std_logic_1164.all;

entity lookahead is
generic(n: integer := 4);
port(cin: in std_logic;
	  inA,inB: in std_logic_vector(n-1 downto 0);
	  s: out std_logic_vector(n-1 downto 0)
    	  cout,p,g: out std_logic);
end lookahead;

architecture lahead of lookahead is

component halfadder is
port(a,b: in std_logic;
     g,p: out std_logic);
end component;

signal c: std_logic_vector(n downto 0);
signal gc: std_logic_vector(n-1 downto 0);
signal pc: std_logic_vector(n-1 downto 0);

begin

c(0) <= gc(0) or (pc(0) and cin);
c(1) <= gc(1) or (pc(1) and gc(0)) or (pc(1) and pc(0) and cin);
c(2) <= gc(2) or (pc(2) and gc(1)) or (pc(2) and pc(1) and gc(0)) or (pc(2) and pc(1) and pc(0) and cin));
c(3) <= gc(3) or (pc(3) and gc(2)) or (pc(3) and pc(2) and gc(1)) or (pc(3) and pc(2) and pc(1) and gc(0)) or (pc(3) and pc(2) and pc(1) and pc(0) and cin);

g <= gc(3) or (pc(3) and gc(2)) or (pc(3) and pc(2) and gc(1)) or (pc(3) and pc(2) and pc(1) and gc(0));
p <= (pc(3) and pc(2) and pc(1) and pc(0) and cin);
cout <= c(3);

s(0) <= c(0) xor pc(0);
s(1) <= c(1) xor pc(1);
s(2) <= c(2) xor pc(2);
s(3) <= c(3) xor pc(3);

end lahead;
