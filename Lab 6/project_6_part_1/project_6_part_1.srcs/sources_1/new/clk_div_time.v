`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2018 05:39:05 PM
// Design Name: 
// Module Name: clk_div_disp
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


module clk_div_time(
    input clk,
    output reg clk_out
    );

reg[19:0] COUNT = 0;

always @(posedge clk) begin
    if(COUNT >= 1000000) begin
        clk_out = 1;
        COUNT = 0;
    end
    else begin 
        COUNT = COUNT + 1;
        clk_out = 0;
    end
end

endmodule
