set search_path "$search_path \ /remote/models/"

set link_library "your_compiled_liberty.db"  

read_ddc ../remote/design.ddc

link


current_design

report_constraint -verbose  
#doupdate timming when you change anything in sdc

update_timing

resest_deisgn

##########################Timing checks#########################

#its a false path and and gives nothing untill next command
report_timing -from a[*] -to f[*]  

#makes unconstrained path to show the timing reports 
set timing_report_unconstrained_paths false 

#10 worst ppath
report_timing -to f[*] -max_paths 10 

#10 worst ppath with summary but there are only 5 at end
report_timing -to f[*] -max_paths 10 -path_type summary

#10 wors path
report_timing -to f[0]  -nworst 10  -path_type summary

report_timing -to f[0]  -nworst 2

report_timing -to f[0]  -nworst 2 -nets

#uniquify pins
report_timing -to f[0]  -nworst 2 -nets -unique_pins


