--This file will test all 8 functions of the 4-bit ALU. It will test them with A = 1010 (10) and B = 0010 (2).

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity alu_4_test is
end alu_4_test;

architecture test of alu_4_test is

    --define signals
    signal A, B : std_logic_vector(3 downto 0); 	--inputs
    signal S0, S1 : std_logic; 				--inputs
    signal Cin : std_logic;				--input
    signal Cout : std_logic; 				--output
    signal G : std_logic_vector(3 downto 0);		--output

    component
        alu_4 port (
        	A : in std_logic_vector(3 downto 0);
        	B : in std_logic_vector(3 downto 0);
        	Cin : in std_logic;
    		S0 : in std_logic;
    		S1 : in std_logic;
    		G : out std_logic_vector(3 downto 0);
        	Cout : out std_logic
        );
    end component;

    --define mux instance to test
    for DUT : alu_4 use entity work.alu_4(structural);

    --print procedure
    procedure print_output is
        variable out_line: line;
    begin
        write(out_line, string'(" G = "));
        write(out_line, G);
	write(out_line, string'(" Carry = "));
	write(out_line, Cout);
        writeline(output, out_line);
    end print_output;

begin    
	
	--wire signals to the alu instance
	DUT: alu_4 port map(A, B, Cin, S0, S1, G, Cout);

	stimulus_process: process
        	variable out_line: line;
	begin
		
		--assign values of A and B
		A <= "1010"; B <= "0010";
		write(out_line, string'("Welcome to the ALU test suite. This testbench tests all 8 functions where A = 1010 and B = 0010"));
        	writeline(output, out_line);
		
		--Test 1: testing the 1st function which transfers A
		S0 <= '0'; S1 <= '0'; Cin <= '0';
		wait for 10 ns;
		write(out_line, string'("Test 1 Transfer A:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 2: testing the 2nd function which increments A
		S0 <= '0'; S1 <= '0'; Cin <= '1';
		wait for 10 ns;
		write(out_line, string'("Test 2 Increment A:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 3: testing the 3rd function which adds A and B
		S0 <= '1'; S1 <= '0'; Cin <= '0';
		wait for 10 ns;
		write(out_line, string'("Test 3 Add A and B:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 4: testing the 4th function which adds A and B and increments
		S0 <= '1'; S1 <= '0'; Cin <= '1';
		wait for 10 ns;
		write(out_line, string'("Test 4 Add A and B and Increment:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 5: testing the 5th function which adds A and B complement
		S0 <= '0'; S1 <= '1'; Cin <= '0';
		wait for 10 ns;
		write(out_line, string'("Test 5 Add A and B complement:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 6: testing the 6th function which subtracts B from A
		S0 <= '0'; S1 <= '1'; Cin <= '1';
		wait for 10 ns;
		write(out_line, string'("Test 6 Subtract B from A:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 7: testing the 7th function which decrements A
		S0 <= '1'; S1 <= '1'; Cin <= '0';
		wait for 10 ns;
		write(out_line, string'("Test 7 Decrement A:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		--Test 8: testing the 8th function which transfers A
		S0 <= '1'; S1 <= '1'; Cin <= '1';
		wait for 10 ns;
		write(out_line, string'("Test 8 Transfer A:"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;

		wait;

	end process;	

end test;


