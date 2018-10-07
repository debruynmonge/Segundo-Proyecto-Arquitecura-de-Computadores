`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 15:45:36
// Design Name: 
// Module Name: PosiblesLineasGuardado
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


module PosiblesLineasGuardado(C,A,B,D);
input [3:0] A,B,D;
output [3:0]C;
wire [3:0]wa;

    assign wa[0]=~A[0]&~B[0];
    assign wa[1]=~A[1]&~B[1];
    assign wa[2]=~A[2]&~B[2];
    assign wa[3]=~A[3]&~B[3];
    
    
    assign C[0]= wa[0]|D[0];
    assign C[1]=wa[1]|D[1];
    assign C[2]=wa[2]|D[2];
    assign C[3]=wa[3]|D[3];



endmodule
