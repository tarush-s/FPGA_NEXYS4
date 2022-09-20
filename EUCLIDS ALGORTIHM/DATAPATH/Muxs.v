module a_mux(
    input a_sel,
    input [15:0] a,
    input [15:0] a_diff_b,
    output [15:0] a_mux_out
    );
    assign a_mux_out = (a_sel)?a:a_diff_b;

endmodule

module b_mux(
    input [15:0] b,
    input b_sel,
    input [15:0] b_diff_a,
    output [15:0] b_mux_out
    );
 
    assign b_mux_out = (b_sel)? b:b_diff_a;

 
endmodule
