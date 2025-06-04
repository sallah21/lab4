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

#Optymisation takie sytuation

set_app_options -name compile.flow.high_effort_timing -value 2

#### Wstepne mapowanie
compile_fusion -to logic_opto

#### Zebranie raportow
set TargetName "logic_opto_general_timing_2"
generateReports ${TargetName}

#### Generacja netlisty na poziomie bramek
write_verilog ${ResultsDir}/${DesignName}_${TargetName}.v

#### Zapisanie bloku i biblioteki


