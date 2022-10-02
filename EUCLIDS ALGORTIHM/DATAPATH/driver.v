module gcd_datapath(
    input clk,
    input ld,
    input rst,
    input  [15:0] a,
    input [15:0] b,
    input comp,
    input alu,
    input b_sel,
    input a_sel,
    input out_en,
    output reg [15:0] ans,
    output a_eq_b,
    output a_lt_b,
    output a_gt_b
    );
    reg aeb=0,agb=0,alb=0;
    reg [15:0] sta,stb,asubb,bsuba,fans;
    
      
   // always@(posedge clk)
   initial
    begin
   // if(ld)
  //  begin
    sta<=a;
    stb<=b;
  //  end
    end

    always@(posedge clk)
    begin
    if(comp)
    begin
    if(sta==stb)
    begin
      aeb<=1;
      agb<=0;
      alb<=0;
    end  
    if(sta>stb)
     begin
      aeb<=0;
      agb<=1;
      alb<=0;
    end  
    if(stb>sta)
      begin
      aeb<=0;
      agb<=0;
      alb<=1;
    end  
    end
    //end
    
    //always@(posedge clk)
   // begin
    if(alu)
    begin
    asubb<=sta-stb;
    bsuba<=stb-sta;
    end
  //  end
    
   // always@(posedge clk)
   // begin
    if(out_en)
    ans<=sta;
  //  end
    
  //  always@(posedge clk)
  //  begin
    if(a_sel) 
    sta<=asubb;
   // end
    
   // always@(posedge clk)
   // begin
    if(b_sel)
    stb<=bsuba;
    end
    assign a_eq_b=aeb;
    assign a_lt_b=alb;
    assign a_gt_b=agb;
    
endmodule
