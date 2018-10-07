`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 16:09:06
// Design Name: 
// Module Name: DeterminaLineaGuardado
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


module DeterminaLineaGuardado(G,Desalojo2,C);
input   [3:0]C;
output  Desalojo2;
output  [1:0]G;

    assign G[0]=C[1]|(C[3] & ~C[0]);
    assign G[1]=(C[2]&~C[1]&~C[0])|(C[3]&~C[0])|(C[3]&C[2]);
    assign Desalojo2= ~C[0]&~C[1]&~C[2]&~C[3];
    
    
    
endmodule
