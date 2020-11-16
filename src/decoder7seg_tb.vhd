--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:42:57 12/30/2016
-- Design Name:   
-- Module Name:   C:/Users/asus1/Desktop/proyectoSED/RODEDUNAI/decoder7seg_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder7seg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decoder7seg_tb IS
END decoder7seg_tb;
 
ARCHITECTURE behavior OF decoder7seg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder7seg
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         entrada : IN  std_logic_vector(3 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder7seg PORT MAP (
          clk => clk,
          reset => reset,
          entrada => entrada,
          salida => salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset<='1';
      wait for 20 ns;	
		reset<='0';
		entrada<="0000";
      wait for 20 ns;
		entrada<="0001";
      wait for 20 ns;
		entrada<="0010";
      wait for 20 ns;
		entrada<="0011";
      wait for 20 ns;
		entrada<="0100";
      wait for 20 ns;
		entrada<="0101";
      wait for 20 ns;
		entrada<="0110";
      wait for 20 ns;
		entrada<="0111";
      wait for 20 ns;
		entrada<="1000";
      wait for 20 ns;
		entrada<="1001";
      wait for 20 ns;
		entrada<="1010";
      wait for 20 ns;
		entrada<="1011";
      wait for 20 ns;
		entrada<="1100";
      wait for 20 ns;
		entrada<="1101";
      wait for 20 ns;
		entrada<="1110";
      wait for 20 ns;
		entrada<="1111";
      wait for 20 ns;

   
   end process;

END;
