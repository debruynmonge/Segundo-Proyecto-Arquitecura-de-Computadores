`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Jacobo De Bruyn Monge
// Prueba para verificar el correcto funcionamiento del controlador de memoria caché
//////////////////////////////////////////////////////////////////////////////////


module TestBench(    );
reg CLK;
reg Ejecute, Lectura_Escritura, Dato_Listo, PNDNG,POP, PUSH;
reg [23:0] Direccion;
reg [7:0] Dato_Entrada, Dato_Salida;
reg [87:0] D_POP;
reg [88:0] D_Push;


//Definiendo Reloj
always begin
CLK=1; 
#5;
CLK=0;
#5;
end

//UUT
SegundoNivel(.Pop(POP), .Push(PUSH), .Dato_Listo(Dato_Listo), .D_Push(D_Push), .Dato_Salida(Dato_Salida), .Ejecute(Ejecute),
            .Lectura_Escritura(Lectura_Escritura), .Direccion(Direccion), .Dato_Entrada(Dato_Entrada), .PNDNG(PNDNG), .D_POP(D_POP),.CLK(CLK));
           
initial begin
Ejecute=1'b0;
end

//Casos
// 1-Escribir Dato en la memoria y se guarda
//2- Escribir Dato en la memoria y hacer desalojo
//3- Buscar Dato en memoria el dato esta el cache
//3- Buscar Dato en memoria el dato no esta en el cache

//Contar dos ciclos para  iniciar
int ciclos=0;
always @(posedge CLK) begin
ciclos++;
case(ciclos)
1:begin
Ejecute=1'b0;
PNDNG=1'b0;
end


//Verificando que guarde datos correctamente


2: begin  // Guardando un dato en memoria
    $display("Guardando Dato 1");
    $display("Dato a guardar: ff");
    Ejecute=1'b1;
    Lectura_Escritura =1'b0;
    Direccion= 24'h000000;
    Dato_Entrada= 8'hff;
    end
3:begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end
4:
begin  // El dato de salida se tuvo que haber guardado
$display( "Dato Listo: " + Dato_Listo + "/n  Dato de Salida: "+ Dato_Salida );
    end
5:
begin  // Guardando un dato en memoria
    $display("Guardando Dato 2");
    $display("Dato a guardar: aa");
    Ejecute=1'b1;
    Lectura_Escritura =1'b0;
    Direccion= 24'h000001;
    Dato_Entrada= 8'haa;
    end
6: begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end
7:begin  // El dato de salida se tuvo que haber guardado
        $display( "Dato Listo: " + Dato_Listo + "/n  Dato de Salida: "+ Dato_Salida );
            end
8:
begin  // Guardando un dato en memoria
    $display("Guardando Dato 3");
    $display("Dato a guardar: bb");
    Ejecute=1'b1;
    Lectura_Escritura =1'b0;
    Direccion= 24'h000002;
    Dato_Entrada= 8'hbb;
    end
9:begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end
            
10:begin  // El dato de salida se tuvo que haber guardado
   $display( "Dato Listo: " + Dato_Listo + "/n  Dato de Salida: "+ Dato_Salida );
   end
   
11:begin  // Guardando un dato en memoria
       $display("Guardando Dato 4");
       $display("Dato a guardar: cc");
       Ejecute=1'b1;
       Lectura_Escritura =1'b0;
       Direccion= 24'h000003;
       Dato_Entrada= 8'hcc;
       end
12: begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end
13:begin  // El dato de salida se tuvo que haber guardado
                      $display( "Dato Listo: " + Dato_Listo + "/n  Dato de Salida: "+ Dato_Salida );
                      end                   
   

//Verificando que pueda hacer un desalojo

14:begin  // Guardando un dato en memoria
       $display("Desalojo");
       $display("Guardando Dato 5");
       $display("Dato a guardar: 33");
       Ejecute=1'b1;
       Lectura_Escritura =1'b0;
       Direccion= 24'h000003;
       Dato_Entrada= 8'h33;
       end
15:begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end
16:begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end
17:begin  // El dato de salida se tuvo que haber guardado
   $display( "Dato Listo: " + Dato_Listo + "/n  Dato de Salida: "+ Dato_Salida );
   end   


//Verificando que pueda leer un dato existente en el cache
18:begin  // Guardando un dato en memoria
       $display("Leyendo Dato existente en cache");
       $display("El dato Leido debe ser: aa");
       Ejecute=1'b1;
       Lectura_Escritura =1'b1;
       Direccion= 24'h000001;
       Dato_Entrada= 8'h55;
       end
19: begin   Ejecute=1'b0;    PNDNG=1'b0; Direccion= 24'h000000;  Dato_Entrada= 8'h88;    end       
20:begin  // El dato de salida se tuvo que haber guardado
   $display( "Dato Listo: " + Dato_Listo + "/n  Dato de Salida: "+ Dato_Salida );
   end   

21:// Verificando que pueda leer un dato que no esta en la cache, sin necesidad de hacer desalojo
    begin $display("Leyendo Dato que no se encuentra en al cache");
    $display("El dato Leido debe ser: aa");
           Ejecute=1'b1;
           Lectura_Escritura =1'b1;
           Direccion= 24'hffffff;
           Dato_Entrada= 8'h33;
          
    end





   
endcase 
end



endmodule