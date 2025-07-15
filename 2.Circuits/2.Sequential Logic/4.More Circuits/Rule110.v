module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
integer i;
    reg [511:0] store;

    always @(*) begin
        for (i = 0; i < 512; i = i + 1) begin
            if (i == 0) begin
                
                store[i] = (~q[i] & 0) | (q[i] & ~q[i+1]) | (q[i] & 1);
            end
            else if (i == 511) begin
            
                store[i] = (~q[i] & q[i-1]) | (1 & q[i]) | (q[i] & ~q[i-1]);
            end
            else begin
                
                store[i] = (~q[i] & q[i-1]) | (~q[i+1] & q[i]) | (q[i] & ~q[i-1]);
            end
        end
    end

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= store;
    end
endmodule