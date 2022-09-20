module gcd_datapath(
      input clk,
      input rst,
      input [15:0] a,
      input [15:0] b,
      input loadA,
      input loadB,
      input selectA,
      input selectb,
      input loadANS,
      output done,
      output a_eq_b,
      output a_lt_b,
      output a_gt_b,
      output [15:0] ans
    );  
    wire [15:0] A,B,a_minus_b,b_minus_a,a_muxout,b_muxout;
    wire a_l_b,a_e_b,a_g;
    a_mux(selectA,a,a_minus_b,a_muxout);
    b_mux(b,selectB,b_minus_a,b_muxout);
    a_register(loadA,a_muxout,clk,A);
    b_register(loadB,b_muxout,clk,B);
    comp(A,B,a_e_b,a_l_b,a_g,done);
    alu(A,B,a_l_b,a_g,a_minus_b,b_minus_a);
    answer_register(a_e_b,clk,A,ans);
    
    
endmodule
