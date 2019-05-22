library ieee;
use ieee.std_logic_1164.all;

entity crc is

port(ser_in, clk: in std_logic;
	  reset: in std_logic;
	  crc_out: out std_logic_vector(1 downto 0));

end crc;

architecture func of crc is

signal x: std_logic_vector(1 downto 0) := "00";

begin

crc_out <= x;

process(clk,reset)
begin

if(reset = '1') then
	x <= "00";
elsif(clk'event and clk = '0') then
	x(1) <= x(0);
	x(0) <= (ser_in xor x(1));
end if;

end process;

end func;
