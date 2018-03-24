@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim clk_gen_sim_behav -key {Behavioral:sim_1:Functional:clk_gen_sim} -tclbatch clk_gen_sim.tcl -view C:/Users/Auora/Documents/tonedeaf/delay_sim_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
