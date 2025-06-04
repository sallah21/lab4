#####################################################################
#####		Design Setup Script for Fusion Compiler		#####
#####################################################################

set DesignName				"dut_toplevel"			; # define design name # 
set DesignLibrary			"${DesignName}.dlib"	; # define design library name # 
set WorkDir					"[pwd]"					; # define current working directory # 

set TechFlowType			"tf"					; # set "tf" for TECH_FILE-based flow or set "ndm" for TECH_NDM-based flow. # 
			
set ParasiticModel			"tlup"					; # set "tlup" for using TLUP files or  set "nxtgrd" for using NXTGRD files. # 
			
set HDL						"sverilog"				; # set "sverilog", "verilog" or "vhdl" for reading SystemVerilog, Verilog or VHDL RTL, respectively.

set SdcFile					"${SdcDir}/${DesignName}.sdc" ; # specify file with design constraints # 
set NormalModeSdcFile		"${SdcDir}/${DesignName}_normal.sdc" ; # specify file with design constraints for normal mode 
set PowerSaveModeSdcFile	"${SdcDir}/${DesignName}_power_save.sdc" ; # specify file with design constraints for low power mode 

set PVT_FF					"ff0p88v125c"			; # set FF PVT
set PVT_TT					"tt0p8v25c"				; # set TT PVT
set PVT_SS					"ss0p72vm40c"			; # set SS PVT

set DB_FF					"${LibertyDir}/${TechLibName}_${PVT_FF}.db"
set DB_TT					"${LibertyDir}/${TechLibName}_${PVT_TT}.db"
set DB_SS					"${LibertyDir}/${TechLibName}_${PVT_SS}.db"

set TapCellDistance			40

#Configure host file/options
set_host_options -max_cores 12
