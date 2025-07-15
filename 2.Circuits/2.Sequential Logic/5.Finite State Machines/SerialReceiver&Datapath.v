module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    parameter S0 = 0,S1 = 1,S2 = 2,S3 = 3,S4 = 4,S5 =5,S6 = 6,S7 = 7,S8 = 8,S9 = 9,DONE = 10,IDLE = 11;
    reg [3:0] state,next;
    reg [7:0] out_reg;
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
        done =(state==DONE);
        out_byte = done ? out_reg:8'd0;
    end

    //datapath
    always@(posedge clk)begin
        case(state)
            S0:out_reg[0]<=in;
            S1:out_reg[1]<=in;
            S2:out_reg[2]<=in;
            S3:out_reg[3]<=in;
            S4:out_reg[4]<=in;
            S5:out_reg[5]<=in;
            S6:out_reg[6]<=in;
            S7:out_reg[7]<=in;
            //S8:out_reg[7]<=in;
        endcase
    end
endmodule
