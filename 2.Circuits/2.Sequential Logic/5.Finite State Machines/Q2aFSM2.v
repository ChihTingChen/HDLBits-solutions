module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    
    parameter A=0,B=1,C=2,D=3;
    reg [1:0] state,next;
    
    always@(posedge clk)begin
        if(~resetn)begin
            state <= A;
        end
        else begin
            state <= next;
        end
    end
    
    always@(*)begin
        case(state)
            A: begin
                if(r[1])begin
                    next = B;
                end
                /*else if(r==3'd0)begin
                    next = A;
                end*/
                else if(r[2]==1)begin
                    next =C;
                end
                else if(r[3] == 1)begin
                    next = D;
                end
                else next = A;
            end
            B: next = r[1] ? B:A;
            C: next = r[2] ? C:A;
            D: next = r[3] ? D:A;
            default:next = A;
        endcase
    end
    
    always@(*)begin
        case(state)
            //A:g='x;
            B:g = 3'b001;
            C:g = 3'b010;
            D:g = 3'b100;
            default:g=3'b000;
        endcase
    end
                    

endmodule
