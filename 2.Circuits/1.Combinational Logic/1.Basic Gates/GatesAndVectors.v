module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    integer i,m,n;
    always@(*) begin
        for(i=0;i<3;i=i+1)begin
            out_both[i] = in[i]&in[i+1];
        end
        for(m=1;m<4;m=m+1)begin
            out_any[m] = in[m]|in[m-1];
        end
        for(n=0;n<4;n=n+1)begin
            if (n!=3) out_different[n] = in[n]^in[n+1];
            else if (n==3) out_different[n] = in[n]^in[0];
        end
    end
endmodule
