@echo off
REM ****************************************************************************
REM Vivado (TM) v2021.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Sep 29 21:11:52 -0500 2021
REM SW Build 3247384 on Thu Jun 10 19:36:33 MDT 2021
REM
REM IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim TB_BCD_TO_SEVEN_SEGEMNENT_behav -key {Behavioral:sim_1:Functional:TB_BCD_TO_SEVEN_SEGEMNENT} -tclbatch TB_BCD_TO_SEVEN_SEGEMNENT.tcl -view C:/Users/deeps/Lab_3_part_3/TB_BCD_TO_SEVEN_SEGEMNENT_behav.wcfg -log simulate.log"
call xsim  TB_BCD_TO_SEVEN_SEGEMNENT_behav -key {Behavioral:sim_1:Functional:TB_BCD_TO_SEVEN_SEGEMNENT} -tclbatch TB_BCD_TO_SEVEN_SEGEMNENT.tcl -view C:/Users/deeps/Lab_3_part_3/TB_BCD_TO_SEVEN_SEGEMNENT_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
