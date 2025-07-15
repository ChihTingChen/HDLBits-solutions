module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  
	parameter S0 = 1'b0,S1=1'b1;
    reg state,next;
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state<=S0;
        end
        else begin
            state <= next;
        end
    end
    //transition
    always@(*)begin
        case(state)
            S0:next = (bump_left) ? S1:S0;
            S1:next = (bump_right) ? S0:S1;
        endcase
    end
    always@(*)begin
        walk_left  = 1'b0;
   		walk_right = 1'b0;
        if(state == S0) walk_left = 1'b1;
        else if(state == S1) walk_right = 1'b1;
    end
    
endmodule
