library ieee;
use ieee.std_logic_1164.all;

entity fft is

port(reset, preset, t, clk: in std_logic;
	  q: out std_logic);

end fft;

architecture funcionamento of fft is

signal state : std_logic := '0'; -- signal que será atribuído a saída

begin

process(reset, preset, clk) --sinais que irão "gatilhar" o process
begin

if(reset = '1') then -- definindo o funcionamento do reset
	state <= '0';
elsif(preset = '1') then -- definindo o funcionamento do preset
	state <= '1';
elsif(clk'event and clk = '0') then -- definindo o funcionamento do fft com o clk, que é estar sempre comutando a entrada q e a !q
	state <= not state;
end if;
end process;

q <= state; -- atribuindo o signal a saída

end funcionamento;
