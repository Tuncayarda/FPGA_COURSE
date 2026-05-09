`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 05:25:19 AM
// Design Name: 
// Module Name: wallace_tree_multiplier_4bit
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


module wallace_tree_multiplier_4bit(
    input [3:0] A, B,
    output [7:0] Z
    );
    
    wire [3:0] P [3:0];
    wire [11:0] S;
    wire [11:0] C;

    assign P[0] = A & {4{B[0]}};
    assign P[1] = A & {4{B[1]}};
    assign P[2] = A & {4{B[2]}};
    assign P[3] = A & {4{B[3]}};

    assign Z[0] = P[0][0];
    assign Z[1] = S[6];
    assign Z[2] = S[7];
    assign Z[3] = S[8];
    assign Z[4] = S[9];
    assign Z[5] = S[10];
    assign Z[6] = S[11];
    assign Z[7] = C[11];
    
    // half adder
    half_adder ha1(P[0][3], P[1][2], S[0], C[0]);
    half_adder ha2(P[2][2], P[1][3], S[1], C[1]);
    half_adder ha3(P[0][2], P[1][1], S[2], C[2]);
    half_adder ha7(P[0][1], P[1][0], S[6], C[6]);
    
    // full adder
    full_adder fa4(P[3][0], P[2][1], S[0], S[3], C[3]);
    full_adder fa5(P[3][1], S[1], C[0], S[4], C[4]);
    full_adder fa6(P[2][3], P[3][2], C[1], S[5], C[5]);
    full_adder fa8(S[2], P[2][0], C[6], S[7], C[7]);
    full_adder fa9(S[3], C[2], C[7], S[8], C[8]);
    full_adder fa10(S[4], C[3], C[8], S[9], C[9]);
    full_adder fa11(S[5], C[4], C[9], S[10], C[10]);
    full_adder fa12(P[3][3], C[5], C[10], S[11], C[11]);
    
endmodule
