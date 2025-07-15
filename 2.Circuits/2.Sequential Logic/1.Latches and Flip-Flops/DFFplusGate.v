module top_module (
    input clk,
    input in, 
    output out);
    reg d;
    always@(posedge clk)begin
        out<=in^out;
    end
endmodule
