library IEEE;
use IEEE.std_logic_1164.all;

entity alu_4 is
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
    	S0 : in std_logic;
    	S1 : in std_logic;
    	G : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end alu_4;

architecture structural of alu_4 is

        component
		selector port(
        		B   : in std_logic_vector(3 downto 0);
        		s0  : in std_logic;
        		s1  : in std_logic;
        		Y   : out std_logic_vector(3 downto 0)
                );
        end component;

	component
		adder4 port(
                        A : in std_logic_vector(3 downto 0);
                        B : in std_logic_vector(3 downto 0);
                        Cin : in std_logic;
			Cout : out std_logic;
			SUM : out std_logic_vector(3 downto 0)
		);
	end component;

	--output of the selector unit
        signal Y: std_logic_vector(3 downto 0);

	--define instances of selector unit and 4 bit adder
	for selector_0: selector use entity work.selector(structural);
        for adder4_0: adder4 use entity work.adder4(structural);

begin
	--port map for selector unit and 4 bit adder instances
	selector_0: selector port map(B, S0, S1, Y);
	adder4_0: adder4 port map(A, Y, Cin, Cout, G);

end structural;
