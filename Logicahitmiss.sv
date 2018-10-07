`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2018 11:38:49
// Design Name: 
// Module Name: Logicahitmiss
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


module Logicahitmiss(Hit,H,T1,T2,T3,T4,Address,D1,D2,D3,D4);
parameter k=12;
input [k-1:0] T1,T2,T3,T4,Address;
input D1,D2,D3,D4;
output Hit;
output [1:0]H;
wire [k-1:0]x1,x2,x3,x4;
wire a1,a2,a3,a4;
wire [(k/2)-1:0] AAA1,AAA2,AAA3,AAA4;
wire [(k/4)-1:0] AA1,AA2,AA3,AA4;

    assign x1[k-1:0]=T1[k-1:0]^~Address[k-1:0];
    assign x2[k-1:0]=T2[k-1:0]^~Address[k-1:0];
    assign x3[k-1:0]=T3[k-1:0]^~Address[k-1:0];
    assign x4[k-1:0]=T4[k-1:0]^~Address[k-1:0];
    
   //Creando multiples ands
    generate
    genvar j;
    genvar f;
    
        for (j=0; j<=k ;j=j+2) begin
            if (j==0)begin
                assign AAA1[0]= x1[j] & x1[j+1];
                assign AAA2[0]=x2[j] & x2[j+1];
                assign AAA3[0]=x3[j] & x3[j+1];
                assign AAA4[0]=x4[j] & x4[j+1];
            end
            else begin
                assign AAA1[j/2]= x1[j] & x1[j+1];
                assign AAA2[j/2]=x2[j] & x2[j+1];
                assign AAA3[j/2]=x3[j] & x3[j+1];
                assign AAA4[j/2]=x4[j] & x4[j+1];         
            end
            
        end
        
        for(f=0;f<=(k/2);f=f+2) begin
            if (j==0) begin
                assign AA1[0]= AAA1[f] & AAA1[f+1];
                assign AA2[0]= AAA2[f] & AAA2[f+1];
                assign AA3[0]= AAA3[f] & AAA3[f+1];
                assign AA4[0]= AAA4[f] & AAA4[f+1];
               end
               
                else begin
                    assign AA1[f/2]= AAA1[f] & AAA1[f+1];
                    assign AA2[f/2]= AAA2[f] & AAA2[f+1];
                    assign AA3[f/2]= AAA3[f] & AAA3[f+1];
                    assign AA4[f/2]= AAA4[f] & AAA4[f+1];
                end
        end
        
        
    endgenerate
    
     assign a1= AA1[0] & AA1[1] & AA1[2] & ~D1;
     assign a2= AA2[0] & AA2[1] & AA2[2] & ~D2;
     assign a3= AA3[0] & AA3[1] & AA3[2] & ~D3;
     assign a4= AA4[0] & AA4[1] & AA4[2] & ~D4;
     
 
 
    
   //assign a1j= x1[k-1:0] & ~D1;
    //        assign a2j=x2[k-1:0] & ~D2;
      //      assign a3j=x3[k-1:0] & ~D3;
        //    assign a4j=x4[k-1:0] & ~D4;
    
    
    
    
    
    or or1(Hit,a1,a2,a3,a4);
    
    
    // Creando decodificador
   Deco4inputs deco1(.O(H),.I1(a1),.I2(a2),.I3(a3),.I4(a4));
    
 
    
         
           

endmodule
