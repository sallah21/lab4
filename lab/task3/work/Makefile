##########################
### Makefile for task3 ###
##########################

help:
	@echo ""
	@echo " To printing usage: 			make help "
	@echo " To run Lab1 with Fusion Compiler:	make run "
	@echo " To clean working area:			make clean "
	@echo ""

run:
	test -d ./logs	|| mkdir ./logs
	fc_shell  -no_log -f ../scripts/task3.tcl | tee ./logs/task3.log
	cp -rf ../../results/*.v ../../solution

run_power:
	test -d ./logs	|| mkdir ./logs
	fc_shell  -no_log -f ../scripts/task3_power.tcl | tee ./logs/task3_power.log
	cp -rf ../../results/*.v ../../solution

run_timing:
	test -d ./logs	|| mkdir ./logs
	fc_shell  -no_log -f ../scripts/task3_timing.tcl | tee ./logs/task3_timing.log
	cp -rf ../../results/*.v ../../solution

run_area:
	test -d ./logs	|| mkdir ./logs
	fc_shell  -no_log -f ../scripts/task3_area.tcl | tee ./logs/task3_area.log
	cp -rf ../../results/*.v ../../solution

clean:
	rm -rf default* *.dlib fc.log HDL* CLIBs fc* check* lm_command.log work* logs/*
	rm -rf ../../results/*.dlib
	rm -rf ../../results/*.v
	cp -rf ../../solution/*.dlib ../../results
	cp -rf ../../solution/*.v ../../results
