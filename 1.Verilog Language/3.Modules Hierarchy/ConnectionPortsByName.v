module top_module(
    input a,b,c,d,
    output out1,out2);
    
    mod_a instance1(.out1(out1),.out2(out2),.in1(a),.in2(b),.in3(c),.in4(d));
endmodule