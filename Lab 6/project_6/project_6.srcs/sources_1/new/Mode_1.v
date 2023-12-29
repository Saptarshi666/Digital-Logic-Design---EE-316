`timescale 1ns / 1ps

module mode1(
    input clk, // 100 Mhz clock source on Basys 3 FPGA
    input reset, // reset
    input [9:0]switches,
    input start_stop,
    output  [3:0] ano, // anode signals of the 7-segment LED display
    output dp,
    output  [6:0] sseg
    );
    wire[3:0] ones,tens,tenth,hundred; 
    wire[6:0] in0, in1, in2, in3;
    wire slow_clk;
    wire slow_clk1;
    hex_to_7segment c1(.x(hundred),.r(in0));
    hex_to_7segment c2(.x(tenth),.r(in1));
    hex_to_7segment c3(.x(ones),.r(in2));
    hex_to_7segment c4(.x(tens),.r(in3));   
    clk_div_disp c5 (.clk(clk), .reset(reset), .clk_out(slow_clk));
    time_mux_state_machine_disp c6(
    .clk(slow_clk),
    .reset(reset),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .dp(dp),
    .an(ano[3:0]),
    .sseg(sseg));
    Clk_div_time c7(
    .clk(clk),
    .clk_out(slow_clk1));
     fsm c8(
     .mode(switches[1:0]),
     .preset(switches[9:2]),
     .start_stop(start_stop),
     .clk(slow_clk1),
     .ones(ones),
     .tens(tens),
     .tenth(tenth),
     .hundred(hundred));
 endmodule