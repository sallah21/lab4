#####################################################################
#####					Technology Setup Script					#####
#####################################################################

set_attribute [get_site_defs unit] symmetry Y
set_attribute [get_site_defs unit] is_default true

if {[string equal tlup ${ParasiticModel}]} {
	read_parasitic_tech -layermap ${LayerMapFile} -tlup ${TlupMaxFile} -name maxTLU
	read_parasitic_tech -layermap ${LayerMapFile} -tlup ${TlupNomFile} -name nomTLU
	read_parasitic_tech -layermap ${LayerMapFile} -tlup ${TlupMinFile} -name minTLU
} elseif {[string equal nxtgrd ${ParasiticModel}]} {
	read_parasitic_tech -layermap ${LayerMapFile} -tlup ${NxtGrdMaxFile} -name maxTLU
	read_parasitic_tech -layermap ${LayerMapFile} -tlup ${NxtGrdNomFile} -name nomTLU
	read_parasitic_tech -layermap ${LayerMapFile} -tlup ${NxtGrdMinFile} -name minTLU
} 

suppress_message ATTR-12
set_attribute [get_layers {M1 M3 M5 M7 M9}]   routing_direction horizontal
set_attribute [get_layers {M2 M4 M6 M8 MRDL}] routing_direction vertical
unsuppress_message ATTR-12
