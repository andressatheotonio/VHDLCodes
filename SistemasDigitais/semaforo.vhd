library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
	-- usando inteiro para facilitar a operação
	generic(max: integer := 12);
	-- os inteiros precisam de um range, para limitar n de pinos
	port(t_amarelo, t_verde, t_vermelho: in integer range 0 to max;
		  reset, clk: in std_logic;
		  led_amarelo, led_verde, led_vermelho: out std_logic);
end semaforo;

architecture func of semaforo is
	-- máquina de estado regida por novo tipo de variável
	type state is (amarelo, verde, vermelho);
	signal c_state: state := amarelo;
begin

process(clk,reset) -- definindo transições
variable cont: integer range 0 to max := 0;
begin
	if(reset = '1') then
		cont := 0;
		c_state <= amarelo;
	elsif(clk' event and clk = '0') then
	
		cont := cont + 1;
		
		if(c_state = amarelo and cont = t_amarelo) then
			c_state <= vermelho;
			cont := 0;
			
		elsif(c_state = vermelho and cont = t_vermelho) then
			c_state <= verde;
			cont := 0;
			
		elsif(c_state = verde and cont = t_verde) then
			c_state <= amarelo;
			cont := 0;
			
		end if;
		end if;
end process;

 process(c_state) -- definindo funcionamento
 begin
	
		if(c_state = amarelo) then
			led_vermelho <= '0';
			led_verde <= '0';
			led_amarelo <= '1';
		elsif (c_state = verde) then
			led_vermelho <= '0';
			led_verde <= '1';
			led_amarelo <= '0';
		elsif(c_state = vermelho) then
			led_vermelho <= '1';
			led_verde <= '0';
			led_amarelo <= '0';
		
		end if;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
 
 end process;

end func;
