`timescale 1ns / 1ps

module decoder(
    input e,
    input a,
    input b,
    input c,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,
    output d7
    );
       
//    // Structural -- Comment when testing Behavioral
//    // Both should never be uncommented at once
    
//    // Defining wires for not signals
//    wire a_not, b_not, c_not;
//    not n0(a_not, a);
//    not n1(b_not, b);
//    not n2(c_not, c);
    
//    //Instantiating AND gates as per the schematic
//    and g0(d0, e, a_not, b_not, c_not);
//    and g1(d1, e, a_not, b_not, c);
//    and g2(d2, e, a_not, b, c_not);
//    and g3(d3, e, a_not, b, c);
//    and g4(d4, e, a, b_not, c_not);
//    and g5(d5, e, a, b_not, c);
//    and g6(d6, e, a, b, c_not);
//    and g7(d7, e, a, b, c);
    
    
    // Behavioral -- Comment when testing Structural
    // Both should never be uncommented at once
    
    // Only reg can be on the left hand side during always blocks.. 
    // Thus, we create a temporary d0_buf and assign it to d0. 
    reg d0_buf = 0;
    assign d0 = d0_buf;
    reg d1_buf = 0;
    assign d1 = d1_buf;
    reg d2_buf = 0;
    assign d2 = d2_buf;
    reg d3_buf = 0;
    assign d3 = d3_buf;
    reg d4_buf = 0;
    assign d4 = d4_buf;
    reg d5_buf = 0;
    assign d5 = d5_buf;    
    reg d6_buf = 0;
    assign d6 = d6_buf;    
    reg d7_buf = 0;
    assign d7 = d7_buf;  
                               
    always @(e, a, b, c)             
    begin
        d0_buf = 1'b0; 
        d1_buf = 1'b0; 
        d2_buf = 1'b0; 
        d3_buf = 1'b0; 
        d4_buf = 1'b0; 
        d5_buf = 1'b0;
        d6_buf = 1'b0;
        d7_buf = 1'b0;
        if(e == 1'b1)
            case({a, b, c})                   
            3'b000: d0_buf = 1;
            3'b001: d1_buf = 1;    
            3'b010: d2_buf = 1;
            3'b011: d3_buf = 1;
            3'b100: d4_buf = 1;
            3'b101: d5_buf = 1;
            3'b110: d6_buf = 1;
            3'b111: d7_buf = 1;
            default: begin
                    d0_buf = 1'b0; 
                    d1_buf = 1'b0; 
                    d2_buf = 1'b0; 
                    d3_buf = 1'b0; 
                    d4_buf = 1'b0; 
                    d5_buf = 1'b0;
                    d6_buf = 1'b0;
                    d7_buf = 1'b0;
                end
            endcase
    end
       
endmodule
