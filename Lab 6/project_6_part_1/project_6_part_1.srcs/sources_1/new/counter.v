`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2018 04:41:59 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input reset,
    input go,
    input[9:0] sw,
    input[3:0] in0,
    input[3:0] in1,
    input[3:0] in2,
    input[3:0] in3,
    output reg[3:0] out0,
    output reg[3:0] out1,
    output reg[3:0] out2,
    output reg[3:0] out3
    );

always @ (posedge clk) begin
    if(!go) begin
        if(reset) begin
            if(sw[9]) begin
                out0 = 0; out1 = 0; out2 = sw[3:0]; out3 = sw[7:4];
                if(out2 > 9) out2 = 0;
                if(out3 > 9) out3 = 0;
            end
            else if(sw[8]) begin
                out0 = 9; out1 = 9; out2 = 9; out3 = 9;
            end
            else begin
                out0 = 0; out1 = 0; out2 = 0; out3 = 0;
            end
        end
        else begin
            out0 = in0; out1 = in1; out2 = in2; out3 = in3;
        end
    end
    else begin
        if(!sw[8]) begin
            if((out3 == 4'd9) && (out2 == 4'd9) && (out1 == 4'd9) && (out0 == 4'd9)) begin
                out0 = in0; out1 = in1; out2 = in2; out3 = in3;
            end
            else begin
                if(out0 == 4'd9) begin
                    out0 = 0;
                    if(out1 == 4'd9) begin
                        out1 = 0;
                        if(out2 == 4'd9) begin
                            out2 = 0;
                            out3 = out3 + 1;
                        end
                        else out2 = out2 + 1;
                    end
                    else out1 = out1 + 1;
                end
                else out0 = out0 + 1;
            end
        end
        else begin
            if((out3 == 4'd0) && (out2 == 4'd0) && (out1 == 4'd0) && (out0 == 4'd0)) begin
                out0 = in0; out1 = in1; out2 = in2; out3 = in3;
            end
            else begin
                if(out0 == 4'd0) begin
                    out0 = 9;
                    if(out1 == 4'd0) begin
                        out1 = 9;
                        if(out2 == 4'd0) begin
                            out2 = 9;
                            out3 = out3 - 1;
                        end
                        else out2 = out2 - 1;
                    end
                    else out1 = out1 - 1;
                end
                else out0 = out0 - 1;
            end
        end
    end
end

endmodule
