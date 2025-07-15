module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    genvar i;
    reg [3:0] carry;
    generate 
        for(i=0;i<4;i=i+1)begin:add16
            if(i==0) bcd_fadd(a[i*4+3:i*4],b[i*4+3:i*4],cin,carry[i],sum[i*4+3:i*4]);
            else bcd_fadd(a[i*4+3:i*4],b[i*4+3:i*4],carry[i-1],carry[i],sum[i*4+3:i*4]);
        end
    endgenerate
    assign cout = carry[3];
endmodule
