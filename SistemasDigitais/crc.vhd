library ieee;
use ieee.std_logic_1164.all;

entity crc is

port(ser_in, clk: in std_logic; -- entrada e clock
	  reset: in std_logic;
	  crc_out: out std_logic_vector(1 downto 0)); -- vector dos bits gerados (2bits)

end crc;

architecture func of crc is

signal x: std_logic_vector(1 downto 0) := "00"; -- signal que será atribuido ao crc_out

begin

crc_out <= x; -- atribuindo o signal a saída 

process(clk,reset) -- process será acionado quando uma das duas "variáveis" tiver uma mudança de estado
begin

if(reset = '1') then -- definindo o funcionamento do reset
	x <= "00";
elsif(clk'event and clk = '0') then -- definindo o funcionamento do crc
	x(1) <= x(0); -- deslocamento
	x(0) <= (ser_in xor x(1)); --  xor entre o bit recebido e o msb do signal
end if;

end process;

end func;
