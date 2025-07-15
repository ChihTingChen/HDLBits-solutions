module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  
	parameter OFF=1'b0;
    parameter ON = 1'b1;
    reg state,next_state;
    always@(posedge clk)begin
        if(reset)begin
            state <= OFF;
        end
        else begin
            state <= next_state;
        end
    end
    always@(*)begin
        if(state==OFF)begin
            if(~j)begin
                next_state = OFF;
            end
            else begin
                next_state = ON;
            end
        end
        else if(state==ON)begin
            if(~k) begin
                next_state = ON;
            end
            else 
                next_state = OFF;
        end
    end
    always@(*)begin
        if(state==OFF)begin
            out = 1'b0;
        end
        else if(state==ON)begin
            out = 1'b1;
        end
    end

endmodule
