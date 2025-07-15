module top_module (
    input clk,
    input areset,
    input x,
    output z
); 	
    parameter A = 0,B =1;
    reg [1:0] state,next;
    
    //DFF
    always@(posedge clk or posedge areset)begin
        if(areset)begin
            state <= A;
        end
        else begin
            state<=next;
        end
    end
    
    //transition rules
    always@(*)begin
        case(state)
            A: next = x ? B:A;
            B: next = B;
        endcase
    end
    
    //output logic
    always@(*)begin
        case(state)
            A: z = x ? 1:0;
            B: z = x ? 0:1;
        endcase
    end
endmodule
