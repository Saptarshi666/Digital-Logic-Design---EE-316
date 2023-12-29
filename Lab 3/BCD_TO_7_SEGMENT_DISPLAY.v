`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2021 04:20:32 PM
// Design Name: 
// Module Name: BCD_TO_7_SEGMENT_DISPLAY
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


module BCD_TO_7_SEGMENT_DISPLAY(
    input A,
    input B,
    input C,
    input D,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output AN0,
    output AN1,
    output AN2,
    output AN3
    );
 wire A_not,B_not,C_not,D_not;
 not n0(A_not, A); 
 not n1(B_not, B);
 not n2(C_not, C);
 not n3(D_not,D);
 wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15;
 and g0(t1,B,C_not,D_not);
 and g1(t2,A_not,B_not,C_not,D);
 or h0(a,t1,t2);
 and g2(t3,B,C_not,D);
 and g3(t4,B,C,D_not);
 or h1(b,t3,t4);
 and g4(c,B_not,C,D_not);
 and g5(t5,B,C_not,D_not);
 and g6(t6,B,C,D);
 and g7(t7,A_not,B_not,C_not,D);
 or h2(d,t5,t6,t7);
 and g8(t8,B,C_not);
 or h3(e,D,t8);
 and g9(t9,B_not,C);
 and g10(t10,C,D);
 and g11(t11,A_not,B_not,D);
 or h4(f,t9,t10,t11);
 and g12(t12,A_not,B_not,C_not);
 and g13(t13,B,C,D);
 or h5(g,t12,t13);  
 or h6(AN1,A_not,A);
 or h7(AN2,A_not,A);
 or h8(AN3,A_not,A);
 and g14(t14,A,B);
 and g15(t15,A,C);
 or h9(AN0,t14,t15);
endmodule
