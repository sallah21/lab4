
set ClockNane clk
set Period 2
set RiseTransition 0.1
set FallTransition 0.2
set Uncertainty 0.3

create_clock -period $Period -name $ClockNane [get_ports $ClockNane]
set_clock_uncertainty -setup $Uncertainty [get_clocks $ClockNane]
set_clock_transition -rise $RiseTransition [get_clocks $ClockNane]
set_clock_transition -fall $FallTransition [get_clocks $ClockNane]