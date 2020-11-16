--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:50:20 12/28/2016
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/proyectoSED/RODEDUNAI/cuenta_hex_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cuenta_hex
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
 
ENTITY cuenta_hex_tb IS
END cuenta_hex_tb;
 
ARCHITECTURE behavior OF cuenta_hex_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cuenta_hex
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         up : IN  std_logic;
         load_N : IN  std_logic;
         IN_DIG1 : IN  std_logic_vector(3 downto 0);
         IN_DIG2 : IN  std_logic_vector(3 downto 0);
         IN_DIG3 : IN  std_logic_vector(3 downto 0);
         IN_DIG4 : IN  std_logic_vector(3 downto 0);
         DIGITO1 : OUT  std_logic_vector(3 downto 0);
         DIGITO2 : OUT  std_logic_vector(3 downto 0);
         DIGITO3 : OUT  std_logic_vector(3 downto 0);
         DIGITO4 : OUT  std_logic_vector(3 downto 0);
         FINAL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal up : std_logic := '0';
   signal load_N : std_logic := '0';
	signal IN_DIG1 : std_logic_vector(3 downto 0) := X"9";
	signal IN_DIG2 : std_logic_vector(3 downto 0) := X"9";
	signal IN_DIG3 : std_logic_vector(3 downto 0) := X"3";
	signal IN_DIG4 : std_logic_vector(3 downto 0) := X"4";


 	--Outputs
   signal DIGITO1 : std_logic_vector(3 downto 0);
   signal DIGITO2 : std_logic_vector(3 downto 0);
   signal DIGITO3 : std_logic_vector(3 downto 0);
   signal DIGITO4 : std_logic_vector(3 downto 0);
   signal FINAL : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cuenta_hex PORT MAP (
          clk => clk,
          reset => reset,
          up => up,
          load_N => load_N,
          IN_DIG1 => IN_DIG1,
          IN_DIG2 => IN_DIG2,
          IN_DIG3 => IN_DIG3,
          IN_DIG4 => IN_DIG4,
          DIGITO1 => DIGITO1,
          DIGITO2 => DIGITO2,
          DIGITO3 => DIGITO3,
          DIGITO4 => DIGITO4,
          FINAL => FINAL
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 	up <= '0' after 0.25 * CLK_PERIOD, '1' after 30.25 * CLK_PERIOD;
	load_N <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;
	reset<= '0';


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
