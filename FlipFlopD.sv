`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Jacobo De Bruyn Monge
// FlipFlop tipo D con reset Asincrono, se reinicia con 1 en el reset, Guarda en el flanco positivo del CLOCK, Se deshabilita con un 1.
//////////////////////////////////////////////////////////////////////////////////


module FlipFlopD(Q,D,CLK,Reset,Eneable);
input D,CLK,Reset, Eneable;
output reg Q;
wire wEneable, wCLK;

not (wEneable,Eneable);
and (wCLK,wEneable,CLK);


always @(posedge wCLK, posedge Reset ) begin        //Se reinician poniendo un 1 en el reset
    if(Reset==0) Q=D;
    else Q=1'b0;

end

endmodule
