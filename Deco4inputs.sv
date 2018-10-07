`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 12:17:14
// Design Name: 
// Module Name: Deco4inputs
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


module Deco4inputs(O,I1,I2,I3,I4
    );
 input I1,I2,I3,I4;
 output [1:0]O;
 assign O = (I1==1'b1)? 2'b00:
                (I2==1'b1)? 2'b01:
                (I3==1'b1)? 2'b10:
                (I4==1'b1)? 2'b11:2'b00;                     
endmodule
