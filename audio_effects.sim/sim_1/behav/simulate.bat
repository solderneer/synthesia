@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim pitchshift_sim_behav -key {Behavioral:sim_1:Functional:pitchshift_sim} -tclbatch pitchshift_sim.tcl -view C:/Users/Auora/Documents/tonedeaf/delay_sim_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0