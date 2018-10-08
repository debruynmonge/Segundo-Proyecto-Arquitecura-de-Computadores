`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Jacobo De Bruyn Monge
// Banco de registros parametrizable, con reset asincrono. El banco se reinicia con un 1 en el reset. Guarda en el ciclo positivo del CLOCK
//////////////////////////////////////////////////////////////////////////////////


module BancoRegistros(Q,D,CLK,Reset);
parameter k=12;
input Reset,CLK;
input [k-1:0]D;
output [k-1:0]Q;

generate
    genvar m;
    for(m=0; m<k; m++) begin
        FlipFlopD FFD_m (.Q(Q[m]),.D(D[m]),.CLK(CLK),.Reset(Reset));   
    
    end



endgenerate


endmodule

