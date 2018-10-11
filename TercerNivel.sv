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
wire [63:0] wBytes;   //Output Logica Guardado de un byte o una línea
wire [63:0]  wOBD; // Output Banco de datos
wire [1:0] wSel_Mem; // Output final muxes
wire [63:0] wLineData; //Output data bank
wire [10:0]wAdrresLogicHit; // Output Address logic hit or miss
wire [13:0] wTag1,wTag2,wTag3,wTag4,wTagMain;
wire wSel_Mem_0,wSel_Mem_1;
wire [1:0] S;//Output politica de desalojo
wire wdesalojo1,wdesalojo2;
wire [3:0] C;
wire [1:0]G;
wire [1:0]H;
wire [88:0]wD_PUSH;



//Multiplexores de 2 a 1

Mux2to1_64 MuxInputData (.O(OMD[63:0]),.A(DatoEntrada),.B(D_POP[63:0]),.SEL(Lectura_Escritura));
Mux2to1_24 MuxInputAddress (.O(OMD[87:64]),.A(Address),.B(D_POP[87:64]),.SEL(Lectura_Escritura));

//Instanciando bancos de registros
BancoRegistros REGBANK (.Q(OMR),.D(OMD),.CLK(CLK),.Reset(Clear_Main_REG),.Eneable(Eneable_Main_REG));


//Instanciando Lógica Guardado de un Byte o una línea
ByteOrLineLogic(.Bytes(wBytes),.LineOrByte( Lectura_Escritura),.AddressLine(OMR[77:75]), .Data( OMR[63:0]),.BankRegData(wOBD), .Clear(Clear_LDG_REG),.CLK(CLK), .Habilitador_Registros(Eneable_REG));

//Instanciando el banco de datos
BancoDatos Banco1(.LineData(wLineData),.Sel_Mem(wSel_Mem),.Eneable(Bank_Eneable), .Data(wBytes), .Address(wAdrresLogicHit), .WriteEneable(Write_Eneable), .CLK(CLK) );

//Instanciando banco de Etiquetas
BancoEtiquetas(.Main_Tag(wTagMain), .Tag1(wTag1), .Tag2(wTag2), .Tag3(wTag3), .Tag4(wTag4), .Input_Tag(OMR[75:64]), .LineNumber(OMR[78:76]),
                      .CLK(CLK), .Sel_Mem_0(wSel_Mem_0), .Sel_Mem_1(wSel_Mem_1), .clear(Clear_Tag_Banks), .Eneable(Bank_Eneable),
                      .Write_Eneable(Write_Eneable), .Sel_Mux_Bank(Sel_Mux_Bank) ,
                      .Sel_Mux_Mem_0(Sel_Mux_Mem[0]), .Sel_Mux_Mem_1(Sel_Mux_Mem[1]));



//Instanciando logica hit miss
Logicahitmiss (.Hit(Hit),.H(H),.T1(wTag1),.T2(wTag2),.T3(wTag3),.T4(wTag4),
                .Address(OMR[75:64]),.D1(wTag1[13]),.D2(wTag2[13]),.D3(wTag3[13]),.D4(wTag4[13]));


//Instanciando Politica de desalojo
PoliticaDesalojo PDD (.S(S),.B({wTag1[11],wTag2[11],wTag3[11],wTag4[11]}),.D({wTag1[13],wTag2[13],wTag3[13],wTag4[13]})); 


//Instanciando Deteccion de desalojo
//desalojo 1
Desalojo1 Des1 (.desalojo1(wdesalojo1),.A({wTag1[12],wTag2[12],wTag3[12],wTag4[12]}),.D({wTag1[13],wTag2[13],wTag3[13],wTag4[13]}));
//Uniendo ambas señales de desalojo
or ORDesa1(Desalojo,wdesalojo1,wdesalojo2);



//Instanciando Logica de seleccion de lugar para guardar
//Posibles Lineas donde se puede Guardar
PosiblesLineasGuardado (.C(C),.A({wTag1[12],wTag2[12],wTag3[12],wTag4[12]}),
                        .B({wTag1[11],wTag2[11],wTag3[11],wTag4[11]}),
                        .D({wTag1[13],wTag2[13],wTag3[13],wTag4[13]}));
//Determina en cual linea se va a guardar el dato
DeterminaLineaGuardado (.G(G),.Desalojo2(wdesalojo2),.C(C));




//Instanciando registro formador de mensaje
BancoRegistros #(88)(.Q(wD_PUSH),.D({R_W, wTagMain,wLineData}),.CLK(CLK),.Reset(Clear_Formador), .Eneable(Eneable_Formador));
assign wD_PUSH=D_PUSH;

// Instanciando multiplexores 
//Multiplexor al cual entran las salidas de las logicas de guardado
Mux4to1_TagBank  #(2)(.O({wSel_Mem_1,wSel_Mem_0}),.A(G),.B(S),.C(H),.D(2'b00),.SEL(Sel_Mux_Mem) );

// Instanciando multiplexor de 8 entradas
Mux8to1 #(8)(.O(Dato_Salida),.A(wD_PUSH[7:0]),.B(wD_PUSH[15:8]),.C(wD_PUSH[23:16]),
                .D(wD_PUSH[31:24]),.E(wD_PUSH[39:32]),.F(wD_PUSH[47:40]),
                .G(wD_PUSH[55:48]),.H(wD_PUSH[63:56]),.SEL(OMR[76:74]));





endmodule



