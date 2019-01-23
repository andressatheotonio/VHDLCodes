-- Registrador Anel 1 byte
-- Entradas: in_paralelo (std_logic_vector, 8 posições), in_clk (std_logic, entrada do clock)
-- Saídas: out_clk (std_logic, saída 1 segundo), out_paralelo(std_logic_vector, 8 posições)
-- Modificado por: Calebe Oliveira e Andressa Theotônio
-- Data: 23/01/2019
 
 
library ieee;
use ieee.std_logic_1164.all;
 
entity registrador_anel is
port (in_paralelo: in std_logic_vector(7 downto 0);
        in_clk, in_hold: in std_logic;
        out_clk: out std_logic;
        out_paralelo: out std_logic_vector(7 downto 0));
end registrador_anel;
 
architecture arquitetura of registrador_anel is
component divisor_clk is
port (clk_in: in std_logic;
        q: out std_logic);
end component;
 
signal sig_paralelo: std_logic_vector (7 downto 0); -- Vetor de 16 posicoes para armazenar os 8 bits ocupados e os 8 bits vazios à esquerda para desvio
signal sig_clk: std_logic;
begin
 
divisor: divisor_clk port map (in_clk, sig_clk);
 
out_clk <= sig_clk;
out_paralelo <= sig_paralelo;
 
process (sig_clk)
begin
 
 
   
if in_hold = '0' then -- Enquanto o botao HOLD estiver em nível logico baixo, o valor de entrada do vetor pode ser alterado
    sig_paralelo (7 downto 0) <= in_paralelo;
    --out_paralelo <= in_paralelo;
 
elsif (in_hold = '1') and rising_edge(sig_clk) then  -- Ao ligar o botao de hold, cada pulso de clock desvia para a esquerda o vetor salvo na entrada
    sig_paralelo <= sig_paralelo (6 downto 0) & sig_paralelo(7); -- Desvio hardcoded
 
else
    sig_paralelo <= sig_paralelo;
       
end if;
   
   
end process;
 
end arquitetura;