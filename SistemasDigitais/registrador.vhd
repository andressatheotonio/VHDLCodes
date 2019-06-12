library ieee;
use ieee.std_logic_1164.all;

entity registrador is
	port(entradad,clk: in std_logic; -- entradas do registrador
		  saidad: out std_logic_vector(7 downto 0)); -- saída do registrador
end registrador;

architecture func of registrador is

signal reg: std_logic_vector(7 downto 0) := "00000000"; -- signal que será atribuído a saída do shiftreg

begin

process(clk) -- entrada que gatilhará o process
begin

if(clk = '0') then -- verificando se é uma borda de descida
	reg(7 downto 1) <= reg(6 downto 0); -- deslocamento
	reg(0) <= entradad; -- entrada preenchendo no vetor
end if;

end process;

saidad <= reg; -- signal sendo atribuído a saída
	

end func;
