module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] a1,a2,a3;
    assign a1 = (a<b) ? a:b;
    assign a2 = (a1<c) ? a1:c;
    assign min = (a2<d) ? a2:d;
    // assign intermediate_result1 = compare? true: false;

endmodule
