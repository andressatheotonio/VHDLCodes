-- ULA com 4 bits de entrada e 5 bits de saida, opcode com 6 operacoes
-- Autores: Joao Vitor e Marcos Meira
-- Data 28/07/2017
-- Modificado por: Andressa Theotônio e Calebe Oliveira

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity ula is
    Port ( NUM1: in  STD_LOGIC_VECTOR (3 downto 0);    --
           NUM2: in  STD_LOGIC_VECTOR (3 downto 0);    -- 4-bit number
           op_code: in  STD_LOGIC_VECTOR (2 downto 0);
             saida: out STD_LOGIC_VECTOR (4 downto 0));   -- 5 bit result
end ula;
 
architecture arq of ula is
begin
    with op_code select saida <=
        ('0' & NUM1) + ('0' & NUM2) when "000",
        ('0' & NUM1) - ('0' & NUM2) when "001",
        ('0' & NUM1) and ('0' & NUM2) when "010",
        ('0' & NUM1) or ('0' & NUM2) when "011",
        ('0' & NUM1) xor ('0' & NUM2) when "100",
        ('0' & NUM1) xnor ('0' & NUM2) when "101",
        "00000" when others;
   
end arq;
