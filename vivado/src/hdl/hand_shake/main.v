`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2022 12:47:12 PM
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
    input clk_d,
    input clk_s,
    input data_in,
    output data_out,
    output data_permission
    );
    
    wire ack, rein_ff, reout_ff, din_ff, dout_ff, ackin_ff, ackout_ff;
    
    source_control a(
        .clk_s(clk_s),
        .data_in(data_in),
        .ack(ackout_ff),
        .request(rein_ff),
        .d_out(din_ff),
        .data_permission(data_permission)
        );
    dual_ff b(
        .clk_ff(clk_d),
        .D(din_ff),
        .Q(dout_ff)
        );
    dual_ff c(
        .clk_ff(clk_d),
        .D(rein_ff),
        .Q(reout_ff)
        );
    destination_control d(
        .clk_d(clk_d),
        .d_in(dout_ff),
        .request(reout_ff),
        .ack(ackin_ff),
        .data_out(data_out)
        );
    dual_ff e(
        .clk_ff(clk_s),
        .D(ackin_ff),
        .Q(ackout_ff)
        );
        
endmodule
