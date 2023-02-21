`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2022 03:37:32 PM
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
    input read_signal,
    input [7:0] din,
    input [2:0] write_pointer,
    output reg [2:0] read_pointer = 0,
    output reg read_permission,
    output [7:0] dout
    );
    
    assign dout = din;
    reg [2:0] ff_status;
    always @(posedge clk_d)
    begin
        if ( ff_status > 1 && read_signal == 1)
        begin
            read_pointer <= read_pointer + 1;
            //dout <= din;
            read_permission <= 1;
        end
        else
            read_permission <= 0;
    end
    
    always @(posedge clk_d)
    begin
        ff_status <= write_pointer - read_pointer;
    end
    
    
endmodule
