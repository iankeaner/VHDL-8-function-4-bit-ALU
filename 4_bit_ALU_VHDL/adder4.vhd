library IEEE;
use IEEE.std_logic_1164.all;

entity adder4 is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
    	Cin : in std_logic;
    	Cout : out std_logic;
    	SUM : out std_logic_vector(3 downto 0)
    );
end adder4;

architecture structural of adder4 is

        component
                fulladder port(
                        A : in std_logic;
                        B : in std_logic;
                        Cin : in std_logic;
			Cout : out std_logic;
			SUM : out std_logic
                );
        end component;

	signal carry_0, carry_1, carry_2: std_logic;

	for adder_0: fulladder use entity work.fulladder(structural);
	for adder_1: fulladder use entity work.fulladder(structural);
	for adder_2: fulladder use entity work.fulladder(structural);
	for adder_3: fulladder use entity work.fulladder(structural);

begin
	--wire up the adders
	adder_0: fulladder port map(A(0), B(0), Cin, carry_0, SUM(0));
	adder_1: fulladder port map(A(1), B(1), carry_0, carry_1, SUM(1));
	adder_2: fulladder port map(A(2), B(2), carry_1, carry_2, SUM(2));
	adder_3: fulladder port map(A(3), B(3), carry_2, Cout, SUM(3));

end structural;
	
