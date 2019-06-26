-- Somador 2 bits (com vetores)
-- Portas: Entradas: in_a (vetor 2 posições), in_b (vetor 2 posições) / Saídas: out_soma (vetor 3 posições)
-- Autores: João Vitor e Marcos Meira
-- Modificado por: Andressa Theotônio e Calebe Oliveira
-- Data: 12/12/18

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity sum_2bits is
    port (in_a, in_b: in std_logic_vector (1 downto 0);
          out_soma: out std_logic_vector (2 downto 0));
end sum_2bits;
 
architecture dataflow of sum_2bits is
begin
out_soma <= ('0' & in_a) + ('0' & in_b);
end dataflow;
