`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2022 03:37:32 PM
// Design Name: 
// Module Name: gray_encoder
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


module gray_encoder(
    input clk_en,
    input [2:0] din,
    output reg [2:0] dout = 0
    );
    
    always @(posedge clk_en)
    begin
        dout[2] <= din[2];
        dout[1] <= din[2] ^ din[1];
        dout[0] <= din[1] ^ din[0];
    end
endmodule
