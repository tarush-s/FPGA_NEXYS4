
module comp(
    input [15:0] a,
    input [15:0] b,
    output a_eq_b,
    output a_lt_b,
    output a_gt_b
    );
    assign a_eq_b=(a==b)? 1:0;
    assign a_lt_b=(a<b)? 1:0;
    assign a_gt_b=(a>b)? 1:0;
endmodule
