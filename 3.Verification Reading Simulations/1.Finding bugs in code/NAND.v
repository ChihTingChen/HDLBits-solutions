module top_module (input a, input b, input c, output out);//
	wire out_first;
    andgate inst1 ( out_first, a, b, c,1,1 );
    assign out= ~out_first;

endmodule
