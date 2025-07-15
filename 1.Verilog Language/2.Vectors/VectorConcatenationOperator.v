module top_module(
    input [4:0] a,b,c,d,e,f,
    output[7:0] w,x,y,z);
    
    reg [31:0] big;
    
    assign big = {a,b,c,d,e,f,1'b1,1'b1};
    assign w = big[31:24];
    assign x = big[23:16];
    assign y = big[15:8];
    assign z = big[7:0];
endmodule