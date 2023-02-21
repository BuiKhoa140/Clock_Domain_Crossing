`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2022 03:37:32 PM
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input [7:0] din,
    input [2:0] write_pointer,
    input [2:0] read_pointer,
    input clk_s,
    input clk_d,
    output reg [7:0] dout
    );
    
    reg [7:0] FIFO [7:0];
    always @(posedge clk_s)
    begin
        FIFO [write_pointer] <= din;
    end

    always @(posedge clk_d)
    begin
        dout <= FIFO [read_pointer];
    end
    
endmodule
