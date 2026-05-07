`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 03:15:25 AM
// Design Name: 
// Module Name: tb_comparator_4bit_behavioral
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


module tb_comparator_4bit_behavioral();

    reg [3:0] tb_a, tb_b;
    wire tb_equal, tb_less, tb_greater;
    
    comparator_4bit_behavioral dut(
    .a(tb_a),
    .b(tb_b),
    .equal(tb_equal),
    .less(tb_less),
    .greater(tb_greater)
    );
    
    initial begin
        repeat (20) begin
        tb_a = $random;
        tb_b = $random;
        #10;
        end;
    end
    
    initial #200 $finish;
endmodule
