`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2021 11:31:07 PM
// Design Name: 
// Module Name: tb_myAND
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
`timescale 1ns/1ps

module tb_myAND;
    
    //Inputs to be defined as register
    reg a;
    reg b;
    
    //outputs to be defined as wires   
    wire out;
    
    myAND and_gate0 (
        .a(a),
        .b(b),
        .out(out)
     );
     initial
        begin
        
        //Stimulus-All input combinations followed by some wait time to observe o/p
        a = 1'b0;
        b = 1'b0;
        
        #50 
        
        a = 1'b0;
        b = 1'b1;
        
        #50
        
        a = 1'b1;
        b = 1'b0;
        
        #50  
        
        a = 1'b1;
        b = 1'b1;
                
        end        
endmodule
