--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:21:00 12/30/2016
-- Design Name:   
-- Module Name:   C:/Users/asus1/Desktop/proyectoSED/RODEDUNAI/clk200Hz_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk200Hz
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
 
ENTITY clk200Hz_tb IS
END clk200Hz_tb;
 
ARCHITECTURE behavior OF clk200Hz_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk200Hz
    PORT(
         entrada : IN  std_logic;
         reset : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic;
	constant entrada_t : time := 20 ns;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk200Hz PORT MAP (
          entrada => entrada,
          reset => reset,
          salida => salida
        );

   -- Clock process definitions
    entrada_process :process
        begin
        entrada <= '0';
        wait for entrada_t / 2;
        entrada <= '1';
        wait for entrada_t / 2;
    end process;
 
    -- Procesamiento de est�mulos.
    estimulos: process
    begin
        reset <= '1'; -- Condiciones iniciales.
        wait for 100 ns;
        reset <= '0'; 
        wait;
    end process;
END;