module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 	
    parameter S0 = 0,S1 = 1,S2 = 2,S3 = 3,S4 = 4,S5 =5,S6 = 6,S7 = 7,S8 = 8,S9 = 9,DONE = 10,IDLE = 11;
    reg [3:0] state,next;
    //DFF
    always@(posedge clk)begin
        if(reset)begin
            state<=IDLE;
        end
        else begin
            state<=next;
        end
    end
    
    //transition rules
    always@(*)begin
        case (state)
            IDLE:next = ~in ? S0:IDLE;
            S0: next = S1;
            S1: next = S2;
            S2: next = S3;
            S3: next = S4;
            S4: next = S5;
            S5: next = S6;
            S6: next = S7;
            S7: next = S8;
            S8: next = in ? DONE:S9;
            S9: next = in ? IDLE : S9;
            DONE: next = in ? IDLE : S0;
        endcase
    end
    
    //output logic
    always@(*)begin
        done = (state==DONE);
    end

endmodule
