

set PERIOD 3
set CLOCK_NAME clk
create_clock -period $PERIOD -name $CLOCK_NAME [get_ports $CLOCK_NAME]