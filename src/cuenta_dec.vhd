----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:37 12/28/2016 
-- Design Name: 
-- Module Name:    cuenta_dec - Behavioral 
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


entity cuenta_dec is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  up : in  STD_LOGIC;
			  load_N : in STD_LOGIC;
			  
				IN_DIG1: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				IN_DIG2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				IN_DIG3: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				IN_DIG4: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				
				DIGITO1   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  --Primer digito 
				DIGITO2   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --Segundo digito 
				
				DIGITO3   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --tercer digito
				DIGITO4   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --cuarto digito
				FINAL		 : OUT STD_LOGIC				--LLEGADA A FINAL
	);
end cuenta_dec;

architecture Behavioral of cuenta_dec is
	signal num1: UNSIGNED(3 downto 0);
	signal num2: UNSIGNED(3 downto 0);
	
	signal num3: UNSIGNED(3 downto 0);
	signal num4: UNSIGNED(3 downto 0);

	signal fin : std_logic := '0';
begin
 process (clk, reset) 
 begin
 
		if load_N= '0' then
			num1 <= unsigned(IN_DIG1);
			num2 <= unsigned(IN_DIG2);
			num3 <= unsigned(IN_DIG3);
			num4 <= unsigned(IN_DIG4);
		
		
		elsif reset = '1' then
			num1 <= "0000" ;
			num2 <= "0000";
			num3 <= "0000" ;
			num4 <= "0000";
		elsif rising_edge(clk) then
			
			if up = '1' then --CUENTA HACIA ALANTE 
				--XXX(X+1)
				num1 <= num1 + 1;
				
				--XXX9==>XX(X+1)0
				if num1 = 9 then
					num2 <= num2 + 1;
					num1 <= "0000";
				end if;
				
				-- XX99==>X(X+1)0X
				if num2 = 9 and num1 = 9 then
					num3 <= num3 + 1;
					num2 <= "0000";
				end if;
				
				--X999==>(X+1)0XX
				if num3 = 9 and num2=9 and num1=9 then
					num4 <= num4 + 1;
					num3 <= "0000";
				end if;
				
				
				-- 9999==>0000
				if num4 = 9 and num3 = 9 and num2 = 9 and num1 = 9 then
					num4 <= "0000";
					num3 <= "0000";
					num2 <= "0000";
					num1 <= "0000";
					fin <= '1';
				end if;
			
			
			--CUENTA HACIA ATRAS
			else
				--XXXX==>XXX(X-1)
				num1<=num1 - 1;
				
				--XXX0
				if num1 = 0 then
					
					-- XX00==>X(X-1)9X
					if num2= 0 then
						num3<= num3 - 1;
						num2<= "1001";
									
					--XX(X!=0)0==>XX(X-1)9
					else
						num2<= num2 -1;
						num1<="1001";
					end if;
				end if;
				
				--X000==>(X-1)9XX
				if num3 = 0 and num2=0 and num1=0 then
					num4 <= num4 -1;
					num3 <= "1001";
				end if;
				
				--0000==>9999
				if num4 = 0 and num3 = 0 and num2 = 0 and num1 = 0 then
					num4 <= "1001";
					num3 <= "1001";
					num2 <= "1001";
					num1 <= "1001";
					fin <= '1';
				end if;
			end if;
		end if;
	end process;
	
	--Asignación de señales.
	DIGITO1 <= STD_LOGIC_VECTOR(num1);
	DIGITO2 <= STD_LOGIC_VECTOR(num2);
	
	DIGITO3 <= STD_LOGIC_VECTOR(num3);
	DIGITO4 <= STD_LOGIC_VECTOR(num4);
	FINAL <= '0' when fin = '0' else '1';


end Behavioral;
