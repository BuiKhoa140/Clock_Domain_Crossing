`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2022 12:47:12 PM
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
    input data_in,
    input ack,
    output reg request,
    output reg d_out,
    output reg data_permission
    );
    
    reg count = 0;
    always @(posedge clk_s)
    begin
        if (data_permission == 1)
        begin
            data_permission = 0;
            count = 1;
        end
        if (ack == 0)
        begin
            request = 0;
            data_permission = 0;
            count = 0;
        end
        else
        begin
            d_out = data_in;
            request = 1;
            if (count == 0)
                data_permission = 1;
        end
            
    end
endmodule
