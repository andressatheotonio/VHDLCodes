-- ARQUIVO PARA TESTAR O GERADOR DE PARIDADE PAR DE 4 BITS

entity testbenchgerador is 
end testbenchgerador;

architecture test of testbenchgerador is

component geradorparidade is
port (a: in bit_vector(3 downto 0);
		s: out bit);
end component;

signal input: bit_vector(3 downto 0);
signal output: bit;

begin

x: geradorparidade port map(input, output);

input <= "0000",
			"0101" after 10 ns,
			"1111" after 20 ns,
			"0010" after 30 ns,
			"1110" after 50 ns;

end test;
