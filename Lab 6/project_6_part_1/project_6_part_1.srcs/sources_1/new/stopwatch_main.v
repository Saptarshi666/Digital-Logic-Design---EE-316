`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2018 03:46:53 PM
// Design Name: 
// Module Name: stopwatch_main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stopwatch_main(
    input clk,
    input reset,
    input start,
    input[9:0] sw,
    output[3:0] an,
    output[6:0] sseg,
    output dp
    );

wire[3:0] dig0, dig1, dig2, dig3;
wire time_clk;
wire display_clk;
wire[6:0] in0, in1, in2, in3;
wire go;

rising_edge_detector c1 (.clk(clk), .signal(start), .out(go));
clk_div_time c2 (.clk(clk), .clk_out(time_clk));
counter c3 (.clk(time_clk), .reset(reset), .go(go), .sw(sw), .in0(dig0), .in1(dig1), .in2(dig2), .in3(dig3), .out0(dig0), .out1(dig1), .out2(dig2), .out3(dig3));

hex_to_7seg c4 (.x(dig0), .r(in0));
hex_to_7seg c5 (.x(dig1), .r(in1));
hex_to_7seg c6 (.x(dig2), .r(in2));
hex_to_7seg c7 (.x(dig3), .r(in3));

clk_div_disp c8 (.clk(clk), .clk_out(display_clk));

time_mux_state_machine c9 (.clk(display_clk), .in0(in0), .in1(in1), .in2(in2), .in3(in3), .dp(dp), .an(an), .sseg(sseg));

endmodule