-- FLIP FLOP TIPO D
-- AUTOR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity ffd is

port(reset, preset, d, clk: in std_logic; -- entradas do flip flop d (data)
	  q: out std_logic); -- saída 

end ffd;

architecture funcionamento of ffd is

signal state : std_logic := '0'; -- signal que será atribuido a saída

begin

process(reset, preset, clk) --sinais que irão "gatilhar" o process
begin

if(reset = '1') then -- definindo o funcionamento do reset
	state <= '0';
elsif(preset = '1') then -- definindo o funcionamento do preset
	state <= '1';
elsif(clk'event and clk = '0') then -- definindo o funcionamento do ffd com o clk, que é transmitir o dado em d para a saída
	state <= d;
end if;
end process;

q <= state; -- atribuindo o signal a saída

end funcionamento;
