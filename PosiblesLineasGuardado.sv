`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jacobo De Bruyn Monge
//Logica para determinar en cuales lineas es posible almacenar el dato 
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
