----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:08 12/12/2016 
-- Design Name: 
-- Module Name:    cronometro - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity cronometro is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  up  : in  STD_LOGIC;
			  load_N : in STD_LOGIC;
				IN_SEG0: In std_logic_vector(3 downto 0);
				IN_SEG1: In std_logic_vector(3 downto 0);
				IN_MIN0: In std_logic_vector(3 downto 0);
				IN_MIN1: In std_logic_vector(3 downto 0);
			
			  
				Segundo0   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --Primer digito de los segundos.
				Segundo1   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Segundo digito de los segundos.
				
				Minuto0   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Primer digito del minuto.
				Minuto1   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Segundo digito del minuto.
				FINAL		 : OUT STD_LOGIC				--LLEGADA A FINAL
	);
end cronometro;

architecture Behavioral of cronometro is
	signal segundero0: UNSIGNED(3 downto 0);
	signal segundero1: UNSIGNED(3 downto 0);
	
	signal minutero0: UNSIGNED(3 downto 0);
	signal minutero1: UNSIGNED(3 downto 0);

	signal fin : std_logic := '0';
begin
 process (clk, reset) 
 begin
		
		if load_N = '0' then 
			segundero0 <= unsigned(IN_SEG0);
			segundero1 <= unsigned(IN_SEG1);
			minutero0 <= unsigned(IN_MIN0);
			minutero1 <= unsigned(IN_MIN1);
		
		elsif  reset = '1' then
			minutero1 <= "0000" ;
			minutero0 <= "0000";
			segundero1 <= "0000" ;
			segundero0 <= "0000";
		
		elsif rising_edge(clk) then
			
			if up = '1' then --CUENTA HACIA ALANTE 
				--XX:X(X+1)
				segundero0 <= segundero0 + 1;
				
				--XX:X9==>XX:(X+1)0
				if segundero0 = 9 then
					segundero1 <= segundero1 + 1;
					segundero0 <= "0000";
				end if;
				
				-- XX:59==>X(X+1):0X
				if segundero1 = 5 and segundero0 = 9 then
					minutero0 <= minutero0 + 1;
					segundero1 <= "0000";
				end if;
				
				--X9:59==>(X+1)0:XX
				if minutero0 = 9 and segundero1=5 and segundero0=9 then
					minutero1 <= minutero1 + 1;
					minutero0 <= "0000";
				end if;
				
				
				-- 59:59==>00:00
				if minutero1 = 5 and minutero0 = 9 and segundero1 = 5 and segundero0 = 9 then
					minutero1 <= "0000";
					minutero0 <= "0000";
					segundero1 <= "0000";
					segundero0 <= "0000";
					fin <= '1';
				end if;
			
			
			--CUENTA HACIA ATRAS
			else
				--XX:XX==>XX:X(X-1)
				segundero0<=segundero0 - 1;
				
				--XX:X0
				if segundero0 = 0 then
					
					-- XX:00==>X(X-1):5X
					if segundero1= 0 then
						minutero0<= minutero0 - 1;
						segundero1<= "0101";
									
					--XX:(X!=0)0==>XX:(X-1)9
					else
						segundero1<= segundero1 -1;
						segundero0<="1001";
					end if;
				end if;
				
				--X0:00==>(X-1)9:XX
				if minutero0 = 0 and segundero1=0 and segundero0=0 then
					minutero1 <= minutero1 -1;
					minutero0 <= "1001";
				end if;
				
				--00:00==>59:59
				if minutero1 = 0 and minutero0 = 0 and segundero1 = 0 and segundero0 = 0 then
					minutero1 <= "0101";
					minutero0 <= "1001";
					segundero1 <= "0101";
					segundero0 <= "1001";
					fin <= '1';
				end if;
			end if;
		end if;
	end process;
	
	--Asignación de señales.
	Segundo0 <= STD_LOGIC_VECTOR(segundero0);
	Segundo1 <= STD_LOGIC_VECTOR(segundero1);
	
	Minuto0 <= STD_LOGIC_VECTOR(minutero0);
	Minuto1 <= STD_LOGIC_VECTOR(minutero1);
	FINAL <= '0' when fin = '0' else '1';


end Behavioral;

