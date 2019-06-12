library ieee;
use ieee.std_logic_1164.all;

entity cd4511 is
	port(abcd: in std_logic_vector(3 downto 0); -- entrada do decodificador
		  nle, nbl, nlt: in std_logic; -- latch enable, blanking test e lamp test
		  saida: out std_logic_vector(6 downto 0)); -- saída do decodificador
end cd4511;

architecture funcionamento of cd4511 is

signal latches: std_logic_vector(3 downto 0) := "0000"; -- signal de entrada
signal decoder: std_logic_vector(6 downto 0); -- signal do decodificador
signal driver: std_logic_vector(6 downto 0); -- signal que "ligará" os leds
signal mode: std_logic := '1'; -- [0] catodo comum e [1] anodo comum

begin

latches <= abcd when nle = '0' else latches; 

          --abcdefg
decoder <= "0000000" when nbl = '0' else -- funcionamento do decoder
			  "1111110" when latches = "0000" else
			  "0110000" when latches = "0001" else
			  "1101101" when latches = "0010" else
			  "1111001" when latches = "0011" else
			  "0110011" when latches = "0100" else
			  "1011011" when latches = "0101" else
			  "1011111" when latches = "0110" else
			  "1110000" when latches = "0111" else
			  "1111111" when latches = "1000" else
			  "1111011" when latches = "1001" else
			  "0000000";
			  
driver <= "1111111" when nlt = '0' else -- lamp test liga todos os leds
			 decoder;
			 
rep: for i in 0 to 6 generate
	saida(i) <= driver(i) xor mode; -- ligará os leds de acordo com o modo anodo ou catodo comum
end generate;

end funcionamento;
