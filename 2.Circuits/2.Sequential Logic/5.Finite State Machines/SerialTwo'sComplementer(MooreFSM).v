module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S0 = 0,S1 = 1,S2 = 2,S3 = 3,IDLE = 4;
    reg [1:0] state, next;
    
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state <= IDLE;
        end
        else begin
            state <= next;
        end
    end
    
    //transition rules
    always@(*)begin
        case(state)
            IDLE: next = areset ? IDLE : S0;
            S0: next = x ? S1:S0;
            S1: next = x ? S2:S3;
            S2: next = x ? S2:S3;
            S3: next = x ? S2:S3;
        endcase
    end
    
    //output logic
    always@(*)begin
        case(state)
            IDLE: z = 0;
            S0: z = 0;
            S1: z = 1;
            S2: z = 0;
            S3: z = 1;
        endcase
    end
        

endmodule
