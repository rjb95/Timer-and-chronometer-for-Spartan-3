--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:37:56 12/28/2016
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/proyectoSED/RODEDUNAI/cronometro_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cronometro
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
 
ENTITY cronometro_tb IS
END cronometro_tb;
 
ARCHITECTURE behavior OF cronometro_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cronometro
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         up : IN  std_logic;
			load_N : IN std_logic;
			IN_SEG0: In std_logic_vector(3 downto 0);
			IN_SEG1: In std_logic_vector(3 downto 0);
			IN_MIN0: In std_logic_vector(3 downto 0);
			IN_MIN1: In std_logic_vector(3 downto 0);
			
         Segundo0 : OUT  std_logic_vector(3 downto 0);
         Segundo1 : OUT  std_logic_vector(3 downto 0);
         Minuto0 : OUT  std_logic_vector(3 downto 0);
         Minuto1 : OUT  std_logic_vector(3 downto 0);
			
			FINAL : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal up : std_logic := '0';
	signal load_N : std_logic := '0';
	
	signal IN_SEG0 : std_logic_vector(3 downto 0) := X"2";
	signal IN_SEG1 : std_logic_vector(3 downto 0) := X"5";
	signal IN_MIN0 : std_logic_vector(3 downto 0) := X"3";
	signal IN_MIN1 : std_logic_vector(3 downto 0) := X"4";

 	--Outputs
   signal Segundo0 : std_logic_vector(3 downto 0);
   signal Segundo1 : std_logic_vector(3 downto 0);
   signal Minuto0 : std_logic_vector(3 downto 0);
   signal Minuto1 : std_logic_vector(3 downto 0);
	signal FINAL : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cronometro PORT MAP (
          clk => clk,
			 load_N=>load_N,
          reset => reset,
          up => up,
			 
			 IN_SEG0 => IN_SEG0,
			 IN_SEG1 => IN_SEG1,
			 IN_MIN0 => IN_MIN0,
			 IN_MIN1 => IN_MIN1,
			 
          Segundo0 => Segundo0,
          Segundo1 => Segundo1,
          Minuto0 => Minuto0,
          Minuto1 => Minuto1,
			 FINAL	=> FINAL
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	up <= '0' after 0.25 * CLK_PERIOD, '1' after 360.25 * CLK_PERIOD;
	load_N <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;
	reset<= '0';
	
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 730000 ns;	

      wait for clk_period*73000;

      -- insert stimulus here 

      wait;
   end process;

END;
