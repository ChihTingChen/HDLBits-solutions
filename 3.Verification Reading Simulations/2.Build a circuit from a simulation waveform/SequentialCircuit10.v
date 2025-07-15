module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always@(posedge clk)begin
        if(a&b)begin
            state<=1;
        end
        else if(~a&~b)begin
            state<=0;
        end
    end
    
    always@(*)begin
        q = ~a&b&~state | a&~b&~state | ~a&~b&state | a&b&state;
    end
endmodule
