module top_module(
    input clk,
    input reset,
    input [7:0]d,
    output [7:0]q);
    always@(posedge clk)begin
        if(reset==1)begin
            q=0;
        end
        else q=d;
    end
endmodule