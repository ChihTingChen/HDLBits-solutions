module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
	parameter S0 = 0,S1=1,S2 = 2,S3 = 3,S4 = 4;
    reg [2:0] state,next;
    
    always@(posedge clk)begin
        if(reset)begin
            state<=S0;
        end
        else begin
            state<=next;
        end
    end
    //transition rules
    always@(*)begin
        case(state)
            S0:next = x?S1:S0;
            S1:next = x?S4:S1;
            S2:next = x?S1:S2;
            S3:next = x?S2:S1;
            S4:next = x?S4:S3;
            default next = S0;
        endcase
    end
    
    always@(*)begin
        case(state)
            S0,S1,S2:z=0;
            S3,S4:z=1;
        endcase
    end
endmodule
