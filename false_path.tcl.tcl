############source one by one to check#########################


#Reset design before apply another case analysis method
reset_design

#applying false_path in the deisgn
set_false_path -from [get_ports a[*]] -to [get_ports f[*]]
set_false_path -from [get_ports c[*]] -to [get_ports f[*]]
set_false_path -from [get_ports b[*]] -to [get_ports e[*]]
set_false_path -from [get_ports d[*]] -to [get_ports e[*]]

#Do update_timing
update_timing

#report the exceptions
report_exceptions -nosplit

#report timing
report_timing -to f[0] -nworst 50 -path_type summary

report_timing -from a[*] -to f[*]


#setting max delay
set_max_delay -from [all_inputs] -to [all_outputs]

update_timing

#unconstrained path
report_timing -from a[*] -to f[*]

#constrained path
report_timing -from b[*] -to f[*]

report_timing -to f[0] -nworst 50 -path_type summary
