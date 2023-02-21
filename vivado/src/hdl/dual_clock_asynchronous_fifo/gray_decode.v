`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 10:23:57 PM
// Design Name: 
// Module Name: gray_decode
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


module gray_decoder(
    input clk_de,
    input [2:0] din,
    output reg [2:0] dout = 0
    );
    
    always @(posedge clk_de)
    begin
        dout[2] <= din[2];
        dout[1] <= din[2] ^ din[1];
        dout[0] <= (din[2] ^ din[1]) ^ din[0];
    end
    
endmodule
