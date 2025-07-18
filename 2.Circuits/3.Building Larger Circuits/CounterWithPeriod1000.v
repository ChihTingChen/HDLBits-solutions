module top_module (
    input clk,
    input reset,
    output [9:0] q);
	
    always@(posedge clk)begin
        if (reset)begin
            q<=1'b0;
        end
        else if(q < 999)begin
            q <= q+1;
        end
        else if (q==999)begin
            q<=0;
        end
    end
endmodule
