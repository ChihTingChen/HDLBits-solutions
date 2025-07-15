module top_module (
    input a, b, c, d, e,
    output [24:0] out );//
    wire [24:0] a1, a2, a3;
    //assign a1 = {{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}};
    assign a2 = {{5{{a},{b},{c},{d},{e}}}};
    //assign out = ~({{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}} ^ {{5{{a},{b},{c},{d},{e}}}});
    assign out = ~({{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}}^{{5{{a},{b},{c},{d},{e}}}});

endmodule
