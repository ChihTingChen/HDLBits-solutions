module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d_last;
    always@(posedge clk)begin
        d_last <= in;
        if(reset)begin
            out <= 32'd0;
        end
        else begin
            
            out <= d_last&~in|out;
        end
    end
        
endmodule
