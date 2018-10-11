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
                PNDNG,Ejecute,Lectura_Escritura,Hit,Desalojo, CLK);
                
input PNDNG,Ejecute,Lectura_Escritura,Hit,Desalojo, CLK;
output Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
        Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
        Banks_Eneable, R_W, Clear_Formador,Eneable_Formador;

reg Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
                Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
                Banks_Eneable, R_W, Clear_Formador,Eneable_Formador;


//wire [4:0]entradas;
wire [12:0]wsalidas;
reg [12:0]salidas;

//Concatenando entradas y salidas
//assign entradas={PNDNG,Ejecute,Lectura_Escritura,Hit,Desajolo};
assign salidas={Clear_Main_REG, Eneable_Main_REG, Sel_Mux_Bank, Clear_Tag_Bank_REG,
        Sel_Mux_Mem_0, Sel_Mux_Mem_1, Eneable_REG, Clear_LDG_REG, Write_Eneable,
        Banks_Eneable, R_W, Clear_Formador,Eneable_Formador};
 
 
 // Estado inicial 0101100110110
 //Estado Escribir 0000001001100
 //Estado Leer  0000100011100
 //Estado Traer dato de memoria   0100001001100
 // Estado Desalojo 0000010001001
 // Estado Actualizar Etiquetas 1010100001100
 
 parameter INICIAL=13'b0101100110110;
 parameter ESCRIBIR =13'b0000001001100;
 parameter LEER =13'b0000100011100;
 parameter TRAERDATO=13'b0100001001100;
 parameter ACTUALIZAR=13'b1010100001100;
 parameter DESALOJO=13'b0000010001001;
 
 always @(posedge CLK) begin
    if(salidas==INICIAL)begin
        if (Ejecute==0) salidas=INICIAL;
        else begin
            if(Lectura_Escritura==0) salidas=ESCRIBIR;
            else salidas=LEER;
        end
    end
        else begin 
            if(salidas==LEER)begin
                if(Hit==0) salidas=TRAERDATO;
                else salidas=ACTUALIZAR;
            end
            else begin
                if(salidas==TRAERDATO)begin
                    if(PNDNG==0) salidas=TRAERDATO;
                    else salidas=ESCRIBIR;
                end
                else begin
                    if(salidas==ESCRIBIR)begin
                        if(Desalojo==0) salidas=ACTUALIZAR;
                        else salidas=DESALOJO;
                    end
                    else begin
                        if(salidas==Desalojo) salidas=ACTUALIZAR;
                        else salidas=INICIAL;
                    end
                    
                end
            
            end
             
        end
        
      
 
    
    
    

 
 end      
        
assign wsalidas=salidas;
endmodule
