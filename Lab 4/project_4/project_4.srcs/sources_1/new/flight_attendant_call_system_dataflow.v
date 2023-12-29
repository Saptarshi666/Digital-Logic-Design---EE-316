`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 01:42:51 PM
// Design Name: 
// Module Name: flight_attendant_call_system_dataflow
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


module flight_attendant_call_system_dataflow(
    input wire clk,
    input wire call_button,
    input wire cancel_button,
    output reg light_state
    );
wire next_state;
assign next_state = (((~cancel_button) & light_state) | (call_button));

always @ (posedge clk) begin
    light_state <= next_state;
end
endmodule
