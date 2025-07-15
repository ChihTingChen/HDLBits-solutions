module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter S0=0,S1=1,S2=2,S3=3;
    reg [1:0] state,next;
    
    //DFF
    always@(posedge clk)begin
        if(reset)begin
            state<=S0;
        end
        else begin
            state<=next;
        end
    end
    
    //transition logic
    always@(*)begin
        case(state)
            S0:next = in[3] ? S1:S0;
            S1:next = S2;
            S2:next = S3;
            S3:next = in[3]?S1:S0;
        endcase
    end
    
    always@(*)begin
        done = 1'b0;
        done = (state == S3);
    end
endmodule
