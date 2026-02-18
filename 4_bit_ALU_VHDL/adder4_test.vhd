library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity adder4_test is
end adder4_test;

architecture test of adder4_test is

    --define signals
    signal A, B : std_logic_vector(3 downto 0); 	--inputs
    signal Cin : std_logic;				--input
    signal Cout : std_logic; 				--output
    signal SUM : std_logic_vector(3 downto 0);		--output

    component
        adder4 port (
        	A : in std_logic_vector(3 downto 0);
        	B : in std_logic_vector(3 downto 0);
    		Cin : in std_logic;
    		Cout : out std_logic;
    		SUM : out std_logic_vector(3 downto 0)
        );
    end component;

    --define mux instance to test
    for DUT : adder4 use entity work.adder4(structural);

    --print procedure
    procedure print_output is
        variable out_line: line;
    begin
        write(out_line, string'(" SUM = "));
        write(out_line, SUM);
	write(out_line, string'(" Carry = "));
	write(out_line, Cout);
        writeline(output, out_line);
    end print_output;

begin    
	
	--wire signals to the alu instance
	DUT: adder4 port map(A, B, Cin, Cout, SUM);

	stimulus_process: process
        	variable out_line: line;
	begin
		
		--assign values of A and B
		A <= "1010"; B <= "0010";
		
		--Test 1: add A and B
		Cin <= '0';
		wait for 10 ns;
		write(out_line, string'("Test 1"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
	
		A <= "1111"; B <= "0001";	
		wait for 10 ns;
		write(out_line, string'("Test 2"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
	
		A <= "0000"; B <= "0000";	
		wait for 10 ns;
		write(out_line, string'("Test 3"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
	
		A <= "1010"; B <= "1001";	
		wait for 10 ns;
		write(out_line, string'("Test 2"));
        	writeline(output, out_line);
		print_output;
		wait for 10 ns;
		
		wait;

	end process;	

end test;

