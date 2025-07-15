module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    assign c_enable = enable;
    assign c_load = reset|(Q==4'd12&&enable==1'b1);
    assign c_d = (c_load) ? 1:0;
    count4(clk,c_enable,c_load,c_load,Q);

endmodule
