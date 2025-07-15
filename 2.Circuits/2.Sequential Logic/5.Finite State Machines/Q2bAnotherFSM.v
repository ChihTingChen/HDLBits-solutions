module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
	parameter A = 0,B = 1,C = 2,D = 3,E = 4,F = 5,G = 6,H = 7,I = 8;
    reg [3:0] state,next;
    
    always@(posedge clk)begin
        if(~resetn)begin
            state<=A;
        end
        else begin
            state <= next;
        end
    end
    //transition rules
    always@(*)begin
        next = state;
        case(state)
            A:next = B;
            B:next = C;
            C: next = (x) ? D:C;
            D: next = (x) ? D:E;
            E: next = (x) ? F:C;
            F: next = (y) ? G:H;
            H: next = (y) ? G:I;
            G: next = G;
            I:next = I;
        endcase
    end
    
    always@(*)begin
        case(state)
            A:begin
                f=0;
                g=0;
            end
            B:begin
                f=1;
                g=0;
            end
            C: begin
                f=0;
                g=0;
            end
            D: begin
                f=0;
                g=0;
            end
            E: begin
                f=0;
                g=0;
            end
            F: begin
                f=0;
                g=1;
            end
            H: begin
                f=0;
                g=1;
            end
            G:begin
                f=0;
                g=1;
            end
            I:begin
                f=0;
                g=0;
            end
        endcase
    end
    /*assign f = (state ==B);
    assign g = (state == F || state == H || state == G);*/
endmodule
