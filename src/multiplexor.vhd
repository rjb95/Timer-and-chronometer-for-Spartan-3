----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:22 12/29/2016 
-- Design Name: 
-- Module Name:    multiplexor - Behavioral 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexor is
  PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        
		  D0    : IN  STD_LOGIC_VECTOR(3 downto 0);  --Primer d�gito.
        D1    : IN  STD_LOGIC_VECTOR(3 downto 0);  --Segundo d�gito.
        D2    : IN  STD_LOGIC_VECTOR(3 downto 0);  --Tercer d�gito.
        D3    : IN  STD_LOGIC_VECTOR(3 downto 0);  --Cuarto d�gito.
        
		  salida: OUT STD_LOGIC_VECTOR(3 downto 0);  --Salida del multiplexor (valor a desplegar).
        MUX   : OUT STD_LOGIC_VECTOR(3 downto 0)   --Valor que define cual d�gito se va a mostrar.
    );
end multiplexor;
 
architecture Behavioral of multiplexor is
    type estados is (rst, v0, v1, v2, v3);
    signal estado : estados;
begin
     process (reset, clk)
	  begin
        if (reset = '1') then
            estado <= rst;
            MUX <= x"F";
            salida <= "1111";
        elsif rising_edge(clk) then
            case estado is
                when v0 =>
                    salida <= D3;
                    MUX <= "1110";
                    estado <= v1;
                when v1 =>
                    salida <= D2;
                    MUX <= "1101";
                    estado <= v2;
                when v2 =>
                    salida <= D1;
                    MUX <= "1011";
                    estado <= v3;
                when others =>
                    salida <= D0;
                    MUX <= "0111";
                    estado <= v0;
            end case;
        end if;
    end process;
end Behavioral;