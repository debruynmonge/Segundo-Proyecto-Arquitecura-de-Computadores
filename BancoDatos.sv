`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 20:42:59
// Design Name: 
// Module Name: BancoDatos
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


module BancoDatos(LineData,Sel_Mem,Eneable, Data,Address,WriteEneable, CLK );
input [63:0] Data;
input [10:0] Address;
input [1:0]Sel_Mem;
input Eneable, WriteEneable,CLK;
output [63:0]LineData;

wire [3:0] wCE; // wire Chip eneable
wire [63:0] BankDataOutputA,BankDataOutputB,BankDataOutputC,BankDataOutputD;   

 
    
    //Instanciar decodificador
    Deco2to4OutNegwithEneable Deco1 (.Dn(wCE),.Eneable(Eneable),.A(Sel_Mem));
    
    
    //Instanciar  Banco 1 Memoria
    XSPRAMLP_2048X32_M8P Mem1 (.Q(BankDataOutputA[31:0]), .D(Data[31:0]), .A(Address), .CLK(CLK), .CEn(wCE[0]), .WEn(WriteEneable), .SL(1'b0), .RDY());
   XSPRAMLP_2048X32_M8P Mem2 (.Q(BankDataOutputA[63:32]), .D(Data[63:32]), .A(Address), .CLK(CLK), .CEn(wCE[0]), .WEn(WriteEneable), .SL(1'b0), .RDY());
   
   
    //Instanciar  Banco 2 Memoria
      XSPRAMLP_2048X32_M8P Mem3 (.Q(BankDataOutputB[31:0]), .D(Data[31:0]), .A(Address), .CLK(CLK), .CEn(wCE[1]), .WEn(WriteEneable), .SL(1'b0), .RDY());
     XSPRAMLP_2048X32_M8P Mem4 (.Q(BankDataOutputB[63:32]), .D(Data[63:32]), .A(Address), .CLK(CLK), .CEn(wCE[1]), .WEn(WriteEneable), .SL(1'b0), .RDY());
     
     
      //Instanciar  Banco 3 Memoria
        XSPRAMLP_2048X32_M8P Mem5 (.Q(BankDataOutputC[31:0]), .D(Data[31:0]), .A(Address), .CLK(CLK), .CEn(wCE[2]), .WEn(WriteEneable), .SL(1'b0), .RDY());
       XSPRAMLP_2048X32_M8P Mem6 (.Q(BankDataOutputC[63:32]), .D(Data[63:32]), .A(Address), .CLK(CLK), .CEn(wCE[2]), .WEn(WriteEneable), .SL(1'b0), .RDY());
       
        //Instanciar  Banco 4 Memoria
          XSPRAMLP_2048X32_M8P Mem7 (.Q(BankDataOutputD[31:0]), .D(Data[31:0]), .A(Address), .CLK(CLK), .CEn(wCE[3]), .WEn(WriteEneable), .SL(1'b0), .RDY());
         XSPRAMLP_2048X32_M8P Mem8 (.Q(BankDataOutputD[63:32]), .D(Data[63:32]), .A(Address), .CLK(CLK), .CEn(wCE[3]), .WEn(WriteEneable), .SL(1'b0), .RDY());
            
   
    //Instanciando Multiplexores
    MUX4to1 Mux1( .O(LineData[31:0]),.A(BankDataOutputA[31:0]),.B(BankDataOutputB[31:0]),.C(BankDataOutputC[31:0]),.D(BankDataOutputD[31:0]),.SEL(Sel_Mem)  );
    MUX4to1 Mux2 ( .O(LineData[63:32]),.A(BankDataOutputA[63:32]),.B(BankDataOutputB[63:32]),.C(BankDataOutputC[63:32]),.D(BankDataOutputD[63:32]),.SEL(Sel_Mem)  );
    
    
       
    
    
endmodule
