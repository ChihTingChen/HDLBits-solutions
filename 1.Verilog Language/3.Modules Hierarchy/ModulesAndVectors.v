module top_module(
    input wire clk,
    input reg [7:0] d,
    input reg [1:0] sel,
    output reg [7:0] q);
    
    reg [7:0] q1,q2,q3;
    
    my_dff8 instance1(clk,d,q1);
    my_dff8 instance2(clk,q1,q2);
    my_dff8 instance3(clk,q2,q3);
    always @(*)begin
        case(sel)
            2'b00:q=d;
            2'b01:q=q1;
            2'b10:q=q2;
            2'b11:q=q3;
        endcase
    end
endmodule
    