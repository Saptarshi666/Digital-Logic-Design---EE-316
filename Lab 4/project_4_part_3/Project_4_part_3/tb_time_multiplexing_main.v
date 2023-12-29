`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 01:58:07 PM
// Design Name: 
// Module Name: tb_time_multiplexing_main
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


module tb_time_multiplexing_main;
reg clk;
reg reset;
reg[15:0] sw;
wire[3:0] an;
wire[6:0] sseg;

time_multiplexing_main uut (
    .clk(clk),
    .reset(reset),
    .sw(sw),
    .an(an),
    .sseg(sseg)
);

initial begin

clk = 0;
reset = 1;
sw = 0;

#50;

reset = 0;
sw = 16'h3210;

#50;

sw = 16'h7654;

#50;

sw = 16'hBA98;

#50;

sw = 16'hFEDC;

#50;

sw = 16'h5555;
reset = 1;

#100;

reset = 0;

#50;

sw = 16'h0000;


end

always
#5 clk = ~clk;

endmodule
