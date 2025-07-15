module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
	
    parameter A = 0,B = 1,C = 2,D = 3,E = 4,F = 5;
    reg [3:0] state,next;
    
    always@(posedge clk)begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= next;
        end
    end
    
    //transition rules
    always@(*)begin
        case(state)
            A:next = w ? A:B;
            B:next = w ? D:C;
            C:next = w ? D:E;
            D:next = w ? A:F;
            E:next = w ? D:E;
            F:next = w ? D:C;
        endcase
    end
    
    //output logic
    always@(*)begin
        case(state)
            A:z=0;
            B:z=0;
            C:z=0;
            D:z=0;
            E:z=1;
            F:z=1;
        endcase
    end
    
        
endmodule
