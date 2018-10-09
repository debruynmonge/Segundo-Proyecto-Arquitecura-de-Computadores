`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2018 21:25:20
// Design Name: 
// Module Name: Deco3inputs
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


module Deco3inputs(O,A,Eneable);
input Eneable;
input [2:0]A;
output [7:0]O;
reg [7:0]O;

always @(*) begin
    case({Eneable,A})
        4'b0000: O=8'b00000001;
        4'b0001: O=8'b00000010;
        4'b0010: O=8'b00000100;
        4'b0011: O=8'b00001000;
        4'b0100: O=8'b00010000;
        4'b0101: O=8'b00100000;
        4'b0110: O=8'b01000000;
        4'b0111: O=8'b10000000;
        default: O=8'b00000000;
    
    
    
    endcase
    
    
end

endmodule
