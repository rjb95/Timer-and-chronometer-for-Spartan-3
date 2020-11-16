--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:17:03 12/05/2016
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/proyectoSED/RODEDUNAI/RODEDUNAI_1_tb.vhd
-- Project Name:  RODEDUNAI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RODEDUNAI_1
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
USE IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RODEDUNAI_1_tb IS
END RODEDUNAI_1_tb;
 
ARCHITECTURE behavior OF RODEDUNAI_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RODEDUNAI_1
    PORT(
         CLR_N : IN  std_logic;
         CLK : IN  std_logic;
         UP : IN  std_logic;
         J : IN  std_logic_vector(3 downto 0);
         ZERO_N : OUT  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
			SALIDA_FIN : OUT  std_logic_vector(3 downto 0);
         CE_N : IN  std_logic;
         LOAD_N : IN  std_logic;
			
			 --DIVISOR FRECUENCIA
			CARGA_FREC: in STD_LOGIC_VECTOR(3 downto 0);
			DIVISOR_FREC: out STD_LOGIC
			
        );
    END COMPONENT;
    

   --Inputs
   signal CLR_N : std_logic := '0';
   signal CLK : std_logic := '0';
   signal UP : std_logic := '0';
   signal J : std_logic_vector(3 downto 0) := X"8";
	signal CARGA_FREC : std_logic_vector(3 downto 0) := X"4";
   signal CE_N : std_logic := '0';
   signal LOAD_N : std_logic := '0';

 	--Outputs
   signal ZERO_N : std_logic;
   signal Q : std_logic_vector(3 downto 0);
	signal SALIDA_FIN : std_logic_vector(3 downto 0);
	
	signal DIVISOR_FREC :  STD_LOGIC;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant DELAY: time := 0.1 * CLK_PERIOD;
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: RODEDUNAI_1 PORT MAP (
          CLR_N => CLR_N,
          CLK => CLK,
          UP => UP,
          J => J,
          ZERO_N => ZERO_N,
          Q => Q,
			 SALIDA_FIN => SALIDA_FIN,
          CE_N => CE_N,
          LOAD_N => LOAD_N,
			 
			 CARGA_FREC => CARGA_FREC,
			 DIVISOR_FREC => DIVISOR_FREC
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
  clr_n  <= '0' after 0.25 * CLK_PERIOD, '1' after 0.75 * CLK_PERIOD;
  load_n <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;
  up     <= '0' after 0.25 * CLK_PERIOD, '1' after 7.25 * CLK_PERIOD;
  ce_n   <= '0' after 0.25 * CLK_PERIOD, '1' after 7.25 * CLK_PERIOD,
            '0' after 8.25 * CLK_PERIOD;


   -- Stimulus process
   stim_proc: process
   begin
    -- Check CLR_N
    wait until clr_n = '0';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 0
      report "[FAILED]: CLR_N malfunction."
      severity failure;
    wait until clk = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 0
      report "[FAILED]: CLR_N malfunction."
      severity failure;

    -- Check LOAD_N
    wait until clr_n = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 5
      report "[FAILED]: LOAD_N malfunction."
      severity failure;
    wait until clk = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 5
      report "[FAILED]: LOAD_N malfunction."
      severity failure;

    -- Check countdown
    wait until load_n = '1';
    for i in 4 downto 1 loop
      wait until clk = '1';
      wait for DELAY;
      assert zero_n = '1' and to_integer(unsigned(q)) = i
        report "[FAILED]: countdown malfunction."
        severity failure;
    end loop;      
    wait until clk = '1';
    wait for DELAY;
    assert zero_n = '0' and to_integer(unsigned(q)) = 0
      report "[FAILED]: countdown malfunction."
      severity failure;

    -- Check CE_N
    wait until clk = '1';
    wait for DELAY;
    assert to_integer(unsigned(q)) = 0
      report "[FAILED]: CE_N malfunction."
      severity failure;

    -- Check countup
    for i in 1 to 4 loop
      wait until clk = '1';
      wait for DELAY;
      assert zero_n = '1' and to_integer(unsigned(q)) = i
        report "[FAILED]: countup malfunction."
        severity failure;
    end loop;      

    -- insert stimulus here 

    assert false
      report "[SUCCESS]: Simulation finished."
      severity failure;
  end process;

end;
