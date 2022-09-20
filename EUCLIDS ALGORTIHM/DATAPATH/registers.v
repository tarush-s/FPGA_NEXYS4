
module a_register(
    input a_ld,
    input [15:0] a,
    input clk,
    output reg [15:0] a_out
    );
    always@(posedge clk)
    begin 
    if(a_ld)
    a_out<=a;
    end
endmodule


module b_register(
    input b_ld,
    input [15:0] b,
    input clk,
    output reg [15:0] b_out
    );
    always@(posedge clk)
    begin 
    if(b_ld)
    b_out<=b;
    end
endmodule


module answer_register(
    input a_eq_b,
    input clk,
    input [15:0] a,
    output reg [15:0] ans_out
    );
    always@(posedge clk)
    begin
    if(a_eq_b)
    ans_out<=a;
    end
endmodule
