module top_module(
    input clk,
    input in,
    input reset,
    output out); //
 	parameter A =0,B=1,C=2,D=3;
    reg [2:0] state,next_state;
    // State transition logic
    always@(*)begin
        if(state == A) begin
            if(in) next_state = B;
        	else next_state = A;
    	end	
        else if (state == B)begin
            if(in) next_state =B;
            else next_state = C;
        end
        else if (state==C)begin
            if(in) next_state = D;
            else next_state = A;
        end
        else if (state==D)begin
            if(in)next_state = B;
            else next_state = C;
        end
    end
    // State flip-flops with asynchronous reset
    always@(posedge clk)begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end
    
        
    // Output logic
    always@(*)begin
        if(state==A)out = 0;
        else if (state==B)out = 0;
        else if (state ==C)out = 0;
        else if (state ==D)out = 1;
    end
endmodule
