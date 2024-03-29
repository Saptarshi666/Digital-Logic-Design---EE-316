`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 08:49:49 PM
// Design Name: 
// Module Name: time_multiplex_main
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


module time_multiplex_main(
    input clk,
    input startstop,
    input reset,
    output dp,
    input [7:0] sw,
    input [1:0] mode,
    output [3:0] an,
    output [6:0] sseg
    );
    
    wire [6:0] in0, in1, in2, in3;
    wire refresh_clk;
    wire time_clk;
    wire [3:0] reg_d0; //count for right most digit
    wire [3:0] reg_d1; //count for second right most digit
    wire [3:0] reg_d2; //count for second left most digit
    wire [3:0] reg_d3; //count for left most digit
    
    
    // Module instantiation of hexto7segment decoder
    hexto7segment c1 (.x(reg_d0), .r(in0));
    hexto7segment c2 (.x(reg_d1), .r(in1));
    hexto7segment c3 (.x(reg_d2), .r(in2));
    hexto7segment c4 (.x(reg_d3), .r(in3));
    
    // Module instantiation of clock divider
    // same functionality as the clk_div before, but may have a different width requirement
    clk_div_disp clock (.clk(clk), .reset(reset), .refresh_clk(refresh_clk), .time_clk(time_clk));
    
    
    stopwatch stopwatch_a (
        .clk(time_clk),
        .startstop(startstop),
        .reset(reset),
        .mode(mode[1:0]),
        .sw(sw[7:0]),
        .reg_d0(reg_d0),
        .reg_d1(reg_d1),
        .reg_d2(reg_d2),
        .reg_d3(reg_d3));
    
    
    // Module instantiation of the multiplexer
    //replace slow_clk with clk for simulation, and vice versa
    time_mux_state_machine c6 (
        .clk(refresh_clk),
        .reset(reset),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .dp(dp),
        .sseg(sseg));   
    
    
endmodule

