`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 04:39:12 AM
// Design Name: 
// Module Name: array_multiplier_4bit
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


module array_multiplier_4bit(
    input [3:0] A, B,
    output [7:0] Z
    );
    
    wire [3:0] P0, P1, P2, P3;
    wire S0, S1, S2, S3, S4, S5;
    wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10;

    assign P0 = A & {4{B[0]}};
    assign P1 = A & {4{B[1]}};
    assign P2 = A & {4{B[2]}};
    assign P3 = A & {4{B[3]}};
    
    assign Z[0] = P0[0];
    
    //half adder
    half_adder ha0(.a(P0[1]), .b(P1[0]), .sum(Z[1]), .carry(C0));
    half_adder ha1(.a(P0[2]), .b(P1[1]), .sum(S0), .carry(C1));
    half_adder ha2(.a(P0[3]), .b(P1[2]), .sum(S1), .carry(C2));
    half_adder ha3(.a(C6), .b(S4), .sum(Z[4]), .carry(C9));

    //full adder
    full_adder fa0(.a(P2[0]), .b(S0), .cin(C0), .sum(Z[2]), .cout(C3));
    full_adder fa1(.a(P2[1]), .b(S1), .cin(C1), .sum(S2), .cout(C4));
    full_adder fa2(.a(P2[2]), .b(P1[3]), .cin(C2), .sum(S3), .cout(C5));
    full_adder fa3(.a(P3[0]), .b(S2), .cin(C3), .sum(Z[3]), .cout(C6));
    full_adder fa4(.a(P3[1]), .b(S3), .cin(C4), .sum(S4), .cout(C7));
    full_adder fa5(.a(P2[3]), .b(P3[2]), .cin(C5), .sum(S5), .cout(C8));
    full_adder fa6(.a(S5), .b(C7), .cin(C9), .sum(Z[5]), .cout(C10));
    full_adder fa7(.a(P3[3]), .b(C8), .cin(C10), .sum(Z[6]), .cout(Z[7]));

endmodule
