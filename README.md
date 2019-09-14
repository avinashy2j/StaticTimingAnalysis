# StaticTimingAnalysis
Implementation of Timing Exceptions in RTL design for STA 

This design contains Muxes, Half Adder and AND gates. The logic was implemented using Verilog and synthesized on Design Compiler to obtain gate level netlist timing_mapped.v. Regular Threshold Voltage liberty file was used for synthesis and timing analysis.
The design description is as follows (and see the schematic.png):
E= A+B, if S=0
F= B+D, if S=1

The operating condition was selected worst i.e., 0.95V and 125 C with on-chip variation analysis mode. 
After completing synthesis the design was used as an input to Primetime. The initial setup script is attached in the TCL format which are three in count: caseAnalysis.tcl, clockGroup.tcl and falsePath.tcl.
1. #caseAnalysis: This file contains script for initial primetime setup as well as implementation of set_case_analysis command for timing exception.
2. #falsePath: This scripts talks about define false path in the design. But make sure that set_false_path command does not change anything in the delay calculation on primetime.
3. #virtualClocks: clk1 and clk2 was defined as the clock for A to E, C to E and D to F, B to F respectively. Disable timing option was used here to make zeroth bit of a (a[0]) to ground and see the effect on delay calculation on primetime.

