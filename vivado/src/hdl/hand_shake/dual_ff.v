`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2022 12:47:12 PM
// Design Name: 
// Module Name: dual_ff
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

module ff (
    input clk_ff,
    input D,
    output reg Q
    );
    
    always @(posedge clk_ff)
        Q = D;
endmodule

module dual_ff(
    input clk_ff,
    input D,
    output Q
    );
    wire D_ff;
    ff f(
        .clk_ff (clk_ff),
        .D (D),
        .Q (D_ff)
    );
    ff g(
        .clk_ff (clk_ff),
        .D (D_ff),
        .Q (Q)
    );
endmodule
