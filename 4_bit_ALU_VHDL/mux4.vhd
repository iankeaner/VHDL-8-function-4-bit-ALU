library IEEE;
use IEEE.std_logic_1164.all;

entity mux4 is 
    port (
        x0, x1, x2, x3  : in std_logic;
        sel0, sel1      : in std_logic;
        y               : out std_logic
    );
end mux4;

architecture structural of mux4 is

    --define intermediate signals
    signal sel0_not, sel1_not : std_logic;
    signal and0_out, and1_out, and2_out, and3_out : std_logic;

    component  
        inverter port (
            input   : in std_logic;
            output  : out std_logic
        );
    end component;

    component 
        and3 port (
            a   : in std_logic;
            b   : in std_logic;
            c   : in std_logic;
            y   : out std_logic
        );
    end component;

    component
        or4 port (
            a   : in std_logic;
            b   : in std_logic;
            c   : in std_logic;
            d   : in std_logic;
            y   : out std_logic
        );
    end component;

    --define gate instances
    for inv_0: inverter use entity work.inverter(structural);
    for inv_1: inverter use entity work.inverter(structural);
    for and_0: and3 use entity work.and3(structural);
    for and_1: and3 use entity work.and3(structural);
    for and_2: and3 use entity work.and3(structural);
    for and_3: and3 use entity work.and3(structural);
    for or_0: or4 use entity work.or4(structural);

begin

    --PORT MAP GATES--
    --inverters--

    inv_0 : inverter port map(sel0, sel0_not);
    inv_1 : inverter port map(sel1, sel1_not);

    --3-input ands--

    and_0 : and3 port map(sel0_not, sel1_not, x0, and0_out);
    and_1 : and3 port map(sel0, sel1_not, x1, and1_out);
    and_2 : and3 port map(sel0_not, sel1, x2, and2_out);
    and_3 : and3 port map(sel0, sel1, x3, and3_out);

    --4-input or--

    or_0 : or4 port map(and0_out, and1_out, and2_out, and3_out, y);

    end structural;