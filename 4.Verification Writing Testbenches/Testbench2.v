module top_module();
	reg clk;
    reg in;
    reg [2:0] s;
    reg out;
    q7 instance1(clk,in,s,out);
    initial begin
        clk = 1'b0;
        forever
            #5
            clk = ~clk;
    
    end
    initial begin
        in = 1'b0;
        s = 3'd2;
        #10
        in = 1'b0;
        s = 3'd6;
        #10
        in = 1'b1;
        s = 3'd2;
        #10
        in = 1'b0;
        s = 3'd7;
        #10
        in = 1'b1;
        s = 3'd0;
        #30
        in = 1'b0;
        s = 3'd0;
    end
endmodule
