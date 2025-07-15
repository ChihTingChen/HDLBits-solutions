module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
	
    
    parameter IDLE = 0,S0 = 1,S1 = 2,S2 = 3,S3 = 4;
    reg [2:0]state,next;
    //DFF
    always@(posedge clk)begin
        if(reset)begin
            state <= IDLE;
        end
        else begin
            state <= next;
        end
    end
    
    //transition rules
    always@(*)begin
        case(state)
            IDLE: next = data ? S0:IDLE;
            S0: next = data ? S1:IDLE;
            S1: next = data ? S1:S2;
            S2: next = data ? S3:IDLE;
            S3: next = S3;
        endcase
    end
    
    //output logic
    assign start_shifting = (state == S3);
        
        
        
        
            
endmodule
