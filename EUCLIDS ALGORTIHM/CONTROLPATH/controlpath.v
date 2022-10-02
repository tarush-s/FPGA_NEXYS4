module gcd_controlpath(
    input clk,
    input rst,
    input go,
    output reg ld,
    output reg comp,
    output reg alu,
    output reg b_sel,
    output reg a_sel,
    output reg ans_en,
    output reg done,
    input a_eq_b,
    input a_lt_b,
    input a_gt_b
    );
    
    reg [2:0] nstate,cstate=0;
    parameter s0=0;
    parameter s1=1;
    parameter s2=2;
    parameter s3=3;
    parameter s4=4;
    parameter s5=5;
    parameter s6=6;
    
    always@(posedge clk)
    begin 
    if(rst)
    cstate<=s0;
    else
    cstate<=nstate;
    end
    
    always@(posedge clk)
    begin 
    case(cstate)
    s0: begin
        if(go)
        nstate<=s1;
        else
        nstate<=s0;
        end
    s1:nstate<=s2;  //start loading 
    s2:nstate<=s3;  // compare 
    s3:begin        //alu is enabled
       if(a_eq_b)
       nstate<=s6;
       else if(a_gt_b)
       nstate<=s5;
       else
       nstate<=s4;
       end
     s4:nstate<=s2;
     s5:nstate<=s2;
     s6:nstate<=s0;
     default:nstate<=s0;
     endcase
     end
     
        
    always@(posedge clk)
    begin 
    case(cstate)
    s0: begin
        ld<=0;
        comp<=0;
        alu<=0;
        b_sel<=0;
        a_sel<=0;
        ans_en<=0;
        done<=0;
        end
    s1: begin
        comp<=0;
        ld<=1;
        alu<=0;
        b_sel<=0;
        a_sel<=0;
        ans_en<=0;
        done<=0;
        end
    s2: begin
        ld<=0;
        comp<=1;
        alu<=0;
        b_sel<=0;
        a_sel<=0;
        ans_en<=0;
        done<=0;
        end
    s3: begin
        ld<=0;
        comp<=0;
        alu<=1;
        b_sel<=0;
        a_sel<=0;
        ans_en<=0;
        done<=0;
       end
     s4: begin
        ld<=0;
        comp<=0;
        alu<=0;
        b_sel<=1;
        a_sel<=0;
        ans_en<=0;
        done<=0;
        end
     s5: begin
         ld<=0;
        comp<=0;
        alu<=0;
        b_sel<=0;
        a_sel<=1;
        ans_en<=0;
        done<=0;
        end
     s6: begin
        ld<=0;
        comp<=0;
        alu<=0;
        b_sel<=0;
        a_sel<=0;
        ans_en<=1;
        done<=1;
        end
     default: begin
        ld<=0;
        comp<=0;
        alu<=0;
        b_sel<=0;
        a_sel<=0;
        ans_en<=0;
        done<=0;
        end
     endcase
     end    
                    
endmodule
