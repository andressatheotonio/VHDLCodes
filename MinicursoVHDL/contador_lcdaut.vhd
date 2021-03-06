-- Contador LCD Automático
-- Autores: João Vitor e Marcos Meira
-- Alterado por: Calebe Oliveira, Andressa Theotonio e Allan Alves
-- Data: 05/12/2018

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity contador_lcdaut is
port (clk_in: in std_logic;
        LCD_RW, LCD_EN, LCD_RS, LCD_ON, LCD_BLON: out std_logic;
        LCD_DATA: out std_logic_vector (7 downto 0));
end contador_lcdaut;
 
architecture arquitetura of contador_lcdaut is
component divisor_clk is
port (clk_in: in std_logic;
        q: out std_logic);
end component;
 
signal sig_clk: std_logic;
 
begin
divisor: divisor_clk port map (clk_in, sig_clk);
 
lcd_BLON <= '1';
lcd_RW <= '0';
 
process (sig_clk)
variable contagem: integer:= 0;
begin
 
if rising_edge (sig_clk) then
lcd_EN <= '0';
        case contagem is
            when 0 =>   lcd_RS <= '0';
                            LCD_DATA <= "00110000"; -- Entrada em ASCII para o comando 00111100 de inicializaÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o do display
                            lcd_EN <= '1';
                            lcd_ON <= '1';
            when 1 => lcd_DATA <= "00111100";
                         lcd_EN <= '1';
            when 2 => lcd_DATA <= "00000000";
                         lcd_EN <= '0';
            when 3 => lcd_DATA <= "00001100";
                         lcd_EN <= '1';
            when 4 => lcd_DATA <= "00000000";
                         lcd_EN <= '0';
            when 5 => lcd_DATA <= "00000001";
                         lcd_EN <= '1';
            when 6 => lcd_DATA <= "00000000";
                         lcd_EN <= '0';
            when 7 => lcd_DATA <= "00000110";
                         lcd_EN <= '1';
            when 8 => lcd_DATA <= "00000000";  -- Fim da inicializacao
                         lcd_EN <= '0';
            when 9 => lcd_DATA <= "01000010";  -- B
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 10 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 11 => lcd_DATA <= "01100101"; -- e
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 12 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 13 => lcd_DATA <= "01101101"; --m
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 14 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 15 => lcd_DATA <= "00101101"; -- hifem
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 16 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 17 => lcd_DATA <= "01010110"; -- V
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 18 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 19 => lcd_DATA <= "01101001"; -- i
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 20 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 21 => lcd_DATA <= "01101110"; -- n
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 22 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 23 => lcd_DATA <= "01100100"; -- d
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 24 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 25 => lcd_DATA <= "01101111"; -- o
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 26 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 27 => lcd_DATA <= "00100000"; -- espaco
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 28 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 29 => lcd_DATA <= "01100001"; -- A
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 30 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 31 => lcd_DATA <= "01101111"; -- o
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 32 => lcd_DATA <= "00000000"; --
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 33 => lcd_DATA <= "11000000"; -- Linha 2
                         lcd_RS <= '0';
                         lcd_EN <= '1';
            when 34 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 35 => lcd_DATA <= "01001001"; -- I
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 36 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 37 => lcd_DATA <= "01000110"; -- F
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 38 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 39 => lcd_DATA <= "01010000"; -- P
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 40 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 41 => lcd_DATA <= "01000010"; -- B
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 42 => lcd_DATA <= "00000000";
                         lcd_RS <= '0';        
                         lcd_EN <= '0';
            when 43 => lcd_DATA <= "00100001"; -- !
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 44 => lcd_DATA <= "00010000";      -- comando para apagar caractere anterior (del)
                         lcd_RS <= '0';
                         lcd_EN <= '1';                  
            when 45 => lcd_DATA <= "01101001";
                         lcd_RS <= '1';
                         lcd_EN <= '1';
            when 46 => lcd_DATA <= "00010000";      -- comando para apagar caractere anterior
                         lcd_RS <= '0';
                         lcd_EN <= '1';
            when others => contagem := 43;
        end case;
end if;
 
contagem := contagem + 1;
 
end process;
 
end arquitetura;
