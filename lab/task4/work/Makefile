###########################
### Makefile for Task 3 ###
###########################

help:
	@echo ""
	@echo " To printing usage: 			make help "
	@echo " To run Lab1 with Fusion Compiler:	make run "
	@echo " To clean working area:			make clean "
	@echo ""

run:
	test -d ./logs	|| mkdir ./logs
	fc_shell  -no_log -f ../scripts/task3.tcl | tee ./logs/task3.log 

clean:
	rm -rf default* *.dlib fc.log HDL* CLIBs fc* check* lm_command.log work* logs/*
	rm -rf ../../results/*.dlib
	rm -rf ../../results/*.v
	rm -rf ../../results/*floorplan_files
	rm -rf ../../results/*.def
	cp -rf ../../solution/*.dlib ../../results
	cp -rf ../../solution/*.v ../../results
