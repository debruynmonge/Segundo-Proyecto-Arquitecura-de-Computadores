`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jacobo De Bruyn Monge
// Logica para detectar el primer desalojo 
//////////////////////////////////////////////////////////////////////////////////


module Desalojo1(desalojo1,A,D);
input [3:0]A,D;
output desalojo1;

assign desalojo1=(A[0]&~D[0]) & (A[1]&~D[1]) & (A[2]&~D[2]) & (A[3]&~D[3]);


endmodule
