module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    always@(posedge clk)begin
        if(~L) Q<= q_in;
        else if (L) Q<= r_in;
    end
	
endmodule
