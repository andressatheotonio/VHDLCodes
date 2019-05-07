library ieee;
use ieee.std_logic_1164.all;

entity latchwhen is
port(reset, preset, en, d: in std_logic;
	  q: out std_logic);
end latchwhen;

architecture lw of latchwhen is

signal state: std_logic := '0';

begin

state <= '0' when reset = '1' else
			'1' when preset = '1' else
			 d when en = '1' else state; 

q <= state;

end lw;
