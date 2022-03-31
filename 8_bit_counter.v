`timescale 1ns / 1ps
module eight_bit_counter(
     input clk,
    output A,B,C,D,E,F,G,
    output [7:0] AN
    );
    reg [3:0]disp;
    reg [31:0] counter;
    always @ (posedge clk)
    begin
        if(counter == 100_000_000)
            begin
                counter<=0;
                if(disp == 10)
                    begin
                        disp<=0;   
                    end
                else
                    begin 
                        disp<=disp+1;
                    end           
            end
          
        else
            begin
                counter<=counter+1;
                
            end          
    end 
seven_segment u1(
    .bcd(disp),
    .AN(an),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .F(F),
    .G(G)
    );
endmodule

module seven_segment(
    input [4:0] bcd,
    output A,B,C,D,E,F,G,
    output [7:0] AN
    );
    reg [2:0] data;
    reg a,b,c,d,e,f,g;
    always @(*)
    begin
    case (data)
        0:begin
          a=1;
          b=1;
          c=1;
          d=1;
          e=1;
          f=1;
          g=0;
          end  
        1:begin
          a=0;
          b=1;
          c=1;
          d=0;
          e=0;
          f=0;
          g=0;
          end
       2:begin
          a=1;
          b=1;
          c=0;
          d=1;
          e=1;
          f=0;
          g=1;
          end  
        3:begin
          a=1;
          b=1;
          c=1;
          d=1;
          e=0;
          f=0;
          g=1;
          end 
        4:begin
          a=0;
          b=1;
          c=1;
          d=0;
          e=0;
          f=1;
          g=1;
          end
        5:begin
          a=1;
          b=0;
          c=1;
          d=1;
          e=0;
          f=1;
          g=0;
          end 
        6:begin
          a=0;
          b=0;
          c=1;
          d=1;
          e=1;
          f=1;
          g=0;
          end
        7:begin
          a=1;
          b=1;
          c=1;
          d=0;
          e=0;
          f=0;
          g=0;
          end 
        8:begin
          a=1;
          b=1;
          c=1;
          d=1;
          e=1;
          f=1;
          g=1;
          end
        9:begin
          a=1;
          b=1;
          c=1;
          d=0;
          e=0;
          f=1;
          g=1;
          end     
    endcase
    end
    assign AN=8'b1;
    assign A=~a; 
    assign B=~b;
    assign C=~c;
    assign D=~d;
    assign E=~e;
    assign F=~f;
    assign G=~g;  
endmodule   
