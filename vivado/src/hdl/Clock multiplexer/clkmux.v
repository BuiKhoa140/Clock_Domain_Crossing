`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 08:08:25 AM
// Design Name: 
// Module Name: clkmux
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


module clkmux(
    input in_1,
    input in_2,
    input sel,
    output reg out
    );
    
    reg change = 0, enable = 1;
    reg clk;
    reg check = 0;
    
    always @(in_1 or in_2 or sel)
    begin
        case (check)
            1'b0: 
            begin 
                out <= in_1;  
//                if (change == 1)
//                begin
//                    enable = 0;
//                end
                change = 0;
                
//                if (enable == 0)
//                    out = 0;
//                else out = in_1;
            end
            1'b1: 
            begin 
                out <= in_2;
//                if (change == 0)
//                begin
//                    enable = 0; 
//                end
                change = 1; 
                        
//                if (enable == 0)
//                    out = 0;
//                else out = in_2;
            end
        endcase
    end
    always @(posedge out)
    begin
        check = sel;
        if (change == 0 && check == 1)
            out = 0;
        if (change == 1 && check == 0)
            out = 0;
            
    end
endmodule
