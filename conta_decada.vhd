-- Contador de d�cada
-- Entradas: clk (clock), reset;
-- Sa�da: q (Vetor 4 posi��es tipo BCD)
-- Autores: Jo�o Vitor e Marcos Meira
-- Modificado por: Andressa Theot�nio e Calebe Oliveira
-- 02/08/2017
 
library IEEE;                                                        
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity conta_decada is
  port (clk:in std_logic;
    reset: in std_logic;
    q: out std_logic_vector(3 downto 0));
end conta_decada;
 
architecture arquitetura of conta_decada is
begin
    process(clk,reset)                                  
    variable qtemp: std_logic_vector(3 downto 0);  
    begin
-- para resetar quando apertar o bot�o, alteramos a l�gica do reset
        if reset='0' then
        qtemp:="0000";                                            
       
        else       
            if clk'event and clk='1' then                            
                if qtemp<9 then
                qtemp:=qtemp+1;                                        
                else
                qtemp:="0000";                                            
                end if;
            end if;
        q<=qtemp;                                                
        end if;
       
    end process;                                                      
end arquitetura;
