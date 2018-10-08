`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jacobo De Bruyn Monge
// Logica que determina la linea donde se va a guardar el dato.
//////////////////////////////////////////////////////////////////////////////////


module DeterminaLineaGuardado(G,Desalojo2,C);
input   [3:0]C;
output  Desalojo2;
output  [1:0]G;

    assign G[0]=C[1]|(C[3] & ~C[0]);
    assign G[1]=(C[2]&~C[1]&~C[0])|(C[3]&~C[0])|(C[3]&C[2]);
    assign Desalojo2= ~C[0]&~C[1]&~C[2]&~C[3];
    
    
    
endmodule
