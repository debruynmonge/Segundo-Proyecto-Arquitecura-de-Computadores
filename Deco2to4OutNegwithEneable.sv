`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jacobo De Bruyn Monge
// Decodificador de 2 entradas y 4 salidas, las salidas son negadas, y contiene un eneable
//////////////////////////////////////////////////////////////////////////////////


module Deco2to4OutNegwithEneable(Dn,Eneable,A);
input Eneable;
input [1:0] A;
output [3:0]Dn;
reg [3:0]Dn;

always @(Eneable,A) begin
    case({Eneable,A})
        3'b000: Dn=4'b1110;
        2'b001: Dn=4'b1101;
        2'b010: Dn=4'b1011;
        2'b011: Dn=4'b0111;
        default: Dn=4'b1111;
    
    endcase


end



endmodule
