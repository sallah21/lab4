
set ClockNane clk
set Period 10
set RiseTransition 0.3
set FallTransition 0.5
set Uncertainty 0.7

create_clock -period $Period -name $ClockNane [get_ports $ClockNane]
set_clock_uncertainty -setup $Uncertainty [get_clocks $ClockNane]
set_clock_transition -rise $RiseTransition [get_clocks $ClockNane]
set_clock_transition -fall $FallTransition [get_clocks $ClockNane]
