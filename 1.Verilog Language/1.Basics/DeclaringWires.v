module top_module(input a,b,c,d,output out,out_n);
    wire and_out1;
    wire and_out2;
    wire or_out1;
    assign and_out1 = a&b;
    assign and_out2 = c&d;
    assign or_out1 = and_out1|and_out2;
    assign out = or_out1;
    assign out_n = ~or_out1;
endmodule