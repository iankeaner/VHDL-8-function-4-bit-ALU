library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
    port (
        A, B, Cin  : in std_logic;
        Cout, SUM  : out std_logic
    );
end fulladder;

architecture structural of fulladder is

	component
		xor2 port(
			a : in std_logic;
			b : in std_logic;
			y : out std_logic
		);
	end component;

	component
		and2 port(
			a : in std_logic;
			b : in std_logic;
			y : out std_logic
		);
	end component;

	component
                or2 port(
                        a : in std_logic;
                        b : in std_logic;
                        y : out std_logic
                );
        end component;

	signal xor0_out: std_logic;
	signal and0_out, and1_out: std_logic;

	for xor_0: xor2 use entity work.xor2(structural); 
	for xor_1: xor2 use entity work.xor2(structural); 
	for and_0: and2 use entity work.and2(structural); 
	for and_1: and2 use entity work.and2(structural); 
	for or_0: or2 use entity work.or2(structural); 
	
begin
	--xors
	xor_0: xor2 port map(A, B, xor0_out);
	xor_1: xor2 port map(xor0_out, Cin, SUM);

	--ands
	and_0: and2 port map(xor0_out, Cin, and0_out);
	and_1: and2 port map(A, B, and1_out);

	--or
	or_0: or2 port map(and0_out, and1_out, Cout);

end structural;
