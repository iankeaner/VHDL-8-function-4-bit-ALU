#There are 5 test benches for this project. One to test the 4 to 1 mux, one to test the full adder, one to test the 4 bit adder, one to test the ALU using standard output and one to test the ALU using file IO.

#note: these commands were ran with a UMBC launch script for xrun. replace /umbc/software/scripts/launch_cadence_xrun.sh with a different launch script or command.

alu_file_test:
	/umbc/software/scripts/launch_cadence_xrun.sh -top alu_4_test_fileIO gates/*.vhd mux4.vhd fulladder.vhd adder4.vhd selector.vhd alu_4.vhd alu_4_test_fileIO.vhd -access rwc

alu_stdout_test:
	/umbc/software/scripts/launch_cadence_xrun.sh -top alu_4_test gates/*.vhd mux4.vhd fulladder.vhd adder4.vhd selector.vhd alu_4.vhd alu_4_test.vhd -access rwc

adder4_test: 
	/umbc/software/scripts/launch_cadence_xrun.sh -top adder4_test gates/*.vhd fulladder.vhd adder4.vhd adder4_test.vhd -access rwc

fulladder_test:
	/umbc/software/scripts/launch_cadence_xrun.sh -top fulladder_test gates/*.vhd fulladder.vhd fulladder_test.vhd -access rwc

mux4_test:
	/umbc/software/scripts/launch_cadence_xrun.sh -top mux4_tb gates/*.vhd mux4.vhd mux4_tb.vhd -access rwc	

