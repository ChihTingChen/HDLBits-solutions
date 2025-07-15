module top_module(
    input wire [2:0] a,b,
    output wire[2:0] out_or_bitwise,
    output out_or_logical,
    output wire [5:0] out_not);
    
    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not[2:0] = ~a;
    assign out_not[5:3] = ~b;
endmodule