`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2018 19:56:08
// Design Name: 
// Module Name: ByteOrLineLogic
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


module ByteOrLineLogic(Bytes,LineOrByte,AddressLine, Data,BankRegData, Clear,CLK, Habilitador_Registros);
input LineOrByte, Clear,CLK,Habilitador_Registros;
input [2:0]AddressLine;
input [63:0]Data,BankRegData;
output [63:0]Bytes;
wire [63:0]ORB; //output Reg Bank
wire [3:0] wSEL1,wSEL2;
wire [7:0]wA,wB;



//Instanciando Decodificador
Deco3inputs(.O(wA),.A(AddressLine),.Eneable(LineOrByte));


assign wB=~wA;

//Instanciando mux habilitador Controlodar de mux bytes
 Mux4_2Inputs muxA (.O(wSEL1),.A(wA[3:0]),.B(wB[3:0]),.SEL(LineOrByte));
 Mux4_2Inputs muxB(.O(wSEL2),.A(wA[7:4]),.B(wB[7:4]),.SEL(LineOrByte));

//Instanciando Banco de registros
REGBANK64B Bank(.Q(ORB),.D(BankRegData),.CLK(CLK),.Reset(Clear), .Eneable(Habilitador_Registros));



//Instanciando Multiplexores de Salida
MuxByte2to1 mux1(.O(Bytes[7:0]),.A(ORB[7:0]),.B(Data[7:0]),.SEL(wSEL1[0]));
MuxByte2to1 mux2(.O(Bytes[15:8]),.A(ORB[15:8]),.B(Data[15:8]),.SEL(wSEL1[1]));
MuxByte2to1 mux3(.O(Bytes[23:16]),.A(ORB[23:16]),.B(Data[23:16]),.SEL(wSEL1[2]));
MuxByte2to1 mux4(.O(Bytes[31:24]),.A(ORB[31:24]),.B(Data[31:24]),.SEL(wSEL1[3]));
MuxByte2to1 mux5(.O(Bytes[39:32]),.A(ORB[39:32]),.B(Data[39:32]),.SEL(wSEL2[0]));
MuxByte2to1 mux6(.O(Bytes[47:40]),.A(ORB[47:40]),.B(Data[47:40]),.SEL(wSEL2[1]));
MuxByte2to1 mux7(.O(Bytes[55:48]),.A(ORB[55:48]),.B(Data[55:48]),.SEL(wSEL2[2]));
MuxByte2to1 mux8(.O(Bytes[63:56]),.A(ORB[63:56]),.B(Data[63:56]),.SEL(wSEL2[3]));




endmodule
