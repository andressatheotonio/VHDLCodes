entity testbenchcheck is 
end testbenchcheck;

architecture test of testbenchcheck is

component geradorparidade is
	generic(n: in integer := 5);
	port (input: in bit_vector (n-1 downto 0);
			output: out bit);
end component;

signal n: integer := 5;
signal input: bit_vector(n-1 downto 0);
signal output: bit;

begin

x: geradorparidade port map(input,output);

input <= "00000",
					   "01010" after 10 ns,
						"11111" after 20 ns,
						"00100" after 30 ns,
						"11101" after 50 ns;
end test;
