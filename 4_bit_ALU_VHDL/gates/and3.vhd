library IEEE;
use IEEE.std_logic_1164.all;

entity and3 is
    port (
        a : in    std_logic;
        b : in    std_logic;
        c : in    std_logic;
        y: out std_logic
    );
end and3;

architecture structural of and3 is
begin 
    y <= a and b and c;
end structural;    