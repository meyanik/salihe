#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Jul 11 01:03:15 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.18-s099_1 (64bit) 07/18/2023 13:03 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.18-s099_1 NR230707-1955/21_18-UB (database version 18.20.605) {superthreading v2.17}
#@(#)CDS: AAE 21.18-s017 (64bit) 07/18/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.18-s022_1 () Jul 11 2023 23:10:24 ( )
#@(#)CDS: SYNTECH 21.18-s010_1 () Jul  5 2023 06:32:03 ( )
#@(#)CDS: CPE v21.18-s053
#@(#)CDS: IQuantus/TQuantus 21.1.1-s966 (64bit) Wed Mar 8 10:22:20 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set_db init_power_nets VDD
set_db init_ground_nets VSS
read_mmmc gpio.view
#@ Begin verbose source gpio.view (pre)
create_library_set -name max_timing\
   -timing ../lib/slow_vdd1v0_basicCells.lib
create_library_set -name min_timing\
   -timing ../lib/fast_vdd1v0_basicCells.lib
create_timing_condition -name default_mapping_tc_2\
   -library_sets min_timing
create_timing_condition -name default_mapping_tc_1\
   -library_sets max_timing
create_rc_corner -name rccorners\
   -cap_table ../captable/cln28hpl_1p10m+alrdl_5x2yu2yz_typical.capTbl\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -qrc_tech ../QRC_Tech/gpdk045.tch
create_delay_corner -name max_delay\
   -timing_condition {default_mapping_tc_1}\
   -rc_corner rccorners
create_delay_corner -name min_delay\
   -timing_condition {default_mapping_tc_2}\
   -rc_corner rccorners
create_constraint_mode -name sdc_cons\
   -sdc_files\
    gpio_sdc.sdc 
