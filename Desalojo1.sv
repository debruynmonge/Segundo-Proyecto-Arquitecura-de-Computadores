`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 16:23:16
// Design Name: 
// Module Name: Desalojo1
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


module Desalojo1(desalojo1,A,D);
input [3:0]A,D;
output desalojo1;

assign desalojo1=(A[0]&~D[0]) & (A[1]&~D[1]) & (A[2]&~D[2]) & (A[3]&~D[3]);


endmodule
