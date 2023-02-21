`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2022 03:37:32 PM
// Design Name: 
// Module Name: source_control
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


module source_control(
    input clk_s,
    input write_signal,
    input [7:0] din,
    input [2:0] read_pointer,
    output reg [2:0] write_pointer = 3'b000,
    output [7:0] dout,
    output reg data_permission
    );
    
    reg [2:0] ff_status = 0;
    reg full;
    
    assign dout = din;
    always @(posedge clk_s)
    begin
        if (ff_status < 6 && write_signal == 1)
        begin
            //dout <= din;
            write_pointer <= write_pointer + 1;
            data_permission <= 1;
        end
        else
        begin
            write_pointer <= write_pointer;
            data_permission <= 0;
        end
        
        
    end
    
    always @(posedge clk_s)
    begin
        ff_status <= write_pointer - read_pointer;
    end
    
endmodule
