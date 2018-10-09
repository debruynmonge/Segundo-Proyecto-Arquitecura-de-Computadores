`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2018 16:02:08
// Design Name: 
// Module Name: Mux2to1LogicaBitEtiquetas
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


module Mux2to1LogicaBitEtiquetas(O,A,B,SEL);
parameter k=1;
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
