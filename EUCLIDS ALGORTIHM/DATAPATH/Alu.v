module alu(
    input [15:0] a,
    input [15:0] b,
    input a_lt_b,
    input a_gt_b,
    output  [15:0] a_diff_b,
    output  [15:0] b_diff_a
    );
    assign a_diff_b=(a_lt_b)? a:b-a;
    assign b_diff_a=(a_gt_b)? b:b-a;
endmodule
