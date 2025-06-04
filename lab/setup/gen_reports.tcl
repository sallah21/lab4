echo "Generating reports for the stage: ${StageName} ..."

redirect -file ${ReportsDir}/${StageName}_report_power.rpt {report_power -scenarios Normal_Typical}
redirect -file ${ReportsDir}/${StageName}_report_timing_setup.rpt {report_timing -scenarios Normal_Typical -delay_type max}
redirect -file ${ReportsDir}/${StageName}_report_timing_hold.rpt  {report_timing -scenarios Normal_Typical -delay_type min}
redirect -file ${ReportsDir}/${StageName}_report_area.rpt {report_area}
redirect -file ${ReportsDir}/${StageName}_report_qor.rpt  {report_qor}
redirect -file ${ReportsDir}/${StageName}_report_design.rpt  {report_design}

echo "Reports have been generated for the stage: ${StageName}."