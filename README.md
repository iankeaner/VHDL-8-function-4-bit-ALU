# VHDL-8-function-4-bit-ALU
This project implements an 8 function, 4 bit ALU using structural VHDL code. 

![Top Level Diagram](4_bit_ALU_VHDL/diagrams/4_bit_ALU_diagram_1.png)

The functions of the ALU are shown in the table below

| S1 | S0 | Cin | Function |
|----|----|-----|----------|
| 0 | 0 | 0 | Transfer A |
| 0 | 0 | 1 | A + 1 |
| 0 | 1 | 0 | A + B |
| 0 | 1 | 1 | A + B + 1 |
| 1 | 0 | 0 | A + ~B |
| 1 | 0 | 1 | A - B |
| 1 | 1 | 0 | A - 1 |
| 1 | 1 | 1 | Transfer A |

A bottom-up approach was used when designing this ALU, starting at the gate entities and working up to the top level alu\_4 entity. All logic gate entities are found in the /gates directory.

![Entity Hierarchy](4_bit_ALU_VHDL/diagrams/4_bit_ALU_entity_hierarchy.png)

5 testbenches were written to simulate different entities in the design. There is one simulation of the 4-to-1 mux, one simulation of the fulladder, one simulation of the 4 bit adder and two simulations of the top level ALU. One of the ALU testbenches used file I/O to simulate while the other uses stdout to show the output. The commands to run the simulations using xrun can be found in the Makefile.
