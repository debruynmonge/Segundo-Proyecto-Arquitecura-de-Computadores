`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2018 00:34:02
// Design Name: 
// Module Name: Mux8to1
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


module Mux8to1(O,A,B,C,D,E,F,G,H,SEL);
parameter k=1;
input [k-1:0] A,B,C,D,E,F,G,H;
output [k-1:0] O;
input [2:0] SEL;
reg [k-1:0] O;

always @(*)begin
    case(SEL)
    3'b000: O=A;
    3'b001: O=B;
    3'b010: O=C;
    3'b011: O=D;
    3'b100: O=E;
    3'b101: O=F;
    3'b110: O=G;
    3'b111: O=H;
    endcase
end




endmodule
