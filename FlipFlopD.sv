`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Jacobo De Bruyn Monge
// FlipFlop tipo D con reset Asincrono, se reinicia con 1 en el reset, Guarda en el flanco positivo del CLOCK
//////////////////////////////////////////////////////////////////////////////////


module FlipFlopD(Q,D,CLK,Reset);
input D,CLK,Reset;
output reg Q;

always @(posedge CLK, posedge Reset ) begin        //Se reinician poniendo un 1 en el reset
    if(Reset==0) Q=D;
    else Q=1'b0;

end

endmodule
