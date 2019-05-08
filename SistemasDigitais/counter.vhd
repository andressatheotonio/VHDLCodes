library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	port(clk, reset: in std_logic;
		  data_out: out std_logic_vector(3 downto 0));
end counter;

architecture funcionamento of counter is

signal contador: std_logic_vector(3 downto 0) := "0000";

begin

data_out <= contador;

process(clk)
begin
	if(reset = '1') then
		contador <= "0000";
	elsif(clk = '0') then
		contador <= std_logic_vector(signed(contador)+ "0001");
	end if;
end process;

end funcionamento;
