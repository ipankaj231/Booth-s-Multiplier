`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2025 22:47:42
// Design Name: 
// Module Name: ALU
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


module ALU(
       
       input [15:0] in1, in2,
       input control,
       output reg[15:0] result
    );
       always@(*)begin
          if(control == 0)
             result = in1 - in2;
          else 
             result = in1 + in2;
       end
endmodule
