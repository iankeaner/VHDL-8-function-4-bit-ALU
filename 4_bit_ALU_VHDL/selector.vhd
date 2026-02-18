library IEEE;
use IEEE.std_logic_1164.all;

entity selector is
    port(
        B   : in std_logic_vector(3 downto 0);
        s0  : in std_logic;
        s1  : in std_logic;
        Y   : out std_logic_vector(3 downto 0)
    );
end selector;

architecture structural of selector is

    component
        mux4 port (
            x0, x1, x2, x3  : in std_logic;
            sel0, sel1      : in std_logic;
            y               : out std_logic
        );
    end component;

    component  
            inverter port (
                input   : in std_logic;
                output  : out std_logic
            );
    end component;

    signal b0_not, b1_not, b2_not, b3_not : std_logic;
    signal gnd, vdd : std_logic;

    for inv_0: inverter use entity work.inverter(structural);
    for inv_1: inverter use entity work.inverter(structural);
    for inv_2: inverter use entity work.inverter(structural);
    for inv_3: inverter use entity work.inverter(structural);
    for mux_0: mux4 use entity work.mux4(structural);
    for mux_1: mux4 use entity work.mux4(structural);
    for mux_2: mux4 use entity work.mux4(structural);
    for mux_3: mux4 use entity work.mux4(structural);

begin
    gnd <= '0';
    vdd <= '1';

    --inverters
    inv_0 : inverter port map(B(0), b0_not);
    inv_1 : inverter port map(B(1), b1_not);
    inv_2 : inverter port map(B(2), b2_not);
    inv_3 : inverter port map(B(3), b3_not);

    --muxes
    mux_0 : mux4 port map (gnd, B(0), b0_not, vdd, s0, s1, Y(0));
    mux_1 : mux4 port map (gnd, B(1), b1_not, vdd, s0, s1, Y(1));
    mux_2 : mux4 port map (gnd, B(2), b2_not, vdd, s0, s1, Y(2));
    mux_3 : mux4 port map (gnd, B(3), b3_not, vdd, s0, s1, Y(3));

end structural;
