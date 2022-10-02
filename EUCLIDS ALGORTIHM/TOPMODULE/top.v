module gcd(
       input clk,
       input [15:0] a,
       input [15:0] b,
       input rst,
       input go,
       output done,
       output [15:0] ans
    );
    
    wire a_e_b,a_lt_b,a_gt_b,ld,comp,alu,a_sel,b_sel,out_en;
    gcd_datapath u1 (
          .clk(clk),
          .ld(ld),
           .rst(rst),
           .a(a),
           .b(b),
           .comp(comp),
           .alu(alu),
           .b_sel(b_sel),
           .a_sel(a_sel),
           .out_en(out_en),
           .ans(ans),
           .a_eq_b(a_e_b),
           .a_lt_b(a_lt_b),
           .a_gt_b(a_gt_b)
    );
    
    gcd_controlpath u2 (
           .ld(ld),
           .clk(clk),
           .rst(rst),
           .go(go),
           .comp(comp),
           .alu(alu),
           .b_sel(b_sel),
           .a_sel(a_sel),
           .ans_en(out_en),
           .done(done),
           .a_eq_b(a_e_b),
           .a_lt_b(a_lt_b),
           .a_gt_b(a_gt_b)
    );
endmodule
