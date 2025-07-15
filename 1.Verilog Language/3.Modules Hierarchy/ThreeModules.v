module top_module(
    input clk,d,
    output q);
    
    wire q1,q2;
    
    my_dff instance1(clk,d,q1);
    my_dff instance2(clk,q1,q2);
    my_dff instance3(clk,q2,q);
endmodule