module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    always@(*)begin
        if(state==A)begin
            if(~in) next_state = A;
            else next_state = B;
        end
        else if(state==B)begin
            if(~in) next_state = C;
            else next_state = B;
        end
        else if(state==C)begin
            if(~in)next_state = A;
            else next_state = D;
        end
        else if(state == D)begin
            if(~in)next_state = C;
            else next_state = B;
        end
    end
    
    always@(*)begin
        if(state==A) out = 0;
        else if (state==B) out = 0;
        else if (state ==C) out = 0;
        else if (state==D)out = 1;
    end

endmodule
