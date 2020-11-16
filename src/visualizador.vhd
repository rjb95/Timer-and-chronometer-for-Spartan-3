----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:45 12/29/2016 
-- Design Name: 
-- Module Name:    visualizador - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity visualizador is
    PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        D0    : IN  STD_LOGIC_VECTOR(3 downto 0);
        D1    : IN  STD_LOGIC_VECTOR(3 downto 0);
        D2    : IN  STD_LOGIC_VECTOR(3 downto 0);
        D3    : IN  STD_LOGIC_VECTOR(3 downto 0);
        salida: OUT STD_LOGIC_VECTOR(7 downto 0);
        MUX   : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end visualizador;
 
architecture Behavioral of visualizador is
    COMPONENT clk200Hz IS
        PORT (
            entrada : IN  STD_LOGIC;
            reset   : IN  STD_LOGIC;
            salida  : OUT STD_LOGIC
        );
    END COMPONENT;
     
    COMPONENT decoder7seg IS
        PORT (
            entrada: IN  STD_LOGIC_VECTOR(3 downto 0);
            salida : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;
     
    COMPONENT multiplexor IS
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            D0    : IN  STD_LOGIC_VECTOR(3 downto 0);
            D1    : IN  STD_LOGIC_VECTOR(3 downto 0);
            D2    : IN  STD_LOGIC_VECTOR(3 downto 0);
            D3    : IN  STD_LOGIC_VECTOR(3 downto 0);
            salida: OUT STD_LOGIC_VECTOR(3 downto 0);
            MUX   : OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
     
    signal clk_out : STD_LOGIC := '0';
    signal digito  : STD_LOGIC_VECTOR(3 downto 0);
begin
    clk_i: clk200Hz PORT MAP(
        clk, reset, clk_out
    );
     
    mux_i: multiplexor PORT MAP(
        clk_out, reset, D0, D1, D2, D3, digito, MUX
    );
     
    seg_i: decoder7seg PORT MAP(
        digito, salida
    );
end Behavioral;