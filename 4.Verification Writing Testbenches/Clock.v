module top_module ( );
	reg clk;
    dut instance1 (clk);
    
    initial begin
        clk = 1'b0;
    end
    always begin
        #5 
        clk = ~clk;
    end
endmodule
