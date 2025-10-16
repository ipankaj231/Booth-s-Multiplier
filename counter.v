`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2025 23:04:14
// Design Name: 
// Module Name: counter
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


module counter(
       
       input clk, ld, dec,
       output reg [4:0] out
    );
       
       always@(posedge clk)begin
           if(ld)
                out <= 5'b10000;
           else if(dec)
                out = out -1;
        end
endmodule
