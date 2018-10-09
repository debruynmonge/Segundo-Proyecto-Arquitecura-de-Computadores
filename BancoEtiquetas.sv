`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2018 10:23:19
// Design Name: 
// Module Name: BancoEtiquetas
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


module BancoEtiquetas(Main_Tag, Tag1,Tag2,Tag3,Tag4, Input_Tag, LineNumber,
                      CLK, Sel_Mem_0,Sel_Mem_1,clear, Eneable,Write_Eneable,Sel_Mux_Bank);
                      
output [13:0]Main_Tag, Tag1,Tag2,Tag3,Tag4;
input [10:0]Input_Tag;
input [9:0] LineNumber;
input CLK,Sel_Mem_0,Sel_Mem_1, clear,Eneable,Write_Eneable,Sel_Mux_Bank;
    
wire [3:0] wOD, wODN; //Wire Output Deco  (Negado)  
wire [3:0] wCM; //Wire Control muxes


    
//Instancciando decodificador
Deco2to4OutNegwithEneable Deco1 (.Dn(wOD),.Eneable(Eneable),.A({Sel_Mem_1,Sel_Mem_0}));

//Negando las salidas del Deco
assign wODN=~wOD;

//Instanciando Multiplexor conectado a la salida del Deco
Mux2to1TagBank MUX1 (.O(wCM),.A(wOD),.B(wODN),.SEL(Sel_Mux_Bank));



//Instanciando Multiplexores de entrada a los registros
Mux2to1_14b_TagBank2 m14a1(.O(),.A(),.B(),.SEL());
Mux2to1_14b_TagBank2 m14a2(.O(),.A(),.B(),.SEL());
Mux2to1_14b_TagBank2 m14a3 (.O(),.A(),.B(),.SEL());
Mux2to1_14b_TagBank2 m14a4(.O(),.A(),.B(),.SEL());

    
//Instanciando  Memorias
XSPRAMLP_2048X32_M8P Mem1 (.Q(), .D(), .A(LineNumber), .CLK(CLK), .CEn(Eneable), .WEn(Write_Eneable), .SL(1'b0), .RDY());
XSPRAMLP_2048X32_M8P Mem2 (.Q(), .D(), .A(LineNumber), .CLK(CLK), .CEn(Eneable), .WEn(Write_Eneable), .SL(1'b0), .RDY());
      
    
    
    //Instanciando Registros
BancoReg28b RB1(.Q(),.D(),.CLK(),.Reset(), .Eneable());
BancoReg28b RB2(.Q(),.D(),.CLK(),.Reset(), .Eneable());



//Instanciando Multiplexor de 4 entradas de 14 bits
Mux4to1_TagBank MuxOutput(.O(),.A(),.B(),.C(),.D(),.SEL()  );
    
endmodule
