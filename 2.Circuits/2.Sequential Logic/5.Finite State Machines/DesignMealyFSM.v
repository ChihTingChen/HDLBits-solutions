module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	
    parameter S0 = 0,S1 = 1,S2 = 2;
    reg [1:0] state,next;
    
    always@(posedge clk or posedge ~aresetn)begin
        if (~aresetn)begin
            state <=S0;
        end
        else state <= next;
    end
    
    //transition rules
    always@(*)begin
        case(state)
            S0: next = x ? S1:S0;
            S1: next = x ? S1:S2;
            S2: next = x ? S1:S0;
        endcase
    end
    
    //output
    always@(*)begin
        case(state)
            S0:z = 0;
            S1:z = 0;
            S2:z= x;
        endcase
    end
endmodule
