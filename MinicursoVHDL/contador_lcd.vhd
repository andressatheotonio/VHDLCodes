LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity contador_lcd is
port (in_enable, in_rs, in_onoff, in_iluminacao: in std_logic; -- EN: SW(15), RS: SW (8), onoff: SW (16), ilum: SW (17)
        SW: in std_logic_vector (7 downto 0);
        LCD_RW, LCD_EN, LCD_RS, LCD_ON, LCD_BLON: out std_logic;
        LCD_DATA: out std_logic_vector (7 downto 0));
end contador_lcd;
 
architecture arquitetura of contador_lcd is
begin
 
lcd_rw <= '0';          -- Seleciona modo escrita/leitura, 0 para escrita
lcd_en <= in_enable; -- Quando o pino de enable é posto em nível lógico alto, os dados do vetor de entrada são lançados na saida
lcd_rs <= in_rs;        -- Seletor de registro. 1 - Escrever caracteres ASCII, 0 - Lançar instruções
lcd_on <= in_onoff; -- Liga/Desliga o display - 1/0
lcd_blon <= in_iluminacao; -- Liga/Desliga o backlight 1/0
 
lcd_data <= SW; -- Dados das chaves lançados nos pinos de dados do display
end arquitetura;
