#####################################################################
#####                          Task 2                           #####
#####################################################################

#### Sourcing main setup script
source -echo  ../../setup/main_setup.tcl

#### Sourcing project specyfic setup script
source -echo  ${SetupDir}/design_setup.tcl

#### utworzenie biblioteki projektu i sprawdzenie poprawnosci operacji
set_app_var link_library "${DB_FF} ${DB_TT} ${DB_SS}"
create_lib ${ResultsDir}/${DesignLibrary} -technology $TechFile -ref_libs ${RefLib}
report_ref_libs

#### analiza modelu
analyze -format sverilog [glob ${SystemVerilogDir}/*.svh]
analyze -format sverilog [glob ${SystemVerilogDir}/*.sv]

#### elaboracja projektu
elaborate ${DesignName}

#### ustawienie top module
set_top_module ${DesignName}

#### zapisanie bloku
save_block -as ${DesignName}/rtl_read

#### wypisanie i zamkniecie blokow, zapisanie i zamkniecie biblioteki
current_block
get_blocks -all
list_blocks
save_lib
copy_lib -to_lib ${LabRootDir}/lab/solution
close_blocks
close_lib
exit 