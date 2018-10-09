`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2018 20:06:41
// Design Name: 
// Module Name: REGBANK64B
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


module REGBANK64B(Q,D,CLK,Reset, Eneable);
parameter k=64;
input Reset,CLK, Eneable;
input [k-1:0]D;
output [k-1:0]Q;

generate
    genvar m;
    for(m=0; m<k; m++) begin
        FlipFlopD FFD_m (.Q(Q[m]),.D(D[m]),.CLK(CLK),.Reset(Reset),.Eneable(Eneable));   
    
    end



endgenerate

endmodule
