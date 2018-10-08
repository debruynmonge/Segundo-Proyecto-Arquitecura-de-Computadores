`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 15:24:40
// Design Name: 
// Module Name: Politica de Desalojo
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


module PoliticaDesalojo(S,B,D);
output [1:0]S;
input [3:0]B,D;
wire [3:0]F;

assign F[0]=B[0]&~D[0];
assign F[1]=B[1]&~D[1];
assign F[2]=B[2]&~D[2];
assign F[3]=B[3]&~D[3];

assign S[1]=(~F[2]&F[0])|(~F[2]&F[1])|(~F[3]&F[0]);
assign S[0]=(F[2]&F[0])|(F[2]&~F[1]);




endmodule
