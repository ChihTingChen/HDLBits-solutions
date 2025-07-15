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
	
    parameter S0 = 0,S1 = 1,S2 = 2, S3 = 3,S4 = 4,S5 = 5,S6 = 6;
    reg [3:0] state,next;
    reg [10:0] sign;
    
    //DFF
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state <= S0;
        end
        else state <= next;
    end
    
    //20s falling sign
    always@(posedge clk)begin
        if(~ground)begin
            sign <= sign +1'b1;
        end
        else begin
            sign <= 11'b00000000000;
        end
    end
    //transition rules
    always@(*)begin
        case(state)
            S0:next = ~ground ? S3:(dig ? S5:(bump_left?S1:S0));
            S1:next = ~ground ? S2:(dig ? S4:(bump_right?S0:S1));
            S2:next = (ground&&sign<21) ? S1:((ground&&sign>20)?S6:S2);
            S3:next = (ground&&sign<21) ? S0:((ground&&sign>20)?S6:S3);
            S4:next = ~ground ? S2: S4;
            S5:next = ~ground ? S3: S5;
            S6:next = S6;
        endcase
    end
    //output combinational logic
    always@(*)begin
        case(state)
            S0:{walk_left,walk_right,aaah,digging} = 4'b1000;
            S1:{walk_left,walk_right,aaah,digging} = 4'b0100;
            S2:{walk_left,walk_right,aaah,digging} = 4'b0010;
            S3:{walk_left,walk_right,aaah,digging} = 4'b0010;
            S4:{walk_left,walk_right,aaah,digging} = 4'b0001;
            S5:{walk_left,walk_right,aaah,digging} = 4'b0001;
            S6:{walk_left,walk_right,aaah,digging} = 4'b0000;
        endcase
    end
endmodule
