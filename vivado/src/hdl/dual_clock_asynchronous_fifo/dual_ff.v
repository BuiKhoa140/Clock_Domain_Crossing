`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2022 03:37:32 PM
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
    output reg Q = 0
    );
    
    always @(posedge clk_ff)
    begin
        Q <= D;
    end
endmodule

module dual_ff(
    input clk_ff,
    input D,
    output Q
    );
    
    wire dff;
    
    ff _ff1(
        .clk_ff(clk_ff),
        .D(D),
        .Q(dff)
    );
    ff _ff2(
        .clk_ff(clk_ff),
        .D(dff),
        .Q(Q)
    );
    
endmodule
