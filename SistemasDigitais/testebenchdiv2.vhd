-- TESTBENCH DIVISOR OTIMIZADO
-- SISTEMAS DIGITAIS 29/05/2019
-- AUTOR: CALEBE OLIVEIRA

library ieee;
use ieee.std_logic_1164.all;

entity testbenchdiv2 is
end testbenchdiv2;

architecture arquitetura of testbenchdiv2 is

component div2 is
generic( size: integer :=4 );
port (A, B: in std_logic_vector(size-1 downto 0);
		clk, reset: in std_logic;
	   resto, resultado: out std_logic_vector(size-1 downto 0);
		ready: out std_logic
);

end component;

signal A:  std_logic_vector(3 downto 0) := "1111";
signal B: std_logic_vector(3 downto 0) := "0011";
signal clk, reset:  std_logic := '0';
signal resto, resultado:  std_logic_vector(3 downto 0);
signal ready:  std_logic := '0';

begin 

div: div2 port map (A, B, clk, reset, resto, resultado, ready); 

process

begin 

wait for 10 ns;
reset <= '1';
wait for 10 ns;
reset <= '0';

	for i in 0 to 10 loop
		clk<='1';
		wait for 100 ns;
		clk<='0';
		wait for 100 ns;
	end loop;
wait;
end process;

end arquitetura;
