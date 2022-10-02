module testbench();
       reg clk=0;
       reg [15:0] a=10;
       reg [15:0] b=8;
       reg rst=1;
       reg go=0;
       wire done;
       wire [15:0] ans;
       
       always#10 clk=~clk;
       gcd u3(.clk(clk),
              .rst(rst),
              .go(go),
              .a(a),
              .b(b),
              .done(done),
              .ans(ans));
        always@(posedge clk)
        begin
        #10 rst<=0;
        #10 go<=1;
        end
              
endmodule
