#####################################################################
#####                          Task 3                           #####
#####################################################################

#### Sourcing main setup script
source -echo  ../../setup/main_setup.tcl

#### Sourcing project specyfic setup script
source -echo  ${SetupDir}/design_setup.tcl

#### Sourcing main setup script
source -echo  ../../setup/main_setup.tcl

#### Sourcing project specyfic setup script
source -echo  ${SetupDir}/design_setup.tcl

#### Otwarcie biblioteki
open_lib ${ResultsDir}/${DesignLibrary}

#### Kopia i otwarcie bloku
copy_block -from ${DesignName}/rtl_read -to ${DesignName}/mcmm_and_logic_opto_general
open_block ${DesignName}/mcmm_and_logic_opto_general

#### Dolaczenie skryptu ustawien technologicznych
source -echo ${SetupDir}/technology_setup.tcl

#### Czytanie ograniczen
read_sdc -echo ${SdcFile}

#### MCMM
source -echo ${SetupDir}/mcmm_setup.tcl

#### Wstepne mapowanie
compile_fusion -to logic_opto

#### Zebranie raportow
set TargetName "logic_opto_general"
generateReports ${TargetName}

#### Generacja netlisty na poziomie bramek
write_verilog ${ResultsDir}/${DesignName}_${TargetName}.v

#### Zapisanie bloku i biblioteki
current_block
get_blocks -all
list_blocks
save_block
save_lib
close_blocks
close_lib

exit

