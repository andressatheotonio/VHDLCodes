library ieee;
use ieee.std_logic_1164.all;
 
entity paralelo_serial is
port (in_paralelo: in std_logic_vector(7 downto 0);
        in_clk, in_hold: in std_logic;
        out_clk: out std_logic;
        out_paralelo: out std_logic_vector(7 downto 0));
end paralelo_serial;
 
architecture arquitetura of paralelo_serial is
component divisor_clk is
port (clk_in: in std_logic;
        q: out std_logic);
end component;
 
signal sig_paralelo: std_logic_vector (15 downto 0); -- Vetor de 16 posicoes para armazenar os 8 bits ocupados e os 8 bits vazios à esquerda para desvio
signal sig_clk: std_logic;
begin
 
divisor: divisor_clk port map (in_clk, sig_clk);
 
out_clk <= sig_clk;
 
process (sig_clk)
variable var_for: integer:= 0;
begin
   
if in_hold = '0' then -- Enquanto o botao HOLD estiver em nível logico baixo, o valor de entrada do vetor pode ser alterado
    sig_paralelo <= "00000000" & in_paralelo; -- Zera o buffer do desvio à esquerda, e aloca a entrada nos bits à deslocar
    out_paralelo <= in_paralelo; -- Vetor de entrada = vetor de saída
    var_for:= 0; -- Zera o contador do FOR
 
elsif in_hold = '1' and rising_edge(sig_clk) and var_for < 8 then  -- Ao ligar o botao de hold, cada pulso de clock desvia para a esquerda o vetor salvo na entrada
    sig_paralelo <= sig_paralelo (14 downto 0) & "0"; -- Desvio hardcoded
    out_paralelo <= sig_paralelo (15 downto 8); -- Saída com os 8 últimos bits do buffer
    var_for:= var_for + 1;
   
    if var_for > 7 then -- Para evitar contas infinitas
        var_for := 8;
    else
        var_for:= var_for;
    end if;
 
else --Condição para manter estáticos os dados quando não houver ação que requer mudanças
    sig_paralelo <= sig_paralelo;
    out_paralelo <= sig_paralelo (15 downto 8);
       
end if;
   
end process;
 
end arquitetura;