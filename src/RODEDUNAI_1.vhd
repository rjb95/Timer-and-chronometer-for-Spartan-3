----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:45 12/05/2016 
-- Design Name: 
-- Module Name:    RODEDUNAI_1 - Behavioral 
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RODEDUNAI_1 is
    Port ( CLR_N : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           UP : in  STD_LOGIC;
           J : in  STD_LOGIC_VECTOR (3 downto 0);
           ZERO_N : out  STD_LOGIC;
 
			  --LAP
           CE_N : in  STD_LOGIC;
			  LOAD_N : in STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  SALIDA_FIN : out  STD_LOGIC_VECTOR (3 downto 0);			  
			  
			  --DIVISOR FRECUENCIA
			  CARGA_FREC: in STD_LOGIC_VECTOR(3 downto 0);
			  DIVISOR_FREC: out STD_LOGIC
			  );
end RODEDUNAI_1;

architecture Behavioral of RODEDUNAI_1 is
  signal q_i: unsigned(Q'range);
  signal frec_i: unsigned(CARGA_FREC'range);

begin 
 process (CLR_N, CLK, LOAD_N, J)
   variable salida: unsigned(Q'range);
	variable cuenta: unsigned(CARGA_FREC'range);

begin
    if CLR_N = '0' then
      q_i <= (others => '0');
		salida := (others => '0');
		cuenta:= (others => '0');
		frec_i <= (others => '0');
   elsif LOAD_N = '0' then
      q_i <= unsigned(J);
		salida := unsigned(J);
		cuenta := unsigned(CARGA_FREC);
		frec_i <= unsigned(CARGA_FREC);
		
		
	elsif rising_edge(CLK) then
		if UP = '1' then
          q_i <= q_i + 1;
        else
          q_i <= q_i - 1;
      end if;
				
      if CE_N = '0' then
			if UP = '1' then
          salida := q_i + 1;
        else
          salida := q_i - 1;
        end if;
		else
		  salida := salida;
      end if;
		
		if frec_i = 0000 then
			cuenta := cuenta-1;
			if cuenta = 0000 then
				frec_i <= unsigned(CARGA_FREC);
				cuenta := unsigned(CARGA_FREC);
			end if;
		else
			frec_i <= frec_i - 1;
		end if;
			
   end if;
	SALIDA_FIN <= std_logic_vector(salida);

  end process;
  Q <= std_logic_vector(q_i);
  ZERO_N <= '0' when q_i = 0 else
            '1';
  DIVISOR_FREC <= '0' when frec_i = 0 else
            '1';
end behavioral;
