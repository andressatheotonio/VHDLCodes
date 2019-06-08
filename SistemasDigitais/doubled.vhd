library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- adicionando biblioteca para não precisar incluir um somador 

entity doubled is
	port(bit_in: in  std_logic; -- bit de entrada
		  bit_out: out std_logic; -- bit de saída
		  nibble: out std_logic_vector(3 downto 0); -- nibble que será mostrado
		  is_adding: out std_logic; -- saída que avisa quando o módulo entra em modo add
		  reset: in std_logic; -- reset
		  clk: in std_logic; -- clock
		  go_idle: in std_logic);  -- entrada que faz o módulo entrar em estado de espera enquanto outro está em modo add
end doubled;

architecture funcionamento of doubled is

type state is (idle, shift, add3); -- estados de operação do módulo
signal current_state: state := shift; -- estado atual de operação
signal data: std_logic_vector(3 downto 0) := "0000"; -- inicializando data

begin

is_adding <= '1' when data > "0100" else
				 '0';
nibble <= data; -- atribuindo signal a saída real
bit_out <= data(0); -- atribuindo o último bit de data ao bit de saída
				 
process(clk, reset, go_idle) -- entradas que provocam mudança de estado
begin

	if(reset = '1') then -- prioridade do reset
		data <= "0000";
		current_state <= shift;
	elsif(clk'event and clk = '0') then -- o trabalho começa após a borda de descida do clock
		if(current_state = shift and data > "0100") then -- definindo o estado de operação add3 (adiciona 3 ao vector data)
			current_state <= add3;
			data <= std_logic_vector(signed(data) + "0011");
		elsif(current_state = shift and go_idle = '1') then -- definindo o estado de operação idle (estado de espera)
			current_state <= idle;
		elsif(current_state = add3 or current_state = idle) then -- definindo o estado de operação shift (registrador de deslocamento)
			current_state <= shift;
			data(3 downto 1) <= data(2 downto 0);
			data(0) <= bit_in;
		elsif(current_state = shift) then -- definindo a realimentação do shift
			current_state <= shift;
			data(3 downto 1) <= data(2 downto 0);
			data(0) <= bit_in;
	end if;
end if;
	
end process;
end funcionamento;
