module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
	
    parameter IDLE =0,S0 = 1,S1 = 2,S2 = 3,S3 = 4;
    reg [2:0] state,next;
    
    
    //DFF
    always@(posedge clk)begin
        state <= next;
    end
    
    //transition rules
    always@(*)begin
        case(state)
            IDLE: next = reset ? S0:IDLE;
            S0: next = reset ? S0:S1;
            S1: next = reset ? S0:S2;
            S2: next = reset ? S0:S3;
            S3: next = reset ? S0:IDLE;
        endcase
    end
    
    //output logic
    assign shift_ena = (state==S0 || state==S1 || state==S2 || state==S3);
        
endmodule
