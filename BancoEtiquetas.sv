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
                      CLK, Sel_Mem_0,Sel_Mem_1,clear, Eneable,Write_Eneable,Sel_Mux_Bank, Sel_Mux_Mem_0, Sel_Mux_Mem_1);
                      
output [13:0]Main_Tag, Tag1,Tag2,Tag3,Tag4;
input [10:0]Input_Tag;
input [9:0] LineNumber;
input CLK,Sel_Mem_0,Sel_Mem_1, clear,Eneable,Write_Eneable,Sel_Mux_Bank, Sel_Mux_Mem_0, Sel_Mux_Mem_1;
    
wire [3:0] wOD, wODN; //Wire Output Deco  (Negado)  
wire [3:0] wCM; //Wire Control muxes
wire [13:0] TagConcatenado;
wire [27:0]ConcaMux1,ConcaMux2, wBancoRegO1, wBancoRegO2;
wire [13:0]ConcaL1,ConcaL2, ConcaL3, ConcaL4;
wire [31:0] wMem1,wMem2;
wire EneableNegado;

wire wInL1, wInL2, wInL3,wInL4;
wire wDirtyL1,wDirtyL2,wDirtyL3,wDirtyL4;
wire wUltimoL1,wUltimoL2,wUltimoL3,wUltimoL4;


//Concatenando Tag
assign TagConcatenado={1'b0,1'b0,1'b1,Input_Tag};

    
//Instancciando decodificador
Deco2to4OutNegwithEneable Deco1 (.Dn(wOD),.Eneable(Eneable),.A({Sel_Mem_1,Sel_Mem_0}));

//Negando las salidas del Deco
assign wODN=~wOD;

//Instanciando Multiplexor conectado a la salida del Deco
Mux2to1TagBank MUX1 (.O(wCM),.A(wOD),.B(wODN),.SEL(Sel_Mux_Bank));



//Instanciando Multiplexores de entrada a los registros
Mux2to1_14b_TagBank2 m14a1(.O(ConcaMux1[13:0]),.A(ConcaL1),.B(TagConcatenado),.SEL(wCM[0]));
Mux2to1_14b_TagBank2 m14a2(.O(ConcaMux1[27:14]),.A(ConcaL2),.B(TagConcatenado),.SEL(wCM[1]));
Mux2to1_14b_TagBank2 m14a3 (.O(ConcaMux2[13:0]),.A(ConcaL3),.B(TagConcatenado),.SEL(wCM[2]));
Mux2to1_14b_TagBank2 m14a4(.O(ConcaMux2[27:14]),.A(ConcaL4),.B(TagConcatenado),.SEL(wCM[3]));

    
//Instanciando  Memorias
XSPRAMLP_2048X32_M8P Mem1 (.Q(wMem1), .D(wBancoRegO1), .A(LineNumber), .CLK(CLK), .CEn(Eneable), .WEn(Write_Eneable), .SL(1'b0), .RDY());
XSPRAMLP_2048X32_M8P Mem2 (.Q(wMem2), .D(wBancoRegO2), .A(LineNumber), .CLK(CLK), .CEn(Eneable), .WEn(Write_Eneable), .SL(1'b0), .RDY());
      
    
    not (EneableNegado,Eneable);
    //Instanciando Registros
BancoReg28b RB1(.Q(wBancoRegO1),.D(ConcaMux1),.CLK(CLK),.Reset(clear), .Eneable( EneableNegado));
BancoReg28b RB2(.Q(wBancoRegO2),.D(ConcaMux2),.CLK(CLK),.Reset(clear), .Eneable( EneableNegado));



//Instanciando Multiplexor de 4 entradas de 14 bits
Mux4to1_TagBank MuxOutput(.O(Main_Tag),.A(wMem1[13:0]),.B(wMem1[27:14]),.C(wMem1[13:0]),.D(wMem2[27:14]),.SEL({Sel_Mem_1,Sel_Mem_0})  );



//Instanciando logica para los bits de las etiquetas
LogicaBitEtiquetas L1 (.Bit_Invalid(wInL1), .Bit_Ultimo(wUltimoL1), .Bit_Dirty(wDirtyL1), .BA_Ultimo(wMem1[11]),.BA_Dirty(wMem1[12]), .BA_Invalid(wMem1[13]), .Uso(wCM[0]),.Sel_Mux_Mem_0(Sel_Mux_Mem_0), .Sel_Mux_Mem_1(Sel_Mux_Mem_1));
LogicaBitEtiquetas L2 (.Bit_Invalid(wInL2), .Bit_Ultimo(wUltimoL2), .Bit_Dirty(wDirtyL2), .BA_Ultimo(wMem1[25]),.BA_Dirty(wMem1[26]), .BA_Invalid(wMem1[27]), .Uso(wCM[1]),.Sel_Mux_Mem_0(Sel_Mux_Mem_0), .Sel_Mux_Mem_1(Sel_Mux_Mem_1));
LogicaBitEtiquetas L3 (.Bit_Invalid(wInL3), .Bit_Ultimo(wUltimoL3), .Bit_Dirty(wDirtyL3), .BA_Ultimo(wMem2[11]),.BA_Dirty(wMem2[12]), .BA_Invalid(wMem2[13]), .Uso(wCM[2]),.Sel_Mux_Mem_0(Sel_Mux_Mem_0), .Sel_Mux_Mem_1(Sel_Mux_Mem_1));
LogicaBitEtiquetas L4 (.Bit_Invalid(wInL4), .Bit_Ultimo(wUltimoL4), .Bit_Dirty(wDirtyL4), .BA_Ultimo(wMem2[25]),.BA_Dirty(wMem2[26]), .BA_Invalid(wMem2[27]), .Uso(wCM[3]),.Sel_Mux_Mem_0(Sel_Mux_Mem_0), .Sel_Mux_Mem_1(Sel_Mux_Mem_1));

//Concatenando las salidas de la logica para los bits de las etiquetas, con las etiquetas
assign ConcaL1={wInL1,wDirtyL1,wUltimoL1,wMem1[10:0]}; 
assign ConcaL2={wInL2,wDirtyL2,wUltimoL2,wMem1[24:14]};
assign ConcaL3={wInL3,wDirtyL3,wUltimoL3,wMem2[10:0]};
assign ConcaL4={wInL4,wDirtyL4,wUltimoL4,wMem2[24:14]};



assign Tag1=ConcaL1; 
assign Tag2=ConcaL2;
assign Tag3=ConcaL3;
assign Tag4=ConcaL4;
    
endmodule
