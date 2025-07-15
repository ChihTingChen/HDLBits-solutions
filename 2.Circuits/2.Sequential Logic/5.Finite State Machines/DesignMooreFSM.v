module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A = 0,B=1,C=2,D=3,B2=4,C2=5;
    reg [2:0] state,next_state;
    //DFF
    always@(posedge clk)begin
        if(reset)begin
            state<=A;
        end
        else state<=next_state;
    end
    //transition
    always@(*)begin
        case(state)
            A:next_state = s[1] ? B:A;
            B:next_state = s[2] ? C:(s[1] ? B:A);
            B2:next_state = s[2] ? C:(s[1] ? B2:A);
            C:next_state = s[3] ? D:(s[2] ? C:B2);
            C2:next_state = s[3] ? D:(s[2] ? C2:B2);
            D:next_state = s[3] ? D:C2;
            default:next_state = 'x;
        endcase
    end
    always@(*)begin
        if(state==A)begin
            fr1 =1'b1;
            fr2 =1'b1;
            fr3 =1'b1;
            dfr =1'b1;
        end
        else if(state==B)begin
            fr1 =1'b1;
            fr2 =1'b1;
            fr3 =1'b0;
            dfr =1'b0;
            
        end
        else if(state==C)begin
            fr1 =1'b1;
            fr2 =1'b0;
            fr3 =1'b0;
            dfr =1'b0;
        end
        else if(state==D)begin
        	fr1 =1'b0;
            fr2 =1'b0;
            fr3 =1'b0;
            dfr =1'b0;
        end
        else if(state==C2)begin
            fr1 =1'b1;
            fr2 =1'b0;
            fr3 =1'b0;
            dfr =1'b1;
        end
        else if(state ==B2)begin
            fr1 =1'b1;
            fr2 =1'b1;
            fr3 =1'b0;
            dfr =1'b1;
        end
    end
endmodule