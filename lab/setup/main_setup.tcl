#####################################################################
#####		Common Setup Script for Fusion Compiler		#####
#####################################################################

set LabRootDir			"[pwd]/../../.."     ; # root dir for the labs

set LabDir				"${LabRootDir}/lab" ; # directory for lab exercises
set SrcDir				"${LabRootDir}/src"  ; # directory for source files (RTL, SDC)
set TechLibDir			"/eda/synopsys/files/FC_Labs/common" ; # technology library path

set SetupDir			"${LabDir}/setup"   ; # directory with setup files

set TechLibName			"saed14rvt"			 ; # define library name
set CellPrefix			"SAEDRVT14"			 ; # define cell prefix
set TechNodeName		"saed14nm"			 ; # define technology node name
set MetalStack			"1p9m"				 ; # define metal stack

set RefNdmType			"frame_only"		 ; # define reference ndm type: "frame_only" or "frame_timing"
set RefLibDir			"${TechLibDir}/ndm" ; # reference library path
set RefLib				"${RefLibDir}/${TechLibName}_${RefNdmType}.ndm" ; # reference library

set TechFileDir    		"${TechLibDir}/tf"  ; # directory with technology file(s)
set TechFile			"${TechFileDir}/${TechNodeName}_${MetalStack}.tf" ; # technology file
#set TechNdm				""

set LibertyDir			"${TechLibDir}/liberty" ; # 

set TlupDir				"${TechLibDir}/tlup" ; # 
set TlupMinFile			"${TlupDir}/${TechNodeName}_${MetalStack}_Cmin.tlup" ; # 
set TlupNomFile			"${TlupDir}/${TechNodeName}_${MetalStack}_Cnom.tlup" ; # 
set TlupMaxFile			"${TlupDir}/${TechNodeName}_${MetalStack}_Cmax.tlup" ; # 
set NxtGrdDir			"${TechLibDir}/nxtgrd" ; # 
set NxtGrdMinFile		"${NxtGrdDir}/${TechNodeName}_${MetalStack}_Cmin.nxtgrd" ; # 
set NxtGrdNomFile		"${NxtGrdDir}/${TechNodeName}_${MetalStack}_Cnom.nxtgrd" ; # 
set NxtGrdMaxFile		"${NxtGrdDir}/${TechNodeName}_${MetalStack}_Cmax.nxtgrd" ; # 
set MapDir				"${TechLibDir}/map" ; # 
set GdsDir				"${TechLibDir}/gds" ; # 
set RunsetDir			"${TechLibDir}/runsets" ; # 
set GdsFile				"${GdsDir}/saed14rvt.gds" ; # 
set GdsMapFile			"${MapDir}/saed14nm_1p9m_gdsout_mw.map" ; # 
set LayerMapFile		"${MapDir}/${TechNodeName}_tf_itf_tluplus.map" ; # 
set DrcRunsetFile		"${RunsetDir}/saed14nm_1p9m_drc_rules.rs" ; # 
set MetalFillRunsetFile	"${RunsetDir}/saed14nm_1p9m_mfill_rules.rs" ; # 


set RtlDir				"${SrcDir}/rtl" ; # directory with source files
set SystemVerilogDir	"${RtlDir}/sverilog" ; # directory containing SystemVerilog HDL source files
set VerilogDir			"${RtlDir}/verilog" ; # directory containing Verilog HDL source files
set VhdlDir				"${RtlDir}/vhdl" ; # directory containing VHDL source files

set SdcDir				"${SrcDir}/sdc" ; # directory with constraint files

set ResultsDir			"${LabDir}/results" ; # directory for outcomes of the lab
set ReportsDir			"${LabDir}/reports" ; # directory for report files

echo					${SetupDir}
source 					${SetupDir}/utilities.tcl

