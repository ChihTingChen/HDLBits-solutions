module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter S0=0,S1=1,S2=2,S3 = 3,S4 = 4,S5=5;
    reg [2:0] state,next;
    
    //DFF
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state<=S0;
        end
        else begin
            state <= next;
        end
    end
    
    //transition rules
    always@(*)begin
        case(state)
            S0:next = ~ground ? S3:(dig ? S5 : (bump_left ? S1:S0));
            S1:next = ~ground ? S2:(dig ? S4 : (bump_right ? S0:S1));
            S2:next = ground ? S1:S2;
            S3:next = ground ? S0:S3;
            S4:next = ~ground ? S2:S4;
            S5:next = ~ground ? S3: S5;
        endcase
    end
    
    //output combinational logic
    always@(*)begin
        case (state)
            S0:{walk_left,walk_right,aaah,digging} = 4'b1000;
            S1:{walk_left,walk_right,aaah,digging} = 4'b0100;
            S2:{walk_left,walk_right,aaah,digging} = 4'b0010;
            S3:{walk_left,walk_right,aaah,digging} = 4'b0010;
            S4:{walk_left,walk_right,aaah,digging} = 4'b0001;
            S5:{walk_left,walk_right,aaah,digging} = 4'b0001;
            default:{walk_left,walk_right,aaah,digging} = 4'b0000;
        endcase
    end
    
endmodule
