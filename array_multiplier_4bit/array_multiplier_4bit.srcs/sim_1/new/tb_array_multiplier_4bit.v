`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 04:38:27 AM
// Design Name: 
// Module Name: tb_array_multiplier_4bit
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


module tb_array_multiplier_4bit();

    reg [3:0] tb_a, tb_b;
    wire [7:0] tb_z;
    
    array_multiplier_4bit dut(
    .A(tb_a),
    .B(tb_b),
    .Z(tb_z)
    );

    initial begin
        repeat (20) begin
        {tb_a, tb_b} = $random;
        #10;
        end
    end
    
    initial #200 $finish;
endmodule
