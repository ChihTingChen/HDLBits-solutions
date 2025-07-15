module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    reg [1:0] state,next;
    parameter S0 = 0,S1 = 1,S2 = 2,S3 = 3;
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state <= S0;
        end
        else begin
            state <= next;
        end
    end
    //transition rules
    always@(*)begin
        case(state)
            S0:next = (~ground) ? S3:( bump_left ? S1:S0);
            S1:next = (~ground) ? S2:( bump_right ? S0:S1);
            S3:next = (ground) ? S0:S3;
            S2:next = (ground) ? S1:S2;
        endcase
    end
    always@(*)begin
        case(state)
            S0:{walk_left,walk_right,aaah} = 3'b100;
            S1:{walk_left,walk_right,aaah} = 3'b010;
            S3:{walk_left,walk_right,aaah} = 3'b001;
            S2:{walk_left,walk_right,aaah} = 3'b001;
        endcase
    end
    
            
        
            
endmodule
