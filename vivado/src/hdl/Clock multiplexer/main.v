`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 08:06:30 AM
// Design Name: 
// Module Name: main
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


module main(
    input clk_1,
    input clk_2,
    input sel,
    input en,
    output clk_out
    );
    
    wire w_out, ff_out;
    
    clkmux a(
        .in_1(clk_1),
        .in_2(clk_2),
        .sel(sel),
        .out(w_out)
    );
    
    ff c(
        .D(en),
        .clk(w_out),
        .Q(ff_out)
    );
    
    andgate b(
        .in1(w_out),
        .in2(ff_out),
        .out(clk_out)
    );
endmodule
