`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jacobo De Bruyn Monge
// Decodificador de 4 a 2, el cual le da prioridad al bit menos significativo en caso de que se activen varios a la vez
//I1 es el LSB
//I4 es el MSB 
//////////////////////////////////////////////////////////////////////////////////


module Deco4inputs(O,I1,I2,I3,I4);
 input I1,I2,I3,I4;
 output [1:0]O;
 assign O = (I1==1'b1)? 2'b00:
                (I2==1'b1)? 2'b01:
                (I3==1'b1)? 2'b10:
                (I4==1'b1)? 2'b11:2'b00;                     
endmodule
