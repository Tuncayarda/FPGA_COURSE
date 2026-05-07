`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 03:08:11 AM
// Design Name: 
// Module Name: comparator_4bit_behavioral
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


module comparator_4bit_behavioral(
    input [3:0] a, b,
    output equal, less, greater
    );
    
    reg equal_o, less_o, greater_o;
    
    assign equal = equal_o;
    assign less = less_o;
    assign greater = greater_o;
    
    always@ (a, b) begin
        if (a > b) begin
            equal_o = 1'b0;
            less_o = 1'b0;
            greater_o = 1'b1;
        end
        else if (a < b) begin
            equal_o = 1'b0;
            less_o = 1'b1;
            greater_o = 1'b0;
        end
        else begin
            equal_o = 1'b1;
            less_o = 1'b0;
            greater_o = 1'b0;
        end
    end
    
    
endmodule
