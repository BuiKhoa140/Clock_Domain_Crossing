`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2022 12:47:12 PM
// Design Name: 
// Module Name: destination_control
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


module destination_control(
    input clk_d,
    input d_in,
    input request,
    output reg ack,
    output reg data_out
    );
    
    always @(posedge clk_d)
    begin
        if (request == 1)
        begin
            data_out = d_in;
            ack = 1;
        end
        else
            ack = 0;
    end
    
endmodule
