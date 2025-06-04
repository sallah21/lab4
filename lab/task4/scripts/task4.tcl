#####################################################################
#####                          Task 4                           #####
#####################################################################

#### Sourcing main setup script
source -echo  ../../setup/main_setup.tcl

#### Sourcing project specyfic setup script
source -echo  ${SetupDir}/design_setup.tcl



#####################################################################
#####                       Auto Floorplan                      #####
#####################################################################
open_lib ${ResultsDir}/${DesignLibrary} 
 
copy_block -from ${DesignName}/rtl_read -to ${DesignName}/auto_floorplan 
open_block ${DesignName}/auto_floorplan 
 
source -echo ${SetupDir}/technology_setup.tcl 
 
read_sdc -echo ${SdcFile} 
 
source -echo ${SetupDir}/mcmm_setup.tcl 

set_app_options -name place.coarse.continue_on_missing_scandef -value true
set_app_options -name compile.auto_floorplan.enable -value true
set_auto_floorplan_constraints -control_type core -core_utilization 0.5 -core_offset 10 -shape R -side_ratio {1 3} -flip_first_row true
report_auto_floorplan 

set_block_pin_constraints -self -allowed_layers {M2 M3} -sides {1 2 3} -pin_spacing_distance 1 -width 0.19 -length 0.19

set_individual_pin_constraints -ports [get_ports clk] -sides 4 -allowed_layers M4
report_block_pin_constraints -self

compile_fusion -check_only
compile_fusion -to logic_opto

report_congestion -rerun_global_router
generateReports tuned_auto_floorplan
write_floorplan -output ${ResultsDir}/auto_floorplan_files -exclude {cells nets}  
write_def -exclude {cells nets} ${ResultsDir}/auto_floorplan.def

save_block
save_lib
close_blocks
close_lib

#####################################################################
#####                       Manual Floorplan                    #####
#####################################################################
# Open the design library 
open_lib ${ResultsDir}/${DesignLibrary} 
 
# Copy and open block 
copy_block -from ${DesignName}/auto_floorplan -to ${DesignName}/manual_floorplan 
open_block ${DesignName}/manual_floorplan

initialize_floorplan -control_type core -core_utilization 0.55 -core_offset 5 -shape R -side_ratio {2.5 1.5} -flip_first_row true

set ports [remove_from_collection [get_ports] {VDD VSS}]

set_block_pin_constraints -self -allowed_layers {M3 M4} -sides {1 2 3} -pin_spacing_distance 1 -width 0.11 -length 0.11

set_individual_pin_constraints -ports [get_ports clk] -sides 4 -allowed_layers M5

place_pins -self -ports ${ports}

source -echo ../scripts/insert_special_physical_cells.tcl 

write_floorplan -output ${ResultsDir}/manual_floorplan_files -exclude {cells nets}

#### Wrtl_readrite DEF for created floorplan 
write_def -exclude {cells nets} ${ResultsDir}/manual_floorplan.def 
 
generateReports manual_floorplan 
 
get_blocks -all 
save_block 
save_lib 
 
close_blocks 
close_lib 



#####################################################################
#####             Creating power and ground network             #####
#####################################################################




# Open the design library 
open_lib ${ResultsDir}/${DesignLibrary} 
 
# Copy and open block 
copy_block -from ${DesignName}/rtl_read -to ${DesignName}/final_floorplan 
open_block ${DesignName}/final_floorplan 
 
# Source tech setup script 
source -echo ${SetupDir}/technology_setup.tcl 
 
# Read the constraints 
read_sdc -echo ${SdcFile} 
 
# MCMM setup 
source -echo ${SetupDir}/mcmm_setup.tcl 
 
#### Read floorplan from DEF 
read_def ${ResultsDir}/auto_floorplan.def 
 
#### Insert Boundary and TAP cells in the design 
source -echo ../scripts/insert_special_physical_cells.tcl 
 
#### Create Power/Ground Network 
source -echo ../scripts/create_pg_network.tcl 
 
# save_block 
# save_lib 
# close_blocks 
# close_lib
