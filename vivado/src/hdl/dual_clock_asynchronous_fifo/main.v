`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2022 03:37:32 PM
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
    input write_signal,
    input read_signal,
    input [7:0] data_in,
    input clk_s,
    input clk_d,
    output data_permission,
    output read_permission,
    output [7:0] data_out
);
    
    wire [7:0] din_FF; 
    wire [7:0] dout_FF;
    
    wire [2:0] wpin;
    wire [2:0] out_ff;
    wire [2:0] in_ff;
    wire [2:0] rpin;
    wire [2:0] wpout_en;
    wire [2:0] wpout_ff;
    wire [2:0] wpout_de;
    wire [2:0] rpout_en;
    wire [2:0] rpout_ff;
    wire [2:0] rpout_de;
    
    FIFO _FIFO(
        .din            (din_FF),
        .write_pointer  (out_ff),
        .read_pointer   (rpin),
        .dout           (dout_FF),
        .clk_s          (clk_s),
        .clk_d          (clk_d)
    );
    
    D_ff _D_ff(
        .D(wpin),
        .clk(clk_s),
        .Q(out_ff)
    );
    
    source_control _source_control(
        .write_signal       (write_signal),
        .clk_s              (clk_s),
        .din                (data_in),
        .read_pointer       (rpout_de),//rpout_de
        .write_pointer      (wpin),
        .dout               (din_FF),
        .data_permission    (data_permission)
    );
    
    gray_encoder _gray_encoder_src_des(
        .clk_en     (clk_s),
        .din        (wpin),
        .dout       (wpout_en)
    );
    
    dual_ff _dual_ff_src_des_0(
        .clk_ff     (clk_d),
        .D          (wpout_en[0]),
        .Q          (wpout_ff[0])
    );
    dual_ff _dual_ff_src_des_1(
        .clk_ff     (clk_d),
        .D          (wpout_en[1]),
        .Q          (wpout_ff[1])
    );
    dual_ff _dual_ff_src_des_2(
        .clk_ff     (clk_d),
        .D          (wpout_en[2]),
        .Q          (wpout_ff[2])
    );
    
    gray_decoder _gray_decoder_src_des(
        .clk_de     (clk_d),
        .din        (wpout_ff),
        .dout       (wpout_de)
    );
    
    destination_control _destination_control(
        .clk_d              (clk_d),
        .din                (dout_FF),
        .write_pointer      (wpout_de),
        .read_pointer       (rpin),
        .dout               (data_out),
        .read_signal        (read_signal),
        .read_permission    (read_permission)
    );
    
    gray_encoder _gray_encoder_des_src(
        .clk_en             (clk_d),
        .din                (rpin),
        .dout               (rpout_en)
    );
    
    dual_ff _dual_ff_des_src_0(
        .clk_ff             (clk_s),
        .D                  (rpout_en[0]),
        .Q                  (rpout_ff[0])
    );
    dual_ff _dual_ff_des_src_1(
        .clk_ff     (clk_s),
        .D          (rpout_en[1]),
        .Q          (rpout_ff[1])
    );
    dual_ff _dual_ff__des_src_2(
        .clk_ff     (clk_s),
        .D          (rpout_en[2]),
        .Q          (rpout_ff[2])
    );
   
    gray_decoder _gray_decoder_des_src(
        .clk_de     (clk_s),
        .din        (rpout_ff),
        .dout       (rpout_de)
    );
endmodule
