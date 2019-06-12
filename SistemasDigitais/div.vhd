-- DIVISOR NÃO-OTIMIZADO COM SOMADOR E SUBTRATOR
-- DATA: 28/05/2019
-- AUTOR: CALEBE OLIVEIRA 

library ieee;
use ieee.std_logic_1164.all;

entity div is 
	generic(n: integer:=8);
	port(A, B: in std_logic_vector(n-1 downto 0);
		clk, reset: in std_logic; 
		resto, resultado: out std_logic_vector(n-1 downto 0);
		ready: out std_logic
	);
end div;

architecture arquitetura of div is

component addsubtractbits is

generic(n: integer:=8);
port(a,b: in std_logic_vector(n-1 downto 0);
	s: out std_logic_vector(n-1 downto 0);
	m: in std_logic;
	cout: out std_logic
);
end component;

signal acc: std_logic_vector(n-1 downto 0) := (others => '0');
signal w: std_logic_vector(n-1 downto 0) := (others => '0');
signal x: std_logic_vector(n-1 downto 0) := (others => '0');
signal tempadd: std_logic_vector(n-1 downto 0);
signal tempsub: std_logic_vector(n-1 downto 0);
signal addC: std_logic; 
signal subC: std_logic;
signal status: std_logic;
signal temp: std_logic_vector(n-1 downto 0);

begin

temp <= (n-1 downto 1 => '0', 0 => subC);

sub: addsubtractbits port map(w, x, tempsub, '1', subC);
adder: addsubtractbits port map (w, x, tempadd, '0', addC);
ready <= status;
resto <= w; 
resultado <= acc;

process(reset, clk)
begin

if (reset = '1') then
	status <= '0';
	w <= a;
	x <= b;
	acc <= (others => '0');
elsif (clk'event and clk = '0') then
	if (subC = '1') then
		w <= tempsub;
		acc <= tempadd;
	else 
		status <= '1';
	end if;
end if;
	
end process; 


end arquitetura;
