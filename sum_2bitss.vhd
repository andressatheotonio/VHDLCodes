-- Somador 2 bits
-- Portas Entradas in_a0, in_a1, in_b0, in_b1 (tipo bit) / Saídas out_0, out_1, cout (tipo bit)
-- Autores: João Vitor e Marcos Meira
-- Alterado por: Calebe Oliveira e Andressa Theotonio
-- Data: 05/12/2018
 
entity sum_2bitss is
	-- Portas de entrada
    port (in_a0, in_a1, in_b0, in_b1: in bit;
	-- Portas de saída, cout refere-se ao carry out
          out_0, out_1, cout: out bit);
end sum_2bitss;
 
architecture dataflow of sum_2bits is
    signal sinal0, sinal1, sinal2, sinal3: bit;
begin
--Soma da primeira coluna
out_0 <= in_a0 xor in_b0;
--Carry Out da primeira coluna
sinal0 <= in_a0 and in_b0;
--Soma da segunda coluna
sinal1 <= in_a1 xor in_b1;
--Soma do Carry out da primeira com a soma da segunda coluna
out_1 <= sinal0 xor sinal1;
--Carry out da soma do carry out da primeira coluna com a soma da segunda coluna
sinal2 <= sinal0 and sinal1;
--Carry out da segunda coluna 
sinal3 <= in_a1 and in_b1;
--Última Carry Out
cout <= sinal2 or sinal3;
 
end dataflow;
