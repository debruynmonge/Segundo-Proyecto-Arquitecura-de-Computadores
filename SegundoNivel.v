`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2018 16:12:24
// Design Name: 
// Module Name: SegundoNivel
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


module SegundoNivel(Pop, Push, Dato_Listo, D_Push, Dato_Salida, Ejecute, Lectura_Escritura, Direccion, Dato_Entrada, PNDNG, D_POP,CLK);

input Ejecute, Lectura_Escritura;
input [23:0]Direccion;
input [7:0]Dato_Entrada;
input PNDNG;
input [87:0]D_POP;
input CLK;
output Pop, Push, Dato_Listo;
output [88:0] D_Push;
output [7:0] Dato_Salida;

wire wHit,wDesalojo, wLectura_Escritura, wClear_Main_REG,
     wEneable_Main_REG, wSel_Mux_Bank, wClear_Tag_Banks;
wire [1:0] wSel_Mux_Mem;
wire wR_W,  wClear_Formador, wEneable_Formador,
     wBank_Eneable, wWrite_Eneable, wClear_LDG_REG, wEneable_REG;

TercerNivel( .Hit(wHit), .Desalojo(wDesalojo), .D_PUSH(D_Push), .Dato_Salida(Dato_Salida) , .DatoEntrada(Dato_Entrada),
               .D_POP(D_POP), .Address(Direccion), .CLK(CLK), .Lectura_Escritura(wLectura_Escritura), .Clear_Main_REG(wClear_Main_REG),
                    .Eneable_Main_REG(wEneable_Main_REG), .Sel_Mux_Bank(wSel_Mux_Bank), .Clear_Tag_Banks(wClear_Tag_Banks),
                    .Sel_Mux_Mem(wSel_Mux_Mem), .R_W(wR_W),  .Clear_Formador(wClear_Formador), .Eneable_Formador(wEneable_Formador),
                    .Bank_Eneable(wBank_Eneable), .Write_Eneable(wWrite_Eneable), .Clear_LDG_REG(wClear_LDG_REG), .Eneable_REG(wEneable_REG));


Control(.Clear_Main_REG(wClear_Main_REG), .Eneable_Main_REG(wEneable_Main_REG), .Sel_Mux_Bank(wSel_Mux_Bank),
        .Clear_Tag_Bank_REG(wClear_Tag_Banks), .Sel_Mux_Mem_0(wSel_Mux_Mem[0]), .Sel_Mux_Mem_1(wSel_Mux_Mem[1]),
        .Eneable_REG(wEneable_REG), .Clear_LDG_REG(wClear_LDG_REG), .Write_Eneable(wWrite_Eneable),
        .Banks_Eneable(wBank_Eneable), .R_W(wR_W), .Clear_Formador(wClear_Formador), .Eneable_Formador(wEneable_Formador),
        .PNDNG(PNDNG),.Ejecute(Ejecute),.Lectura_Escritura(Lectura_Escritura),.Hit(wHit),.Desajolo(wDesalojo), .CLK(CLK));




endmodule
