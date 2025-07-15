module top_module(
    input [31:0] a,b,
    output [31:0] sum);
    wire [15:0] out1,out2;
    wire cout;
    add16 instance1(a[15:0],b[15:0],,out1,cout);
    add16 instance2(a[31:16],b[31:16],cout,out2,);
    assign sum[15:0] = out1;
    assign sum[31:16] = out2;
endmodule