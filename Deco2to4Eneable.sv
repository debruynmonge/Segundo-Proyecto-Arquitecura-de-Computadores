`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2018 20:21:33
// Design Name: 
// Module Name: Deco2to4Eneable
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


module Deco2to4Eneable(O,I,Eneable);
input [1:0]I;
input Eneable;
output [3:0]O;

 assign O = (Eneable==1'b1)? 4'b0000:
               (I[0]==1'b1)? 4'b0001:
               (I[1]==1'b1)? 4'b0010:
               (I[2]==1'b1)? 4'b0100:4'b1000;




endmodule
