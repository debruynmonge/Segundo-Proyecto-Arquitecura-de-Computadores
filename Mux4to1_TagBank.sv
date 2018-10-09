`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2018 15:52:30
// Design Name: 
// Module Name: Mux4to1_TagBank
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


module Mux4to1_TagBank(O,A,B,C,D,SEL  );
parameter k=32;  //Determina cuantos la cantidad de mux que quir
input [k-1:0] A,B,C,D;
input [1:0]SEL;
output [k-1:0]O;
reg [k-1:0]O;

always @ (*) begin
    case(SEL)
        2'b00:  O=A;
        2'b01:  O=B;
        2'b10:  O=C;
        2'b11:  O=D;
    endcase
end
endmodule
