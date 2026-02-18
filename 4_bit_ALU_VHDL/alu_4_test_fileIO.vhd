--this file will read in A and B as 4 bit inputs. It will then read in all 8 function mode inputs to test the all 8 functions with A and B. The function mode inputs are read in the following order: S0, S1, Cin. For this test: A = 1111 and B = 0001.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity alu_4_test_fileIO is
end alu_4_test_fileIO;

architecture test of alu_4_test_fileIO is

    --define signals
    signal A, B : std_logic_vector(3 downto 0); 	--inputs
    signal S0, S1, clock : std_logic; 			--inputs
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

begin    
	
	--wire signals to the alu instance
	DUT: alu_4 port map(A, B, Cin, S0, S1, G, Cout);

	clk: process
	begin
		clock <= '0','1' after 5 ns;
		wait for 10 ns;
	end process clk;

	io_process: process
		file infile : text is in "alu_4_in.txt";
		file outfile : text is out "alu_4_out.txt";
		variable A1, B1, G1 : std_logic_vector(3 downto 0);
		variable Cin1, Cout1, S0_1, S1_1 : std_logic;
        	variable buf: line;
	begin
		--first read in A and B
		readline(infile, buf);
		read(buf, A1);
		read(buf, B1);
		A <= A1;
		B <= B1;
		write(buf, string'("G    Cout"));
		writeline(outfile, buf);
		while not (endfile(infile)) loop
			readline(infile, buf);
			read(buf, S0_1);		--first, reads in S0
			read(buf, S1_1);		--second, reads in S1
			read(buf, Cin1);		--third, reads in Cin
			S0 <= S0_1;
			S1 <= S1_1;
			Cin <= Cin1;
			wait until falling_edge(clock);
			G1 := G;
			Cout1 := Cout;
			write(buf, G1);
			write(buf, string'(" "));
			write(buf, Cout);
			writeline(outfile, buf);
		end loop;
		wait;	
	end process io_process;

end test;
