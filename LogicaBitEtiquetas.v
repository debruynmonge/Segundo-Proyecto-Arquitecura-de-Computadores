`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2018 15:56:21
// Design Name: 
// Module Name: LogicaBitEtiquetas
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


module LogicaBitEtiquetas(BA_Ultimo,BA_Dirty, BA_Invalid, Uso,Sel_Mux_Mem_0, Sel_Mux_Mem_1, Bit_Invalid, Bit_Ultimo, Bit_Dirty);
input BA_Ultimo, BA_Dirty,BA_Invalid,Uso,Sel_Mux_Mem_0,Sel_Mux_Mem_1;
output Bit_Invalid, Bit_Ultimo, Bit_Dirty;

wire wSA1,wSA3;
wire wOA1,wOA3;
wire wSB3;
wire wAND1,wAND2;
wire wSMM1N; //wire Sel Mux Mem 1 (Negado)



//Logica del bit Ultimo
Mux2to1LogicaBitEtiquetas A1 (.O(wOA1),.A(BA_Ultimo),.B(1'b0),.SEL(wSA1));
Mux2to1LogicaBitEtiquetas B1 (.O(Bit_Ultimo),.A(wOA1),.B(1'b1),.SEL(Uso));
assign wSA1=~Sel_Mux_Mem_0;


//Logica del bit Invalid
Mux2to1LogicaBitEtiquetas A3 (.O(wOA3),.A(BA_Invalid),.B(1'b0),.SEL(wSA3));
Mux2to1LogicaBitEtiquetas B3 (.O(Bit_Invalid),.A(wOA3),.B(1'b1),.SEL(wSB3));
not(wSMM1N,Sel_Mux_Mem_1);
and and1(wSA3,Uso,wSMM1N);
and and2(wSB3,Sel_Mux_Mem_0,Uso);

//Logica del bit Dirty
Mux2to1LogicaBitEtiquetas B2 (.O(Bit_Dirty),.A(BA_Dirty),.B(1'b1),.SEL(wSA3));


endmodule
