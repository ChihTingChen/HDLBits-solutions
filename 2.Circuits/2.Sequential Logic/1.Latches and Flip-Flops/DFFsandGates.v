module top_module (
    input clk,
    input x,
    output z
); 
    reg Q1,Q2,Q3;
    assign z =~(Q1|Q2|Q3);
    always@(posedge clk)begin
        Q1<=0;
        Q2<=0;
        Q3<=0;
        Q1<=x^Q1;
        Q2<=x&~Q2;
        Q3<=x|~Q3;
    end

endmodule
