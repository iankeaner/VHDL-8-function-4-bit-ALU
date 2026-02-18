library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity fulladder_test is
end fulladder_test;

architecture test of fulladder_test is 

    --define signals
    signal A, B, Cin : std_logic;
    signal SUM, Cout : std_logic;

    component 
        fulladder port (
            A, B, Cin  : in std_logic;
            Cout, SUM  : out std_logic
        );
    end component;

    --define mux instance to test
    for DUT : fulladder use entity work.fulladder(structural);

    --print procedure
    procedure print_output is
        variable out_line: line;
    begin
        write(out_line, string'(" A = "));
        write(out_line, A);
        write(out_line, string'(" B = "));
        write(out_line, B);
        write(out_line, string'(" Cin = "));
        write(out_line, Cin);
        write(out_line, string'(" SUM = "));
        write(out_line, SUM);
        write(out_line, string'(" Cout = "));
        write(out_line, Cout);
        writeline(output, out_line);
    end print_output;

begin
    
    --map signals to mux instance
    DUT : fulladder port map (A, B, Cin, Cout, SUM);

    stimulus_process: process
        variable out_line : line;
    begin

	--the following 8 tests verify all 8 possible input combinations for the full adder. The output is the full truth table.
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        print_output;
        wait for 10 ns;
        
	A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        print_output;
        wait for 10 ns;

        wait;

    end process;

end test;
