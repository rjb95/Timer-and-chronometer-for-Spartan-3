----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:27:54 12/12/2016 
-- Design Name: 
-- Module Name:    decoder - dataflow 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder7seg is
	port(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		

		
		entrada: IN STD_LOGIC_VECTOR(3 downto 0);
		salida: OUT STD_LOGIC_VECTOR(7 downto 0)

	);
end decoder7seg;

architecture Behavioral of decoder7seg is

begin
	process(entrada) begin
		case entrada is
		
		-- CORRESPONDENCIA 7SEG(DE ARRIBA A ABAJO)
		--BIT 7 DE SALIDA=>PUNTO 
		--BIT 6 DE SALIDA==> 4
		--BIT 5 DE SALIDA==> 2
		--BIT 4 DE SALIDA==> 5
		--BIT 3 DE SALIDA==> 7
		--BIT 2 DE SALIDA==> 6
		--BIT 1 DE SALIDA==> 3
		--BIT 0 DE SALIDA==> 1
			when "0000" =>	 salida <=x"C0";  -- 0
			when "0001" =>  salida <= x"F9"; -- 1
         when "0010" =>  salida <= x"A4"; -- 2
         when "0011" =>  salida <= x"B0"; -- 3
         when "0100" =>  salida <= x"99"; -- 4
         when "0101" =>  salida <= x"92"; -- 5
         when "0110" =>  salida <= x"82"; -- 6
         when "0111" =>  salida <= x"F8"; -- 7
         when "1000" =>  salida <= x"80"; -- 8
         when "1001" =>  salida <= x"98"; -- 9
         when "1010" =>  salida <= x"88"; -- A
         when "1011" =>  salida <= x"83"; -- B
         when "1100" =>  salida <= x"C6"; -- C
         when "1101" =>  salida <= x"A1"; -- D
         when "1110" =>  salida <= x"86"; -- E
         when "1111" =>  salida <= x"8E"; -- F
			when others =>  salida <= x"FF"; -- Nada
		
		end case;
	end process;
end Behavioral;

