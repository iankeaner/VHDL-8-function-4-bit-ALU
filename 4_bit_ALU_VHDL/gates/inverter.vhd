library IEEE;
use IEEE.std_logic_1164.all;

--define inputs and ouputs
entity inverter is
    port (
        input : in      std_logic;
        output: out     std_logic
    );
end inverter;

--structural architecture for the inverter entity is defined
architecture structural of inverter is
begin
    output <= not (input); --dataflow model
end structural;