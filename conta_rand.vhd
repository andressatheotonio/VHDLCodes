-- CONTADOR 8-6-2-5-6-1-6-7-8-9 COM RESET
-- AUTORES: JOAO VITOR E MARCOS MEIRA
-- ENTRADAS: CLK_IN, RESET
-- SAIDAS: HEX0
-- DATA: 10/02/2018
-- MODIFICADO POR: ANDRESSA THEOTONIO E CALEBE OLIVEIRA
 
library IEEE;                                                        
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity conta_rand is
port (clk_in, reset: in std_logic;
    HEX0: out std_logic_vector (0 to 6));
end conta_rand;
 
architecture arquitetura of conta_rand is
component conta_decada
port (clk:in std_logic;
    reset: in std_logic;
    q: out std_logic_vector(3 downto 0));
end component;
 
component divisor_clk
port (clk_in: in std_logic;
        q: out std_logic);
end component;
 
signal sinal_conta: std_logic;
signal sinal_saida: std_logic_vector (3 downto 0);
 
begin
 
divisor: divisor_clk port map (clk_in, sinal_conta);
contador: conta_decada port map (sinal_conta, reset, sinal_saida);
 
process (sinal_saida)
begin
    case sinal_saida is
        when "0000" => HEX0 <= NOT "1111111";
        when "0001" => HEX0 <= NOT "1011111";
        when "0010" => HEX0 <= NOT "1101101";
        when "0011" => HEX0 <= NOT "1011011";
        when "0100" => HEX0 <= NOT "1011111";
        when "0101" => HEX0 <= NOT "0110000";
        when "0110" => HEX0 <= NOT "1011111";
        when "0111" => HEX0 <= NOT "1110000";
        when "1000" => HEX0 <= NOT "1111111";
        when "1001" => HEX0 <= NOT "1110011";
        when others => HEX0 <= NOT "0000000";
    end case;
end process;
 
end arquitetura;