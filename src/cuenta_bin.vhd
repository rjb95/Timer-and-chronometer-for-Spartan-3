----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:35:16 12/12/2016 
-- Design Name: 
-- Module Name:    cuenta_bin - Behavioral 
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

entity cuenta_bin is
    Port ( CLR_N : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           UP : in  STD_LOGIC;
           J0 : in  STD_LOGIC_VECTOR (3 downto 0);
			  J1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  J2 : in  STD_LOGIC_VECTOR (3 downto 0);
           J3 : in  STD_LOGIC_VECTOR (3 downto 0);
			  
 
			  --LAP
           CE_N : in  STD_LOGIC;
			  LOAD_N : in STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q0 : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q1 : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q2 : out  STD_LOGIC_VECTOR (3 downto 0);
			  Q3 : out  STD_LOGIC_VECTOR (3 downto 0);
			  led_parpadeante: out STD_LOGIC;
			  SALIDA_FIN : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end cuenta_bin;

architecture Behavioral of cuenta_bin is
 
begin 
 process (CLR_N, CLK, LOAD_N, J0, J1, J2, J3)
   variable q0_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable q1_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable q2_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable q3_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
  variable vector: UNSIGNED(3 downto 0);
  variable q_i: UNSIGNED(3 downto 0);
  variable led: STD_LOGIC;
begin
    if CLR_N = '0' then					--3
      q0_i := (others => '0');
		q1_i := (others => '0');
		q2_i := (others => '0');
		q3_i := (others => '0');
		vector := (others => '0');
		q_i := (others => '0');
		
				
	elsif rising_edge(CLK) then
		if CE_N='0' then					--2
			if LOAD_N = '0' then			--1
			vector:=J3(3)&J2(2)&J1(1)&J0(0);
			q0_i :="000"& vector(0);	
			q1_i :="000"& vector(1);
			q2_i :="000"& vector(2);
			q3_i :="000"& vector(3);	
			elsif UP = '1' then
			if vector/="1111" then
				led:='0';
				vector := vector+1;
					q0_i :="000"& vector(0);	
					q1_i :="000"& vector(1);
					q2_i :="000"& vector(2);
					q3_i :="000"& vector(3);	
				else
		--		vector := "1111";
					led:='1';
				end if;
			
			else
          
			 if vector/="0000" then
				led:='0';
				vector := vector-1;
				q_i:=vector;
					q0_i :="000"& vector(0);	
					q1_i :="000"& vector(1);
					q2_i :="000"& vector(2);
					q3_i :="000"& vector(3);		
			else
				led:='1';
			end if;
			
			end if;							--1
		end if;								--2	
   end if;									--3
			Q0 <= q0_i;
  Q1 <= q1_i;
  Q2 <= q2_i;
  Q3 <= q3_i;
  led_parpadeante<=led;
  Q<= std_logic_vector(vector);
  end process;
  

end behavioral;
