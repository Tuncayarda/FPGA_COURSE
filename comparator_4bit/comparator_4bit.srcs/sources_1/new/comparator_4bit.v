`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 03:43:29 AM
// Design Name: 
// Module Name: comparator_4bit
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


module comparator_4bit(
    input [3:0] a, b,
    output equal, less, greater
    );
    
    wire E0, E1, E2, E3;
    wire L0, L1, L2, L3;
    wire G0, G1, G2, G3;
    
    comparator_1bit bit0(
        .a(a[0]), .b(b[0]),
        .equal(E0), .less(L0), .greater(G0)
    );
    
    comparator_1bit bit1(
        .a(a[1]), .b(b[1]),
        .equal(E1), .less(L1), .greater(G1)
    );
    
    comparator_1bit bit2(
        .a(a[2]), .b(b[2]),
        .equal(E2), .less(L2), .greater(G2)
    );
    
    comparator_1bit bit3(
        .a(a[3]), .b(b[3]),
        .equal(E3), .less(L3), .greater(G3)
    );
    
    assign equal = E0 & E1 & E2 & E3;
    assign less = L3 | (E3 & L2) | (E3 & E2 & L1) | (E3 & E2 & E1 & L0);
    assign greater = G3 | (E3 & G2) | (E3 & E2 & G1) | (E3 & E2 & E1 & G0); 
    
endmodule
