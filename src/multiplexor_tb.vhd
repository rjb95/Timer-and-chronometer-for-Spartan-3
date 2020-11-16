--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:19:44 12/30/2016
-- Design Name:   
-- Module Name:   C:/Users/asus1/Desktop/proyectoSED/RODEDUNAI/multiplexor_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexor
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
 
ENTITY multiplexor_tb IS
END multiplexor_tb;
 
ARCHITECTURE behavior OF multiplexor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexor
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         D0 : IN  std_logic_vector(3 downto 0);
         D1 : IN  std_logic_vector(3 downto 0);
         D2 : IN  std_logic_vector(3 downto 0);
         D3 : IN  std_logic_vector(3 downto 0);
         salida : OUT  std_logic_vector(3 downto 0);
         MUX : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal D0 : std_logic_vector(3 downto 0) := "0100";
   signal D1 : std_logic_vector(3 downto 0) := "0101";
   signal D2 : std_logic_vector(3 downto 0) := "0110";
   signal D3 : std_logic_vector(3 downto 0) := "0111";

 	--Outputs
   signal salida : std_logic_vector(3 downto 0);
   signal MUX : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexor PORT MAP (
          clk => clk,
          reset => reset,
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          salida => salida,
          MUX => MUX
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
      wait for 35 ns;	

		reset<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
