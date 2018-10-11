`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2018 16:11:31
// Design Name: 
// Module Name: Control
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


module Control(Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
        Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
        Banks_Eneable, R_W, Clear_Formador,Eneable_Formador,
                PNDNG,Ejecute,Lectura_Escritura,Hit,Desajolo, CLK);
                
input PNDNG,Ejecute,Lectura_Escritura,Hit,Desajolo, CLK;
output Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
        Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
        Banks_Eneable, R_W, Clear_Formador,Eneable_Formador;

reg Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
                Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
                Banks_Eneable, R_W, Clear_Formador,Eneable_Formador;


wire [4:0]entradas;
wire [12:0]salidas;

//Concatenando entradas y salidas
assign entradas={PNDNG,Ejecute,Lectura_Escritura,Hit,Desajolo};
assign salidas={Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
        Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
        Banks_Eneable, R_W, Clear_Formador,Eneable_Formador};
        
 always @(posedge CLK) begin
    case({entradas,salidas})
        default: ;
    
    
    
    endcase
 
 
 end      
        

endmodule
