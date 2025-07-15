module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
	
    parameter S1=0,S2=1,S3=2,DONE=3;
    reg [2:0] state,next;
    reg [23:0] out;
    always@(posedge clk)begin
        if(reset)begin
            state<=S1;
        end
        else begin
            state<=next;
        end
    end
    
    //transition logic
    always@(*)begin
        case(state)
            S1:next = in[3] ? S2:S1;
            S2:next = S3;
            S3:next = DONE;
            DONE:next = in[3]?S2:S1;
            default:next = S1;
        endcase
    end
    
    /*always@(*)begin
        done = 1'b0;
        done = (state == DONE);
    end*/
    //data processing
    always@(posedge clk)begin
        /*if(next ==S2)begin
            if(state ==S1)begin
                out[23:16] <=in;
            end
            else if(state==DONE)begin
                out[23:16] <=in;
            end
        end*/
        if(state==S1)begin
            out[23:16] <=in;
        end
        if(state==DONE&&in[3])begin
            out[23:16] <=in;
        end
    end
    
    always@(posedge clk)begin
        if(state ==S2)begin
            out[15:8] = in;
        end
    end
    
    always@(posedge clk)begin
        if(state==S3)begin
            out[7:0] = in;
        end
    end
    always@(*)begin
         done =(state==DONE);
         out_bytes = done? out:23'd0;
    end
    
    
    /*always@(*)begin
        case(state)
            S0:begin
                out[23:16] = in;
            end
            S1:out[15:8] = in;
            S2:out[7:0] = in;
            S3:begin 
                out_bytes = out;
                if(in[3]) begin
                    out[23:16] = in;
                end
            end
            default: out = 24'b0;
        endcase
    end*/
endmodule
