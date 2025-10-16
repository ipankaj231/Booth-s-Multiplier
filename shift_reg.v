`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2025 22:34:39
// Design Name: 
// Module Name: shift_reg
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


module shift_reg(
       
       input clk, ld, shift, clr,
       input [15:0] d_in,
       input msb,
       output reg[15:0] d_out
    );
       
       always@(posedge clk) begin
          if(clr)
              d_out <= 0;
          else if(ld)
              d_out <= d_in;
          else if(shift)
              d_out <= {msb, d_in[15:1]};
        end
       
endmodule
