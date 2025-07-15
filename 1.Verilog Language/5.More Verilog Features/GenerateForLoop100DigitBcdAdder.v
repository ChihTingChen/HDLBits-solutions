module top_module(
    input [399:0] a,b,
    input cin,
    output cout,
    output [399:0] sum
);
    wire [99:0] carry;
    bcd_fadd instance1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(carry[0]));
    genvar i;
    generate
        for(i=1;i<100;i=i+1) begin : add100
            bcd_fadd instance2 (.a(a[i*4+3:i*4]),.b(b[i*4+3:i*4]),.cin(carry[i-1]),.sum(sum[i*4+3:i*4]),.cout(carry[i]));
        end
        assign cout = carry[99];
    endgenerate
    
endmodule