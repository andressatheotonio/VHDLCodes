library ieee;
use ieee.std_logic_1164.all;

entity fft is

port(reset, preset, d, clk: in std_logic;
	  q: out std_logic);

end fft;

architecture funcionamento of fft is

signal state : std_logic := '0';

begin

process(reset, preset, clk) --sinais que irão "gatilhar" o process
begin

if(reset = '1') then
	state <= '0';
elsif(preset = '1') then
	state <= '1';
elsif(clk'event and clk = '0') then
	state <= not state;
end if;
end process;

q <= state;

end funcionamento;
