// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;
	reg state,next_state;
    parameter A=1'b0;
    parameter B=1'b1;
    always@(posedge clk)begin
        if(reset)begin
            state<=B;
        end
        else begin
            state<=next_state;
        end
    end
    always@(*)begin
        if(state==B)begin
            if(in)begin
                next_state = B;
            end
            else begin
                next_state = A;
            end
        end
        else if(state==A)begin
            if(in)begin
                next_state = A;
            end
             else begin
                 next_state = B;
             end
        end
    end
    always@(*)begin
        if(state==A)begin
            out = 1'b0;
        end
        else out = 1'b1;
    end
            
            
endmodule
