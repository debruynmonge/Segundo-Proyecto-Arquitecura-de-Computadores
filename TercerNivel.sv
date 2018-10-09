`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 21:05:05
// Design Name: 
// Module Name: TercerNivel
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


module TercerNivel( Hit, Desalojo, D_PUSH, Dato_Salida , DatoEntrada, D_POP,Address, CLK, Lectura_Escritura, Clear_Main_REG,
                    Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Banks, Sel_Mux_Mem, R_W,  Clear_Formador, Eneable_Formador,
                    Bank_Eneable, Write_Eneable, Clear_LDG_REG, Eneable_REG);
input [63:0] DatoEntrada;
input [87:0]D_POP;
input [23:0]Address;
input CLK, Lectura_Escritura, Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Banks, R_W, Clear_Formador, Eneable_Formador;
input Bank_Eneable, Write_Eneable, Clear_LDG_REG, Eneable_REG;
input [1:0]Sel_Mux_Mem;
output Hit, Desalojo;
output [88:0]D_PUSH;
output [7:0]Dato_Salida;


wire [87:0] OMD;  //Output MUXES Data
wire [87:0] OMR; //Output Main REG (63:0) Data..... (87:64) Address


//Multiplexores de 2 a 1

Mux2to1_64 MuxInputData (.O(OMD[63:0]),.A(DatoEntrada),.B(D_POP[63:0]),.SEL(Lectura_Escritura));
Mux2to1_24 MuxInputAddress (.O(OMD[87:64]),.A(Address),.B(D_POP[87:64]),.SEL(Lectura_Escritura));

//Instanciando bancos de registros
BancoRegistros REGBANK (.Q(),.D(OMD),.CLK(CLK),.Reset(Clear_Main_REG));





endmodule



