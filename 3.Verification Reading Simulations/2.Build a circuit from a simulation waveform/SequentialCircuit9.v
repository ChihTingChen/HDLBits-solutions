module top_module (
    input clk,
    input a,
    output [3:0] q );
    always@(posedge clk)begin
        if(a)begin
            q<=4;
        end
        else if(q==6)begin
            q<=0;
        end
        else begin
            q<=q+1;
        end
    end
endmodule
