module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire a1;
    wire[31:0] xor_out;
    assign xor_out = b^{32{sub}};
    add16 instance1(a[15:0],xor_out[15:0],sub,sum[15:0],a1);
    add16 instance2(a[31:16],xor_out[31:16],a1,sum[31:16],);

endmodule
