`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2025 00:13:14
// Design Name: 
// Module Name: top_module
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


module top_module(
       
       input clk, start,
       input [15:0] data_in,
       output done
    );
       wire ldA, clrA, shiftA, ldQ, clrQ, shiftQ, clr_ff, addsub, ldM, ldcnt, decr,eqz, qm1,q0;
       
       
       Datapath DP(
                   .clk(clk),
                   .ldA(ldA),
                   .clrA(clrA),
                   .shiftA(shiftA),
                   .ldQ(ldQ),
                   .clrQ(clrQ),
                   .shiftQ(shiftQ),
                   .clr_ff(clr_ff),
                   .addsub(addsub),
                   .ldM(ldM),
                   .ldcnt(ldcnt),
                   .decr(decr),
                   .data_in(data_in),
                   .eqz(eqz),
                   .qm1(qm1),
                   .q0(q0)
                );
       Control_path CP(
                      .clk(clk),
                      .start(start),
                      .eqz(eqz),
                      .qm1(qm1),
                      .q0(q0),
                      .ldA(ldA),
                      .clrA(clrA),
                      .shiftA(shiftA),
                      .ldQ(ldQ),
                      .clrQ(clrQ),
                      .shiftQ(shiftQ),
                      .ldM(ldM),
                      .clr_ff(clr_ff),
                      .addsub(addsub),
                      .decr(decr),
                      .ldcnt(ldcnt),
                      .done(done)
              );
                   
endmodule
