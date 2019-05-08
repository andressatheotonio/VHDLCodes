library ieee;
use ieee.std_logic_1164.all;

entity registrador is
	port(entradad,clk: in std_logic;
		  saidad: out std_logic_vector(7 downto 0));
end registrador;

architecture func of registrador is

signal reg: std_logic_vector(7 downto 0) := "00000000";

begin

process(clk)
begin

if(clk = '0') then
	reg(7 downto 1) <= reg(6 downto 0);
	reg(0) <= entradad;
end if;

end process;

saidad <= reg;

end func;
