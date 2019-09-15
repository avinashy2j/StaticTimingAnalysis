############Clock group example######################


create_clock -period 10 -name clk1

create_clock -period 10 -name clk2


#how to associate ports with clocks
#define input delay A to E and C to E : clk1
set_input_delay 0 -clock clk1 [get_ports [list a[*] c[*]]]

#seeting tight o/p delay to see violation, will fix later
set_output_delay 10 -clock clk1 [get_ports e[*]]

#clocks: C to F and D to F : clk2
set_input_delay 0 -clock clk1 [get_ports [list b[*] d[*]]]

#seeting tight o/p delay to see violation, will fix later
set_output_delay 10 -clock clk1 [get_ports f[*]]


update_timing
report_timing
report_timing -from b[*] -to e[*]

#use of report transitive fanout 
report_transitive_fanout -from [get_ports sel]
report_transitive_fanout -from [get_ports a[0]]



report_timing -from a[0] -transition_time -capacitance -nets

#more descriptive report with pin names
report_timing -from a[0] -transition_time -capacitance -nets -/
inputs


#new situation: I dont wanna use A[0]: zeroth bit is grounded
#Way 1: set case analysis 0 at A. Way 2: set diabale timing at A
#This command will disable the path of A3 to Y

set_disable_timing -from A3 -to Y [get_cell U63]

report_timing -from a[0] -transition_time -capacitance -nets

#get a nice summary of checks in your design 
report_analysis_coverage
