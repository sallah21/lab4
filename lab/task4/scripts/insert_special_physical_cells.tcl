#####################################################################
#####                 Boundary/TAP cell insertion               #####
#####################################################################


#### Inserting boundary cells
set_boundary_cell_rules  \
        -top_boundary_cells                */${CellPrefix}_CAPT2 \
        -bottom_boundary_cells             */${CellPrefix}_CAPB2 \
        -left_boundary_cell                */${CellPrefix}_CAPT2 \
        -right_boundary_cell               */${CellPrefix}_CAPB2 \
        -top_left_outside_corner_cell      */${CellPrefix}_CAPTIN13 \
        -top_right_outside_corner_cell     */${CellPrefix}_CAPTIN13 \
        -bottom_left_outside_corner_cell   */${CellPrefix}_CAPBIN13 \
        -bottom_right_outside_corner_cell  */${CellPrefix}_CAPBIN13 \
        -mirror_left_outside_corner_cell \
        -mirror_right_outside_corner_cell 
    
compile_boundary_cells

#### Inserting TAP cells
create_tap_cells   \
         -lib_cell  */${CellPrefix}_TAPDS \
         -distance ${TapCellDistance} \
         -pattern stagger \
         -skip_fixed_cells         
