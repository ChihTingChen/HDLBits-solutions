module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] one,ten, hundred;
    bcdcount(clk,reset,c_enable[0],one);
    bcdcount(clk,reset,c_enable[1],ten);
    bcdcount(clk,reset,c_enable[2],hundred);
    
    assign c_enable = {ten==4'd9&&one==4'd9,one==4'd9,1'b1};
    assign OneHertz = {hundred==4'd9&&ten==4'd9&&one==4'd9};
endmodule
