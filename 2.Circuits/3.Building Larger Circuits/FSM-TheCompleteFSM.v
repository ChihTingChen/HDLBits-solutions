module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
	parameter IDLE =0,S0=1,S1=2,S2=3,S3=4,S4=5,S5=6,S6=7,S7=8,S8=9;
    reg [3:0]state,next;
    
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
            IDLE: next = data ?S0:IDLE;
            S0: next = data ? S1:IDLE;
            S1: next = data ? S1:S2;
            S2: next = data ? S3:IDLE;
            S3:next = S4;
            S4:next = S5;
            S5:next = S6;
            S6:next = S7;
            S7:next = done_counting ? S8:S7;
            S8:next = ack? IDLE:S8;
        endcase
    end
    
    //output rules
    assign done = (state==S8);
    assign shift_ena = (state==S3||state==S4||state==S5||state==S6);
    assign counting = (state ==S7);
endmodule
