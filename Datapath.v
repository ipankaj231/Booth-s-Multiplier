`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2025 22:21:56
// Design Name: 
// Module Name: Datapath
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


module Datapath(
       
       input clk, 
       input ldA, clrA, shiftA, ldQ, clrQ, shiftQ, clr_ff, addsub, ldM, ldcnt, decr,  
       input [15:0] data_in,
       output qm1, eqz, q0
    );
       
       wire [15:0] A,M, Z, Q;
       wire [4:0] count;
       assign eqz = ~&count;
       
       shift_reg AR(
                    .clk(clk), .d_in(Z), .d_out(A), .msb(A[15]), 
                    .ld(ldA), .clr(clrA), .shift(shiftA) 
                  );
       shift_reg QR(
                     .clk(clk), .d_in(data_in), .d_out(Q), .msb(A[0]), 
                     .ld(ldQ), .clr(clrQ), .shift(shiftQ) 
                    );
       d_ff  QM1(
                  .clk(clk), .clr(clr_ff), .d(Q[0]), .q(qm1)
                 );
       
       ALU   AS(
                 .in1(A), .in2(M), .control(addsub), . result(Z)
              );
       
       PIPO MR(
                .clk(clk), .ld(ldM), .in(data_in), .data(M)
              );
       
       counter comp(
                  .clk(clk), .ld(ldcnt), .dec(decr), .out(count)
                );
       
       assign q0 = Q[0];
                                   
endmodule
