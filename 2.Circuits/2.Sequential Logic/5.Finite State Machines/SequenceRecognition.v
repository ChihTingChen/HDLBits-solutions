module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
	
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3,S4 = 4,S5 = 5,S6= 6,ERR = 7,DISC = 8,FLAG = 9;
    reg [3:0] state, next;
    
    //DFF
    always@(posedge clk)begin
        if(reset)begin
            state <= S0;
        end
        else begin
            state <= next;
        end
    end
    
    //transition rules
    always@(*)begin
        case(state)
            S0:next = in ? S1:S0;
            S1:next = in ? S2:S0;
            S2:next = in ? S3:S0;
            S3:next = in ? S4:S0;
            S4:next = in ? S5:S0;
            S5:next = in ? S6:DISC;
            S6:next = in ? ERR:FLAG;
            DISC:next = in ? S1:S0;
            FLAG:next = in ? S1:S0;
            ERR:next = in ? ERR:S0;
        endcase
    end
    
    //output logic
    assign disc = (state == DISC);
    assign flag = (state == FLAG);
    assign err = (state == ERR);
    
endmodule
