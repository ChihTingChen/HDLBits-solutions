module top_module(
    input wire p1a,p2a,p2b,p2c,p2d,p1c,p1b,p1f,p1e,p1d,
    output wire p2y,p1y);
    
    wire andout1;
    wire andout2;
    wire andout3;
    wire andout4;
    
    assign andout1 = p2a&p2b;
    assign andout2 = p1a&p1c&p1b;
    assign andout3 = p1f&p1e&p1d;
    assign andout4 = p2c&p2d;
    assign p2y = andout1|andout4;
    assign p1y = andout2|andout3;
endmodule