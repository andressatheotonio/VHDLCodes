-- DIVISOR OTIMIZADO
-- SISTEMAS DIGITAIS 29/05/2019
-- AUTOR: CALEBE OLIVEIRA
-- ADAPTADO POR: ANDRESSA THEOTÔNIO

library ieee;
use ieee.std_logic_1164.all;

entity div2 is
generic( size: integer :=8 ); -- qtd bits
port (A, B: in std_logic_vector(size-1 downto 0); -- entradas (divisor e dividendo)
		clk, reset: in std_logic; -- clock e reset
	  	resto, resultado: out std_logic_vector(size-1 downto 0); -- saídas (resto e qtd de divisões)
		ready: out std_logic -- sinalizador
);
end div2;

architecture arquitetura of div2 is

component addsubtractbits is -- adicionando somador
generic(n: integer:= 2*size); 
port(a,b: in std_logic_vector(n-1 downto 0);
	s: out std_logic_vector(n-1 downto 0);
	m: in std_logic;
	cout: out std_logic
);
end component;

signal a_Maior, b_Maior,  tempAMaior: std_logic_vector((2*size)-1 downto 0); -- entradas e saídas temporários
signal tempRes: std_logic_vector(size-1 downto 0); -- resposta temporária
signal cout: std_logic; -- carry out

begin 

resultado<=tempRes; -- signal resposta atribuído a entrada resposta
resto<=a_Maior(size-1 downto 0); -- resto atribuído

sub: addsubtractbits port map(a_Maior, b_Maior, tempAMaior, '1', cout); -- relação signals/componente

process(reset, clk) -- variáveis que irão gatilhar o process

variable contador: integer range 0 to size+1 := 0; -- CONTADOR PARA PARAR MEU DESLOCAMENTO(DIVISÃO). ELE PARA QUANDO CHEGA NA QUANTIDADE DE BITS TOTAL. 

begin

	if(reset = '1') then -- funcionamento do reset
		a_Maior(size - 1 downto 0) <= a;
		a_Maior((2*size-1) downto size) <= (others => '0'); -- others preenche com 0
		b_Maior((2*size)-1 downto size) <= b;
		b_Maior(size downto 0) <= (others => '0');
		
		tempRes <= (others => '0');
		ready <= '0';
		contador := 0;
		
	elsif(clk'event and clk = '0') then -- funcionamento na borda de descida do clock
		if (contador = size+1) then -- sinalizando se o processo acabou
			ready <= '1';
		else
			contador := contador + 1; -- add vezes processadas
			tempRes(size-1 downto 1) <= tempRes(size-2 downto 0); -- DESLOQUEI
			tempRes(0) <= cout; -- EMPURREI O COUT NO TEMPRES
			
			b_Maior(2*size - 2 downto 0) <= b_Maior(2*size-1 downto 1); -- DESLOQUEI B
			b_Maior(2*size-1) <= '0'; --ADICIONO UM ZERO À ESQUERDA
			
			if (cout = '1') then -- SE B<=A, A = A-B (ESTA LÁ SUBTRAÍDA NO ADD SUBTRACT BITS)
				a_Maior <= tempAMaior;
			
			end if;
		end if;
	end if;

end process;


end arquitetura; 
