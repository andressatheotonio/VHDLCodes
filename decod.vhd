-- Decodificador BCD para 7 segmentos (vetores)
-- Entrada: bcd (vetor de 4 posicoes);
-- Saida: HEX (vetor de 7 posicoes)
-- Autores: Joao Vitor e Marcos Meira
-- Modificado por: Calebe Oliveira e Andressa Theotônio
-- 29/07/2017
 
library ieee;
use ieee.std_logic_1164.all;
 
entity decod is
port(SW: in std_logic_vector (3 downto 0);
     HEX0: out std_logic_vector (0 to 6));
end decod;
 
architecture arquitetura of decod is
begin
 
    with sw select HEX0 <=
        NOT "1111110" when "0000",
        NOT "0110000" when "0001",
        NOT "1101101" when "0010",
        NOT "1111001" when "0011",
        NOT "0110011" when "0100",
        NOT "1011011" when "0101",
        NOT "1011111" when "0110",
        NOT "1110000" when "0111",
        NOT "1111111" when "1000",
        NOT "1110011" when "1001",
        NOT "0000000" when others;
 
end arquitetura;
