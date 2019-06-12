library ieee;
use ieee.std_logic_1164.all;

entity latchwhen is
port(reset, preset, en, d: in std_logic; -- entradas
	  q: out std_logic); -- saída q
end latchwhen;

architecture lw of latchwhen is

signal state: std_logic := '0'; -- signal que será atribuído a saída

begin

state <= '0' when reset = '1' else -- funcionamento do reset
			'1' when preset = '1' else -- funcionamento do preset
			 d when en = '1' else state; -- funcionamento do latch

q <= state; -- atribuindo o signal a saída

end lw;