create_analysis_view -name wc -constraint_mode sdc_cons -delay_corner max_delay
create_analysis_view -name bc -constraint_mode sdc_cons -delay_corner min_delay
set_analysis_view -setup wc -hold bc
#@ End verbose source gpio.view
write_io_file --help
write_io_file -help
ls
write_io_file ./pindeneme.io
set_db add_rings_target default
set_db add_rings_extend_over_row 0
set_db add_rings_ignore_rows 0
set_db add_rings_avoid_short 0
set_db add_rings_skip_shared_inner_ring none
set_db add_rings_stacked_via_top_layer Metal11
set_db add_rings_stacked_via_bottom_layer Metal1
set_db add_rings_via_using_exact_crossover_size 1
set_db add_rings_orthogonal_only true
set_db add_rings_skip_via_on_pin {  standardcell }
set_db add_rings_skip_via_on_wire_shape {  noshape }
add_rings -nets {VSS VDD} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 0.7 bottom 0.7 left 0.7 right 0.7} -spacing {top 0.3 bottom 0.3 left 0.3 right 0.3} -offset {top 0.5 bottom 0.5 left 0.5 right 0.5} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none
set_db add_rings_target default
set_db add_rings_extend_over_row 0
set_db add_rings_ignore_rows 0
set_db add_rings_avoid_short 0
set_db add_rings_skip_shared_inner_ring none
set_db add_rings_stacked_via_top_layer Metal11
set_db add_rings_stacked_via_bottom_layer Metal1
set_db add_rings_via_using_exact_crossover_size 1
set_db add_rings_orthogonal_only true
set_db add_rings_skip_via_on_pin {  standardcell }
set_db add_rings_skip_via_on_wire_shape {  noshape }
add_rings -nets {VSS VDD} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 0.7 bottom 0.7 left 0.7 right 0.7} -spacing {top 0.3 bottom 0.3 left 0.3 right 0.3} -offset {top 0.5 bottom 0.5 left 0.5 right 0.5} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none
set_db add_stripes_ignore_block_check false
set_db add_stripes_break_at none
set_db add_stripes_route_over_rows_only false
set_db add_stripes_rows_without_stripes_only false
set_db add_stripes_extend_to_closest_target none
set_db add_stripes_stop_at_last_wire_for_area false
set_db add_stripes_partial_set_through_domain false
set_db add_stripes_ignore_non_default_domains false
set_db add_stripes_trim_antenna_back_to_shape none
set_db add_stripes_spacing_type edge_to_edge
set_db add_stripes_spacing_from_block 0
set_db add_stripes_stripe_min_length stripe_width
set_db add_stripes_stacked_via_top_layer Metal11
set_db add_stripes_stacked_via_bottom_layer Metal1
set_db add_stripes_via_using_exact_crossover_size false
set_db add_stripes_split_vias false
set_db add_stripes_orthogonal_only true
set_db add_stripes_allow_jog { padcore_ring  block_ring }
set_db add_stripes_skip_via_on_pin {  standardcell }
set_db add_stripes_skip_via_on_wire_shape {  noshape   }
add_stripes -nets {VDD VSS} -layer Metal10 -direction vertical -width 0.3 -spacing 0.4 -set_to_set_distance 5 -start_from left -start_offset 1 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit Metal11 -pad_core_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid none
set_db add_stripes_ignore_block_check false
set_db add_stripes_break_at none
set_db add_stripes_route_over_rows_only false
set_db add_stripes_rows_without_stripes_only false
set_db add_stripes_extend_to_closest_target none
set_db add_stripes_stop_at_last_wire_for_area false
set_db add_stripes_partial_set_through_domain false
set_db add_stripes_ignore_non_default_domains false
set_db add_stripes_trim_antenna_back_to_shape none
set_db add_stripes_spacing_type edge_to_edge
set_db add_stripes_spacing_from_block 0
set_db add_stripes_stripe_min_length stripe_width
set_db add_stripes_stacked_via_top_layer Metal11
set_db add_stripes_stacked_via_bottom_layer Metal1
set_db add_stripes_via_using_exact_crossover_size false
set_db add_stripes_split_vias false
set_db add_stripes_orthogonal_only true
set_db add_stripes_allow_jog { padcore_ring  block_ring }
set_db add_stripes_skip_via_on_pin {  standardcell }
set_db add_stripes_skip_via_on_wire_shape {  noshape   }
add_stripes -nets {VDD VSS} -layer Metal10 -direction vertical -width 0.3 -spacing 0.4 -set_to_set_distance 5 -start_from left -start_offset 1 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit Metal11 -pad_core_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid none
write_floorplan gpio_controller.fp
connect_global_net VDD -type pg_pin -pin VDD -inst_base_name *
connect_global_net VSS -type pg_pin -pin VSS -inst_base_name *
set_db route_special_via_connect_to_shape { stripe }
route_special -connect core_pin -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target nearest_target -core_pin_target first_after_row_end -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }
set_db route_special_via_connect_to_shape { stripe }
route_special -connect core_pin -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target nearest_target -core_pin_target first_after_row_end -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }
place_opt_design 
gui_select -point {27.66850 28.47550}
write_db placeOpt
create_clock_tree_spec 
clock_opt_design
write_db postCTSopt
set_db route_design_with_timing_driven 1
set_db route_design_with_si_driven 1
set_db route_design_top_routing_layer 11
set_db route_design_bottom_routing_layer 1
set_db route_design_detail_end_iteration 1
set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
route_design -global_detail
reset_parasitics
extract_rc
time_design -post_route 
time_design -post_route -hold
set_db timing_analysis_type ocv
time_design -post_route -hold
set_db check_drc_disable_rules {}
set_db check_drc_ndr_spacing auto
set_db check_drc_check_only default
set_db check_drc_inside_via_def true
set_db check_drc_exclude_pg_net false
set_db check_drc_ignore_trial_route false
set_db check_drc_ignore_cell_blockage false
set_db check_drc_use_min_spacing_on_block_obs auto
set_db check_drc_report gpio_controller.drc.rpt
set_db check_drc_limit 1000
check_drc
set_db check_drc_area {0 0 0 0}
set_db check_drc_disable_rules {}
set_db check_drc_ndr_spacing auto
set_db check_drc_check_only default
set_db check_drc_inside_via_def true
set_db check_drc_exclude_pg_net false
set_db check_drc_ignore_trial_route false
set_db check_drc_ignore_cell_blockage false
set_db check_drc_use_min_spacing_on_block_obs auto
set_db check_drc_report gpio_controller.drc.rpt
set_db check_drc_limit 1000
check_drc
set_db check_drc_area {0 0 0 0}
check_connectivity -type all -error 1000 -warning 50
gui_select -rect {8.88300 18.60550 9.88700 17.76850}
gui_select -point {-1.78800 11.07300}
gui_select -point {-6.60000 2.99650}
#@ source power.tcl 
#@ Begin verbose source (pre): source power.tcl 
connect_global_net VDD -type pg_pin -pin VDD -inst *
connect_global_net VSS -type pg_pin -pin VSS -inst *
connect_global_net VDD -type tie_hi 
connect_global_net VSS -type tie_lo 
connect_global_net VDD -type tie_hi -pin VDD -inst *
connect_global_net VSS -type tie_lo -pin VSS -inst *
#@ End verbose source: power.tcl
set_power_output_dir -reset
set_power_output_dir ./run1
set_default_switching_activity -reset
set_default_switching_activity -input_activity 0.2 -period 10.0
read_activity_file -reset
set_power -reset
set_dynamic_power_simulation -reset
report_power -rail_analysis_format VS -out_file ./run1/gpio_controller.rpt
add_fillers -base_cells FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 FILL1 DECAP10 DECAP9 DECAP8 DECAP7 DECAP6 DECAP5 DECAP4 DECAP3 DECAP2 -prefix FILLER
write_stream gpio -lib_name DesignLib -unit 2000 -mode all
