`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2025 23:32:18
// Design Name: 
// Module Name: Control_path
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


module Control_path(
       
       input clk, start, 
       input eqz, qm1, q0,
       output reg ldA, clrA, shiftA, ldQ, clrQ, shiftQ, clr_ff, addsub, ldM, ldcnt, decr,done
    );
       
       reg[2:0] state;
       parameter s0 = 3'b000, s1 = 3'b001, s2=3'b010, s3= 3'b011, s4=3'b100, s5=3'b101, s6=3'b110;
       
       always@(posedge clk)begin
         case(state)
           s0: begin
                if(start)
                   state<=s1;
                else
                    state<=s0;
               end
           s1: state <= s2;
           s2:  begin
                    if({q0,qm1}==2'b01)
                       state <= s3;
                    else if({q0,qm1} == 2'b10)
                       state <= s4;
                    else 
                       state <= s5;
                 end
           s3: state <= s5;
           s4: state <= s5;
           s5: begin
                    if((({q0,qm1})==2'b01) && !eqz)
                        state<= s3;
                    else if((({q0,qm1})==2'b10) && !eqz)
                        state <= s4;
                    else if(eqz)  
                        state <= s6;
               end
           s6: state <= s6;
           default: state <= s0;
         endcase
      end
      
      always@(*)begin
        case(state)
           s0: begin
                clrA=0; ldA=0; shiftA=0; clrQ=0; ldQ=0; 
                shiftQ=0; ldM=0; clr_ff=0; done=0;
              end
           s1: begin
                   clrA=1; clr_ff=1; ldcnt =1; ldM=1;
               end
           s2: begin
                    clrA=0; clr_ff=0; ldcnt=0; ldM=0; 
                    ldQ=1;
                end
           s3: begin
                    ldA=1; addsub =1; ldQ=0; shiftA=0;
                    shiftQ=0; decr=0;
               end
           s4:  begin
                    ldA=1; addsub=0; ldQ=0; shiftA=0;
                    shiftQ=0; decr=0;
                end
           s5: begin
                    shiftA=1; shiftQ=1; ldQ=0; decr =1;
                    ldA=0;
               end
           s6:   done =1;
               
           default: begin
                         clrA=0; shiftA=0; ldQ=0;shiftQ=0;
                     end
                    
         endcase
       end
endmodule
