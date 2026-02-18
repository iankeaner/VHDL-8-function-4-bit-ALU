library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mux4_tb is
end mux4_tb;

architecture test of mux4_tb is 

    --define signals
    signal x0, x1, x2, x3 : std_logic;
    signal sel0, sel1 : std_logic;
    signal y : std_logic;

    component 
        mux4 port (
            x0, x1, x2, x3  : in std_logic;
            sel0, sel1      : in std_logic;
            y               : out std_logic
        );
    end component;

    --define mux instance to test
    for DUT : mux4 use entity work.mux4(structural);

    --print procedure
    procedure print_output is
        variable out_line: line;
    begin
        write(out_line, string'("time="));
        write(out_line, now);
        write(out_line, string'(" x0="));
        write(out_line, x0);
        write(out_line, string'(" x1="));
        write(out_line, x1);
        write(out_line, string'(" x2="));
        write(out_line, x2);
        write(out_line, string'(" x3="));
        write(out_line, x3);
        write(out_line, string'(" sel0="));
        write(out_line, sel0);
        write(out_line, string'(" sel1="));
        write(out_line, sel1);
        write(out_line, string'(" output="));
        write(out_line, y);
        writeline(output, out_line);
    end print_output;

begin

    --map signals to mux instance
    DUT : mux4 port map (x0, x1, x2, x3, sel0, sel1, y);

    stimulus_process: process
        variable out_line : line;
    begin

        --test 1. output should be 1
        x0 <= '1'; x1 <= '0'; x2 <= '0'; x3 <= '0'; sel0 <= '0'; sel1 <= '0';
        wait for 10 ns;
        print_output;
        wait for 10 ns;

        --test 2. output should be 1
        x0 <= '0'; x1 <= '1'; x2 <= '0'; x3 <= '0'; sel0 <= '1'; sel1 <= '0';
        wait for 10 ns;
        print_output;
        wait for 10 ns;

        --test 3. output should be 1
        x0 <= '0'; x1 <= '0'; x2 <= '1'; x3 <= '0'; sel0 <= '0'; sel1 <= '1';
        wait for 10 ns;
        print_output;
        wait for 10 ns;

        --test 4. output should be 1
        x0 <= '0'; x1 <= '0'; x2 <= '0'; x3 <= '1'; sel0 <= '1'; sel1 <= '1';
        wait for 10 ns;
        print_output;
        wait for 10 ns;

        wait;

    end process;

end test;