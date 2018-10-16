`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Jacobo De Bruyn Monge
//Multiplexor parametrizable de 2 entradas 
//////////////////////////////////////////////////////////////////////////////////


module Mux2to1_24(O,A,B,SEL);
parameter k=24;
input [k-1:0]A,B;
input SEL;
output [k-1:0]O;
reg [k-1:0]O;

always @(*) begin
    case(SEL)
        1'b0: O=A;
        1'b1: O=B;        
    endcase

end
endmodule
