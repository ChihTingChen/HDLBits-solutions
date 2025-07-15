module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output reg out);//  

	parameter A = 1'b0;
    parameter B = 1'b1;
    reg state,next_state;
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state<=B;
        end
        else begin
            state <= next_state;
        end
    end
    
    always@(*)begin
        case (state)
            B:begin
                if(in)begin
                    next_state = B;
                end
                else begin
                    next_state = A;
                end
            end
            A:begin
                if(in)begin
                    next_state = A;
                end
                else begin
                    next_state = B;
                end
            end
        endcase
    end
    always@(*)begin
        if(state ==B)begin
            out = 1'b1;
        end
        else begin
            out = 1'b0;
        end
    end
            
                
        
endmodule
